Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D72ABC19F2A
	for <buildroot@archiver.kernel.org>; Thu, 11 Aug 2022 21:03:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 759CF60BB9;
	Thu, 11 Aug 2022 21:03:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 759CF60BB9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EcBkvdAI73rA; Thu, 11 Aug 2022 21:03:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9154E60804;
	Thu, 11 Aug 2022 21:03:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9154E60804
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D61A41BF2B9
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 21:03:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9E0038141F
 for <buildroot@lists.busybox.net>; Thu, 11 Aug 2022 21:03:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E0038141F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Vy8cU4tHO00A for <buildroot@lists.busybox.net>;
 Thu, 11 Aug 2022 21:03:50 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD3BE8140B
Received: from sendmail.purelymail.com (sendmail.purelymail.com
 [34.202.193.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AD3BE8140B
 for <buildroot@buildroot.org>; Thu, 11 Aug 2022 21:03:50 +0000 (UTC)
Feedback-ID: 3615:1030:null:purelymail
X-Pm-Original-To: buildroot@buildroot.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 229812383
 for <buildroot@buildroot.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Thu, 11 Aug 2022 21:03:45 +0000 (UTC)
Date: Thu, 11 Aug 2022 23:01:03 +0200
To: buildroot@buildroot.org
Message-ID: <20220811210103.kbygtc3h5ffwuhsx@purelymail.com>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailman-Original-DKIM-Signature: a=rsa-sha256;
 b=XGyXkzo82cUowuVxQ/Kr0HXaO0PNieUL4R9zPthN1DT/K2a0rAKwN0P8UTv0M1mqX8guAJHhGi0pcmIB1v3AQmRmRgs5XahDn9j5gURalm+MguUse3k0Mi6OuMsyFIIrGma0wQmr0DVsJ2KJli2C8+QyEgChjT8oMwRN682qr+5LLUq0tzO2LbGahZovTB1seVGl+u6ST8gjbGeqfqndU2FtYMNuJe14WHmsV2RDlxFHNSt2O97I7YPT8akkGD5oibZIA3ndH1dJWztf9j5zlEEEGMbkXnCk2ZU2hL+viBbMXMO7GDGDGlH8FwF386D2h6BxI7yz/6UUvtcda90uAA==;
 s=purelymail2; d=purelymail.com; v=1;
 bh=csOIir4wdFswqC6wss2oXNzspSjm6e4gXAUf0f8NRXM=;
 h=Feedback-ID:Received:From:To; 
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=purelymail.com header.i=@purelymail.com
 header.a=rsa-sha256 header.s=purelymail2 header.b=XGyXkzo8
Subject: [Buildroot] Unable to build for Banana Pi M2 ZERO - _libdft
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
From: Michal Ciesielski via buildroot <buildroot@buildroot.org>
Reply-To: Michal Ciesielski <ciesielskimm@purelymail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello

I'm trying to build bananapi_m2_zero_defconfig. I'm hitting the following problem:

  OBJCOPY spl/u-boot-spl-nodtb.bin
  COPY    spl/u-boot-spl.bin
  MKSUNXI spl/sunxi-spl.bin
  BINMAN  u-boot-sunxi-with-spl.bin
binman: No module named _libfdt
make[1]: *** [Makefile:1348: u-boot-sunxi-with-spl.bin] Error 1
make[1]: Leaving directory '/home/mc/gits/buildroot-2022.05.1/output/build/uboot-2019.01'
make: *** [package/pkg-generic.mk:293: /home/mc/gits/buildroot-2022.05.1/output/build/uboot-2019.01/.stamp_built] Error 2

Before that problem I see the warning:

/home/mc/gits/buildroot-2022.05.1/output/host/lib/python3.10/site-packages/setuptools/dist.py:530:
UserWarning: The version specified ('u-boot-2019.01') is an invalid version, this may not work as
expected with newer versions of setuptools, pip, and PyPI. Please see PEP 440 for more details.

Looking at the path it seems it's using Python3. Looking at the description here https://lists.denx.de/pipermail/u-boot/2017-October/308661.html.
it seems this would be solved by using Python2. I found the option BR2_TARGET_UBOOT_NEEDS_PYTHON2
but this seems to be legacy option.

Is this a Buildroot problem or is it me? Any idea how to make this work?

Thanks, Michal

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
