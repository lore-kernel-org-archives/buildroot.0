Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B40B7C47077
	for <buildroot@archiver.kernel.org>; Sun, 14 Jan 2024 16:44:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7412F60669;
	Sun, 14 Jan 2024 16:44:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7412F60669
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 19Vfa5EH1VYq; Sun, 14 Jan 2024 16:44:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A522760EAA;
	Sun, 14 Jan 2024 16:44:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A522760EAA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2B3CD1BF41F
 for <buildroot@lists.busybox.net>; Sun, 14 Jan 2024 16:43:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 401CB600C9
 for <buildroot@lists.busybox.net>; Sun, 14 Jan 2024 16:43:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 401CB600C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LUBsk7EMANQk for <buildroot@lists.busybox.net>;
 Sun, 14 Jan 2024 16:43:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6E71D6058D
 for <buildroot@buildroot.org>; Sun, 14 Jan 2024 16:43:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E71D6058D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5C1AC86158; Sun, 14 Jan 2024 16:43:15 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 14 Jan 2024 17:39:30 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 89b9a7d38b59803809a43cf1908366f78a2c303a
X-Git-Newrev: 1ddea7db1039c68f3b3ad42fe6b97c0ed0c32e5c
X-Patchwork-Hint: ignore
Message-Id: <20240114164315.5C1AC86158@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/libuev: security
 bump to version 2.4.1
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1ddea7db1039c68f3b3ad42fe6b97c0ed0c32e5c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

- Fix #27: possible buffer overrun in uev_run()
- Update hash of LICENSE file (update in year with
  https://github.com/troglobit/libuev/commit/0f5909615439d2a3d6a9b44f5a7570e071b90448)

https://github.com/troglobit/libuev/blob/v2.4.1/ChangeLog.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit e3518dd952d20d64bc9cd24ebf025b4e7b575baf)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libuev/libuev.hash | 6 +++---
 package/libuev/libuev.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libuev/libuev.hash b/package/libuev/libuev.hash
index e5c9660a02..1b5a9fa721 100644
--- a/package/libuev/libuev.hash
+++ b/package/libuev/libuev.hash
@@ -1,4 +1,4 @@
-# From https://github.com/troglobit/libuev/releases/download/v2.4.0/libuev-2.4.0.tar.xz.sha256
-sha256  31f1aa4f492ba4f6a5dd6b19968ae6a732968dc05cae6575930560b6cee1f5ef  libuev-2.4.0.tar.xz
+# From https://github.com/troglobit/libuev/releases/download/v2.4.1/libuev-2.4.1.tar.xz.sha256
+sha256  1d171c572ca48ddd6763f76c54e77d021d4ca7beb007610f7c1fec903511977b  libuev-2.4.1.tar.xz
 # License files
-sha256  694a734d9c1b46ae203314ed1c744a1acebd4fe5fc964b761703772546f0d3ab  LICENSE
+sha256  387d0d8e2aabf187751c8f1ebb9a4abaecaa7e0e05fead27f408193a0f0f17dd  LICENSE
diff --git a/package/libuev/libuev.mk b/package/libuev/libuev.mk
index a32381dcc5..432c362401 100644
--- a/package/libuev/libuev.mk
+++ b/package/libuev/libuev.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUEV_VERSION = 2.4.0
+LIBUEV_VERSION = 2.4.1
 LIBUEV_SOURCE = libuev-$(LIBUEV_VERSION).tar.xz
 LIBUEV_SITE = https://github.com/troglobit/libuev/releases/download/v$(LIBUEV_VERSION)
 LIBUEV_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
