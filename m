Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C823C38A02
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 22:26:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF250402E0;
	Sun, 30 Oct 2022 22:26:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF250402E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mMhgCUWLCKyg; Sun, 30 Oct 2022 22:26:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 97642402C3;
	Sun, 30 Oct 2022 22:26:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 97642402C3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D6E741BF28B
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 22:26:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AFA1D60687
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 22:26:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AFA1D60687
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vkaJUNlhqp25 for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 22:26:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BD530605A4
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 22:26:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD530605A4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A6892876CD; Sun, 30 Oct 2022 22:26:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Oct 2022 23:25:11 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8dd62133a771ecdd73a4ffab5ff7bba60ccb4bc3
X-Git-Newrev: 80b1d93d8b783e59ae65a0940e74955dbef3f462
X-Patchwork-Hint: ignore
Message-Id: <20221030222630.A6892876CD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/s6: bump to v2.11.1.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=80b1d93d8b783e59ae65a0940e74955dbef3f462
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Summary of changes:

 - execline optional dependency bumped to 2.9.0.1.
 - skalibs dependency bumped to 2.12.0.0.
 - nsss optional dependency bumped to 0.2.0.1.
 - s6-svwait now supports the -r and -R options, to wait for service restarts.
 - The s6/lock.h, s6/supervise.h and s6/fdholder.h headers replace their
   previous versions that had an extra s6 prefix.
 - New binaries: s6-svlink, s6-svunlink, and s6-socklog.

License hash updated due to copyright year change.

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/s6/s6.hash | 4 ++--
 package/s6/s6.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/s6/s6.hash b/package/s6/s6.hash
index a829700d97..3c5ce4265a 100644
--- a/package/s6/s6.hash
+++ b/package/s6/s6.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  1d21373151704150df0e8ed199f097f6ee5d2befb9a68aca4f20f3862e5d8757  s6-2.10.0.3.tar.gz
-sha256  adecb8bedfaae27fcfe65ecb3ef0e2e71aa2a2b49dc21886a200bc677d93e6ec  COPYING
+sha256  6c1474be3e889dac392cee307abe015cd4be0c85c725c84ea7f184f0e34503a2  s6-2.11.1.2.tar.gz
+sha256  35126cb8f2ff2a6e359f7bfec46c49004ead6304d8248ba67dcdebcc7d377754  COPYING
diff --git a/package/s6/s6.mk b/package/s6/s6.mk
index ead82d7eaf..78962ed159 100644
--- a/package/s6/s6.mk
+++ b/package/s6/s6.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-S6_VERSION = 2.10.0.3
+S6_VERSION = 2.11.1.2
 S6_SITE = http://skarnet.org/software/s6
 S6_LICENSE = ISC
 S6_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
