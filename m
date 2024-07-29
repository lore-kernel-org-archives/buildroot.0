Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE74EC3DA61
	for <buildroot@archiver.kernel.org>; Mon, 29 Jul 2024 21:11:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 85B35811AB;
	Mon, 29 Jul 2024 21:11:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 79j-qs3_6xY1; Mon, 29 Jul 2024 21:11:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A61B811CC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A61B811CC;
	Mon, 29 Jul 2024 21:11:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8D7481BF426
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 21:11:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8860F607FB
 for <buildroot@lists.busybox.net>; Mon, 29 Jul 2024 21:11:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c_8OkRy4Nvp5 for <buildroot@lists.busybox.net>;
 Mon, 29 Jul 2024 21:11:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6BF360760
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B6BF360760
 for <buildroot@buildroot.org>; Mon, 29 Jul 2024 21:11:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AD606835AB; Mon, 29 Jul 2024 21:11:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 29 Jul 2024 22:53:52 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c4e845b5b805cc487fca6203caccc363e6e108e6
X-Git-Newrev: 9bded368221e1aaf69a316565101e6ef109c49db
X-Patchwork-Hint: ignore
Message-Id: <20240729211143.AD606835AB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lynx: bump to version 2.9.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=9bded368221e1aaf69a316565101e6ef109c49db
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

remove upstreamed patch

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lynx/lynx.hash | 3 +--
 package/lynx/lynx.mk   | 6 +-----
 2 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/package/lynx/lynx.hash b/package/lynx/lynx.hash
index 62e2555a99..d9a0fc4212 100644
--- a/package/lynx/lynx.hash
+++ b/package/lynx/lynx.hash
@@ -1,4 +1,3 @@
 # Locally calculated:
-sha256  387f193d7792f9cfada14c60b0e5c0bff18f227d9257a39483e14fa1aaf79595  lynx2.8.9rel.1.tar.bz2
-sha256  b2207e757dbbefc34a20a32b1b4a216b4a4316e1dc812bceca4ac6294871119a  90_CVE-2021-38165.patch
+sha256  7374b89936d991669e101f4e97f2c9592036e1e8cdaa7bafc259a77ab6fb07ce  lynx2.9.2.tar.bz2
 sha256  8406a30ff3134ec23cf752d1ceda92ddaabbe41b4f2dc07ea3cfa139de12d6d6  COPYING
diff --git a/package/lynx/lynx.mk b/package/lynx/lynx.mk
index 8317329262..4f23b68917 100644
--- a/package/lynx/lynx.mk
+++ b/package/lynx/lynx.mk
@@ -4,13 +4,9 @@
 #
 ################################################################################
 
-LYNX_VERSION = 2.8.9rel.1
+LYNX_VERSION = 2.9.2
 LYNX_SOURCE = lynx$(LYNX_VERSION).tar.bz2
 LYNX_SITE = https://invisible-mirror.net/archives/lynx/tarballs
-LYNX_PATCH = \
-	https://salsa.debian.org/lynx-team/lynx/-/raw/debian/2.9.0dev.6-3_deb11u1/debian/patches/90_CVE-2021-38165.patch
-# 90_CVE-2021-38165.patch
-LYNX_IGNORE_CVES += CVE-2021-38165
 LYNX_LICENSE = GPL-2.0
 LYNX_LICENSE_FILES = COPYING
 LYNX_CPE_ID_VALID = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
