Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF37DEB64DD
	for <buildroot@archiver.kernel.org>; Tue, 18 Jul 2023 18:24:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D600E4161B;
	Tue, 18 Jul 2023 18:24:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D600E4161B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lAJD72muq17w; Tue, 18 Jul 2023 18:24:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C255E41795;
	Tue, 18 Jul 2023 18:24:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C255E41795
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4E5EA1BF333
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 18:24:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 283FC40491
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 18:24:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 283FC40491
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VHJIMSeZo0eQ for <buildroot@lists.busybox.net>;
 Tue, 18 Jul 2023 18:24:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2F78F40328
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2F78F40328
 for <buildroot@buildroot.org>; Tue, 18 Jul 2023 18:24:22 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b341.dip0.t-ipconnect.de [84.161.179.65])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A0AEEA4C0FE1;
 Tue, 18 Jul 2023 20:24:05 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:43634)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qLpMi-00030n-2u;
 Tue, 18 Jul 2023 20:24:05 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 18 Jul 2023 20:24:03 +0200
Message-Id: <20230718182404.687314-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: ++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1689704645;
 bh=h029QQxmyYzpUXVjRYLRcTnRirt73/ikewcIPmMqnxs=;
 h=From:To:Cc:Subject:Date:From;
 b=l/Ey443dFil+nX1iAmnhZi8VTVtF/qYBmI3gXwTbUuL0L13QF+83/1m0kqbt7s6fc
 7vohkhta86qBdXHLolmxUffUMkhAWCD+Lq5jpC6dSyso2+8bNxSq0QyzmTmgPQb9kY
 hTPZluV8s+LNktUqqLbue/L4t4ChFY2PVIArnXycX5P8nM2tLTpV6pDL6bhvblVzn9
 1ld6rELNJxnwRb/Hwonxxr1jJ+1O/Bgdop9Okd+Qldp0Bg6wVgI5aICOHsxPDZZ3Bv
 clMwT2kGrp86DwEy6jZLr6SPJ69OPUFrEPJddgfC66b16FcLh8H19HfXqGRBFDX0Z0
 E50lIl/gKicZg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=l/Ey443d
Subject: [Buildroot] [PATCH 1/2] package/cmake: bump version to 3.26.4
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
 .../cmake/0001-rename-cmake-rootfile.patch    |  6 ++++--
 package/cmake/Config.in.host                  | 20 +++++++++++++++++++
 package/cmake/cmake.hash                      |  6 +++---
 package/cmake/cmake.mk                        |  4 ++--
 4 files changed, 29 insertions(+), 7 deletions(-)

diff --git a/package/cmake/0001-rename-cmake-rootfile.patch b/package/cmake/0001-rename-cmake-rootfile.patch
index a8cd3ee820..012a4e89b5 100644
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
