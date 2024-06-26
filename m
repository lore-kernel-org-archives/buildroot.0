Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84B4BC3064D
	for <buildroot@archiver.kernel.org>; Wed, 26 Jun 2024 15:42:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2EF8260681;
	Wed, 26 Jun 2024 15:42:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J5r1-XoqsWFA; Wed, 26 Jun 2024 15:42:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1BF4D60C06
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1BF4D60C06;
	Wed, 26 Jun 2024 15:42:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D00F61BF3F2
 for <buildroot@lists.busybox.net>; Wed, 26 Jun 2024 15:42:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C999F400DA
 for <buildroot@lists.busybox.net>; Wed, 26 Jun 2024 15:42:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id elnDrG-lPNz5 for <buildroot@lists.busybox.net>;
 Wed, 26 Jun 2024 15:42:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 95F8C419FA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 95F8C419FA
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 95F8C419FA
 for <buildroot@buildroot.org>; Wed, 26 Jun 2024 15:42:08 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.117.148]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N4QsY-1sUuSp09qg-013DEH; Wed, 26
 Jun 2024 17:42:05 +0200
Message-ID: <9d6d6ecc-48c9-438f-9e69-42456f793b74@gmx.de>
Date: Wed, 26 Jun 2024 17:42:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
References: <20240626145942.3154406-1-fiona.klute@gmx.de>
 <CABGWkvoOTM9g3AYsGOAJB_yfQ_xY=XFBZopP9cJcWJz-DNUQuw@mail.gmail.com>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <CABGWkvoOTM9g3AYsGOAJB_yfQ_xY=XFBZopP9cJcWJz-DNUQuw@mail.gmail.com>
X-Provags-ID: V03:K1:Aa291gtlbvYpLytPgBVgy6IaaJ5hBMkI7jR+neWa4QzEXpeqmS9
 cP44057Vsy4g7SAnuJLd7WAwNs9c0rKjqMUirGmwoWit0mlM/TETL61e61Qa2tmfBbLKjX2
 U3s3gHe89mIC/xZdr9COYIlhE1OAkH3pK6Tgnr8iHaJ3oHdqHxUZOcU89UkAjEJDIciso3L
 opPKqpQ1Axd1K2tYyltIw==
UI-OutboundReport: notjunk:1;M01:P0:9xeWXlxoCPA=;mBlzWgkzI8u86hTGDh8XyhAZa3X
 4kxW6OIFM0FZsz8xDsjeu7mQTT8Xt5q/5Uk0PDXEiZZwxQbqlk/vhaew2u9Y2DlLPGZWRIh9m
 VQyLiIeiBoP19VZKtzfnkrya0KP5+NnNSJcmsRIJ0hQgVoq/6CYAurpo6UpghtUnfYptK8q6K
 2vv7ow1QjqtWTxrSPWAKWsocrgOCjg8ULAEGbcgW03YitLf8CpevcQOQbcD69GmiqIs3Yb74J
 u4v+fK2hdHtFltwqV5z1PWhb305AJE6CQw5c8/e/C3rIQPsecgWHK2I9lzbquDVLJ5XUyWjRE
 Qg4moVHpLw/XRlZOlHBM06FGBOAL48rO01cDPr/PsRSyJLOei7N7G8w2PHdKCfOX4tEtBvV/Z
 gdGlI9UHRwR6GJ1NerFETTYUeoPHmZGohCGZd4hVzk7lrOJcioq8kkFxnN6QShPA5YkhBh6ZA
 RhObW54Np8BsZf1XMXav0gONQvxHAKeMukCzI6DRfMZkjW16oRKsHcWlxCVEJFe+lKzQd9m4Y
 u9IRXSx4iowVnpJogv5Ts3bwUljDGy7LCfvuscI9teBafr3xe3xMiBaVVPJjw7Rt8OWdk6fyo
 V+NxESODmZqPOopQTTFUPIc7GnD6d6/Q9tYiqCBJcrBl1TpcxKmaU19+svV8/DDO2Irx8QEUu
 OAJjnRJpBy9NX31LhXlFG1WWX2WuPIE8+MBXxJTbZrJqns2uWhCMZnP3/6lzfZchuPj274oWl
 Ls6JaiCZz9Fht1WbrNJcvSbRLMRDYa4gXj4KJ0GznpZMu0/36hkvSaU2l0+/8PkLlOztO2l19
 nbt3Hz2zGIQe0NEhBUBzvMrH3af3cS1Oxu15z+lP+L7IM=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1719416525; x=1720021325; i=fiona.klute@gmx.de;
 bh=RRDtsjtwfQe+OlaRr5cgGR+ZRh8Ya5MGLniPTsKQdw4=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=jB1KpU8e7akekMsyHuefGZgfVL0hPYV5qYEmO8LQCGbXgmhc1vcWLqkfGfR+HH1+
 MnqnaVax6s4HBe9h34/IChXggGglEfu3sBDThVeADbWRiBpVKT6d6zwCbpbzDFdLt
 NL1FunA2vRnW71mLaT+V6c/VkQ+kviX7Wl6cgp1TxhH49IV88o5svZq3/I5iarF8f
 zIqLE+RNqDTPEbhsCWT6qVf+rVv6jJK1ygex7UYDreWy2IWbjNm/NX34dH11ziMGE
 X/QETpqH9f192SxKrG4Tf38WP2fUC8W5ZP6uwUvy6K+wVtH/6/Vx7bhtBjwGDmsEi
 R3VDirAxun7E725w2Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=jB1KpU8e
