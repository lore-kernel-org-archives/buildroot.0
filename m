Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81C73C433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Dec 2021 18:43:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3884F404B1;
	Mon,  6 Dec 2021 18:43:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LgurjLOhttHF; Mon,  6 Dec 2021 18:43:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3182B40452;
	Mon,  6 Dec 2021 18:43:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6AF631BF3F2
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:14:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 44C5E41C13
 for <buildroot@lists.busybox.net>; Mon,  6 Dec 2021 18:12:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jg9kaqjY4XvM for <buildroot@lists.busybox.net>;
 Mon,  6 Dec 2021 18:12:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3686E41C46
 for <buildroot@buildroot.org>; Mon,  6 Dec 2021 18:12:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id D027381468; Mon,  6 Dec 2021 18:07:41 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 4 Dec 2021 21:09:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 250d36c86f0e104fd978f60e1e004d976a00159a
X-Git-Newrev: d925c1260f14cebff0b479a2abff8e95a8da222d
X-Patchwork-Hint: ignore
Message-Id: <20211206180741.D027381468@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sysklogd: bump to version 2.3.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=d925c1260f14cebff0b479a2abff8e95a8da222d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch updates syskogd to v2.3.0 and drops the redundant .md5 hash.
The upstream sha256 should be sufficient.

Major features and fixes relevant to Buildroot include:
 - UNIX 2038 assert fixes for 32-bit time_t systems
 - logger support for logging to kernel ring buffer
 - Persistent DNS lookup failure for remote syslog servers

For details, see the ChangeLog or the GitHub releases page:
https://github.com/troglobit/sysklogd/releases/tag/v2.3.0

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sysklogd/sysklogd.hash | 5 ++---
 package/sysklogd/sysklogd.mk   | 2 +-
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/sysklogd/sysklogd.hash b/package/sysklogd/sysklogd.hash
index 6d3ba8f960..19405a9877 100644
--- a/package/sysklogd/sysklogd.hash
+++ b/package/sysklogd/sysklogd.hash
@@ -1,6 +1,5 @@
-# Upstream .md5 and .sha256 from GitHub
-md5 2c6749c49f52b8c5dad18e9a9315e7dd  sysklogd-2.2.3.tar.gz
-sha256 e7ea09c15511a63c430e84f65ce3bf55a0386ee419ab52e9341c4a9fabae59ad  sysklogd-2.2.3.tar.gz
+# Upstream .sha256 from GitHub
+sha256  9a410b484713d9600c820d8113f2d80cb14708328c908b1a28e8b7b31fd54f57  sysklogd-2.3.0.tar.gz
 
 # Locally calculated
 sha256  7a71d7603a7c4456df441463e54da35acf151c1be0879246de63544f1f34f477  LICENSE
diff --git a/package/sysklogd/sysklogd.mk b/package/sysklogd/sysklogd.mk
index 7c5de95743..20ce9d60e3 100644
--- a/package/sysklogd/sysklogd.mk
+++ b/package/sysklogd/sysklogd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSKLOGD_VERSION = 2.2.3
+SYSKLOGD_VERSION = 2.3.0
 SYSKLOGD_SITE = https://github.com/troglobit/sysklogd/releases/download/v$(SYSKLOGD_VERSION)
 SYSKLOGD_LICENSE = BSD-3-Clause
 SYSKLOGD_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
