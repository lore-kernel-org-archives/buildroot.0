Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6BFFC433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Jun 2022 13:04:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5502B41A6E;
	Mon,  6 Jun 2022 13:04:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B3pAXFYoYlUs; Mon,  6 Jun 2022 13:04:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0EA5E41A4A;
	Mon,  6 Jun 2022 13:04:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 581511BF339
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 13:03:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 41459416F3
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 13:03:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id onLm0tEN4WM4 for <buildroot@lists.busybox.net>;
 Mon,  6 Jun 2022 13:03:51 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2CCFB418F8
 for <buildroot@buildroot.org>; Mon,  6 Jun 2022 13:03:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id EE1E186D92; Mon,  6 Jun 2022 12:52:01 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 6 Jun 2022 14:59:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a1dafa1b04fff04b238be8dbe5543f366062d2d4
X-Git-Newrev: 4fac515ab5f92c537e55f408c26be28ada7aaf7e
X-Patchwork-Hint: ignore
Message-Id: <20220606125201.EE1E186D92@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mariadb: security bump to version
 10.3.35
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

commit: https://git.buildroot.net/buildroot/commit/?id=4fac515ab5f92c537e55f408c26be28ada7aaf7e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix CVE-2021-46669, CVE-2022-21427, CVE-2022-27376, CVE-2022-27377,
CVE-2022-27378, CVE-2022-27379, CVE-2022-27380, CVE-2022-27381,
CVE-2022-27383, CVE-2022-27384, CVE-2022-27386, CVE-2022-27387,
CVE-2022-27445, CVE-2022-27447, CVE-2022-27448, CVE-2022-27449,
CVE-2022-27452, CVE-2022-27456 and CVE-2022-27458

https://mariadb.com/kb/en/mariadb-10335-release-notes

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/mariadb/mariadb.hash | 4 ++--
 package/mariadb/mariadb.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/mariadb/mariadb.hash b/package/mariadb/mariadb.hash
index 4da26bdf94..f7e3c7b744 100644
--- a/package/mariadb/mariadb.hash
+++ b/package/mariadb/mariadb.hash
@@ -1,5 +1,5 @@
-# From https://dlm.mariadb.com/2117287/MariaDB/mariadb-10.3.34/source/sha512sums.txt
-sha512  46d4575ec1afb68510652a4bb31ca5ce83a2f5f61048a6e9c1487b0ba58f079465a8b72518d44043cd42c631b19ff50b5498584676ac6473705b138fe3300741  mariadb-10.3.34.tar.gz
+# From https://downloads.mariadb.org/mariadb/10.3.35
+sha512  9355de944eccef4e0bc01b19ffc3c0c72cf88befae7385c6f0ee1ea47dbd98d23f6bb46af9c140acc48d9d9613552870684bc0b7ca1f3cff1dc09c1a2c801573  mariadb-10.3.35.tar.gz
 
 # Hash for license files
 sha256  084aa0007efac6dda6aafffb3f3ef8b66b105862dad7ee23f6a4b52813f84464  README.md
diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
index 18667e7e70..06fd1484b6 100644
--- a/package/mariadb/mariadb.mk
+++ b/package/mariadb/mariadb.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-MARIADB_VERSION = 10.3.34
-MARIADB_SITE = https://dlm.mariadb.com/2117285/MariaDB/mariadb-$(MARIADB_VERSION)/source
+MARIADB_VERSION = 10.3.35
+MARIADB_SITE = https://downloads.mariadb.org/interstitial/mariadb-$(MARIADB_VERSION)/source
 MARIADB_LICENSE = GPL-2.0 (server), GPL-2.0 with FLOSS exception (GPL client library), LGPL-2.0 (LGPL client library)
 # Tarball no longer contains LGPL license text
 # https://jira.mariadb.org/browse/MDEV-12297
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