Subject: Re: [Buildroot] [PATCH 1/1] package/rauc: select
 BR2_PACKAGE_LIBOPENSSL_ENGINES
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: Heiko Thiery <heiko.thiery@gmail.com>, buildroot@buildroot.org,
 Andrey Yurovsky <yurovsky@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 26.06.24 um 17:29 schrieb Dario Binacchi:
> *Dario Binacchi*
>
> Senior Embedded Linux Developer
>
> dario.binacchi@amarulasolutions.com
>
> __________________________________
>
>
> *Amarula Solutions SRL*
>
> Via Le Canevare 30, 31100 Treviso, Veneto, IT
>
> T. +39 042 243 5310
> info@amarulasolutions.com
>
> www.amarulasolutions.com
>
> Hi Fiona,
>
> Il giorno mer 26 giu 2024 alle 16:59 Fiona Klute <fiona.klute@gmx.de> ha
> scritto:
>
>> This fixes link time errors, undefined references to various ENGINE_*
>> functions (paths shortened to the output directory):
>>
>> host/lib/gcc/aarch64-buildroot-linux-musl/13.3.0/../../../../aarch64-buildroot-linux-musl/bin/ld:
>> librauc.a.p/src_signature.c.o: in function `get_pkcs11_engine.constprop.0':
>> signature.c:(.text.get_pkcs11_engine.constprop.0+0x14): undefined
>> reference to `ENGINE_load_builtin_engines'
>> host/lib/gcc/aarch64-buildroot-linux-musl/13.3.0/../../../../aarch64-buildroot-linux-musl/bin/ld:
>> signature.c:(.text.get_pkcs11_engine.constprop.0+0x20): undefined reference
>> to `ENGINE_by_id'
>> host/lib/gcc/aarch64-buildroot-linux-musl/13.3.0/../../../../aarch64-buildroot-linux-musl/bin/ld:
>> signature.c:(.text.get_pkcs11_engine.constprop.0+0x54): undefined reference
>> to `ENGINE_ctrl_cmd_string'
>> host/lib/gcc/aarch64-buildroot-linux-musl/13.3.0/../../../../aarch64-buildroot-linux-musl/bin/ld:
>> signature.c:(.text.get_pkcs11_engine.constprop.0+0x60): undefined reference
>> to `ENGINE_init'
>> host/lib/gcc/aarch64-buildroot-linux-musl/13.3.0/../../../../aarch64-buildroot-linux-musl/bin/ld:
>> signature.c:(.text.get_pkcs11_engine.constprop.0+0xe0): undefined reference
>> to `ENGINE_ctrl_cmd_string'
>> host/lib/gcc/aarch64-buildroot-linux-musl/13.3.0/../../../../aarch64-buildroot-linux-musl/bin/ld:
>> signature.c:(.text.get_pkcs11_engine.constprop.0+0x128): undefined
>> reference to `ENGINE_free'
>> host/lib/gcc/aarch64-buildroot-linux-musl/13.3.0/../../../../aarch64-buildroot-linux-musl/bin/ld:
>> signature.c:(.text.get_pkcs11_engine.constprop.0+0x1a4): undefined
>> reference to `ENGINE_finish'
>> host/lib/gcc/aarch64-buildroot-linux-musl/13.3.0/../../../../aarch64-buildroot-linux-musl/bin/ld:
>> librauc.a.p/src_signature.c.o: in function `load_cert':
>> signature.c:(.text.load_cert+0x114): undefined reference to
>> `ENGINE_ctrl_cmd'
>> host/lib/gcc/aarch64-buildroot-linux-musl/13.3.0/../../../../aarch64-buildroot-linux-musl/bin/ld:
>> librauc.a.p/src_signature.c.o: in function `load_key':
>> signature.c:(.text.load_key+0x124): undefined reference to
>> `ENGINE_load_private_key'
>
>
>>
>> Before linking there were matching implicit declaration warnings
>> during compile.
>>
>> Signed-off-by: Fiona Klute <fiona.klute+wiwa@gmx.de>
>> ---
>> I assume this is a consequence of
>> 623d3bbe43e9193aa8e3395367d01af59071b859, previously RAUC built fine
>> without the option enabled.
>>
>
> I think you are right. This patch raised the error because it was not
> backward compatible. So my suggestion is to fix the problem patching
> package/libopensslConfig.in to enable by default the _ENGINES option.

I'm happy to add a patch to change the default, but I believe the RAUC
package needs the dependency either way: A user could override the
changed default for BR2_PACKAGE_LIBOPENSSL_ENGINES, and then the RAUC
build would break again. The explicit dependency prevents that and makes
clear that if you want RAUC you need the OpenSSL engines.

Best regards,
Fiona

>>   package/rauc/Config.in | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/package/rauc/Config.in b/package/rauc/Config.in
>> index 7451b29a55..69a65d165b 100644
>> --- a/package/rauc/Config.in
>> +++ b/package/rauc/Config.in
>> @@ -5,6 +5,7 @@ config BR2_PACKAGE_RAUC
>>          depends on BR2_USE_WCHAR # glib2
>>          select BR2_PACKAGE_LIBGLIB2
>>          select BR2_PACKAGE_OPENSSL
>> +       select BR2_PACKAGE_LIBOPENSSL_ENGINES
>>          select BR2_PACKAGE_SQUASHFS # run-time dependency
>>          select BR2_PACKAGE_UBOOT_TOOLS if BR2_TARGET_UBOOT # run-time
>> dependency
>>          select BR2_PACKAGE_UBOOT_TOOLS_FWPRINTENV if BR2_TARGET_UBOOT
>> --
>> 2.45.2
>>
>>
>


_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
