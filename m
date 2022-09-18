Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7790EC6FA82
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 21:13:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F3CA660BE7;
	Sun, 18 Sep 2022 21:13:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F3CA660BE7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ihfu1BIS9Y2f; Sun, 18 Sep 2022 21:13:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1900160AE8;
	Sun, 18 Sep 2022 21:13:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1900160AE8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1E8531BF3C4
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 21:12:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ED46842468
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 21:12:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED46842468
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id po6a7ml05iG0 for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 21:12:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2D1984241A
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 21:12:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D1984241A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1BC6C854B0; Sun, 18 Sep 2022 21:12:21 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 18 Sep 2022 22:58:47 +0200
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: 0003fdbed318adbd85ba9f65791ed9b5eedf3c72
X-Git-Newrev: b535edfe43500b95e86f12ff2b323deab6f2630a
X-Patchwork-Hint: ignore
Message-Id: <20220918211221.1BC6C854B0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] package/mariadb: security
 bump to version 10.3.36
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

commit: https://git.buildroot.net/buildroot/commit/?id=b535edfe43500b95e86f12ff2b323deab6f2630a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

- Fixes for the following security vulnerabilities:
  - CVE-2018-25032
  - CVE-2022-32091
  - CVE-2022-32084
- Refresh first patch

https://mariadb.com/kb/en/mariadb-10336-release-notes

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit ac9c077fb832098e38c1b846fb3023253b27d105)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/mariadb/0001-add-extra-check-for-librt.patch | 6 ++++--
 package/mariadb/mariadb.hash                         | 4 ++--
 package/mariadb/mariadb.mk                           | 2 +-
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/mariadb/0001-add-extra-check-for-librt.patch b/package/mariadb/0001-add-extra-check-for-librt.patch
index 0dd4c546fb..6e3fc70276 100644
--- a/package/mariadb/0001-add-extra-check-for-librt.patch
+++ b/package/mariadb/0001-add-extra-check-for-librt.patch
@@ -8,6 +8,8 @@ https://jira.mariadb.org/browse/MDEV-10841
 Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
 [Rebased on mariadb-10.3.30]
 Signed-off-by: Peter Seiderer <ps.report@gmx.net>
+[Rebased on mariadb-10.3.36]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
  configure.cmake | 3 +++
  1 file changed, 3 insertions(+)
@@ -23,9 +25,9 @@ index 1b85c31b..4a1cd847 100644
 +  IF(NOT LIBRT)
 +    MY_SEARCH_LIBS(posix_spawn_file_actions_addclose rt LIBRT)
 +  ENDIF()
-   set(THREADS_PREFER_PTHREAD_FLAG ON)
-   FIND_PACKAGE(Threads)
+   MY_SEARCH_LIBS(backtrace_symbols_fd execinfo LIBEXECINFO)
  
+   set(THREADS_PREFER_PTHREAD_FLAG ON)
 -- 
 2.32.0
 
diff --git a/package/mariadb/mariadb.hash b/package/mariadb/mariadb.hash
index f7e3c7b744..c4064cff66 100644
--- a/package/mariadb/mariadb.hash
+++ b/package/mariadb/mariadb.hash
@@ -1,5 +1,5 @@
-# From https://downloads.mariadb.org/mariadb/10.3.35
-sha512  9355de944eccef4e0bc01b19ffc3c0c72cf88befae7385c6f0ee1ea47dbd98d23f6bb46af9c140acc48d9d9613552870684bc0b7ca1f3cff1dc09c1a2c801573  mariadb-10.3.35.tar.gz
+# From https://downloads.mariadb.org/mariadb/10.3.36
+sha512  321b4c48fcea4413eb239c4904c806306de660f2844edfa1d2a2a15213db287070d0f923db976588dfe329559d565bd98bddef3aaf8f14502f8c3db2ee27757a  mariadb-10.3.36.tar.gz
 
 # Hash for license files
 sha256  084aa0007efac6dda6aafffb3f3ef8b66b105862dad7ee23f6a4b52813f84464  README.md
diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
index 4c855985b1..5fb8876278 100644
--- a/package/mariadb/mariadb.mk
+++ b/package/mariadb/mariadb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MARIADB_VERSION = 10.3.35
+MARIADB_VERSION = 10.3.36
 MARIADB_SITE = https://downloads.mariadb.org/interstitial/mariadb-$(MARIADB_VERSION)/source
 MARIADB_LICENSE = GPL-2.0 (server), GPL-2.0 with FLOSS exception (GPL client library), LGPL-2.0 (LGPL client library)
 # Tarball no longer contains LGPL license text
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
