Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF96AC71150
	for <buildroot@archiver.kernel.org>; Sun, 15 Jun 2025 10:18:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9403140644;
	Sun, 15 Jun 2025 10:18:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cFnri_fmw-LK; Sun, 15 Jun 2025 10:18:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A75B6405F1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A75B6405F1;
	Sun, 15 Jun 2025 10:18:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id F08661A4
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 10:18:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E240A80A81
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 10:18:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1HvZajTefEpG for <buildroot@buildroot.org>;
 Sun, 15 Jun 2025 10:18:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 45DEE80A75
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 45DEE80A75
 for <buildroot@buildroot.org>; Sun, 15 Jun 2025 10:18:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3059583687; Sun, 15 Jun 2025 10:18:19 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun, 15 Jun 2025 12:14:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8ebb1c3edcde999803198631eb0b135bf2ac3ca0
X-Git-Newrev: 7139ffaf06bde0398cf41fb702241b295ac9ff94
X-Patchwork-Hint: ignore
Message-Id: <20250615101819.3059583687@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bcg729: bump version to
 1.1.1-3-g8bec1e5fc
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

commit: https://git.buildroot.net/buildroot/commit/?id=7139ffaf06bde0398cf41fb702241b295ac9ff94
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This bump includes three patches which were added since version 1.1.1
to the cmake files:
https://github.com/BelledonneCommunications/bcg729/commits/master/

One of them fixes build errors with cmake 4.x:
https://github.com/BelledonneCommunications/bcg729/commit/e29952e7ceff64de6fc6f8db43e3b326481280be#diff-1e7de1ae2d059d21e1dd75d5812d5a34b0222cef273b7c3a2af62eb747f9d20aL23-L81

Fixes:
https://autobuild.buildroot.net/results/118/118349d20eae2dccdadab949065f6bc6471c825e/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Julien: use "git describe --abbrev=40" format in _VERSION]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/bcg729/bcg729.hash | 2 +-
 package/bcg729/bcg729.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/bcg729/bcg729.hash b/package/bcg729/bcg729.hash
index 2eb80a0407..75dc6a6452 100644
--- a/package/bcg729/bcg729.hash
+++ b/package/bcg729/bcg729.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  68599a850535d1b182932b3f86558ac8a76d4b899a548183b062956c5fdc916d  bcg729-1.1.1.tar.gz
+sha256  62812779c776620f8fa005fc7c6ae14039d7b2efce66cf9af69c426393b5d062  bcg729-1.1.1-3-g8bec1e5fc072f3669e435edd137eb3da6da2eef7.tar.gz
 sha256  1b3782ccad7b8614100cda30d3faf42fc39f2e97932908c543005053b654ca68  LICENSE.txt
diff --git a/package/bcg729/bcg729.mk b/package/bcg729/bcg729.mk
index f89e535546..d0eeed5faa 100644
--- a/package/bcg729/bcg729.mk
+++ b/package/bcg729/bcg729.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BCG729_VERSION = 1.1.1
+BCG729_VERSION = 1.1.1-3-g8bec1e5fc072f3669e435edd137eb3da6da2eef7
 BCG729_SITE = $(call github,BelledonneCommunications,bcg729,$(BCG729_VERSION))
 BCG729_LICENSE = GPL-3.0+
 BCG729_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
