Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8BD2EB64DC
	for <buildroot@archiver.kernel.org>; Tue, 18 Jul 2023 20:59:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 70D67605C9;
	Tue, 18 Jul 2023 20:59:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 70D67605C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tOnvLgwpuNh2; Tue, 18 Jul 2023 20:59:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 762BA60B4C;
	Tue, 18 Jul 2023 20:59:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 762BA60B4C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5BE8B1BF20B
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 20:59:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 34FE9813CC
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 20:59:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 34FE9813CC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BlVFEc4MULUW for <buildroot@lists.busybox.net>;
 Tue, 18 Jul 2023 20:59:14 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C670F813B6
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C670F813B6
 for <buildroot@buildroot.org>; Tue, 18 Jul 2023 20:59:13 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b341.dip0.t-ipconnect.de [84.161.179.65])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id AE6BDA4C07EB;
 Tue, 18 Jul 2023 22:59:10 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:50096)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qLrmo-0004Rb-1Q;
 Tue, 18 Jul 2023 22:59:10 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 18 Jul 2023 22:59:08 +0200
Message-Id: <20230718205910.2667726-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1689713950;
 bh=Nt2qeQBGuuDXg3Se/JBQ0L8Xi2/bsBkWvdBhp0DN3p0=;
 h=From:To:Cc:Subject:Date:From;
 b=IOed6NqtBrQIfcbjOZAb5EGIYnCbuztfEYvR2y78a7PK6ogP8sP+sNPMW4bXDAbNu
 0uizsqc6JdHkKbjuSaidnm6tSTxXpa+iRC7Jjr1lXAH746IVklP3NCFX3aRoFKMchW
 ePF96cdNtrwx4pcAJxBVNk68oLjpYxBG5FwiRorymul3+sKETPYGVWp0G74hTP4Yia
 0UsRArv7LAzkYNa7xDSZbXqFnTQkYSm9xhyxN/Y/xN2hAS87JGGPXg416wRbd+mHlc
 3+fQ/b/0/f+fxMOv/obKVZi0Ng+lRoyUZOyOqsY7+Zo442nOYWAclHWTO++Pb+DqPG
 W+2DoN95qtHdA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=IOed6Nqt
Subject: [Buildroot] [PATCH v2 1/3] package/cmake: bump version to 3.26.4
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: no changes

 .../cmake/0001-rename-cmake-rootfile.patch    |  6 ++++--
 package/cmake/Config.in.host                  | 20 +++++++++++++++++++
 package/cmake/cmake.hash                      |  6 +++---
 package/cmake/cmake.mk                        |  4 ++--
 4 files changed, 29 insertions(+), 7 deletions(-)

diff --git a/package/cmake/0001-rename-cmake-rootfile.patch b/package/cmake/0001-rename-cmake-rootfile.patch
index a8cd3ee820..1f1fd4893e 100644
--- a/package/cmake/0001-rename-cmake-rootfile.patch
+++ b/package/cmake/0001-rename-cmake-rootfile.patch
@@ -12,10 +12,12 @@ This buildroot-specific patch makes sure ctest looks also for
 
 [Vincent: tweak patch for 3.6.3]
 [James: tweak patch for 3.15.4]
+[Bernd: tweak patch for 3.26.4]
 
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
+@@ -1668,7 +1668,12 @@ int cmake::AddCMakePaths()
+                       cmStateEnums::INTERNAL);
  #endif
    if (!cmSystemTools::FileExists(
 -        (cmSystemTools::GetCMakeRoot() + "/Modules/CMake.cmake"))) {
diff --git a/package/cmake/Config.in.host b/package/cmake/Config.in.host
index 5de076537b..c7b96019a8 100644
--- a/package/cmake/Config.in.host
+++ b/package/cmake/Config.in.host
@@ -27,10 +27,30 @@ config BR2_HOST_CMAKE_AT_LEAST_3_22
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
 # This order guarantees that the highest version is set, as kconfig
 # stops affecting a value on the first matching default.
 config BR2_HOST_CMAKE_AT_LEAST
 	string
+	default "3.26"	if BR2_HOST_CMAKE_AT_LEAST_3_26
+	default "3.25"	if BR2_HOST_CMAKE_AT_LEAST_3_25
+	default "3.24"	if BR2_HOST_CMAKE_AT_LEAST_3_24
+	default "3.23"	if BR2_HOST_CMAKE_AT_LEAST_3_23
 	default "3.22"	if BR2_HOST_CMAKE_AT_LEAST_3_22
 	default "3.21"	if BR2_HOST_CMAKE_AT_LEAST_3_21
 	default "3.20"	if BR2_HOST_CMAKE_AT_LEAST_3_20
diff --git a/package/cmake/cmake.hash b/package/cmake/cmake.hash
index 43b5efb0f0..a3567d3236 100644
--- a/package/cmake/cmake.hash
+++ b/package/cmake/cmake.hash
@@ -1,5 +1,5 @@
-# From https://cmake.org/files/v3.22/cmake-3.22.3-SHA-256.txt
-sha256  9f8469166f94553b6978a16ee29227ec49a2eb5ceb608275dec40d8ae0d1b5a0  cmake-3.22.3.tar.gz
+# From https://cmake.org/files/v3.26/cmake-3.26.4-SHA-256.txt
+sha256  313b6880c291bd4fe31c0aa51d6e62659282a521e695f30d5cc0d25abbd5c208  cmake-3.26.4.tar.gz
 
 # Locally calculated
-sha256  f1a4326266aada65b307dac05161a9d02d3dba4fb08b50cb26e3c24cc8a86e97  Copyright.txt
+sha256  4a01ccf2dc580ba570d02bc015bbe0ec92f1f318717aae9540ba841ba7946756  Copyright.txt
diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index b99877696a..d31a446c37 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 # When updating the version, please also update BR2_HOST_CMAKE_AT_LEAST_X_Y
-CMAKE_VERSION_MAJOR = 3.22
-CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).3
+CMAKE_VERSION_MAJOR = 3.26
+CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).4
 CMAKE_SITE = https://cmake.org/files/v$(CMAKE_VERSION_MAJOR)
 CMAKE_LICENSE = BSD-3-Clause
 CMAKE_LICENSE_FILES = Copyright.txt
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
