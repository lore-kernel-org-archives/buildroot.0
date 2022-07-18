Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C4DCC433EF
	for <buildroot@archiver.kernel.org>; Mon, 18 Jul 2022 10:11:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 46F51416CA;
	Mon, 18 Jul 2022 10:11:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 46F51416CA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gVQxUNo48y4J; Mon, 18 Jul 2022 10:11:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F1B374154C;
	Mon, 18 Jul 2022 10:11:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F1B374154C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B8C921BF421
 for <buildroot@lists.busybox.net>; Mon, 18 Jul 2022 10:11:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A150260A80
 for <buildroot@lists.busybox.net>; Mon, 18 Jul 2022 10:11:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A150260A80
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sDAF4qMkwCFT for <buildroot@lists.busybox.net>;
 Mon, 18 Jul 2022 10:11:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A9FBD60FD8
 for <buildroot@buildroot.org>; Mon, 18 Jul 2022 10:11:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A9FBD60FD8
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 7A38483C8C; Mon, 18 Jul 2022 09:57:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 18 Jul 2022 12:10:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 35b35d90b1e393f580b6a0497a561d8a7a55d563
X-Git-Newrev: cb433ecfd066db576c2bc59d2d42b6ea092b7caa
X-Patchwork-Hint: ignore
Message-Id: <20220718095754.7A38483C8C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/crucible: fix CRUCIBLE_VERSION
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

commit: https://git.buildroot.net/buildroot/commit/?id=cb433ecfd066db576c2bc59d2d42b6ea092b7caa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Make CRUCIBLE_VERSION compatible with https://release-monitoring.org

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/crucible/crucible.hash | 2 +-
 package/crucible/crucible.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/crucible/crucible.hash b/package/crucible/crucible.hash
index ad8a2cb35c..d0a2a63fab 100644
--- a/package/crucible/crucible.hash
+++ b/package/crucible/crucible.hash
@@ -1,2 +1,2 @@
-sha256  51e911ce5e2a9f182a737b71f6e2bbf46fb80bb3252220cd99ffaf54d38e6c64  crucible-v2022.05.25.tar.gz
+sha256  1229c7d1587a97e9f3d456392e06c7be288bacf6ffb68c940d497bf55edab20b  crucible-2022.05.25.tar.gz
 sha256  d88514630470aec9fa7abdc990a1e0a8751a752321bffa868188c49009d64d59  LICENSE
diff --git a/package/crucible/crucible.mk b/package/crucible/crucible.mk
index e9038f8cff..fdad709dde 100644
--- a/package/crucible/crucible.mk
+++ b/package/crucible/crucible.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-CRUCIBLE_VERSION = v2022.05.25
-CRUCIBLE_SITE = $(call github,usbarmory,crucible,$(CRUCIBLE_VERSION))
+CRUCIBLE_VERSION = 2022.05.25
+CRUCIBLE_SITE = $(call github,usbarmory,crucible,v$(CRUCIBLE_VERSION))
 CRUCIBLE_LICENSE = GPL-3.0
 CRUCIBLE_LICENSE_FILES = LICENSE
 CRUCIBLE_GOMOD = ./cmd/crucible
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
