Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CDC5C624DB
	for <buildroot@archiver.kernel.org>; Sat,  5 Sep 2026 06:23:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B5BC140BED;
	Sat,  5 Sep 2026 06:23:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 49D2uchCRNEt; Sat,  5 Sep 2026 06:23:48 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org CFF3240BF1
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788589427;
	b=P1d1APc9LrStmYh6UIDHd1n3Pg0WKJPdNL9riT4sqwpGniCRpcZi36HLrFXUu/ztu3NQ
	 LXuv2lbARIvDD7DuS+2BCYY3rwL9OkBhFjYk2ztvSh3FX91KEXR8apP+5137c9aS4Ui0G
	 XlJCLegI58/DqSkdTy2+jIwyWviZPgKzUslka8dzST8loq784DZvR2a2OHid9SoKI9uTE
	 l0zYVbbrzsCdQiXsfTeDEG2UWQ33AkSTKjFlxVyG3eplkTOjSiLlJcKaPU5/hABsB3ajc
	 ECLC1bSsmtiooDLchWsI2yHoWdBgFLylyZZ6oBnof0QypK7qwpdUYIsGvU1+QZ8ZAXA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788589427;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=CLfvCJl4IxW2LkK4/hL153wnCaobq6Kwk4d52Aa6yNw=;
	b=EPQ4E5agIrbp0fzXO9Nc9/x+fvqf+3EOb+fxi+hPiFZ3yW90vk3P4mqzPkPBTWYBnCFm
	 P+EjpMGiMJ7qfEzy1OuvN0QXc1ELHAjJWaxDbCrM6xQsTBRo64dkpG76SBpE+2KQfXQhw
	 VPUC0XQS6+WQ637Vp++b5PaK4qg4LJa/QCTdw0TOmVNPlUwI+h55TcrtWUpKTN+gAKxX1
	 JIz0kQD9q5X1o7XunURkF+tljj5pQEAOg1ZHa6dDU4m+wMarNXZj6szOfrIEtJU54oiG3
	 DCSKkbm8gs0eLZm4bEvjPA6/56cPYU9X9Ske3IHAmtIYGgloVI6Idzt9vHgvIOupuyw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788589427;
	bh=CLfvCJl4IxW2LkK4/hL153wnCaobq6Kwk4d52Aa6yNw=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=J+viR5YzLSUolFkp/2CPGTjLOvm7eOCWB8fua8r8rdPB0Fsr64mxaod1/3UAfSDyZ
	 Sqy03rOAwkQ2awnGOUgl1f9pXpS3GkLFPfC7EhIY9N/jLSRibI0Dx4bZCqRP/1e3w/
	 pDVXCgi63qu0LT0HD0VW+F9glrq2ahO399m5UNsQ7IGTAAPnFP7V+vzZPQwsdLFMqv
	 WrTcMuwxor/6wjTfsZh7GF16TUmr2/06MctxrwgKwgfugwm1WagAg0ykAA5T5+fP96
	 9Yj3xMqVm2RFnw2ReSQQEIx5P011kXLqk1hv2aJj4+XsHbVFmcHcSejsrO4RMEKOKU
	 rYM1yc4u+pcJQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CFF3240BF1;
	Sat,  5 Sep 2026 06:23:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9F58D9CF
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 06:23:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9167660627
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 06:23:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NXag0s_XdHEL for <buildroot@buildroot.org>;
 Sat,  5 Sep 2026 06:23:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 9B64060BF1
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788589425;
 b=U0Sgmd13iDM9/Cm0sSX3M18u/JqBqtAYzueQE1zpvBHB5E11vDxLkI4+wx4SBmg9VIpy
 RtsrO/iRFIhaMGXvvGdEdLa5T1UH75eQRmwXQCakPMz5ci0NDIBW7Wt0bcNg7aU+vDfDX
 ZBXiwv/jUZ2V2x764g/IqqEG9foIWb+SwNdaQ2fAFT6hKrXN5R7InnnZc/XFeRgbEz+U1
 vfw4/TcMKYiEWEitewNYJGtb6xKrFkSOukBDGgUjftAX0VpYi5T7Ah6VGkoAqdxOlU3T+
 KwlAh1F3trzOSblkxpLpS6bxSo1OPWmgCdMB7tFG1PX2nfg/40VAVohfeuKAqdkIoMg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788589425;
 h=Received-SPF:DKIM-Signature:Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
 X-Spam-Score:X-Spamd-Bar;
 bh=Qsv8M49Kh0XTqJS2mpkkYfHh1yoZ1hMeon8UXWtQHgM=;
 b=BVCGYCSGeQzqef7JbPY/j6InlhP6UmwhLkhF+VcIV1MrNx71snIvVNAPGhxcFBeF/ub7
 kQ+WwkcbPVdcBiBCpBdzHOebcLdz3GSXqWD6XU6Ex9MXU6rc33sGixNv1Fz42c3ESVYs0
 IJ0fpfCM3hwzfCc6/7Gfd+bngm5LWJk+KQFo5Tau+WIvcCU3vFHikprxfZLqCZt48FOtP
 6h83E4mqEfUo/biCRhau1SHMkD7culqS4wKoG+zZpBynQb+OQmDrxH3b9A5kdxe2rzMm9
 MBcCDJL+wymk/Eq6YAiQY3dc5mGf9+28FzRbOpjBBZEAgvmp7rJzLuCI0MCog8/x0NA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b="J/CWkGM1"; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=J/CWkGM1
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9B64060BF1
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 06:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1788589397;
 bh=Qsv8M49Kh0XTqJS2mpkkYfHh1yoZ1hMeon8UXWtQHgM=;
 h=From:To:Cc:Subject:Date:From;
 b=J/CWkGM1hANhC3XaMb+yN3E9+mFhNaYqS6btmzaTBmXJKkJYK7MlcwAWxFILLkRr/
 dxPjOaq/h95Tj3QdJ/dZ3POFY/zmn18WC4066PXoUTsacg3choAaS02+4DrTD8Yu66
 HmmkyospPruh6XDMHzVu7XZxBl97q+tD7CToMhTUfEnXDM8E0ZYufw/PHyvKPJ/hS/
 xiKiw1ueWuRokdTruO0pei2mHf+zBTLIL2lOG+7eH9OI0cJofI8EjGF+6zXEtRC2W2
 3TSJER4QGBkZz/pFcsK9a3yShQmNkbArMl8auoi08IDs9SaqgMf9Fxq0+oX851WCIH
 4yHXRx20iJ74A==
