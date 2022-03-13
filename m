Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB1D6C433F5
	for <buildroot@archiver.kernel.org>; Sun, 13 Mar 2022 21:31:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 81DC481DB2;
	Sun, 13 Mar 2022 21:31:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1_KWrqzy396Z; Sun, 13 Mar 2022 21:31:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9407081BCF;
	Sun, 13 Mar 2022 21:31:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 54E221BF97C
 for <buildroot@lists.busybox.net>; Sun, 13 Mar 2022 21:30:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 41835408F4
 for <buildroot@lists.busybox.net>; Sun, 13 Mar 2022 21:30:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BeXxgqSPs8N5 for <buildroot@lists.busybox.net>;
 Sun, 13 Mar 2022 21:30:19 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4C4F040926
 for <buildroot@buildroot.org>; Sun, 13 Mar 2022 21:30:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id DEE5883D1E; Sun, 13 Mar 2022 21:21:41 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 13 Mar 2022 22:25:12 +0100
X-Git-Refname: refs/heads/2021.11.x
X-Git-Oldrev: 909acef27b14e73d633d347d13eab04298596a99
X-Git-Newrev: 77545c497e74ca68099969a86c1434d7aa695273
X-Patchwork-Hint: ignore
Message-Id: <20220313212141.DEE5883D1E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.11.x] package/mariadb: security
 bump to version 10.3.34
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

commit: https://git.buildroot.net/buildroot/commit/?id=77545c497e74ca68099969a86c1434d7aa695273
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.11.x

Fix CVE-2021-46665, CVE-2021-46664, CVE-2021-46661, CVE-2021-46668,
CVE-2021-46663, CVE-2022-24052, CVE-2022-24051, CVE-2022-24050,
CVE-2022-24048, CVE-2021-46659, CVE-2021-35604, CVE-2021-46667,
CVE-2021-46662, CVE-2021-2372, CVE-2021-2389 and CVE-2021-46658

Update hash of README.md (changes not related to license:
https://github.com/MariaDB/server/commit/773a07b65517327add6348c045cee14bdf489fe0)

https://mariadb.com/kb/en/mariadb-10334-release-notes/
https://mariadb.com/kb/en/mariadb-10333-release-notes/
https://mariadb.com/kb/en/mariadb-10332-release-notes/
https://mariadb.com/kb/en/mariadb-10331-release-notes/

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit e7a9a1bce4b081a721799ff62ee5fff8456203ce)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mariadb/mariadb.hash | 7 +++----
 package/mariadb/mariadb.mk   | 4 ++--
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/mariadb/mariadb.hash b/package/mariadb/mariadb.hash
index 4025be317f..4da26bdf94 100644
--- a/package/mariadb/mariadb.hash
+++ b/package/mariadb/mariadb.hash
@@ -1,7 +1,6 @@
-# From https://downloads.mariadb.org/mariadb/10.3.30
-sha256  bd8735c65bdb7ebcd5d779fb9d3de3f2fcd319ad6482278d73dfe7301ad4ae1b  mariadb-10.3.30.tar.gz
-sha512  742c30b3ebc0b6d36b98d4e7a7fb511098142e72d8f42cbfa73a0bdea2059be17e790fbda4732329bbd99e4b50b13cf18e8122964a473e0b62170ab869eca8fc  mariadb-10.3.30.tar.gz
+# From https://dlm.mariadb.com/2117287/MariaDB/mariadb-10.3.34/source/sha512sums.txt
+sha512  46d4575ec1afb68510652a4bb31ca5ce83a2f5f61048a6e9c1487b0ba58f079465a8b72518d44043cd42c631b19ff50b5498584676ac6473705b138fe3300741  mariadb-10.3.34.tar.gz
 
 # Hash for license files
-sha256  a4665c1189fe31e0bbc27e9b55439df7dad6e99805407fe58d78da7aabe678f8  README.md
+sha256  084aa0007efac6dda6aafffb3f3ef8b66b105862dad7ee23f6a4b52813f84464  README.md
 sha256  240a15a1d0f34d3abca462cdb7e5fb89470967563f16b0e71169e51c1e74cf2b  COPYING
diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
index d08b768a2e..146ce0ee09 100644
--- a/package/mariadb/mariadb.mk
+++ b/package/mariadb/mariadb.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-MARIADB_VERSION = 10.3.30
-MARIADB_SITE = https://downloads.mariadb.org/interstitial/mariadb-$(MARIADB_VERSION)/source
+MARIADB_VERSION = 10.3.34
+MARIADB_SITE = https://dlm.mariadb.com/2117285/MariaDB/mariadb-$(MARIADB_VERSION)/source
 MARIADB_LICENSE = GPL-2.0 (server), GPL-2.0 with FLOSS exception (GPL client library), LGPL-2.0 (LGPL client library)
 # Tarball no longer contains LGPL license text
 # https://jira.mariadb.org/browse/MDEV-12297
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
