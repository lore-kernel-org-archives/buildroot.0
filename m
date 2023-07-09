Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D0BBEB64DC
	for <buildroot@archiver.kernel.org>; Sun,  9 Jul 2023 22:16:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF9B740321;
	Sun,  9 Jul 2023 22:16:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF9B740321
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oFemj_Jf4Er0; Sun,  9 Jul 2023 22:15:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7EF2E4006D;
	Sun,  9 Jul 2023 22:15:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7EF2E4006D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3684B1BF484
 for <buildroot@lists.busybox.net>; Sun,  9 Jul 2023 22:15:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1D37160A99
 for <buildroot@lists.busybox.net>; Sun,  9 Jul 2023 22:15:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D37160A99
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JEN0ITV4wbpb for <buildroot@lists.busybox.net>;
 Sun,  9 Jul 2023 22:15:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2EE6060B05
 for <buildroot@buildroot.org>; Sun,  9 Jul 2023 22:15:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2EE6060B05
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1B62A8698B; Sun,  9 Jul 2023 22:15:45 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 9 Jul 2023 19:53:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 683b3e93eb40bf4b312d76a1ce88b2df0519487a
X-Git-Newrev: 88c7359f65381d49fa497f9e33bf54bb31a14e6c
X-Patchwork-Hint: ignore
Message-Id: <20230709221545.1B62A8698B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mariadb: update to version 10.11.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=88c7359f65381d49fa497f9e33bf54bb31a14e6c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove 0002-include-ssl_compat.h-fix-build-with-libressl-3.5.0.patch as it
is now upstream. Update README.md hash for minor formatting changes.

Release notes: https://mariadb.com/kb/en/mariadb-10-11-4-release-notes/
Changelog: https://mariadb.com/kb/en/mariadb-10-11-4-changelog/

Signed-off-by: Danny Wood <danny@rotronics.co.uk>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...sl_compat.h-fix-build-with-libressl-3.5.0.patch | 39 ----------------------
 package/mariadb/mariadb.hash                       |  6 ++--
 package/mariadb/mariadb.mk                         |  2 +-
 3 files changed, 4 insertions(+), 43 deletions(-)

diff --git a/package/mariadb/0002-include-ssl_compat.h-fix-build-with-libressl-3.5.0.patch b/package/mariadb/0002-include-ssl_compat.h-fix-build-with-libressl-3.5.0.patch
deleted file mode 100644
index fd3e6e6607..0000000000
--- a/package/mariadb/0002-include-ssl_compat.h-fix-build-with-libressl-3.5.0.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 79ed770a37c8669390a58a4485dd8f5565fe2497 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 15 Jan 2023 19:12:05 +0100
-Subject: [PATCH] include/ssl_compat.h: fix build with libressl >= 3.5.0
-
-Fix the following build failure with libressl >= 3.5.0:
-
-In file included from /tmp/instance-10/output-1/build/mariadb-10.3.36/vio/viosslfactories.c:18:
-/tmp/instance-10/output-1/build/mariadb-10.3.36/vio/viosslfactories.c: In function 'get_dh2048':
-/tmp/instance-10/output-1/build/mariadb-10.3.36/include/ssl_compat.h:68:45: error: invalid use of incomplete typedef 'DH' {aka 'struct dh_st'}
-   68 | #define DH_set0_pqg(D,P,Q,G)            ((D)->p= (P), (D)->g= (G))
-      |                                             ^~
-
-Fixes:
- - http://autobuild.buildroot.org/results/524198344aafca58d214537af64c5961c407b0f8
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/MariaDB/server/pull/2435]
----
- include/ssl_compat.h | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/include/ssl_compat.h b/include/ssl_compat.h
-index 664f3aac87c..3678e5fa084 100644
---- a/include/ssl_compat.h
-+++ b/include/ssl_compat.h
-@@ -19,7 +19,8 @@
- /* OpenSSL version specific definitions */
- #if defined(OPENSSL_VERSION_NUMBER)
- 
--#if OPENSSL_VERSION_NUMBER >= 0x10100000L && !defined(LIBRESSL_VERSION_NUMBER)
-+#if OPENSSL_VERSION_NUMBER >= 0x10100000L && \
-+	!(defined(LIBRESSL_VERSION_NUMBER) && LIBRESSL_VERSION_NUMBER < 0x30500000L)
- #define HAVE_OPENSSL11 1
- #define SSL_LIBRARY OpenSSL_version(OPENSSL_VERSION)
- #define ERR_remove_state(X) ERR_clear_error()
--- 
-2.39.0
-
diff --git a/package/mariadb/mariadb.hash b/package/mariadb/mariadb.hash
index c4064cff66..03ce5a968a 100644
--- a/package/mariadb/mariadb.hash
+++ b/package/mariadb/mariadb.hash
@@ -1,6 +1,6 @@
-# From https://downloads.mariadb.org/mariadb/10.3.36
-sha512  321b4c48fcea4413eb239c4904c806306de660f2844edfa1d2a2a15213db287070d0f923db976588dfe329559d565bd98bddef3aaf8f14502f8c3db2ee27757a  mariadb-10.3.36.tar.gz
+# From https://downloads.mariadb.org/mariadb/10.11.4
+sha512  62fc05395857dd036ebeed53b1ff0ecd9abd95ce8e5316194286521caae0f9452cf96a93613adec809e39e1d8ef20c330b24fee82b3bb90ee27a84f2bbd0d8d2  mariadb-10.11.4.tar.gz
 
 # Hash for license files
-sha256  084aa0007efac6dda6aafffb3f3ef8b66b105862dad7ee23f6a4b52813f84464  README.md
+sha256  2b278a3a2f20696113a7c57c4f3e6a5cdb9a25f2a827e72e0c089a2f805ff91a  README.md
 sha256  240a15a1d0f34d3abca462cdb7e5fb89470967563f16b0e71169e51c1e74cf2b  COPYING
diff --git a/package/mariadb/mariadb.mk b/package/mariadb/mariadb.mk
index 5fb8876278..a743d020c0 100644
--- a/package/mariadb/mariadb.mk
+++ b/package/mariadb/mariadb.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MARIADB_VERSION = 10.3.36
+MARIADB_VERSION = 10.11.4
 MARIADB_SITE = https://downloads.mariadb.org/interstitial/mariadb-$(MARIADB_VERSION)/source
 MARIADB_LICENSE = GPL-2.0 (server), GPL-2.0 with FLOSS exception (GPL client library), LGPL-2.0 (LGPL client library)
 # Tarball no longer contains LGPL license text
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
