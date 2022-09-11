Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12865C54EE9
	for <buildroot@archiver.kernel.org>; Sun, 11 Sep 2022 18:26:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A73AC845FD;
	Sun, 11 Sep 2022 18:26:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A73AC845FD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QcmObn5gSGxb; Sun, 11 Sep 2022 18:26:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D67F9845FB;
	Sun, 11 Sep 2022 18:26:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D67F9845FB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9AA981BF3EB
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 18:25:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 71DD94251C
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 18:25:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 71DD94251C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gRg2xDNKAcSj for <buildroot@lists.busybox.net>;
 Sun, 11 Sep 2022 18:25:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5559142506
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 18:25:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5559142506
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 41B14836D1; Sun, 11 Sep 2022 18:25:24 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 11 Sep 2022 20:24:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f7c841c75e84faedf2628a556b1e0bbbafbbf210
X-Git-Newrev: ac9c077fb832098e38c1b846fb3023253b27d105
X-Patchwork-Hint: ignore
Message-Id: <20220911182524.41B14836D1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mariadb: security bump to version
 10.3.36
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

commit: https://git.buildroot.net/buildroot/commit/?id=ac9c077fb832098e38c1b846fb3023253b27d105
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Fixes for the following security vulnerabilities:
  - CVE-2018-25032
  - CVE-2022-32091
  - CVE-2022-32084
- Refresh first patch

https://mariadb.com/kb/en/mariadb-10336-release-notes

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
