Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 092EEC55173
	for <buildroot@archiver.kernel.org>; Sat,  1 Aug 2026 11:11:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BF2C66079B;
	Sat,  1 Aug 2026 11:11:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T8nICNgtc-Jd; Sat,  1 Aug 2026 11:11:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E30DD6079D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785582684;
	bh=7G+pZ6mzEvuBpbkTU9j0C7/ENsvdMxzhm4bjVN6OhrQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Q2m9GvHMPEB//UlCZt4CFNjfprcnDiNp8kgTiCuMv3wsbZ5WfyEvIF1Kr2GvMEPJD
	 DVMmdhT2WyharNIYK+RKQToAp+kvB+0JwOopYvzKRdAXbPVvVRZ+v3QACZFm3wvgDu
	 EVqDoo7Qb2MVCaNGMaF2s3W17BHq/seKwe3ROM5Q6WVoBB5a/ISuIeeJ3g51aQk4sj
	 U2uii8dpN7NII6QkCcpCasOTDBAGjgPW+wOfX4TWB1Tpsj0j6BcRl98+sHuPMwlBis
	 PuiyDGXXuw6UXjscpM8uXzYTPOeuv9W7/hm45g4lwGzf/OBzyru6IpDaGxjF3WpkvB
	 yFmrvFT+jkseA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E30DD6079D;
	Sat,  1 Aug 2026 11:11:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id AAFC9138A
 for <buildroot@buildroot.org>; Sat,  1 Aug 2026 11:11:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9D5C140061
 for <buildroot@buildroot.org>; Sat,  1 Aug 2026 11:11:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PhqoLTPo2r2g for <buildroot@buildroot.org>;
 Sat,  1 Aug 2026 11:11:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE0534004E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EE0534004E
 for <buildroot@buildroot.org>; Sat,  1 Aug 2026 11:11:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5D7DE86C5E; Sat,  1 Aug 2026 11:10:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 1 Aug 2026 12:35:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fd685fc8c2c061641e94bff8f5db76d49be6a18b
X-Git-Newrev: cec50f48d6b2f2d2b8683b1637e4513a5acb0d5a
X-Patchwork-Hint: ignore
Message-Id: <20260801111037.5D7DE86C5E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/armadillo: needs gcc >= 8
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/cec50f48d6b2f2d2b8683b1637e4513a5acb0d5a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Upstream bumped the minimum required gcc version from 6.1 to 8.1 in
commit 84ec3ddf9fd3 ("bump minimum gcc version to 8.1"), so the build
now fails with "Compiler too old; need at least gcc 8.1" on older
toolchains.

There is no gcc 8.0.x release (the 8.x series starts at 8.1.0), so
BR2_TOOLCHAIN_GCC_AT_LEAST_8 is enough to express this dependency.

While at it, add the gcc version to the openblas-arch comment, which
only checked for C++ support and would therefore stay hidden on
toolchains that are too old.

Fixes: 597d5d10ec77 ("package/armadillo: bump to version 15.0.1")
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/armadillo/Config.in | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/armadillo/Config.in b/package/armadillo/Config.in
index 7a93343d41..7b66179fb8 100644
--- a/package/armadillo/Config.in
+++ b/package/armadillo/Config.in
@@ -1,19 +1,19 @@
-comment "armadillo needs a toolchain w/ C++"
+comment "armadillo needs a toolchain w/ C++, gcc >= 8"
 	depends on BR2_PACKAGE_OPENBLAS_ARCH_SUPPORTS
-	depends on !BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_8
 
-comment "armadillo needs a toolchain w/ fortran, C++, gcc >= 4.9"
+comment "armadillo needs a toolchain w/ fortran, C++, gcc >= 8"
 	depends on !BR2_PACKAGE_OPENBLAS_ARCH_SUPPORTS # otherwise, see comment above
 	depends on BR2_PACKAGE_LAPACK_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_FORTRAN || !BR2_INSTALL_LIBSTDCPP
-	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_8
 
 config BR2_PACKAGE_ARMADILLO
 	bool "armadillo"
 	depends on BR2_PACKAGE_OPENBLAS_ARCH_SUPPORTS || \
 		(BR2_PACKAGE_LAPACK_ARCH_SUPPORTS && BR2_TOOLCHAIN_HAS_FORTRAN)
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++14
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # armadillo requires gcc >= 8.1
 	help
 	  Armadillo: An Open Source C++ Linear Algebra Library for
 	  Fast Prototyping and Computationally Intensive Experiments.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
