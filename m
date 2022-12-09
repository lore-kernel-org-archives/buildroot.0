Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEBF0C61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 22:06:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6444B4EE3F;
	Mon, 20 Feb 2023 22:06:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6444B4EE3F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2wujI-1-MWm5; Mon, 20 Feb 2023 22:06:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 19C874EE3C;
	Mon, 20 Feb 2023 22:06:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 19C874EE3C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3F4761BF8C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:54:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C896861150
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C896861150
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ClU620nE_3dg for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:51:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BE89061140
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:51:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE89061140
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BD207828C8; Mon, 20 Feb 2023 20:51:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 9 Dec 2022 19:02:38 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: c29929c123a2e84e358a08916168d8010fbb3e9d
X-Git-Newrev: 583e06a495e401c564adfd0c13c4ebad33e34e63
X-Patchwork-Hint: ignore
Message-Id: <20230220205159.BD207828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/proftpd: bump to
 version 1.3.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=583e06a495e401c564adfd0c13c4ebad33e34e63
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Drop patch (already in version)

http://proftpd.org/docs/NEWS-1.3.8
http://proftpd.org/docs/RELEASE_NOTES-1.3.8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...quotatab-fix-build-failure-against-gcc-10.patch | 56 ----------------------
 package/proftpd/proftpd.hash                       |  2 +-
 package/proftpd/proftpd.mk                         |  4 +-
 3 files changed, 3 insertions(+), 59 deletions(-)

diff --git a/package/proftpd/0001-mod_quotatab-fix-build-failure-against-gcc-10.patch b/package/proftpd/0001-mod_quotatab-fix-build-failure-against-gcc-10.patch
deleted file mode 100644
index 5f4eb66c71..0000000000
--- a/package/proftpd/0001-mod_quotatab-fix-build-failure-against-gcc-10.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-From 9c9623c8a47fb5580dfea1a59296c6d224479504 Mon Sep 17 00:00:00 2001
-From: Sergei Trofimovich <slyfox@gentoo.org>
-Date: Mon, 2 Mar 2020 23:45:22 +0000
-Subject: [PATCH] mod_quotatab: fix build failure against gcc-10
-
-On gcc-10 (and gcc-9 -fno-common) build fails as:
-
-```
-$ ./configure --with-modules=mod_quotatab && make
-...
-ld: modules/module_glue.o:(.data.rel+0x68):
-  undefined reference to `quotatab_file_module'
-collect2: error: ld returned 1 exit status
-make: *** [Makefile:56: proftpd] Error 1
-```
-
-gcc-10 will change the default from -fcommon to fno-common:
-https://gcc.gnu.org/PR85678.
-
-The error also happens if CFLAGS=-fno-common passed explicitly.
-
-Signed-off-by: Sergei Trofimovich <slyfox@gentoo.org>
-
-[Retrieved from:
-https://github.com/proftpd/proftpd/commit/9c9623c8a47fb5580dfea1a59296c6d224479504]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- contrib/mod_quotatab.c | 1 +
- contrib/mod_quotatab.h | 2 +-
- 2 files changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/contrib/mod_quotatab.c b/contrib/mod_quotatab.c
-index 4fa6c1f44..0ee480163 100644
---- a/contrib/mod_quotatab.c
-+++ b/contrib/mod_quotatab.c
-@@ -50,6 +50,7 @@ typedef struct regtab_obj {
- module quotatab_module;
- 
- /* Quota objects for the current session */
-+quota_deltas_t quotatab_deltas;
- static quota_table_t *limit_tab = NULL;
- static quota_limit_t sess_limit;
- 
-diff --git a/contrib/mod_quotatab.h b/contrib/mod_quotatab.h
-index ed30333f5..c818395a0 100644
---- a/contrib/mod_quotatab.h
-+++ b/contrib/mod_quotatab.h
-@@ -188,7 +188,7 @@ typedef struct table_obj {
- #define QUOTATAB_TALLY_SRC      0x0002
- 
- /* Quota objects for the current session. */
--quota_deltas_t quotatab_deltas;
-+extern quota_deltas_t quotatab_deltas;
- 
- /* Function prototypes necessary for quotatab sub-modules */
- int quotatab_log(const char *, ...)
diff --git a/package/proftpd/proftpd.hash b/package/proftpd/proftpd.hash
index 983500bb8e..f950f26b86 100644
--- a/package/proftpd/proftpd.hash
+++ b/package/proftpd/proftpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  2dbe684034ab592742ebdb778a8a234b70f959efeb30feedee3ea77f26f74fbb  proftpd-1.3.6e.tar.gz
+sha256  f7139e7377a2cb059b8b9b14d76a6df5f440e3181cb15ae890d43bbcae574748  proftpd-1.3.8.tar.gz
 sha256  391a473d755c29b5326fb726326ff3c37e42512f53a8f5789fc310232150bf80  COPYING
diff --git a/package/proftpd/proftpd.mk b/package/proftpd/proftpd.mk
index 64c16a84eb..8e7d108c9e 100644
--- a/package/proftpd/proftpd.mk
+++ b/package/proftpd/proftpd.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PROFTPD_VERSION = 1.3.6e
-PROFTPD_SITE = $(call github,proftpd,proftpd,v$(PROFTPD_VERSION))
+PROFTPD_VERSION = 1.3.8
+PROFTPD_SITE = ftp://ftp.proftpd.org/distrib/source
 PROFTPD_LICENSE = GPL-2.0+
 PROFTPD_LICENSE_FILES = COPYING
 PROFTPD_CPE_ID_VENDOR = proftpd
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
