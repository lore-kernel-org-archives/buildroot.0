Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22D83EB64DD
	for <buildroot@archiver.kernel.org>; Tue, 18 Jul 2023 22:18:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C9143605AF;
	Tue, 18 Jul 2023 22:18:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C9143605AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vhJFT-MH48g4; Tue, 18 Jul 2023 22:18:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DEAC260B65;
	Tue, 18 Jul 2023 22:18:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DEAC260B65
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 98D761BF2CA
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 22:18:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5EB5260D64
 for <buildroot@lists.busybox.net>; Tue, 18 Jul 2023 22:18:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5EB5260D64
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yZyzwNXBfm7I for <buildroot@lists.busybox.net>;
 Tue, 18 Jul 2023 22:18:00 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1317D60D59
 for <buildroot@buildroot.org>; Tue, 18 Jul 2023 22:18:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1317D60D59
Received: from fli4l.lan.fli4l (p54a1b341.dip0.t-ipconnect.de [84.161.179.65])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 4F431A4C024D;
 Wed, 19 Jul 2023 00:10:21 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39548)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qLstg-00006i-3D;
 Wed, 19 Jul 2023 00:10:21 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Wed, 19 Jul 2023 00:10:19 +0200
Message-Id: <20230718221020.1407123-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1689718221;
 bh=09xI37+wsA8HqBwflN1wEn1BaTwtQ/UuNL4VXlCF6ig=;
 h=From:To:Cc:Subject:Date:From;
 b=RK2vHZpkD6MkjjHt1ma3LznDIq56hKDPVtDKAbd2Lg8tPB/tXRcrABl3/f0N6IU2Y
 vg+02V7wli/tYM8aD4u4cj/Hxk7LsLQ2gs8rFOlzHLc5dEnKAdWLo/lsy4U4pC6o43
 Hw9tR6/khEPpB8cHMjWj8mOrbNll4dUKaZBbRTd8j73sAdD/9AbCRxmsRZyqIZKvYa
 2a6dVvlNzhaWfjW2sJAzVfLh8YyP8+Tw7KcVSsmPdM2LeBxWuCwAJs4M2Bh0QXfpfb
 jzFzf7ZUb9SUzvEfPBwJxLmzY2cdktco+c8xUr7Cw3Et5qXka3+wOdYYUE+4R2qF0t
 Me0g4Tz6IQqow==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=RK2vHZpk
Subject: [Buildroot] [PATCH v2 1/2] package/cmake: bump version to 3.27.0
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

Updated license hash due to various commits since Feb 08, 2021:
https://gitlab.kitware.com/cmake/cmake/-/commits/v3.27.0/Copyright.txt

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: added note about license hash change (Thomas)
    bumped to 3.27.0

 .../cmake/0001-rename-cmake-rootfile.patch    |  6 +++--
 package/cmake/Config.in.host                  | 25 +++++++++++++++++++
 package/cmake/cmake.hash                      |  6 ++---
 package/cmake/cmake.mk                        |  4 +--
 4 files changed, 34 insertions(+), 7 deletions(-)

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
index 43b5efb0f0..32ea699ec1 100644
--- a/package/cmake/cmake.hash
+++ b/package/cmake/cmake.hash
@@ -1,5 +1,5 @@
-# From https://cmake.org/files/v3.22/cmake-3.22.3-SHA-256.txt
-sha256  9f8469166f94553b6978a16ee29227ec49a2eb5ceb608275dec40d8ae0d1b5a0  cmake-3.22.3.tar.gz
+# From https://cmake.org/files/v3.27/cmake-3.27.0-SHA-256.txt
+sha256  aaeddb6b28b993d0a6e32c88123d728a17561336ab90e0bf45032383564d3cb8  cmake-3.27.0.tar.gz
 
 # Locally calculated
-sha256  f1a4326266aada65b307dac05161a9d02d3dba4fb08b50cb26e3c24cc8a86e97  Copyright.txt
+sha256  4a01ccf2dc580ba570d02bc015bbe0ec92f1f318717aae9540ba841ba7946756  Copyright.txt
diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index b99877696a..951fc2912a 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 # When updating the version, please also update BR2_HOST_CMAKE_AT_LEAST_X_Y
-CMAKE_VERSION_MAJOR = 3.22
-CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).3
+CMAKE_VERSION_MAJOR = 3.27
+CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).0
 CMAKE_SITE = https://cmake.org/files/v$(CMAKE_VERSION_MAJOR)
 CMAKE_LICENSE = BSD-3-Clause
 CMAKE_LICENSE_FILES = Copyright.txt
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
