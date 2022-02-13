Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49E7AC433F5
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 15:31:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 117A860BED;
	Sun, 13 Feb 2022 15:31:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5JMYUVwYTn0Y; Sun, 13 Feb 2022 15:31:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D11860BBF;
	Sun, 13 Feb 2022 15:31:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 742381BF3F2
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 15:26:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 29EB960A83
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 15:26:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vSZuRSCMnMAG for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 15:26:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 713A260A9C
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 15:26:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 060398295E; Sun, 13 Feb 2022 15:18:35 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 13 Feb 2022 16:21:02 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f540edccb93444408b4280b62e254d9b4fc335b2
X-Git-Newrev: e33cd57b2515675d9aa1a9abdfdf8b21025705ea
X-Patchwork-Hint: ignore
Message-Id: <20220213151835.060398295E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dt-utils: use snapshot tarball
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

commit: https://git.buildroot.net/buildroot/commit/?id=e33cd57b2515675d9aa1a9abdfdf8b21025705ea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use snapshot tarball so DT_UTILS_VERSION will match what is returned by
https://release-monitoring.org

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/dt-utils/dt-utils.hash | 2 +-
 package/dt-utils/dt-utils.mk   | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/dt-utils/dt-utils.hash b/package/dt-utils/dt-utils.hash
index 74819158bb..9fca594db5 100644
--- a/package/dt-utils/dt-utils.hash
+++ b/package/dt-utils/dt-utils.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  8b29d3a8799170afdb1b077e655528bf4e6afe0c789107b1eec8fff9d4482771  dt-utils-v2021.03.0-br1.tar.gz
+sha256  63cf47c70911bb3605bafac38a5a7e19eb753ac1c90de2abceaf2fdefd71be6d  dt-utils-2021.03.0.tar.xz
 sha256  a45932c79317d15116eadbf1c9c6fc59117ec3c4621db3a876066defa723963b  COPYING
diff --git a/package/dt-utils/dt-utils.mk b/package/dt-utils/dt-utils.mk
index bc7fd90631..d264e2cdc9 100644
--- a/package/dt-utils/dt-utils.mk
+++ b/package/dt-utils/dt-utils.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-DT_UTILS_VERSION = v2021.03.0
-DT_UTILS_SITE = https://git.pengutronix.de/git/tools/dt-utils
-DT_UTILS_SITE_METHOD = git
+DT_UTILS_VERSION = 2021.03.0
+DT_UTILS_SOURCE = dt-utils-$(DT_UTILS_VERSION).tar.xz
+DT_UTILS_SITE = https://git.pengutronix.de/cgit/tools/dt-utils/snapshot
 DT_UTILS_LICENSE = GPL-2.0
 DT_UTILS_LICENSE_FILES = COPYING
 DT_UTILS_DEPENDENCIES = udev
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
