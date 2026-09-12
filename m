Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10A43C88E53
	for <buildroot@archiver.kernel.org>; Sat, 12 Sep 2026 21:46:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BDDD740680;
	Sat, 12 Sep 2026 21:46:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 85dGOi1gfkO3; Sat, 12 Sep 2026 21:46:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org D461E406AE
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789249577;
	b=EqE0ytGpJEp2hHtATpN39yaBqWregu977vMyqvuN2J6UJGHmHohvj6AD04aoifoDfMmv
	 2LNLU+B738vuTsd4t31sXgswWi8cwXsERapMn+U/K0SxBLMYnbYqwiJggb69KDijNFOf5
	 UXDPoqQZKUs8VQUefGLErhixJsPey14ah1+Am8jhG5ujS72be9jF69p9/vwUnlOsA8T0u
	 /CIUTCu35daqxPWvw1yWX4jx9tWhQQfcF9NZX80CU9bYfwAhx77/xc/rZ/d1YhzknKj34
	 sm4nOh8L8I86sKElQThphx+FdqpHpI8JVNI0BoKly0Ia3MAOvSdZHVt1sQiALxLojpQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789249577;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=IBr024JBFYUvz1KblV1rXgmiH/dkgbRZkW6gVkKP854=;
	b=UFBpGh4KLI2Y+QKrg5AK6HwPUtw9f8yeG19MzTkmD+uRU/RAvSv1UKsr3dD1FNxejSFY
	 XdDFeGqytIaSbhMVKmQiaThyeemH1wZD9TAorYI22cqK9J02WFpFLtAEWJJVlD4oCtCD7
	 FnGkSmMVTyGS5BmZabl2vdBjlaqHEbFn4PunyaIbpnvvixenqCwQ8ib4mMbGqNydeVi3z
	 H4UmY5pVTZcdxSmMp8Dv8KorG2Hy5uhQBqS09f1SeJc0hQLqbbhNUDdFHq3IKj1MY1QWH
	 QMmBGbNplDIVKCAxTiwDQ5FBb/azO0RsqbI9oht2LnoJwGrgPL8aGvL6BhDcKSupeFA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789249576;
	bh=IBr024JBFYUvz1KblV1rXgmiH/dkgbRZkW6gVkKP854=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=q4DmDz63nyf7QtSMC/dK+LC7xDpjwVEiKfzrJyXEKgxnyVkQ/Alzp5gCilDggwfIh
	 VwO0fRuVUBv200fNIMsHSn+na8QH6Q/BJBqmnn45wimfeHjd2ba5ZCYQ6evqPiA+c/
	 HM01BsiSoeSroWNSSlJW6i7wWIkghN+tJ5sUhoJjNmd6lHF6Fooroew2aT0UlB6tFc
	 cNKoA5ayPb3fMEAVLd7er+1hrecobNJjHslVr3I2ZZeM2eZ9kFmSBo8nlECrnPecVo
	 QZMU9NArKRG4IpoGbcPxIPeti6KJTI7kGD3V4ricVJQMUqScevey2RcKjnwD24/ZOc
	 81mYabberPUZg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D461E406AE;
	Sat, 12 Sep 2026 21:46:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 23F67701
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 21:46:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 15789406AE
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 21:46:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l1KjRaSNkCjj for <buildroot@buildroot.org>;
 Sat, 12 Sep 2026 21:46:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 02E4840680
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789249574;
 b=N21/l3gaLuljYWEN9NJbn7ucIiHydRHYfdtMdd826CAhl+91pFcLTAJSsdtWPBvEtLU7
 vkdt5D/M6vTyv1bep//WGylwgiP8hWeRdJpIX6Ld2lWDFds6t+n8J8s4C2MvegBkFT1Pg
 GxonHiRveRGy0j0HWG271D6uDT/dAl9pcKhDXmBtrd2rMBu2r5S9So1wApdmdXdI6OGW4
 n2X2g2ohLpMA3fZlLpt8vb0yjGjU30ZgfshxLWIXjJX7+waVz19gFuf1Ko4juorX2QvA6
 p9m+GcV4+Mecz4+1VWOV2XDzBzzTfmm2Fi4NM+xrKpIxCm3eIKAzCa6SjS6GSl6ybVQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789249574;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=vVlEOGiOXM1NWoS/jjt7yIfFCsn01BdIEmgZ1xp3Lfs=;
 b=pU30vCvUoLsClxe4tPDow8uQgTjIq0hHwxwC5+zXLeu7Y995CQg/Etx1gshEC/rTFEYA
 ERG46dKMiuDPBg5F3bkb28EUZoTgheDyeS5Q5F+UIU+CIAzwWQLAzkH3qwasN64/LF6qg
 XQ5oUljv4E0XrnVR3wytTeF6VsRqQPPY669TAt/5vDg7g4+v2LNol6Xo7MtBNpKfD2mYP
 tQnKPVzgZA/w8c2kFDsUzCjaUJthl/6Ds0jMSGxNveFT4W63UA1j1SZ7r3BXlOBHvlKRK
 rytd69ULQeEgtgmiMtQUyEHuoy8Pom8BPBG+qJ7JNXDAfgFKIx9lUVi288AajEVKPsg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=bootlin.com; 
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b="UT/8P8u7"; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 02E4840680
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 21:46:12 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 431BE4E402F4
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 21:46:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 89F5860580;
 Sat, 12 Sep 2026 21:46:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id CB5DA11C7AFB8; 
 Sat, 12 Sep 2026 23:46:04 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Bernd Kuhls <bernd@kuhls.net>
