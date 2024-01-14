Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD0FDC4707B
	for <buildroot@archiver.kernel.org>; Sun, 14 Jan 2024 16:40:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 72BBE60E8B;
	Sun, 14 Jan 2024 16:40:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 72BBE60E8B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IW7-Y-bc3unT; Sun, 14 Jan 2024 16:40:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BCB9460E38;
	Sun, 14 Jan 2024 16:40:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BCB9460E38
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 336D51BF86D
 for <buildroot@lists.busybox.net>; Sun, 14 Jan 2024 16:40:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0C77A60ABE
 for <buildroot@lists.busybox.net>; Sun, 14 Jan 2024 16:40:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0C77A60ABE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yyYBBJ3WfDXR for <buildroot@lists.busybox.net>;
 Sun, 14 Jan 2024 16:40:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4A83D6058B
 for <buildroot@buildroot.org>; Sun, 14 Jan 2024 16:40:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A83D6058B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 382EA86140; Sun, 14 Jan 2024 16:40:35 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 14 Jan 2024 17:39:36 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 67501521431c7b793497d0d74b9132bedfbf2b3f
X-Git-Newrev: 10023b762677cfb4b452dd7727ee286f2275387d
X-Patchwork-Hint: ignore
Message-Id: <20240114164035.382EA86140@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/libuev: security
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

commit: https://git.buildroot.net/buildroot/commit/?id=10023b762677cfb4b452dd7727ee286f2275387d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

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
