Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 672D7C4332F
	for <buildroot@archiver.kernel.org>; Thu,  9 Nov 2023 08:05:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D877A40988;
	Thu,  9 Nov 2023 08:05:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D877A40988
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZM3p72VS8Qrp; Thu,  9 Nov 2023 08:05:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 095274098E;
	Thu,  9 Nov 2023 08:05:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 095274098E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 07AB01BF475
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 08:05:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D3A1A6126D
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 08:05:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D3A1A6126D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lTCpxJXhQbnS for <buildroot@lists.busybox.net>;
 Thu,  9 Nov 2023 08:05:25 +0000 (UTC)
Received: from mx1.sberdevices.ru (mx1.sberdevices.ru [37.18.73.165])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DE60C60A66
 for <buildroot@buildroot.org>; Thu,  9 Nov 2023 08:05:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE60C60A66
Received: from p-infra-ksmg-sc-msk01 (localhost [127.0.0.1])
 by mx1.sberdevices.ru (Postfix) with ESMTP id 59AEA10003B;
 Thu,  9 Nov 2023 11:05:18 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 59AEA10003B
Received: from p-i-exch-sc-m01.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru
 [172.16.192.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx1.sberdevices.ru (Postfix) with ESMTPS;
 Thu,  9 Nov 2023 11:05:18 +0300 (MSK)
Received: from [192.168.1.13] (100.64.160.123) by
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.37; Thu, 9 Nov 2023 11:05:17 +0300
Message-ID: <e6e90b1e-9894-4168-9a8b-19b6e8ff855b@salutedevices.com>
Date: Thu, 9 Nov 2023 11:05:17 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, <buildroot@buildroot.org>
References: <20231107132323.3324587-1-ovlevin@salutedevices.com>
 <20231108232644.24817d72@windsurf>
In-Reply-To: <20231108232644.24817d72@windsurf>
X-Originating-IP: [100.64.160.123]
X-ClientProxiedBy: p-i-exch-sc-m01.sberdevices.ru (172.16.192.107) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 181228 [Nov 09 2023]
X-KSMG-AntiSpam-Version: 6.0.0.2
X-KSMG-AntiSpam-Envelope-From: ovlevin@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 543 543
 1e3516af5cdd92079dfeb0e292c8747a62cb1ee4,
 {Tracking_from_domain_doesnt_match_to}, 127.0.0.199:7.1.2;
 100.64.160.123:7.1.2; d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;
 salutedevices.com:7.1.1;
 p-i-exch-sc-m01.sberdevices.ru:5.0.1,7.1.1, FromAlignment: s,
 ApMailHostAddress: 100.64.160.123
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960,
 bases: 2023/11/09 07:10:00 #22435383
X-KSMG-AntiVirus-Status: Clean, skipped
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=salutedevices.com; s=mail; t=1699517118;
 bh=C5pVwjXXS6JXyI0mPRc4QRby9YQSs5/foauka+YHb00=;
 h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
 b=QSbemGNPFXAE1drKqGnd6WBXiZBFtTAmcGHEzCoVLcFN9qOOKj40AcjvEJD/kA7lZ
 dfMgfix1+xmW2rrvcSDbOSBDzVfIFE7ONRQLAGiHKK3ErMwA05R+gWmiFAQIxz74iV
 KgOhvB3nYtKArYMq4g5WaXFITVnOAFkHIRNMcrwu5XNOuZFZzSAlc0L/0cNq8yrubs
 JCGYc3y1h0d9wLN58tQq/fVIix0aWZUlR6sKxx6/Y8VR/8sBUTuBTsJBfi1pG8Odji
 1DrYev4dwX43o2CMM+2nGfafucgoUmx1tmlUnvJO/y2Gz8Sjv1so5XSod8L+rYscGz
 brKMerDGQC0+A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=salutedevices.com
 header.i=@salutedevices.com header.a=rsa-sha256 header.s=mail
 header.b=QSbemGNP
Subject: Re: [Buildroot] [PATCH 1/1] package: dhcpcd: fix dhcpcd binary not
 stripped
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
From: Oleg Lyovin via buildroot <buildroot@buildroot.org>
Reply-To: Oleg Lyovin <ovlevin@salutedevices.com>
Cc: John Stile <johns@msli.com>, olegartys@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,

On 09.11.2023 01:26, Thomas Petazzoni wrote:
> Hello Oleg,
> 
> On Tue, 7 Nov 2023 16:23:23 +0300
> Oleg Lyovin via buildroot <buildroot@buildroot.org> wrote:
> 
>> By default dhcpcd installed with 555 permissions as it is
>> configured in its Makefile.inc. Since 'w' bit is missing,
>> strip fails and dhcpcd binary installed non-stripped.
> 
> Wow, very good finding!
> 
>> On ARM GCC 12 glibc configuration strip saves over 1MB of disk space.
> 
> Could you clarify in which configuration you found that over 1 MB of
> disk space gets saved?
> 
> Here, my dhcpcd binary, unstripped looks like this:
> 
> -r-xr-xr-x. 1 thomas thomas 327K  8 nov.  23:22 dhcpcd
> 
> So, 327 KB. How can 1 MB be saved?
> 
> (Note: of course this doesn't remove anything to the relevance of your
> patch, but I'm curious how you got that number).
> 
> Thanks!
> 
> Thomas

Thanks a lot for your review!

About the 1 MB note: on my local configuration "TARGET_CFLAGS += -gdwarf-4" was set,
which obviously lead to great size increase.

With this option disabled, I got this for unstripped binary:

-rwxr-xr-x 1 olegartys olegartys 240K Nov  9 07:27 dhcpcd

I use the following configuration (highlighted only the important options):
BR2_arm=y
BR2_ARM_CPU_ARMV8A=y
BR2_GCC_TARGET_CPU="cortex-a35"
BR2_GCC_TARGET_FPU="fp-armv8"
BR2_GCC_TARGET_FLOAT_ABI="hard"
BR2_GCC_TARGET_MODE="thumb"
BR2_TOOLCHAIN_EXTERNAL_GCC_12=y
BR2_TOOLCHAIN_EXTERNAL_GLIBC=y

Sorry for the misleading comment about great size saving. If it's not too much trouble,
can you please remove it from commit-msg if you decide to apply the patch?

Thanks!
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
