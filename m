Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C15EE6FE46
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 20:08:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 70AE584798;
	Fri,  6 Sep 2024 20:08:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ulrcg_-0mNTG; Fri,  6 Sep 2024 20:08:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 40CF484D1C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 40CF484D1C;
	Fri,  6 Sep 2024 20:08:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 197F51BF980
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 20:00:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B4DCC60D68
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:59:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c0XVn0MtoQui for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 19:58:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3DBA2606F8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3DBA2606F8
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 19:58:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 398CB86EE5; Fri,  6 Sep 2024 19:58:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 19 Aug 2024 13:16:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d1ea297e930c9d4548415b835d0135a29debc6c0
X-Git-Newrev: 238313c605cd16e96a5abf87f1040d2616341813
X-Patchwork-Hint: ignore
Message-Id: <20240906195855.398CB86EE5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/bubblewrap: bump to version 0.10.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=238313c605cd16e96a5abf87f1040d2616341813
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This version adds new --[ro-]bind-fd option, which other programs can
use to avoid TOCTOU attacks. Release notes:

  https://github.com/containers/bubblewrap/releases/tag/v0.10.0

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/bubblewrap/bubblewrap.hash | 5 +++--
 package/bubblewrap/bubblewrap.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/bubblewrap/bubblewrap.hash b/package/bubblewrap/bubblewrap.hash
index f61aca34f9..37276046b8 100644
--- a/package/bubblewrap/bubblewrap.hash
+++ b/package/bubblewrap/bubblewrap.hash
@@ -1,5 +1,6 @@
-# From https://github.com/containers/bubblewrap/releases/tag/v0.9.0
-sha256  c6347eaced49ac0141996f46bba3b089e5e6ea4408bc1c43bab9f2d05dd094e1  bubblewrap-0.9.0.tar.xz
+# Locally generated after checking GPG signature from
+# https://github.com/containers/bubblewrap/releases/tag/v0.10.0
+sha256  65d92cf44a63a51e1b7771f70c05013dce5bd6b0b2841c4b4be54b0c45565471  bubblewrap-0.10.0.tar.xz
 
 # Hash for license files:
 sha256  b7993225104d90ddd8024fd838faf300bea5e83d91203eab98e29512acebd69c  COPYING
diff --git a/package/bubblewrap/bubblewrap.mk b/package/bubblewrap/bubblewrap.mk
index 9dd711ce47..94ae72d4d2 100644
--- a/package/bubblewrap/bubblewrap.mk
+++ b/package/bubblewrap/bubblewrap.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BUBBLEWRAP_VERSION = 0.9.0
+BUBBLEWRAP_VERSION = 0.10.0
 BUBBLEWRAP_SITE = https://github.com/containers/bubblewrap/releases/download/v$(BUBBLEWRAP_VERSION)
 BUBBLEWRAP_SOURCE = bubblewrap-$(BUBBLEWRAP_VERSION).tar.xz
 BUBBLEWRAP_DEPENDENCIES = host-pkgconf libcap
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
