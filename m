Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC7F5C4332F
	for <buildroot@archiver.kernel.org>; Wed, 16 Nov 2022 00:33:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3942240B4E;
	Wed, 16 Nov 2022 00:33:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3942240B4E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qN9sUy707LQ9; Wed, 16 Nov 2022 00:33:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5E41E40424;
	Wed, 16 Nov 2022 00:33:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5E41E40424
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2CD271BF8C7
 for <buildroot@lists.busybox.net>; Wed, 16 Nov 2022 00:33:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0748B402BB
 for <buildroot@lists.busybox.net>; Wed, 16 Nov 2022 00:33:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0748B402BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WLZpcyOQRK4m for <buildroot@lists.busybox.net>;
 Wed, 16 Nov 2022 00:33:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EDC70402B2
Received: from smtpcmd10101.aruba.it (smtpcmd10101.aruba.it [62.149.156.101])
 by smtp4.osuosl.org (Postfix) with ESMTP id EDC70402B2
 for <buildroot@buildroot.org>; Wed, 16 Nov 2022 00:33:28 +0000 (UTC)
Received: from [192.168.50.220] ([146.241.88.137])
 by Aruba Outgoing Smtp  with ESMTPSA
 id v6Moo6NQk1jfKv6MpoWIgI; Wed, 16 Nov 2022 01:33:27 +0100
Message-ID: <901ec05a-8d90-8658-29ac-381f50ae0eaa@benettiengineering.com>
Date: Wed, 16 Nov 2022 01:33:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20221019134823.12594-1-giulio.benetti@benettiengineering.com>
 <20221030210615.49866828@windsurf>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <20221030210615.49866828@windsurf>
X-CMAE-Envelope: MS4xfEvGq+UGfGjtmlkfWZegv6sovUqBdmDdSd6E1U49wqQxUvfRI+TefEXMvdCigfNmJi09DmMzWDiJEpaVYz+0lG+r75I4fzMlRpVl6bG6L3V+JoNjmkY7
 /ubIFXHXRxZn6Kq5YX+mkPIjUmgelEV0pxDqCebaXGnxqznx7Kmu5HbhnjoXH+VUy+BavP0nQTyYoAkTpWYV6K3SRaR91zWz1GKX9S0dG7Bzgyf1++HC+Xpb
 ckJreHsVH+BMkBCMGWVCQAlxYJubvb4OzK7U0tmPKq/TQyVU1+eVWJ2SXpWSUKgLcVdlKekjMBVpLgpS7px3Qw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1668558807; bh=xuT/W66TXGVMcBT2JsXnhq+CluMwRIU/hvXwB8AuPhc=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=PVJdDsGlRaynzJUSXI22xA+lTE0qhJmjiUXLLecgTsLOEcwyQU2+yqtPTFqBoGYRo
 bTcv2SmQPKh84hY+D82iVnhWYaf+irZte8iXT0VHnSjTaPGkAJURbOudUsvj0aRvcH
 /anOr6LC3xys1xTyW92E1VUAQFdEyQV/QdxSpAF6H9WXFjCkZR+baA+5zPDD7ipyY1
 CBKxJlQvkUHXXeOMbE2A/phDFk65dXvAvYlltGF/d3ZGFyD4vJCdI3qIgqnxdmJ01j
 sMOZDnsiIEMpGKcenJhNEA59FFSzTQlqSDkSn5aLfNPyIAqeP9fhGphI/LcNn+Ll69
 GvkicUu/7s3EQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=PVJdDsGl
Subject: Re: [Buildroot] [PATCH v2] package/rtl8188eu: remove wrong
 description in Config.in
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
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, buildroot@buildroot.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Thomas, Luca,

On 30/10/22 21:06, Thomas Petazzoni via buildroot wrote:
> On Wed, 19 Oct 2022 15:48:23 +0200
> Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
> 
>> This rtl8188eu driver is not the same as the one in mainline Linux that
>> still has pending work to be done that in this driver is done, check:
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/staging/r8188eu/TODO
>> specifically:
>> * Switch to use LIB80211.
>> * Switch to use MAC80211.
>> * Switch to use CFG80211.
>> So let's remove the description that is not valid anymore.
>>
>> Suggested-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
>> ---
>> V1->V2:
>> * improve Config.in description as pointed by Luca Ceresoli
>> ---
>>   package/rtl8188eu/Config.in | 7 ++++---
>>   1 file changed, 4 insertions(+), 3 deletions(-)
>>
>> diff --git a/package/rtl8188eu/Config.in b/package/rtl8188eu/Config.in
>> index 76d9085297..2fab1fd5c0 100644
>> --- a/package/rtl8188eu/Config.in
>> +++ b/package/rtl8188eu/Config.in
>> @@ -4,9 +4,10 @@ config BR2_PACKAGE_RTL8188EU
>>   	depends on BR2_LINUX_KERNEL
>>   	help
>>   	  A standalone driver for the RTL8188EU USB Wi-Fi adapter.
>> -	  This is needed only for Linux kernels before 3.12.
>> -	  Since 3.12, there is a (staging) driver in mainline, with a
>> -	  similar codebase.
>> +	  This rtl8188eu driver is not the same as the one in mainline
>> +	  Linux that still has pending work to be done that in this
>> +	  driver is done, check:
>> +	  https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/staging/r8188eu/TODO
> 
> I don't see any thing in this TODO that explains why the out-of-tree
> driver is better than the mainline driver.
> 
> The out-of-tree driver has been integrated into drivers/staging/, and
> this TODO file lists what should be improved in the driver so that it
> can be graduated to move outside of drivers/staging/ into the proper
> drivers/net/wireless/ location.
> 
> I don't see anything in this TODO that indicates that the out-of-tree
> driver has "more features" than the mainline driver, so to me the
> Config.in help text still makes sense.
> 
> Could you give some more details?

The TODO file[0] is outdated because it states that:
* Switch to use LIB80211.
* Switch to use MAC80211.
* Switch to use CFG80211.
are still pending, but it's true not because if we check the Kconfig[1]
we find 'depends on CFG80211' and LIB80211. Also if we check for
ieee80211_*() callse int drivers/staging/r8188eu folder we find a lot of
calls. So I think this module is only a copy of the Linux driver that
can work as specified in the actual help(with Linux version before 3.12.

Does it maybe make sense to add in the help section:
```
If using Linux 3.12+ it's recommended to use Linux driver
```
?
Or we can rename the package name with the suffix -legacy?

Regarding the other wifi drivers I've checked and they are not supported
in Linux, nor staging nor net/wireless, except rtl8723bu[2], so maybe it
makes sense to drop rtl8723bu package.

What do you think?

[0]: 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/staging/r8188eu/TODO
[1]: 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/staging/r8188eu/Kconfig
[2]: 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/net/wireless/realtek/rtl8xxxu/rtl8xxxu_8723b.c#n238

Thank you
Best regards
-- 
Giulio Benetti
CEO/CTO@Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
