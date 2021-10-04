Return-Path: <SRS0=dj6D=OY=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E2F3C433F5
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 12:49:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8BFA961264
	for <buildroot@archiver.kernel.org>; Mon,  4 Oct 2021 12:49:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8BFA961264
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5E4E260668;
	Mon,  4 Oct 2021 12:49:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8kzthA0yffOa; Mon,  4 Oct 2021 12:49:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D717B60AF5;
	Mon,  4 Oct 2021 12:49:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BF5611BF330
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 12:49:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AEF6784BC2
 for <buildroot@lists.busybox.net>; Mon,  4 Oct 2021 12:49:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fpGh_1p95cjj for <buildroot@lists.busybox.net>;
 Mon,  4 Oct 2021 12:49:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B076284BB2
 for <buildroot@buildroot.org>; Mon,  4 Oct 2021 12:49:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 5B6F38DC9B; Mon,  4 Oct 2021 12:47:05 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 4 Oct 2021 14:14:55 +0200
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: b5f184d898972edfcb1ffdcb2f197c76c33ffaf7
X-Git-Newrev: 789efcea4f8040fb8f956236a86194c9f33741ba
X-Patchwork-Hint: ignore
Message-Id: <20211004124705.5B6F38DC9B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/syslog-ng: Bump
 version to 3.33.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=789efcea4f8040fb8f956236a86194c9f33741ba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

Bugfix release, fixing a regression in 3.33.1:

- disk-buffer: fixed a bug, which was introduced in 3.33.1, where we
  sometimes corrupted the disk-buffer file when it reached full size.

https://github.com/syslog-ng/syslog-ng/releases/tag/syslog-ng-3.33.2

Signed-off-by: Chris Packham <judge.packham@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit e8752217fdbeb4978eef9cdc26d2f63a12b14ace)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/syslog-ng/syslog-ng.hash | 2 +-
 package/syslog-ng/syslog-ng.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/syslog-ng/syslog-ng.hash b/package/syslog-ng/syslog-ng.hash
index fdf37ec3d9..df8002341c 100644
--- a/package/syslog-ng/syslog-ng.hash
+++ b/package/syslog-ng/syslog-ng.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  35913654582947705a5679c9a2dcd4d25b4c98f3f3734cd55e94c5c780c22877  syslog-ng-3.33.1.tar.gz
+sha256  0b786a06077b9150191d714f45a1b4b3792952cb58163a3af336f074da9fb14b  syslog-ng-3.33.2.tar.gz
 sha256  e912cf1e1c09b81d61c0154eb6c179588622c31ad07bfb4a90c612d07ff09d9b  COPYING
 sha256  ce3324c9f22299cfc7c281e5a6ab40fbe9c2ea1a67cee87226cb8cd39db1e1d2  GPL.txt
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LGPL.txt
diff --git a/package/syslog-ng/syslog-ng.mk b/package/syslog-ng/syslog-ng.mk
index b5aa5ca027..765e886b12 100644
--- a/package/syslog-ng/syslog-ng.mk
+++ b/package/syslog-ng/syslog-ng.mk
@@ -6,7 +6,7 @@
 
 # When updating the version, please check at runtime if the version in
 # syslog-ng.conf header needs to be updated
-SYSLOG_NG_VERSION = 3.33.1
+SYSLOG_NG_VERSION = 3.33.2
 SYSLOG_NG_SITE = https://github.com/balabit/syslog-ng/releases/download/syslog-ng-$(SYSLOG_NG_VERSION)
 SYSLOG_NG_LICENSE = LGPL-2.1+ (syslog-ng core), GPL-2.0+ (modules)
 SYSLOG_NG_LICENSE_FILES = COPYING GPL.txt LGPL.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
