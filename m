Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27640C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:33:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E74DF42D14;
	Fri, 28 Feb 2025 16:33:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U5vGHoFl6T0A; Fri, 28 Feb 2025 16:33:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F8014EFEF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F8014EFEF;
	Fri, 28 Feb 2025 16:33:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2444394F
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ED04F6FB2B
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ovOPSyYmk-hf for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:29:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 618896FAEA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 618896FAEA
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5973185E77; Fri, 28 Feb 2025 16:29:39 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 13 Dec 2024 21:00:52 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: bb27353014fecb656a1ce71c445c7d3c885d7d84
X-Git-Newrev: 7b87f8cb21e58ae007d370c899f1f5c41a29ff97
X-Patchwork-Hint: ignore
Message-Id: <20250228162939.5973185E77@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/cmake: bump version to
 3.31.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=7b87f8cb21e58ae007d370c899f1f5c41a29ff97
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Release notes:
https://cmake.org/cmake/help/v3.31/release/3.31.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/cmake/Config.in.host | 5 +++++
 package/cmake/cmake.hash     | 4 ++--
 package/cmake/cmake.mk       | 4 ++--
 3 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/package/cmake/Config.in.host b/package/cmake/Config.in.host
index 389300f31f..b30ce03a1c 100644
--- a/package/cmake/Config.in.host
+++ b/package/cmake/Config.in.host
@@ -59,10 +59,15 @@ config BR2_HOST_CMAKE_AT_LEAST_3_30
 	bool
 	select BR2_HOST_CMAKE_AT_LEAST_3_29
 
+config BR2_HOST_CMAKE_AT_LEAST_3_31
+	bool
+	select BR2_HOST_CMAKE_AT_LEAST_3_30
+
 # This order guarantees that the highest version is set, as kconfig
 # stops affecting a value on the first matching default.
 config BR2_HOST_CMAKE_AT_LEAST
 	string
+	default "3.31"	if BR2_HOST_CMAKE_AT_LEAST_3_31
 	default "3.30"	if BR2_HOST_CMAKE_AT_LEAST_3_30
 	default "3.29"	if BR2_HOST_CMAKE_AT_LEAST_3_29
 	default "3.28"	if BR2_HOST_CMAKE_AT_LEAST_3_28
diff --git a/package/cmake/cmake.hash b/package/cmake/cmake.hash
index f80b942103..f214c21925 100644
--- a/package/cmake/cmake.hash
+++ b/package/cmake/cmake.hash
@@ -1,5 +1,5 @@
-# From https://cmake.org/files/v3.30/cmake-3.30.5-SHA-256.txt
-sha256  9f55e1a40508f2f29b7e065fa08c29f82c402fa0402da839fffe64a25755a86d  cmake-3.30.5.tar.gz
+# From https://cmake.org/files/v3.31/cmake-3.31.1-SHA-256.txt
+sha256  c4fc2a9bd0cd5f899ccb2fb81ec422e175090bc0de5d90e906dd453b53065719  cmake-3.31.1.tar.gz
 
 # Locally calculated
 sha256  0676e30827684487aa0ea8f72f01e9460a6320fa34a2888df0ad1dd3e8a06eb8  Copyright.txt
diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index 0c5d46c23d..7fc1f0181d 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -5,8 +5,8 @@
 ################################################################################
 
 # When updating the version, please also update BR2_HOST_CMAKE_AT_LEAST_X_Y
-CMAKE_VERSION_MAJOR = 3.30
-CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).5
+CMAKE_VERSION_MAJOR = 3.31
+CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).1
 CMAKE_SITE = https://cmake.org/files/v$(CMAKE_VERSION_MAJOR)
 CMAKE_LICENSE = BSD-3-Clause
 CMAKE_LICENSE_FILES = Copyright.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
