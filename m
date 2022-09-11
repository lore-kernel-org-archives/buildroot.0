Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3607FECAAD3
	for <buildroot@archiver.kernel.org>; Sun, 11 Sep 2022 20:36:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 64229404A9;
	Sun, 11 Sep 2022 20:36:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 64229404A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lmUXumlEl6UM; Sun, 11 Sep 2022 20:36:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6E46740385;
	Sun, 11 Sep 2022 20:36:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6E46740385
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E324E1BF4E2
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 20:36:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BCE79424E0
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 20:36:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BCE79424E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7KnqvVM281Op for <buildroot@lists.busybox.net>;
 Sun, 11 Sep 2022 20:36:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 05BAC424E9
Received: from smtpcmd0871.aruba.it (smtpcmd0871.aruba.it [62.149.156.71])
 by smtp4.osuosl.org (Postfix) with ESMTP id 05BAC424E9
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 20:36:16 +0000 (UTC)
Received: from [192.168.50.173] ([146.241.22.4])
 by Aruba Outgoing Smtp  with ESMTPSA
 id XTgdog7nEMW5FXTgdoy8a0; Sun, 11 Sep 2022 22:36:15 +0200
Message-ID: <057e0c0f-ce16-1c0f-3406-3694bb83321b@benettiengineering.com>
Date: Sun, 11 Sep 2022 22:36:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Content-Language: en-US
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20220911195724.3296064-1-giulio.benetti@benettiengineering.com>
 <20220911201856.GK898622@scaer>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20220911201856.GK898622@scaer>
X-CMAE-Envelope: MS4xfOWIFdS3uT8n7xLSgG25w00/QDlbS+rbMSJcUhRfmg8Kg/DX7J66IU+n76r3gAU23oKezIds64ucBZWCT6OLbZnjDU9HY8zRTo/+mmQikteE19fJv86y
 NK34ixOwQlPFjkVVscfWt0JSeM63ZPiGBXiGhpSoFv6x3HitCOju8nHvU3KCDyaJj0KHCZFmGBpH+YBgJ4Jo5lBWYOh6iXj8DTQLVkkzG3bDX1fuGVeFAqXv
 5NGnsmdRoOBHEMUcBeL3MMcydafFzrQLjNPYSVWkflqZQRt8x/B3c7veCecRzCUk
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1662928575; bh=XWxCj7ocWdlyA5qUGb6r10rsWDRsCHK9SZZoW95SeTs=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=jYtL+YWqmNbLdnJAC0GZ2yRhC5BZbvHK927oeKvnoMVE7IoEhBArCWgPEbX4iaNXD
 QNd6RkjYjFrgFyzaHg6kRYcLz5nXVao393V1SvtKTnhrLxnkUiGTDzPkUCRYT7JYIB
 c9FnRjqWbMW/IwQBdXxN4iDbHJO2Vtw7EidcXuGC6dL7usRBntdffV9XdFIfH9QzU/
 b/RcierMJiGqKUkmqimelyLoxewJvkKgP4+W22M+dx03IlWJnA7kKIzDWs7RqiUBHn
 DQJ77YqHs2uJPxIMEDXVfXgYrtCyDMeAIJpk//2A/gAkNEjkV2rRxiBoMftPyPKUPY
 xy19I/z+T/W4A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=jYtL+YWq
Subject: Re: [Buildroot] [PATCH] package/rtl8189es: fix build failure due to
 missing Linux options
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Louis Aussedat <aussedat.louis@gmail.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Yann,

On 11/09/22 22:18, Yann E. MORIN wrote:
> Giulio, All,
> 
> On 2022-09-11 21:57 +0200, Giulio Benetti spake thusly:
>> This driver requires CONFIG_CFG80211 and CONFIG_MMC to build so let's add
>> them to RTL8189ES_LINUX_CONFIG_FIXUPS.
>>

I've forgotten the
Fixes:
http://autobuild.buildroot.net/results/4b7/4b7b5bbf5b3839d99397eb2597dd7be79f403233/

that gives more context

>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> ---
>>   package/rtl8189es/rtl8189es.mk | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/package/rtl8189es/rtl8189es.mk b/package/rtl8189es/rtl8189es.mk
>> index 51477ccc97..a283852a11 100644
>> --- a/package/rtl8189es/rtl8189es.mk
>> +++ b/package/rtl8189es/rtl8189es.mk
>> @@ -13,5 +13,10 @@ RTL8189ES_MODULE_MAKE_OPTS = \
>>   	KVER=$(LINUX_VERSION_PROBED) \
>>   	KSRC=$(LINUX_DIR)
>>   
>> +define RTL8189ES_LINUX_CONFIG_FIXUPS
>> +	$(call KCONFIG_ENABLE_OPT,CONFIG_CFG80211)
> 
>      Symbol: CFG80211 [=m]
>      Type  : tristate
>      Defined at net/wireless/Kconfig:20
>        Prompt: cfg80211 - wireless configuration API
>        Depends on: NET [=y] && WIRELESS [=y] && (RFKILL [=y] || !RFKILL [=y])
> 
> So we need NET and WIRELESS (RFKILL is just to avoid it as a module).

Aaah right!
So here I need:
```
CONFIG_NET
CONFIG_WIRELESS
```
and

> WIRELESS depends on !s390, so rtl8189es should also not be available for
> BR2_s390x, but that's rthogonal to this change.
> 
>> +	$(call KCONFIG_ENABLE_OPT,CONFIG_MMC)
> 
> MMC, for a wireless driver? I've loked at the code, and MMC is not
> required. It can be used, yes, but it is not required, i.e. the code is
> springled with "#ifdef CONFIG_MMC", so it does not look like mandatory
> at all.

CONFIG_MMC is needed for SDIO interface and rtl8189es is driven with SDIO:
https://www.realtek.com/en/products/communications-network-ics/item/rtl8189es
And all the sdio_() APIs not found are enabled enabling CONFIG_MMC:
https://elixir.bootlin.com/linux/latest/source/drivers/mmc/core/Makefile#L7
```
obj-$(CONFIG_MMC)		+= mmc_core.o
mmc_core-y := sdio.o sdio_ops.o ...
```

The upstream driver also covers other Realtek chips, that's why
CONFIG_MMC is optional.

So the result should be:
```
CONFIG_NET
CONFIG_WIRELESS
CONFIG_MMC
```
Right?

Best regards
-- 
Giulio Benetti
Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
