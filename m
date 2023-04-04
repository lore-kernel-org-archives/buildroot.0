Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89B79C77B60
	for <buildroot@archiver.kernel.org>; Tue,  4 Apr 2023 15:25:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1906940A77;
	Tue,  4 Apr 2023 15:25:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1906940A77
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YjpkSmTofpv0; Tue,  4 Apr 2023 15:25:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 61FD940A6E;
	Tue,  4 Apr 2023 15:25:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 61FD940A6E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 217291BF348
 for <buildroot@lists.busybox.net>; Tue,  4 Apr 2023 15:25:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EC989409B4
 for <buildroot@lists.busybox.net>; Tue,  4 Apr 2023 15:25:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC989409B4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5DCpyzxBUipN for <buildroot@lists.busybox.net>;
 Tue,  4 Apr 2023 15:25:34 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D40B4092B
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7D40B4092B
 for <buildroot@buildroot.org>; Tue,  4 Apr 2023 15:25:32 +0000 (UTC)
Received: from Exchange2013.PRIMES.local ([80.154.17.250]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MdvVu-1qIVeo0Iwo-00b3J3; Tue, 04 Apr 2023 17:25:28 +0200
Received: from EXCHANGE2013.PRIMES.local ([fe80::55a6:8c84:95c:30ca]) by
 Exchange2013.PRIMES.local ([fe80::55a6:8c84:95c:30ca%16]) with mapi id
 14.03.0513.000; Tue, 4 Apr 2023 17:25:27 +0200
From: Gerd Kautzmann <G.Kautzmann@PRIMES.de>
To: Bagas Sanjaya <bagasdotme@gmail.com>
Thread-Topic: [Buildroot] Tools(?) packages for drivers a kernels 6..x
Thread-Index: AdlnBZdqa3kUJebZSiaR5XFM0A796A==
Date: Tue, 4 Apr 2023 15:25:27 +0000
Message-ID: <1619D009AA8C9E469331A8EE22395AEC8C24E76A@Exchange2013.PRIMES.local>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.117.177]
MIME-Version: 1.0
X-Provags-ID: V03:K1:ye+P4Isfhul3aA7uNA/M3yNE4GrczZOwcoTn77xuNJV7KKFNVHW
 WSyliqOnM/5V8D96AwWupkYiSn/hrKRwXm+EccNifPmTlQWo1GxCu05hhsxfh7jyIPiYfyJ
 6WzXw3YeoHI8MtyW2lh+cIhKg8aD+1s0ufaD1rpsgtgkBzb5whgzc9MiBIqYiangSuST8pa
 kWZjcjrGni/+FNayZsXDQ==
UI-OutboundReport: notjunk:1;M01:P0:bAFbL+ZETdo=;UN7neUAY4GAA2MGu4GPo1ZdWJqT
 0YZO3ur81VzG2OuGxr8exg1Z7CST9ABeSaXyRMRgOgIIi2LpTZ1NK+6R0Sa/AZ4+8IyhgCAXo
 tK4Na24QTDhljRrFTuiCv2Z1o69rcTVCJODaXvutrgdAjTzf+elAL7/esxUX6b8lWc+0A2l90
 IK53X2wha9nMBwhLg2jPRBK2WzMJ+zYRLCZvn1OaWncLhx0Df0M3mBLe5HI+eLmBi93lGImLx
 wNUltzyRVIijC+SD5IZAOvx9biPfyDuKhZ4SkWyBbpRpbJfo5pw/SWcetwjMtCTGPbCB0CTuw
 86OlJzb+kIWRaQjiMiDS8/t8WjINuk5aFRzOGF5bjNs/wrI5G8gDVBYCsLBtC9pgjTHh5SbIU
 Knc3Fbzf5TSYR+1oW3P412zmRtUQ0JQdJb0sd9znxyhXX1K046K1fnw+U6s5isYlV4VSXLecG
 2oiHi7JOHkwHTtvwcimuWDN4SlKDCyr3a6M2jWvi/fiMi9pC+RhtNTBOnhtT5IFE8RsuoMwee
 kGBBeFcp6nxM5R/zkcINffO/qC+qOmCs7JR1LWXPduJS17B+54Zo61TMLzOA7qrXAeZfyijHl
 bNU+GMfXkNyC21WGRPV4XZMd77vkivrGBsuqHcnUHLMe2zh4sm5kC8jLcDNO4nnT1PdOygKli
 VYhy91N2+3xXTX9R5kf4UKkKc7ZDcpEF1xumsSGGFA==
Subject: Re: [Buildroot] Tools(?) packages for drivers a kernels 6..x
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

> Newer Linux Kernels like 6.1.4 seems to have some support fort he camera imx296, buildingthem with buildroot is leadingto an error:
> 
> *** Can't find default configuration "arch/arm/configs/bcm2711_defconfig"!


> [1]: https://raw.githubusercontent.com/raspberrypi/linux/rpi-6.1.y/arch/arm64/configs/bcm2711_defconfig

Thanks for you reply, I never considered downloading some additional configuration files myself.

This is what I did:

cd output/build/linux-6.1.14/arch/arm/configs
wget https://raw.githubusercontent.com/raspberrypi/linux/rpi-6.1.y/arch/arm/configs/bcm2711_defconfig
make

buildprocess was successful

> because it looks like you ask multiple, distinct questions in the same thread. 
> Please start new thread for each question in that case.

Sorry, I wasn't very precise, there might be two ways getting a linux image with support for a special device and I didn't really know which way to chose.

And sorry for html format, Outlook is a mess and it got worse after they switched to ribbons.


Greetings Gerd
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
