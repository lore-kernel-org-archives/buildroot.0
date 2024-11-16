Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACD53E77173
	for <buildroot@archiver.kernel.org>; Sun,  8 Dec 2024 13:07:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 49BEE60729;
	Sun,  8 Dec 2024 13:07:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9THJtiXnwOc3; Sun,  8 Dec 2024 13:07:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 74901607D8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 74901607D8;
	Sun,  8 Dec 2024 13:07:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3CFACEE0
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 13:06:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DA4E7607EB
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 13:06:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wmKXyrLx4XU6 for <buildroot@buildroot.org>;
 Sun,  8 Dec 2024 13:06:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED719606F1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id ED719606F1
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 13:06:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DA52086B73; Sun,  8 Dec 2024 13:06:51 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 16 Nov 2024 20:21:08 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d6c14a6bc8cb8ef4d2c71e35e9d7d35905ce0347
X-Git-Newrev: 6c8f78b5ae1791771b74e9da024dd505709e095d
X-Patchwork-Hint: ignore
Message-Id: <20241208130651.DA52086B73@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/armadillo: bump to version 14.0.2
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6c8f78b5ae1791771b74e9da024dd505709e095d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The commit f69fe48404eda ("package/armadillo: temporarily update the
site URL") changed the download URL only to continue to build the
9.900.2 version. This is an outdated and no longer supported version
and as suggested by Conrad Sand, the project maintainer, it is
recommended upgrading to the latest version, which is currently 14.0.2,
and it's downloadable from the URL containing the most recent versions.

- Drop ARMADILLO_EXTRACT_CMDS added to fix an issue only related to
  the previous version building.
- C++14 is now mandatory.

Release notes:
https://arma.sourceforge.net/docs.html#changelog

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/armadillo/Config.in      |  4 +++-
 package/armadillo/armadillo.hash |  2 +-
 package/armadillo/armadillo.mk   | 12 ++++--------
 3 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/package/armadillo/Config.in b/package/armadillo/Config.in
index 7aed4fd02f..7a93343d41 100644
--- a/package/armadillo/Config.in
+++ b/package/armadillo/Config.in
@@ -2,16 +2,18 @@ comment "armadillo needs a toolchain w/ C++"
 	depends on BR2_PACKAGE_OPENBLAS_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP
 
-comment "armadillo needs a toolchain w/ fortran, C++"
+comment "armadillo needs a toolchain w/ fortran, C++, gcc >= 4.9"
 	depends on !BR2_PACKAGE_OPENBLAS_ARCH_SUPPORTS # otherwise, see comment above
 	depends on BR2_PACKAGE_LAPACK_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_HAS_FORTRAN || !BR2_INSTALL_LIBSTDCPP
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 
 config BR2_PACKAGE_ARMADILLO
 	bool "armadillo"
 	depends on BR2_PACKAGE_OPENBLAS_ARCH_SUPPORTS || \
 		(BR2_PACKAGE_LAPACK_ARCH_SUPPORTS && BR2_TOOLCHAIN_HAS_FORTRAN)
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++14
 	help
 	  Armadillo: An Open Source C++ Linear Algebra Library for
 	  Fast Prototyping and Computationally Intensive Experiments.
diff --git a/package/armadillo/armadillo.hash b/package/armadillo/armadillo.hash
index 9b19b8c8c4..4e86521923 100644
--- a/package/armadillo/armadillo.hash
+++ b/package/armadillo/armadillo.hash
@@ -1,4 +1,4 @@
 # Locally computed:
-sha256  d78658c9442addf7f718eb05881150ee3ec25604d06dd3af4942422b3ce26d05  armadillo-9.900.2.tar.xz.RETIRED
+sha256  248e2535fc092add6cb7dea94fc86ae1c463bda39e46fd82d2a7165c1c197dff  armadillo-14.0.2.tar.xz
 # License files, locally calculated
 sha256  3ddf9be5c28fe27dad143a5dc76eea25222ad1dd68934a047064e56ed2fa40c5  LICENSE.txt
diff --git a/package/armadillo/armadillo.mk b/package/armadillo/armadillo.mk
index 81684a44f7..608f8fb229 100644
--- a/package/armadillo/armadillo.mk
+++ b/package/armadillo/armadillo.mk
@@ -4,14 +4,14 @@
 #
 ################################################################################
 
-ARMADILLO_VERSION = 9.900.2
-ARMADILLO_SOURCE = armadillo-$(ARMADILLO_VERSION).tar.xz.RETIRED
-ARMADILLO_SITE = https://sourceforge.net/projects/arma/files/retired
+ARMADILLO_VERSION = 14.0.2
+ARMADILLO_SOURCE = armadillo-$(ARMADILLO_VERSION).tar.xz
+ARMADILLO_SITE = https://downloads.sourceforge.net/project/arma
 ARMADILLO_INSTALL_STAGING = YES
 ARMADILLO_LICENSE = Apache-2.0
 ARMADILLO_LICENSE_FILES = LICENSE.txt
 
-ARMADILLO_CONF_OPTS = -DDETECT_HDF5=false
+ARMADILLO_CONF_OPTS = -DDETECT_HDF5=false -DBUILD_SMOKE_TEST=false
 
 # blas support may be provided by lapack (libblas.a) or openblas (libopenblas.a)
 ARMADILLO_CONF_OPTS += -DBLAS_FOUND=ON
@@ -30,8 +30,4 @@ ARMADILLO_CONF_OPTS += -DLAPACK_FOUND=ON
 ARMADILLO_DEPENDENCIES += lapack
 endif
 
-define ARMADILLO_EXTRACT_CMDS
-	$(TAR) --strip-components=1 -C $(@D) $(TAR_OPTIONS) $($(PKG)_DL_DIR)/$(ARMADILLO_SOURCE)
-endef
-
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