Received: from fli4l.lan.fli4l (p5b3a03a0.dip0.t-ipconnect.de [91.58.3.160])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 32554A4C31C6;
 Sat,  5 Sep 2026 08:23:17 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40936)
 by fli4l.lan.fli4l with esmtp (Exim 4.100)
 (envelope-from <bernd@kuhls.net>) id 1x2jo4-000000002H5-2nzW;
 Sat, 05 Sep 2026 06:23:16 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  5 Sep 2026 08:23:14 +0200
Message-ID: <20260905062316.383690-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 1/3] package/i2pd: needs gcc >= 8
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Upstream started using std::string_view
https://github.com/search?q=repo%3APurpleI2P%2Fi2pd+string_view&type=commits&s=committer-date&o=asc

with commit
https://github.com/PurpleI2P/i2pd/commit/a3e0b3710c66b854eee33d7532cbe262e9a72ba0

first released in version 2.54.0 which was added to buildroot with
commit dea4f02bbb24b2125df6f4aa7a4b301a2316ef06.

Building the package with the gcc6-based defconfig
bootlin-aarch64-glibc-old is broken:

/builds/bkuhls/buildroot/br-test-pkg/bootlin-aarch64-glibc-old/build/i2pd-2.61.0/libi2pd/Base.h:14:23:
 fatal error: string_view: No such file or directory

BR2_TOOLCHAIN_HAS_GCC_BUG_64735 can be removed as well now as it depends
on gcc < 7.

A backport to LTS branches should be considered.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Series passed Gitlab pipelines:
https://gitlab.com/bkuhls/buildroot/-/commits/22dfb2cf28943aeaf56911d53553585d6047adb8

 package/i2pd/Config.in | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/package/i2pd/Config.in b/package/i2pd/Config.in
index cb6f7894ea..fc2f3b9367 100644
--- a/package/i2pd/Config.in
+++ b/package/i2pd/Config.in
@@ -1,13 +1,13 @@
 config BR2_PACKAGE_I2PD
 	bool "i2pd"
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # string_view
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	# pthread_condattr_setclock
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-filesystem
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR # boost
-	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # exception_ptr
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_BOOST_FILESYSTEM
 	select BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
@@ -24,15 +24,10 @@ config BR2_PACKAGE_I2PD
 
 	  http://i2pd.website
 
-comment "i2pd needs a toolchain w/ C++, NPTL, wchar"
+comment "i2pd needs a toolchain w/ C++, gcc >= 8, NPTL, wchar"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
 	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_8 || \
 		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_USE_WCHAR
-
-comment "i2pd needs exception_ptr"
-	depends on BR2_USE_MMU
-	depends on BR2_TOOLCHAIN_HAS_ATOMIC
-	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
-	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
