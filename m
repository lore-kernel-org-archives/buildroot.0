Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79CABCAC5B5
	for <buildroot@archiver.kernel.org>; Thu, 25 Sep 2025 20:31:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4EC82617A3;
	Thu, 25 Sep 2025 20:31:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 04B1zTn3fHA8; Thu, 25 Sep 2025 20:31:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 64C1A617A6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 64C1A617A6;
	Thu, 25 Sep 2025 20:31:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 97254177
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:30:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 247F1412D0
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:30:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G5Z-f9ZcdmNs for <buildroot@buildroot.org>;
 Thu, 25 Sep 2025 20:30:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7D5C7412CB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7D5C7412CB
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:30:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7B8818644A; Thu, 25 Sep 2025 20:30:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 25 Sep 2025 16:39:55 +0200
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: 93f886ae79af4535dabab50a8d3bd399e227a103
X-Git-Newrev: ede4af8c584b2a23e7bdef477eec8186641cdc4d
X-Patchwork-Hint: ignore
Message-Id: <20250925203022.7B8818644A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x] package/opencv4
 (-contrib): security bump to v4.12.0
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ede4af8c584b2a23e7bdef477eec8186641cdc4d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

This fixes the following vulnerability:
- CVE-2025-53644:
    OpenCV is an Open Source Computer Vision Library. Versions prior to
    4.12.0 have an uninitialized pointer variable on stack that may lead
    to arbitrary heap buffer write when reading crafted JPEG images.
    Version 4.12.0 fixes the vulnerability.
    https://www.cve.org/CVERecord?id=CVE-2025-53644

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 9c365fee97adced8715bf0e4c6e252dd913d9642)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/opencv4-contrib/opencv4-contrib.hash | 2 +-
 package/opencv4-contrib/opencv4-contrib.mk   | 2 +-
 package/opencv4/opencv4.hash                 | 2 +-
 package/opencv4/opencv4.mk                   | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/opencv4-contrib/opencv4-contrib.hash b/package/opencv4-contrib/opencv4-contrib.hash
index b406f3d11e..dc9e810318 100644
--- a/package/opencv4-contrib/opencv4-contrib.hash
+++ b/package/opencv4-contrib/opencv4-contrib.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  2dfc5957201de2aa785064711125af6abb2e80a64e2dc246aca4119b19687041  opencv4-contrib-4.11.0.tar.gz
+sha256  4197722b4c5ed42b476d42e29beb29a52b6b25c34ec7b4d589c3ae5145fee98e  opencv4-contrib-4.12.0.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/opencv4-contrib/opencv4-contrib.mk b/package/opencv4-contrib/opencv4-contrib.mk
index 3961ca4a25..c1273237aa 100644
--- a/package/opencv4-contrib/opencv4-contrib.mk
+++ b/package/opencv4-contrib/opencv4-contrib.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update opencv4
-OPENCV4_CONTRIB_VERSION = 4.11.0
+OPENCV4_CONTRIB_VERSION = 4.12.0
 OPENCV4_CONTRIB_SITE = $(call github,opencv,opencv_contrib,$(OPENCV4_CONTRIB_VERSION))
 OPENCV4_CONTRIB_INSTALL_TARGET = NO
 OPENCV4_CONTRIB_LICENSE = Apache-2.0
diff --git a/package/opencv4/opencv4.hash b/package/opencv4/opencv4.hash
index 6a3501b051..a39b199166 100644
--- a/package/opencv4/opencv4.hash
+++ b/package/opencv4/opencv4.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  9a7c11f924eff5f8d8070e297b322ee68b9227e003fd600d4b8122198091665f  opencv4-4.11.0.tar.gz
+sha256  44c106d5bb47efec04e531fd93008b3fcd1d27138985c5baf4eafac0e1ec9e9d  opencv4-4.12.0.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/opencv4/opencv4.mk b/package/opencv4/opencv4.mk
index 01f70dfe49..501988bc7a 100644
--- a/package/opencv4/opencv4.mk
+++ b/package/opencv4/opencv4.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update opencv4-contrib
-OPENCV4_VERSION = 4.11.0
+OPENCV4_VERSION = 4.12.0
 OPENCV4_SITE = $(call github,opencv,opencv,$(OPENCV4_VERSION))
 OPENCV4_INSTALL_STAGING = YES
 OPENCV4_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