Date: Sat, 12 Sep 2026 23:45:56 +0200
Message-ID: <20260912214557.1572535-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260912214557.1572535-1-thomas.petazzoni@bootlin.com>
References: <20260912214557.1572535-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH 2/2] package/intel-vpl-gpu-rt: add missing
 BR2_TOOLCHAIN_GCC_AT_LEAST_8 dependency
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

BR2_PACKAGE_INTEL_VPL_GPU_RT selects BR2_PACKAGE_INTEL_MEDIADRIVER but
did not propagate "depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8". This
commit fixes this issue, which was introduced in commit
ac65841defece904e91afe1fb51419084c993dba, when onevpl-intel-gpu was
introduced (it was later renamed to intel-vpl-gpu-rt).

Fixes: ac65841defece904e91afe1fb51419084c993dba ("package/onevpl-intel-gpu: new package")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/intel-vpl-gpu-rt/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/intel-vpl-gpu-rt/Config.in b/package/intel-vpl-gpu-rt/Config.in
index da26ea6aa5..44b2b1c304 100644
--- a/package/intel-vpl-gpu-rt/Config.in
+++ b/package/intel-vpl-gpu-rt/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_INTEL_VPL_GPU_RT
 	depends on BR2_PACKAGE_LIBVPL_ARCH_SUPPORTS # libvpl
 	depends on BR2_INSTALL_LIBSTDCPP # libvpl
 	depends on !BR2_STATIC_LIBS # libvpl
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # libvpl
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # intel-mediadriver
 	depends on BR2_TOOLCHAIN_HAS_SYNC_1 # intel-mediadriver
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libvpl
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # intel-mediadriver
@@ -18,9 +18,9 @@ config BR2_PACKAGE_INTEL_VPL_GPU_RT
 
 	  https://github.com/intel/vpl-gpu-rt
 
-comment "intel-vpl-gpu-rt needs a toolchain w/ dynamic library, gcc >= 7, C++, NPTL"
+comment "intel-vpl-gpu-rt needs a toolchain w/ dynamic library, gcc >= 8, C++, NPTL"
 	depends on BR2_x86_64
 	depends on BR2_PACKAGE_LIBVPL_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_1
-	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_8 || \
 		!BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
