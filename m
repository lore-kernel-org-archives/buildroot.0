Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD056D3A67C
	for <buildroot@archiver.kernel.org>; Tue, 29 Oct 2024 18:51:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86C308089A;
	Tue, 29 Oct 2024 18:51:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Di-dgz20eXkD; Tue, 29 Oct 2024 18:51:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 90CD780849
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 90CD780849;
	Tue, 29 Oct 2024 18:51:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A93635E4F
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 18:51:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A403F4020C
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 18:51:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DUxUQBcB40KI for <buildroot@buildroot.org>;
 Tue, 29 Oct 2024 18:51:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7AC6D401FF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7AC6D401FF
 for <buildroot@buildroot.org>; Tue, 29 Oct 2024 18:51:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 65E5D84755; Tue, 29 Oct 2024 18:51:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 29 Oct 2024 19:50:34 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 21a72fb275aea38c1d82ce7b3b7f10e8cf4bb83d
X-Git-Newrev: ded7184a58ea9fb5b8963cab8a6612146750a693
X-Patchwork-Hint: ignore
Message-Id: <20241029185111.65E5D84755@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nethogs: bump to version 0.8.8
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=ded7184a58ea9fb5b8963cab8a6612146750a693
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove patch that was merged upstream.

Changelog: https://github.com/raboof/nethogs/releases/tag/v0.8.8

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...01-determineVersion-sh-prevent-traversing.patch | 31 ----------------------
 package/nethogs/nethogs.hash                       |  2 +-
 package/nethogs/nethogs.mk                         |  2 +-
 3 files changed, 2 insertions(+), 33 deletions(-)

diff --git a/package/nethogs/0001-determineVersion-sh-prevent-traversing.patch b/package/nethogs/0001-determineVersion-sh-prevent-traversing.patch
deleted file mode 100644
index 6f39c53128..0000000000
--- a/package/nethogs/0001-determineVersion-sh-prevent-traversing.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 6423bdf05d51efc5441c82248098f99e4c1f59c3 Mon Sep 17 00:00:00 2001
-From: Marcus Hoffmann <marcus.hoffmann@othermo.de>
-Date: Fri, 20 Sep 2024 12:06:26 +0200
-Subject: [PATCH] determineVersion.sh: prevent traversing into outer git repo
- for git-describe call
-
-When building nethogs inside another git repo (as is i.e. done as part
-of a buildroot build) the version is picked up from the outer git repo,
-which is confusing as well as introducing reproducibility problems when
-rebuilding the same nethogs version produces different results if the
-outer repository changes.
-
-Upstream: https://github.com/raboof/nethogs/commit/6423bdf05d51efc5441c82248098f99e4c1f59c3
-Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
----
- determineVersion.sh | 7 +++++--
- 1 file changed, 5 insertions(+), 2 deletions(-)
-
-diff --git a/determineVersion.sh b/determineVersion.sh
-index 7c5f1de..3d80d9d 100755
---- a/determineVersion.sh
-+++ b/determineVersion.sh
-@@ -1,3 +1,6 @@
- #!/bin/bash
--
--(git describe --tags 2>/dev/null || pwd | sed -e "s/.*\\///" | sed -e "s/[^-]*//") | tail -c +2
-+if [ $(git rev-parse --show-toplevel 2>/dev/null) == $(pwd) ]; then
-+  git describe --tags 2>/dev/null | tail -c +2
-+else
-+  pwd | sed -e "s/.*\\///" | sed -e "s/[^-]*//" | tail -c +2
-+fi
diff --git a/package/nethogs/nethogs.hash b/package/nethogs/nethogs.hash
index fd1f236250..b1ef5d7042 100644
--- a/package/nethogs/nethogs.hash
+++ b/package/nethogs/nethogs.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  957d6afcc220dfbba44c819162f44818051c5b4fb793c47ba98294393986617d  nethogs-0.8.7.tar.gz
+sha256  111ade20cc545e8dfd7ce4e293bd6b31cd1678a989b6a730bd2fa2acc6254818  nethogs-0.8.8.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/nethogs/nethogs.mk b/package/nethogs/nethogs.mk
index 98c4f5f008..74387d7397 100644
--- a/package/nethogs/nethogs.mk
+++ b/package/nethogs/nethogs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NETHOGS_VERSION = 0.8.7
+NETHOGS_VERSION = 0.8.8
 NETHOGS_SITE = $(call github,raboof,nethogs,v$(NETHOGS_VERSION))
 NETHOGS_LICENSE = GPL-2.0+
 NETHOGS_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
