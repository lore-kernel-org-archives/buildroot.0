Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75438F483D7
	for <buildroot@archiver.kernel.org>; Mon, 23 Mar 2026 19:48:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 44F8340D0D;
	Mon, 23 Mar 2026 19:48:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5YTvkFE5hGuA; Mon, 23 Mar 2026 19:48:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B44740C88
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774295291;
	bh=aSZTG81xgo95KkomQpLrgEDApSaGsPw9DhYYkpm1GWo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=biVf/GjSGqDZe32Co1JpeV5K8ZtnS+nJ/xR+A+V7Ha2drG55G5z/iQvxIaivRel4+
	 BY04wfB5P/gzD4jD/JjvuUFKjGM34qV8UF7pooHNzQmGD32bBYix4cByrVSQ4KQug1
	 gWrvenPN1rz8wsvTf7xdkkoR1JcvOUHnVqODz2+GAw4/lqWg7QhOLKGWH7IT3ONP0W
	 Sh73SbmRVXnkm6K342LAxCaQohy/CEFzAu68mYoThl0alEdkB/oDSXzzp3jeUBJ4oT
	 gcWrmfLHf86ekmQwZziY2/e4InEIV7bA3hqvBNC0QtrrJT1DctgKQ5cCibMJj92l89
	 u+O/fdfeooCTg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B44740C88;
	Mon, 23 Mar 2026 19:48:11 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5A258F4
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 66D6140281
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kgoN3HQoz2v0 for <buildroot@buildroot.org>;
 Mon, 23 Mar 2026 19:47:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3EFE24007D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3EFE24007D
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6F41B845E8; Mon, 23 Mar 2026 19:47:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 21 Mar 2026 18:14:41 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7fe315a6f71a9f66ff4672deb58d723b81953c74
X-Git-Newrev: 114861915662d63b2f9aac28409d128a95482f14
X-Patchwork-Hint: ignore
Message-Id: <20260323194745.6F41B845E8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cmake: bump version to 4.3.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/114861915662d63b2f9aac28409d128a95482f14
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://cmake.org/cmake/help/v4.3/release/4.3.html

Added Upstream: tag and rebased patch 0001.

Updated license hash due to copyright year bump:
https://gitlab.kitware.com/cmake/cmake/-/commit/97ad58a86cf73d85f755939114eb6b32f085d0dd

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                            | 1 -
 package/cmake/0001-rename-cmake-rootfile.patch | 8 +++++---
 package/cmake/Config.in.host                   | 5 +++++
 package/cmake/cmake.hash                       | 6 +++---
 package/cmake/cmake.mk                         | 4 ++--
 5 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 0b1f71d8c6..973ecfba89 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -244,7 +244,6 @@ package/cfm/S65cfm lib_sysv.Indent lib_sysv.Variables
 package/cgroupfs-mount/S30cgroupfs Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/chipmunk/0001-Fix-build-failure-on-musl.patch lib_patch.Upstream
 package/chrony/S49chronyd lib_sysv.Variables
-package/cmake/0001-rename-cmake-rootfile.patch lib_patch.Upstream
 package/collectd/0001-src-netlink.c-remove-REG_NOERROR.patch lib_patch.Upstream
 package/connman/S45connman lib_sysv.Variables
 package/copas/0001-Do-not-load-coxpcall-for-LuaJIT.patch lib_patch.Upstream
diff --git a/package/cmake/0001-rename-cmake-rootfile.patch b/package/cmake/0001-rename-cmake-rootfile.patch
index c73e0dfe02..72da31c8a3 100644
--- a/package/cmake/0001-rename-cmake-rootfile.patch
+++ b/package/cmake/0001-rename-cmake-rootfile.patch
@@ -10,9 +10,11 @@ files are removed at build time via the target-finalize rule.
 This buildroot-specific patch makes sure ctest looks also for
 "Modules/CMake.cmake.ctest" before complaining
 
