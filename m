Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DF60C47073
	for <buildroot@archiver.kernel.org>; Mon,  1 Jan 2024 21:20:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B83F341A8E;
	Mon,  1 Jan 2024 21:20:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B83F341A8E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rFEYoooMyIPI; Mon,  1 Jan 2024 21:20:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0236641A5F;
	Mon,  1 Jan 2024 21:20:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0236641A5F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 262F71BF95D
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 21:19:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5D09B613BB
 for <buildroot@lists.busybox.net>; Mon,  1 Jan 2024 21:05:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D09B613BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mpWIJs4beFrV for <buildroot@lists.busybox.net>;
 Mon,  1 Jan 2024 21:05:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2514B61436
 for <buildroot@buildroot.org>; Mon,  1 Jan 2024 21:05:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2514B61436
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0233F83AE4; Mon,  1 Jan 2024 21:05:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 1 Jan 2024 21:36:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4d07864d4c1b7d964e23f8ab75f5c6f828a674c5
X-Git-Newrev: 8adc37e979aeae192bc4002187385d3c9e66f0b6
X-Patchwork-Hint: ignore
Message-Id: <20240101210511.0233F83AE4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libiec61850: bump to version 1.5.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=8adc37e979aeae192bc4002187385d3c9e66f0b6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Switch site to github to get latest release
- Drop LIBIEC61850_IGNORE_CVES as CVE-2023-27772 only affects version
  1.5.1

https://github.com/mz-automation/libiec61850/blob/v1.5.3/CHANGELOG

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libiec61850/libiec61850.hash | 2 +-
 package/libiec61850/libiec61850.mk   | 7 ++-----
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/package/libiec61850/libiec61850.hash b/package/libiec61850/libiec61850.hash
index a416ecdb4d..be662bebaf 100644
--- a/package/libiec61850/libiec61850.hash
+++ b/package/libiec61850/libiec61850.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  b6d7ffac831e7d9aec3470e45e2f1734071859c95cab4cfe99ffd1091776b3cc  libiec61850-1.5.1.tar.gz
+sha256  a0f396a5e2249398f2432bb9698e3aecdb9de11b28e5af68f7fb8b14bc3b2f44  libiec61850-1.5.3.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/libiec61850/libiec61850.mk b/package/libiec61850/libiec61850.mk
index a3cfb74b03..276acce1a8 100644
--- a/package/libiec61850/libiec61850.mk
+++ b/package/libiec61850/libiec61850.mk
@@ -4,16 +4,13 @@
 #
 ################################################################################
 
-LIBIEC61850_VERSION = 1.5.1
-LIBIEC61850_SITE = https://libiec61850.com/wp-content/uploads/2022/03
+LIBIEC61850_VERSION = 1.5.3
+LIBIEC61850_SITE = $(call github,mz-automation,libiec61850,v$(LIBIEC61850_VERSION))
 LIBIEC61850_INSTALL_STAGING = YES
 LIBIEC61850_LICENSE = GPL-3.0+
 LIBIEC61850_LICENSE_FILES = COPYING
 LIBIEC61850_CPE_ID_VENDOR = mz-automation
 LIBIEC61850_CONF_OPTS = -DBUILD_PYTHON_BINDINGS=OFF
-# Examples aren't build
-# https://github.com/mz-automation/libiec61850/issues/442
-LIBIEC61850_IGNORE_CVES += CVE-2023-27772
 
 ifeq ($(BR2_PACKAGE_MBEDTLS),y)
 LIBIEC61850_DEPENDENCIES += mbedtls
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
