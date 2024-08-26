Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94AD3C5321D
	for <buildroot@archiver.kernel.org>; Mon, 26 Aug 2024 16:33:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3AA58605B7;
	Mon, 26 Aug 2024 16:33:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3nO_0SVu6su1; Mon, 26 Aug 2024 16:33:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4AE4060747
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4AE4060747;
	Mon, 26 Aug 2024 16:33:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8DD2F1BF33F
 for <buildroot@lists.busybox.net>; Mon, 26 Aug 2024 16:33:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 880E84033F
 for <buildroot@lists.busybox.net>; Mon, 26 Aug 2024 16:33:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ytLXqvt2Vj4X for <buildroot@lists.busybox.net>;
 Mon, 26 Aug 2024 16:33:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 79F07400F6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 79F07400F6
 for <buildroot@buildroot.org>; Mon, 26 Aug 2024 16:33:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5EB0A86367; Mon, 26 Aug 2024 16:33:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 26 Aug 2024 18:31:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c1a6987da9bfebac25db0d05fa69a706a933889f
X-Git-Newrev: 2965632a312008f10ce608b6d1ef67837ff6dc69
X-Patchwork-Hint: ignore
Message-Id: <20240826163320.5EB0A86367@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/chicken: security bump to 5.4.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=2965632a312008f10ce608b6d1ef67837ff6dc69
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This release includes a fix for CVE-2022-45145. Also, a copyright date
in the LICENSE file changed, so the hash for it has changed too.

Signed-off-by: Woodrow Douglass <wdouglass@carnegierobotics.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/chicken/chicken.hash | 6 +++---
 package/chicken/chicken.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/chicken/chicken.hash b/package/chicken/chicken.hash
index 5a553da792..18f6693a7a 100644
--- a/package/chicken/chicken.hash
+++ b/package/chicken/chicken.hash
@@ -1,4 +1,4 @@
-# From https://code.call-cc.org/releases/5.3.0/chicken-5.3.0.tar.gz.sha256
-sha256  c3ad99d8f9e17ed810912ef981ac3b0c2e2f46fb0ecc033b5c3b6dca1bdb0d76  chicken-5.3.0.tar.gz
+# From https://code.call-cc.org/releases/5.4.0/chicken-5.4.0.tar.gz.sha256
+sha256  3c5d4aa61c1167bf6d9bf9eaf891da7630ba9f5f3c15bf09515a7039bfcdec5f  chicken-5.4.0.tar.gz
 # Locally computed
-sha256  b434ac92e094214136a6b5032f0dc9da97f22cef084ac1d0131b02a09e2caa37  LICENSE
+sha256  c0ed699d5c4a8687f90a6488244f7f57d48a7f2d42bb7461b08a0d69a07d4f58  LICENSE
diff --git a/package/chicken/chicken.mk b/package/chicken/chicken.mk
index 0000fc635e..ca5f756995 100644
--- a/package/chicken/chicken.mk
+++ b/package/chicken/chicken.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CHICKEN_VERSION = 5.3.0
+CHICKEN_VERSION = 5.4.0
 CHICKEN_SITE = https://code.call-cc.org/releases/$(CHICKEN_VERSION)
 CHICKEN_LICENSE = BSD-3-Clause
 CHICKEN_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
