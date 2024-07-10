Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29C8CC3DA41
	for <buildroot@archiver.kernel.org>; Wed, 10 Jul 2024 21:56:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E5C4A4155A;
	Wed, 10 Jul 2024 21:56:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id waOn89x8AAaZ; Wed, 10 Jul 2024 21:56:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F98C4155C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F98C4155C;
	Wed, 10 Jul 2024 21:56:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 33A441BF292
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 21:56:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1F78583613
 for <buildroot@lists.busybox.net>; Wed, 10 Jul 2024 21:56:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VvWTwZRFPFpr for <buildroot@lists.busybox.net>;
 Wed, 10 Jul 2024 21:56:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 42BE68343E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 42BE68343E
 for <buildroot@buildroot.org>; Wed, 10 Jul 2024 21:56:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2A4548470B; Wed, 10 Jul 2024 21:56:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 10 Jul 2024 23:55:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 78cdfdb9cfaccec71582cd5dd8f05a9e04f799f9
X-Git-Newrev: cc8d4748937c4ed56c827feac19ed7f8fca55843
X-Patchwork-Hint: ignore
Message-Id: <20240710215609.2A4548470B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cmake: bump version to 3.30.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=cc8d4748937c4ed56c827feac19ed7f8fca55843
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://cmake.org/cmake/help/latest/release/3.29.html
https://cmake.org/cmake/help/latest/release/3.30.html

Updated license hash due to copyright year bump:
https://gitlab.kitware.com/cmake/cmake/-/commit/4bc97565d0f97fa1a840d56ab58be46ccad175e0
and updated zlib version:
https://gitlab.kitware.com/cmake/cmake/-/commit/6c2bed54f6610405e1a37aa48ff0f8d25f198076

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/cmake/Config.in.host | 10 ++++++++++
 package/cmake/cmake.hash     |  6 +++---
 package/cmake/cmake.mk       |  4 ++--
 3 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/package/cmake/Config.in.host b/package/cmake/Config.in.host
index c38bb9daaa..389300f31f 100644
--- a/package/cmake/Config.in.host
+++ b/package/cmake/Config.in.host
@@ -51,10 +51,20 @@ config BR2_HOST_CMAKE_AT_LEAST_3_28
 	bool
 	select BR2_HOST_CMAKE_AT_LEAST_3_27
 
+config BR2_HOST_CMAKE_AT_LEAST_3_29
+	bool
+	select BR2_HOST_CMAKE_AT_LEAST_3_28
+
+config BR2_HOST_CMAKE_AT_LEAST_3_30
+	bool
+	select BR2_HOST_CMAKE_AT_LEAST_3_29
+
 # This order guarantees that the highest version is set, as kconfig
 # stops affecting a value on the first matching default.
 config BR2_HOST_CMAKE_AT_LEAST
 	string
+	default "3.30"	if BR2_HOST_CMAKE_AT_LEAST_3_30
+	default "3.29"	if BR2_HOST_CMAKE_AT_LEAST_3_29
 	default "3.28"	if BR2_HOST_CMAKE_AT_LEAST_3_28
 	default "3.27"	if BR2_HOST_CMAKE_AT_LEAST_3_27
 	default "3.26"	if BR2_HOST_CMAKE_AT_LEAST_3_26
diff --git a/package/cmake/cmake.hash b/package/cmake/cmake.hash
index 74b4a0a3a8..ee6dab551c 100644
--- a/package/cmake/cmake.hash
+++ b/package/cmake/cmake.hash
@@ -1,5 +1,5 @@
-# From https://cmake.org/files/v3.28/cmake-3.28.3-SHA-256.txt
-sha256  72b7570e5c8593de6ac4ab433b73eab18c5fb328880460c86ce32608141ad5c1  cmake-3.28.3.tar.gz
+# From https://cmake.org/files/v3.30/cmake-3.30.0-SHA-256.txt
+sha256  157e5be6055c154c34f580795fe5832f260246506d32954a971300ed7899f579  cmake-3.30.0.tar.gz
 
 # Locally calculated
-sha256  4a01ccf2dc580ba570d02bc015bbe0ec92f1f318717aae9540ba841ba7946756  Copyright.txt
+sha256  0676e30827684487aa0ea8f72f01e9460a6320fa34a2888df0ad1dd3e8a06eb8  Copyright.txt
diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index 49d1f9fea5..eacecdc0ee 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 # When updating the version, please also update BR2_HOST_CMAKE_AT_LEAST_X_Y
-CMAKE_VERSION_MAJOR = 3.28
-CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).3
+CMAKE_VERSION_MAJOR = 3.30
+CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).0
 CMAKE_SITE = https://cmake.org/files/v$(CMAKE_VERSION_MAJOR)
 CMAKE_LICENSE = BSD-3-Clause
 CMAKE_LICENSE_FILES = Copyright.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