+Upstream: N/A (specific to buildroot)
+
 [Vincent: tweak patch for 3.6.3]
 [James: tweak patch for 3.15.4]
-[Bernd: tweak patch for 3.27.0 & 3.31.2]
+[Bernd: rebased for 4.3.0]
 
 Signed-off-by: Davide Viti <zinosat@tiscali.it>
 Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
@@ -26,7 +28,7 @@ diff --git a/Source/cmake.cxx b/Source/cmake.cxx
 index 3772f09985..c317e4af38 100644
 --- a/Source/cmake.cxx
 +++ b/Source/cmake.cxx
-@@ -1896,7 +1896,12 @@ int cmake::AddCMakePaths()
+@@ -1987,7 +1987,12 @@ int cmake::AddCMakePaths()
                        cmStateEnums::INTERNAL);
  #endif
    if (!cmSystemTools::FileExists(
@@ -39,7 +41,7 @@ index 3772f09985..c317e4af38 100644
 +  {
      // couldn't find modules
      cmSystemTools::Error(
-       "Could not find CMAKE_ROOT !!!\n"
+       cmStrCat("Could not find CMAKE_ROOT !!!\n"
 -- 
 2.20.1
 
diff --git a/package/cmake/Config.in.host b/package/cmake/Config.in.host
index 86f93b0ac8..0d96ee2233 100644
--- a/package/cmake/Config.in.host
+++ b/package/cmake/Config.in.host
@@ -75,10 +75,15 @@ config BR2_HOST_CMAKE_AT_LEAST_4_2
 	bool
 	select BR2_HOST_CMAKE_AT_LEAST_4_1
 
+config BR2_HOST_CMAKE_AT_LEAST_4_3
+	bool
+	select BR2_HOST_CMAKE_AT_LEAST_4_2
+
 # This order guarantees that the highest version is set, as kconfig
 # stops affecting a value on the first matching default.
 config BR2_HOST_CMAKE_AT_LEAST
 	string
+	default "4.3"	if BR2_HOST_CMAKE_AT_LEAST_4_3
 	default "4.2"	if BR2_HOST_CMAKE_AT_LEAST_4_2
 	default "4.1"	if BR2_HOST_CMAKE_AT_LEAST_4_1
 	default "4.0"	if BR2_HOST_CMAKE_AT_LEAST_4_0
diff --git a/package/cmake/cmake.hash b/package/cmake/cmake.hash
index 88744ac703..605bed2a40 100644
--- a/package/cmake/cmake.hash
+++ b/package/cmake/cmake.hash
@@ -1,5 +1,5 @@
-# From https://cmake.org/files/v4.2/cmake-4.2.3-SHA-256.txt
-sha256  7efaccde8c5a6b2968bad6ce0fe60e19b6e10701a12fce948c2bf79bac8a11e9  cmake-4.2.3.tar.gz
+# From https://cmake.org/files/v4.3/cmake-4.3.0-SHA-256.txt
+sha256  f51b3c729f85d8dde46a92c071d2826ea6afb77d850f46894125de7cc51baa77  cmake-4.3.0.tar.gz
 
 # Locally calculated
-sha256  1e0d48f16c60f400838a96989684ae12cec35cb96688db11e8cb0204058cf4b8  LICENSE.rst
+sha256  4382e7c1879ac90e3f101a395d23846fa4dbcaa1eed7265b43681e348754825d  LICENSE.rst
diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index f5d1787d19..952e8174f4 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 # When updating the version, please also update BR2_HOST_CMAKE_AT_LEAST_X_Y
-CMAKE_VERSION_MAJOR = 4.2
-CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).3
+CMAKE_VERSION_MAJOR = 4.3
+CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).0
 CMAKE_SITE = https://cmake.org/files/v$(CMAKE_VERSION_MAJOR)
 CMAKE_LICENSE = BSD-3-Clause
 CMAKE_LICENSE_FILES = LICENSE.rst
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
