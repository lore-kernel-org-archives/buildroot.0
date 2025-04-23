Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E7C4C369CB
	for <buildroot@archiver.kernel.org>; Wed, 23 Apr 2025 18:34:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DBB44412AE;
	Wed, 23 Apr 2025 18:34:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Iztv-9rNkwDc; Wed, 23 Apr 2025 18:34:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EEAE541296
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EEAE541296;
	Wed, 23 Apr 2025 18:34:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 93F112A6
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 18:34:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 837C8836F0
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 18:34:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cSC1CEysKRr2 for <buildroot@buildroot.org>;
 Wed, 23 Apr 2025 18:34:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 28D4D810C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 28D4D810C1
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 28D4D810C1
 for <buildroot@buildroot.org>; Wed, 23 Apr 2025 18:34:12 +0000 (UTC)
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:656e:cf44:475c:a8d2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 06917B00579;
 Wed, 23 Apr 2025 20:34:08 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>
Date: Wed, 23 Apr 2025 20:34:03 +0200
Message-ID: <20250423183403.9160-1-ju.o@free.fr>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1745433250;
 bh=Hzy5Q3tZF7CDSHUw3ZxuvlvSRZ14WYzZzjPO55LSspM=;
 h=From:To:Cc:Subject:Date:From;
 b=iqmG2/HMnQq9t3LBKVQzXSyqc7UhuAAxPojO2Zf2MGc03MGZ7BJGhN0O2Ae1RvYUQ
 0o0HeL1rGzZLO8UkWZYB+xkpLq09qP5iq3es8VXZ7HOdo0Gm7BiyC1nmvXxoiaYWge
 hEtPM3Blas3A/aEdzUsWAeevpBNVHCgre7O3Std0FixcP334vdB54bqEoKG1hODnQ2
 k0U0bN2dCDgl5eGpji6qW/f97T2onblEEzDp3Q6YPmqm09vG07HEosNz6cJyjyOvfG
 HkpBcMxolwpSXTDxkTIwJ1eJipRUbP2UW9K7MUJp16qC6e2YaggrsRlVgrag3c8UZo
 I7BIDpUyiCNew==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=iqmG2/HM
Subject: [Buildroot] [PATCH 1/1] package/octave: bump to version 10.1.0
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

See release note:
https://octave.org/NEWS-10.html

GNU Octave now requires a C++17 compiler. This change is reflected in
the Config.in dependencies.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Patch tested in:
https://gitlab.com/jolivain/buildroot/-/jobs/9792375542
---
 package/octave/Config.in   | 6 +++---
 package/octave/octave.hash | 4 ++--
 package/octave/octave.mk   | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/octave/Config.in b/package/octave/Config.in
index 73e27f65e8..a969147adf 100644
--- a/package/octave/Config.in
+++ b/package/octave/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_OCTAVE
 	bool "octave"
 	depends on BR2_PACKAGE_OPENBLAS_ARCH_SUPPORTS
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
 	depends on BR2_TOOLCHAIN_HAS_FORTRAN
 	# Some Bootlin x86_64 toolchains (like version
 	# bleeding-edge-2021.11-1) has a file
@@ -32,7 +32,7 @@ config BR2_PACKAGE_OCTAVE
 
 	  https://www.octave.org/
 
-comment "octave needs a toolchain w/ C++ and fortran, gcc >= 4.8"
+comment "octave needs a toolchain w/ C++ and fortran, gcc >= 7"
 	depends on !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
 		!BR2_TOOLCHAIN_HAS_FORTRAN
diff --git a/package/octave/octave.hash b/package/octave/octave.hash
index e0cf6f626c..e45fe12ceb 100644
--- a/package/octave/octave.hash
+++ b/package/octave/octave.hash
@@ -1,5 +1,5 @@
 # Locally computed after checking signature
-# https://ftp.gnu.org/gnu/octave/octave-9.4.0.tar.lz.sig
+# https://ftp.gnu.org/gnu/octave/octave-10.1.0.tar.lz.sig
 # using key DBD9C84E39FE1AAE99F04446B05F05B75D36644B
-sha256  693fceb5b69211034d464b61be871c803ff74a3af4de72829341c365a53d6da1  octave-9.4.0.tar.lz
+sha256  aa1583316916ab5d08e71bcfa63eb865ecaa2561e842f769748d9b106b4cb409  octave-10.1.0.tar.lz
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/octave/octave.mk b/package/octave/octave.mk
index 5ea3f80253..4410da38b1 100644
--- a/package/octave/octave.mk
+++ b/package/octave/octave.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OCTAVE_VERSION = 9.4.0
+OCTAVE_VERSION = 10.1.0
 OCTAVE_SITE = $(BR2_GNU_MIRROR)/octave
 OCTAVE_SOURCE = octave-$(OCTAVE_VERSION).tar.lz
 OCTAVE_LICENSE = GPL-3.0+
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
