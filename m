Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D2B9C001DF
	for <buildroot@archiver.kernel.org>; Fri, 28 Jul 2023 19:39:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ACCF74217A;
	Fri, 28 Jul 2023 19:39:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ACCF74217A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id igCQj691dIEr; Fri, 28 Jul 2023 19:39:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6DC1142188;
	Fri, 28 Jul 2023 19:39:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6DC1142188
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 541ED1BF312
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 19:39:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2CC9142172
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 19:39:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2CC9142172
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WzLCs9BSgApQ for <buildroot@lists.busybox.net>;
 Fri, 28 Jul 2023 19:39:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BD7DD41E8D
 for <buildroot@buildroot.org>; Fri, 28 Jul 2023 19:39:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD7DD41E8D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A7964838C4; Fri, 28 Jul 2023 19:39:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 28 Jul 2023 21:34:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4ce0dacb60b7fdccf3daabe58e09358da3f09fa2
X-Git-Newrev: bb90cbdaa37ab1c12dda592167a69910d96eac80
X-Patchwork-Hint: ignore
Message-Id: <20230728193903.A7964838C4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cmake: bump version to 3.27.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=bb90cbdaa37ab1c12dda592167a69910d96eac80
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Updated license hash due to various commits since Feb 08, 2021:
https://gitlab.kitware.com/cmake/cmake/-/commits/v3.27.0/Copyright.txt

Added option to disable optional cppdap support, buildroot does not
provide this package. Needed due to upstream commit:
https://gitlab.kitware.com/cmake/cmake/-/commit/5ec69eb58c4d863e9f8f278b7c78d08f8cedd3f4

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/cmake/0001-rename-cmake-rootfile.patch |  6 ++++--
 package/cmake/Config.in.host                   | 25 +++++++++++++++++++++++++
 package/cmake/cmake.hash                       |  6 +++---
 package/cmake/cmake.mk                         |  5 +++--
 4 files changed, 35 insertions(+), 7 deletions(-)

diff --git a/package/cmake/0001-rename-cmake-rootfile.patch b/package/cmake/0001-rename-cmake-rootfile.patch
index a8cd3ee820..7e6e0a8cf7 100644
--- a/package/cmake/0001-rename-cmake-rootfile.patch
+++ b/package/cmake/0001-rename-cmake-rootfile.patch
@@ -12,10 +12,12 @@ This buildroot-specific patch makes sure ctest looks also for
 
 [Vincent: tweak patch for 3.6.3]
 [James: tweak patch for 3.15.4]
+[Bernd: tweak patch for 3.27.0]
 
 Signed-off-by: Davide Viti <zinosat@tiscali.it>
 Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  Source/cmake.cxx | 7 ++++++-
  1 file changed, 6 insertions(+), 1 deletion(-)
@@ -24,8 +26,8 @@ diff --git a/Source/cmake.cxx b/Source/cmake.cxx
 index 3772f09985..c317e4af38 100644
 --- a/Source/cmake.cxx
 +++ b/Source/cmake.cxx
-@@ -1009,7 +1009,12 @@ int cmake::AddCMakePaths()
-     "Path to cpack program executable.", cmStateEnums::INTERNAL);
+@@ -1891,7 +1891,12 @@ int cmake::AddCMakePaths()
+                       cmStateEnums::INTERNAL);
  #endif
    if (!cmSystemTools::FileExists(
 -        (cmSystemTools::GetCMakeRoot() + "/Modules/CMake.cmake"))) {
diff --git a/package/cmake/Config.in.host b/package/cmake/Config.in.host
index 5de076537b..0935e9a564 100644
--- a/package/cmake/Config.in.host
+++ b/package/cmake/Config.in.host
@@ -27,10 +27,35 @@ config BR2_HOST_CMAKE_AT_LEAST_3_22
 	bool
 	select BR2_HOST_CMAKE_AT_LEAST_3_21
 
+config BR2_HOST_CMAKE_AT_LEAST_3_23
+	bool
+	select BR2_HOST_CMAKE_AT_LEAST_3_22
+
+config BR2_HOST_CMAKE_AT_LEAST_3_24
+	bool
+	select BR2_HOST_CMAKE_AT_LEAST_3_23
+
+config BR2_HOST_CMAKE_AT_LEAST_3_25
+	bool
+	select BR2_HOST_CMAKE_AT_LEAST_3_24
+
+config BR2_HOST_CMAKE_AT_LEAST_3_26
+	bool
+	select BR2_HOST_CMAKE_AT_LEAST_3_25
+
+config BR2_HOST_CMAKE_AT_LEAST_3_27
+	bool
+	select BR2_HOST_CMAKE_AT_LEAST_3_26
+
 # This order guarantees that the highest version is set, as kconfig
 # stops affecting a value on the first matching default.
 config BR2_HOST_CMAKE_AT_LEAST
 	string
+	default "3.27"	if BR2_HOST_CMAKE_AT_LEAST_3_27
+	default "3.26"	if BR2_HOST_CMAKE_AT_LEAST_3_26
+	default "3.25"	if BR2_HOST_CMAKE_AT_LEAST_3_25
+	default "3.24"	if BR2_HOST_CMAKE_AT_LEAST_3_24
+	default "3.23"	if BR2_HOST_CMAKE_AT_LEAST_3_23
 	default "3.22"	if BR2_HOST_CMAKE_AT_LEAST_3_22
 	default "3.21"	if BR2_HOST_CMAKE_AT_LEAST_3_21
 	default "3.20"	if BR2_HOST_CMAKE_AT_LEAST_3_20
diff --git a/package/cmake/cmake.hash b/package/cmake/cmake.hash
index 43b5efb0f0..e5a047e7d3 100644
--- a/package/cmake/cmake.hash
+++ b/package/cmake/cmake.hash
@@ -1,5 +1,5 @@
-# From https://cmake.org/files/v3.22/cmake-3.22.3-SHA-256.txt
-sha256  9f8469166f94553b6978a16ee29227ec49a2eb5ceb608275dec40d8ae0d1b5a0  cmake-3.22.3.tar.gz
+# From https://cmake.org/files/v3.27/cmake-3.27.1-SHA-256.txt
+sha256  b1a6b0135fa11b94476e90f5b32c4c8fad480bf91cf22d0ded98ce22c5132004  cmake-3.27.1.tar.gz
 
 # Locally calculated
-sha256  f1a4326266aada65b307dac05161a9d02d3dba4fb08b50cb26e3c24cc8a86e97  Copyright.txt
+sha256  4a01ccf2dc580ba570d02bc015bbe0ec92f1f318717aae9540ba841ba7946756  Copyright.txt
diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index b99877696a..1e29e25471 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 # When updating the version, please also update BR2_HOST_CMAKE_AT_LEAST_X_Y
-CMAKE_VERSION_MAJOR = 3.22
-CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).3
+CMAKE_VERSION_MAJOR = 3.27
+CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).1
 CMAKE_SITE = https://cmake.org/files/v$(CMAKE_VERSION_MAJOR)
 CMAKE_LICENSE = BSD-3-Clause
 CMAKE_LICENSE_FILES = Copyright.txt
@@ -33,6 +33,7 @@ CMAKE_CONF_OPTS = \
 	-DKWSYS_CHAR_IS_SIGNED=TRUE \
 	-DCMAKE_USE_SYSTEM_LIBRARIES=1 \
 	-DCTEST_USE_XMLRPC=OFF \
+	-DCMake_ENABLE_DEBUGGER=0 \
 	-DBUILD_CursesDialog=OFF
 
 # Get rid of -I* options from $(HOST_CPPFLAGS) to prevent that a
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
