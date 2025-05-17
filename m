Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91674C2D0CD
	for <buildroot@archiver.kernel.org>; Sat, 17 May 2025 10:49:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5739E81587;
	Sat, 17 May 2025 10:49:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zTUW8_3Y6Ec0; Sat, 17 May 2025 10:49:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 776BA80E86
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 776BA80E86;
	Sat, 17 May 2025 10:49:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8954C1DE
 for <buildroot@buildroot.org>; Sat, 17 May 2025 10:49:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7AE1C40529
 for <buildroot@buildroot.org>; Sat, 17 May 2025 10:49:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0wlIQoMVZPxW for <buildroot@buildroot.org>;
 Sat, 17 May 2025 10:49:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B613C40409
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B613C40409
 for <buildroot@buildroot.org>; Sat, 17 May 2025 10:49:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A50D886EEF; Sat, 17 May 2025 10:49:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 17 May 2025 12:48:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 97ac89eb115dbcd28efd1cf95d9a308f71b33041
X-Git-Newrev: 4672e18ca1b2bb27f4eee2006168eaddecd465a3
X-Patchwork-Hint: ignore
Message-Id: <20250517104928.A50D886EEF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/octave: bump to version 10.1.0
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4672e18ca1b2bb27f4eee2006168eaddecd465a3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See release note:
https://octave.org/NEWS-10.html

GNU Octave now requires a C++17 compiler. This change is reflected in
the Config.in dependencies.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
