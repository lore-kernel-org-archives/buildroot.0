Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DCCFECAAA1
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 22:39:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C3FD4031E;
	Sun, 30 Oct 2022 22:39:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C3FD4031E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZLWSNQ9BydYm; Sun, 30 Oct 2022 22:39:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 37C224030D;
	Sun, 30 Oct 2022 22:39:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 37C224030D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2D9AF1BF28B
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 22:39:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0990A60803
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 22:39:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0990A60803
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xq1-unhfd084 for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 22:39:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4C0E8605F6
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 22:39:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C0E8605F6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 38B7D876F2; Sun, 30 Oct 2022 22:39:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Oct 2022 23:38:57 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1a236c99f4ec2f52fa2baefe5a21190ab623cfc7
X-Git-Newrev: 3b27e969fd75018b3df0a01d4e5d6bc67db562af
X-Patchwork-Hint: ignore
Message-Id: <20221030223916.38B7D876F2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/s6-rc: bump to v0.5.3.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=3b27e969fd75018b3df0a01d4e5d6bc67db562af
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Summary of changes:

 - skalibs dependency bumped to 2.12.0.0.
 - execline dependency bumped to 2.9.0.0.
 - s6 dependency bumped to 2.11.1.0.
 - s6-rc-compile now reads service dependency information from the
   dependencies.d directory and bundle information from the contents.d
   directory, instead of the dependencies and contents flat files.
   The old format is still supported, but deprecated.

License hash updated due to copyright year change.

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/s6-rc/s6-rc.hash | 4 ++--
 package/s6-rc/s6-rc.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/s6-rc/s6-rc.hash b/package/s6-rc/s6-rc.hash
index 8978d68ba6..0a84345e36 100644
--- a/package/s6-rc/s6-rc.hash
+++ b/package/s6-rc/s6-rc.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  2a8d1cd455c05c8502b34517cfe79841aa46d08ad969076b37a15d3910617f89  s6-rc-0.5.2.2.tar.gz
-sha256  4a5e44a69d649f0c37b29d7f6e5df1bb292b09898247be07f0c97814dac4b15d  COPYING
+sha256  4f24a4966a4aa353d2bd1a8afca9b88c7b7bd29c46b3a1a7f5305686b9d6e038  s6-rc-0.5.3.2.tar.gz
+sha256  1898df1e8703bd9c1350d2ec3397880b9b4c1451038a9ce5e1c4b2e58622da39  COPYING
diff --git a/package/s6-rc/s6-rc.mk b/package/s6-rc/s6-rc.mk
index 05d7989735..85b047883b 100644
--- a/package/s6-rc/s6-rc.mk
+++ b/package/s6-rc/s6-rc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-S6_RC_VERSION = 0.5.2.2
+S6_RC_VERSION = 0.5.3.2
 S6_RC_SITE = http://skarnet.org/software/s6-rc
 S6_RC_LICENSE = ISC
 S6_RC_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
