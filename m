Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18088CCD184
	for <buildroot@archiver.kernel.org>; Sun, 19 Oct 2025 17:33:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B07B683EC6;
	Sun, 19 Oct 2025 17:33:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SVDUI91eVzRa; Sun, 19 Oct 2025 17:33:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF1B883ECB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF1B883ECB;
	Sun, 19 Oct 2025 17:33:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0B1681CD
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 17:33:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E4A4C61179
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 17:33:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WFWp7_hOQQLC for <buildroot@buildroot.org>;
 Sun, 19 Oct 2025 17:33:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C6E6361170
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C6E6361170
 for <buildroot@buildroot.org>; Sun, 19 Oct 2025 17:33:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B6C2E87603; Sun, 19 Oct 2025 17:33:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 19 Oct 2025 19:27:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 74eeed692cffd59748068bc059f6a21aab1b6ece
X-Git-Newrev: a36b7cf77e7d44e7abf5c939baabc67e030282e8
X-Patchwork-Hint: ignore
Message-Id: <20251019173323.B6C2E87603@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libarchive: security bump to
 version 3.8.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=a36b7cf77e7d44e7abf5c939baabc67e030282e8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This bump includes the security fix for CVE-2025-25724.

Fixes:
https://www.cve.org/CVERecord?id=CVE-2025-25724.

Release notes:
https://github.com/libarchive/libarchive/releases/tag/v3.8.2

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libarchive/libarchive.hash | 4 ++--
 package/libarchive/libarchive.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libarchive/libarchive.hash b/package/libarchive/libarchive.hash
index b8738e4a99..f31b693c67 100644
--- a/package/libarchive/libarchive.hash
+++ b/package/libarchive/libarchive.hash
@@ -1,5 +1,5 @@
 # Locally computed after verifying the signature from
-# https://www.libarchive.de/downloads/libarchive-3.8.1.tar.xz.asc
-sha256  19f917d42d530f98815ac824d90c7eaf648e9d9a50e4f309c812457ffa5496b5  libarchive-3.8.1.tar.xz
+# https://www.libarchive.de/downloads/libarchive-3.8.2.tar.xz.asc
+sha256  db0dee91561cbd957689036a3a71281efefd131d35d1d98ebbc32720e4da58e2  libarchive-3.8.2.tar.xz
 # Locally computed:
 sha256  30e556b3959e3985d66efefec5eaac51d4995053caa1d3cffe6eb916f146f229  COPYING
diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index 1dafec726b..8568847493 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBARCHIVE_VERSION = 3.8.1
+LIBARCHIVE_VERSION = 3.8.2
 LIBARCHIVE_SOURCE = libarchive-$(LIBARCHIVE_VERSION).tar.xz
 LIBARCHIVE_SITE = https://www.libarchive.de/downloads
 LIBARCHIVE_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
