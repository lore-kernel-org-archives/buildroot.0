Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8756ACE7A88
	for <buildroot@archiver.kernel.org>; Sun, 24 Sep 2023 19:10:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 36BE560F3D;
	Sun, 24 Sep 2023 19:10:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 36BE560F3D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nSHR11KAdGOD; Sun, 24 Sep 2023 19:10:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8220660F2E;
	Sun, 24 Sep 2023 19:10:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8220660F2E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 250D31BF2A9
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 19:06:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7B7704182B
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 19:05:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7B7704182B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wmfILcGGA1Zf for <buildroot@lists.busybox.net>;
 Sun, 24 Sep 2023 19:05:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BA08841833
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 19:05:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA08841833
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AA83087592; Sun, 24 Sep 2023 19:05:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 24 Sep 2023 20:41:36 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 91160ab1169865cef3d06ba64cde417a377e7f0f
X-Git-Newrev: 852e83fe656f90c5123555efb2e1a5d3600f8fbd
X-Patchwork-Hint: ignore
Message-Id: <20230924190552.AA83087592@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/sngrep: security
 bump to version 1.7.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=852e83fe656f90c5123555efb2e1a5d3600f8fbd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

Fix CVE-2023-31981 and CVE-2023-31982

https://github.com/irontec/sngrep/blob/v1.7.0/ChangeLog
https://github.com/irontec/sngrep/compare/v1.6.0...v1.7.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 922e0d8451609c24b45d64c7165cce77213b51e6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sngrep/sngrep.hash | 6 +++---
 package/sngrep/sngrep.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/sngrep/sngrep.hash b/package/sngrep/sngrep.hash
index 60a32022e6..c9b9c8be8d 100644
--- a/package/sngrep/sngrep.hash
+++ b/package/sngrep/sngrep.hash
@@ -1,6 +1,6 @@
-# From https://github.com/irontec/sngrep/releases/download/v1.6.0/sngrep-1.6.0.tar.gz.md5sum
-md5  1519ca6cd1167c0722debfb96e2ac173  sngrep-1.6.0.tar.gz
+# From https://github.com/irontec/sngrep/releases/download/v1.7.0/sngrep-1.7.0.tar.gz.md5sum
+md5  ee3cc7bd75adeb713411aa678e45ae4c  sngrep-1.7.0.tar.gz
 
 # Locally computed
-sha256  fd80964d6560f2ff57b4f5bef2353d1a6f7c48d2f1a5f0a167c854bd2e801999  sngrep-1.6.0.tar.gz
+sha256  2e5ba3a4d6486ea00bd73d2cceff383ba162dcd6d0170ae74cfa3b1c206e2cb1  sngrep-1.7.0.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE
diff --git a/package/sngrep/sngrep.mk b/package/sngrep/sngrep.mk
index 0e344550d3..b86d7e83f0 100644
--- a/package/sngrep/sngrep.mk
+++ b/package/sngrep/sngrep.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SNGREP_VERSION = 1.6.0
+SNGREP_VERSION = 1.7.0
 SNGREP_SITE = \
 	https://github.com/irontec/sngrep/releases/download/v$(SNGREP_VERSION)
 SNGREP_LICENSE = GPL-3.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
