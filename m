Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B83DC25B10
	for <buildroot@archiver.kernel.org>; Fri, 10 May 2024 11:56:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 270F34056F;
	Fri, 10 May 2024 11:56:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 47bxHsGHeIvo; Fri, 10 May 2024 11:55:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E610A42A80
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E610A42A80;
	Fri, 10 May 2024 11:55:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DD7131BF2A1
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 11:55:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D770542A4F
 for <buildroot@lists.busybox.net>; Fri, 10 May 2024 11:55:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0rLycx2FqDQI for <buildroot@lists.busybox.net>;
 Fri, 10 May 2024 11:55:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0FF544056F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0FF544056F
 for <buildroot@buildroot.org>; Fri, 10 May 2024 11:55:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F091286E86; Fri, 10 May 2024 11:55:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 10 May 2024 13:48:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5f7275787ab1520c3d3f7eb9d2bd1b9f5ff41443
X-Git-Newrev: a4023ae75d9295803104dbd6bde35fdfd3c39bce
X-Patchwork-Hint: ignore
Message-Id: <20240510115553.F091286E86@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/policycoreutils: bump version to
 3.6
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a4023ae75d9295803104dbd6bde35fdfd3c39bce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

setsebool/Makefile now unconditionally links against libsepol.
As such, it is now a new dependency.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/policycoreutils/Config.in            | 5 +++--
 package/policycoreutils/policycoreutils.hash | 2 +-
 package/policycoreutils/policycoreutils.mk   | 4 ++--
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/policycoreutils/Config.in b/package/policycoreutils/Config.in
index 499aaf531d..07e171a53f 100644
--- a/package/policycoreutils/Config.in
+++ b/package/policycoreutils/Config.in
@@ -6,10 +6,11 @@ comment "policycoreutils needs a toolchain w/ threads, dynamic library, gcc >= 5
 config BR2_PACKAGE_POLICYCOREUTILS
 	bool "policycoreutils"
 	depends on BR2_PACKAGE_AUDIT_ARCH_SUPPORTS # libsemanage
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libsemanage
-	depends on !BR2_STATIC_LIBS # libsemanage
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libsemanage, libsepol
+	depends on !BR2_STATIC_LIBS # libsemanage, libsepol
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # libsemanage -> libselinux -> libsepol
 	select BR2_PACKAGE_LIBSEMANAGE
+	select BR2_PACKAGE_LIBSEPOL
 	select BR2_PACKAGE_LIBCAP_NG
 	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	help
diff --git a/package/policycoreutils/policycoreutils.hash b/package/policycoreutils/policycoreutils.hash
index e29d192b13..ea45116912 100644
--- a/package/policycoreutils/policycoreutils.hash
+++ b/package/policycoreutils/policycoreutils.hash
@@ -1,3 +1,3 @@
 # https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256  78453e1529fbbf800e88860094d555e781ce1fba11a7ef77b5aabb43e1173276  policycoreutils-3.5.tar.gz
+sha256  a76ac431ea40a35a83164ce9007909c1c6c12fd1056627f622144e4a705c0a2c  policycoreutils-3.6.tar.gz
 sha256  204d8eff92f95aac4df6c8122bc1505f468f3a901e5a4cc08940e0ede1938994  LICENSE
diff --git a/package/policycoreutils/policycoreutils.mk b/package/policycoreutils/policycoreutils.mk
index 3152fb6b67..714e2d7ad6 100644
--- a/package/policycoreutils/policycoreutils.mk
+++ b/package/policycoreutils/policycoreutils.mk
@@ -4,13 +4,13 @@
 #
 ################################################################################
 
-POLICYCOREUTILS_VERSION = 3.5
+POLICYCOREUTILS_VERSION = 3.6
 POLICYCOREUTILS_SITE = https://github.com/SELinuxProject/selinux/releases/download/$(POLICYCOREUTILS_VERSION)
 POLICYCOREUTILS_LICENSE = GPL-2.0
 POLICYCOREUTILS_LICENSE_FILES = LICENSE
 POLICYCOREUTILS_CPE_ID_VENDOR = selinuxproject
 
-POLICYCOREUTILS_DEPENDENCIES = libsemanage libcap-ng $(TARGET_NLS_DEPENDENCIES)
+POLICYCOREUTILS_DEPENDENCIES = libsemanage libsepol libcap-ng $(TARGET_NLS_DEPENDENCIES)
 POLICYCOREUTILS_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS) LDLIBS=$(TARGET_NLS_LIBS)
 
 ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
