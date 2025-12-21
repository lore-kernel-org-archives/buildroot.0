Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D75DE66886
	for <buildroot@archiver.kernel.org>; Sun, 21 Dec 2025 13:55:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 43CED81B9D;
	Sun, 21 Dec 2025 13:55:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C7JTRSljgr7t; Sun, 21 Dec 2025 13:55:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 86895817C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766325327;
	bh=ia7X6u88NCBu+OeyfsycUWdgEABmCUHkTg3KvlELpO0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LAOEwco+quQJ6/1THzI8qYa5XxhssgYL7ZNDvTI+SmxCBIM77upaMI1s9E9FtQKZA
	 SnNwRCMORrN3sSJr6znw4UTqSUPYg3wxBexevQ0P5MwK9cT4lpBdGo7zchB8KespHj
	 xDGrlKhMYybaw6ZHEknKM/npdhSD9sr2+gsBXrPrkWd6dCdyChL0YHv+Gt2ig1j1zF
	 3IH9iIBZuQRYWce1LKqc7foGewwz8Zn1VvMio6BwEJxocxt4GV5uiiWfbaSqs4t+qO
	 h/Dk4SxaxVSN012imHZHJBfCwwaw0ZbsU8AR7SHVGFgYx2tVrwkaXgyzTenPHohukb
	 cBFirSpPENTQA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86895817C0;
	Sun, 21 Dec 2025 13:55:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4D757119
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 13:55:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 33F0560B04
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 13:55:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7W8EVFtOpOid for <buildroot@buildroot.org>;
 Sun, 21 Dec 2025 13:55:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8706E60A6A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8706E60A6A
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 13:55:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6146F874BB; Sun, 21 Dec 2025 13:55:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 21 Dec 2025 14:51:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bc3128fc57021c1efb8faa6e0643c808dd58c180
X-Git-Newrev: 5ab46339aa1efb7c226fe01113d19c4682435f5c
X-Patchwork-Hint: ignore
Message-Id: <20251221135525.6146F874BB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/v4l2loopback: bump version to
 0.15.3
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=5ab46339aa1efb7c226fe01113d19c4682435f5c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
https://github.com/v4l2loopback/v4l2loopback/blob/v0.15.3/ChangeLog

This new version fixes compilation errors with gcc >= 14.

Fixes:
https://autobuild.buildroot.net/results/910/910e27b189c62f977bc42f7c53471334eb765168/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Julien: add comment about the fixed issue]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/v4l2loopback/v4l2loopback.hash | 2 +-
 package/v4l2loopback/v4l2loopback.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/v4l2loopback/v4l2loopback.hash b/package/v4l2loopback/v4l2loopback.hash
index c7fb226add..12ca4ec6cd 100644
--- a/package/v4l2loopback/v4l2loopback.hash
+++ b/package/v4l2loopback/v4l2loopback.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  1e57e1e382d7451aa2a88d63cc9f146eab1f425b90e76104d4c3d73127e34771  v4l2loopback-0.13.2.tar.gz
+sha256  2758ea287da8dd34a0421c0dd50094a0342d22414e1bbccbbe92f41bbaa26b2d  v4l2loopback-0.15.3.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/v4l2loopback/v4l2loopback.mk b/package/v4l2loopback/v4l2loopback.mk
index a4ddf5e2d9..5c3562160f 100644
--- a/package/v4l2loopback/v4l2loopback.mk
+++ b/package/v4l2loopback/v4l2loopback.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-V4L2LOOPBACK_VERSION = 0.13.2
+V4L2LOOPBACK_VERSION = 0.15.3
 V4L2LOOPBACK_SITE = $(call github,umlaeute,v4l2loopback,v$(V4L2LOOPBACK_VERSION))
 V4L2LOOPBACK_LICENSE = GPL-2.0+
 V4L2LOOPBACK_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
