Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E31A3C433EF
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 20:17:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 68B75405C1;
	Thu, 30 Dec 2021 20:17:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i-1TtuKHAo0w; Thu, 30 Dec 2021 20:17:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5F432405C2;
	Thu, 30 Dec 2021 20:17:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E6E131BF361
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 20:17:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DA481405C1
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 20:17:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0lbfU2l-I6ST for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 20:17:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A8D89402D0
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 20:17:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 25C3182DDE; Thu, 30 Dec 2021 20:11:08 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 30 Dec 2021 21:15:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: eae438fccf32722c6d38b859fdd76739b35e2cb2
X-Git-Newrev: 4f467ead8981f8ea9b5cebede4ae2db2aab2e7c8
X-Patchwork-Hint: ignore
Message-Id: <20211230201108.25C3182DDE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/owfs: bump to version 3.2p4
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

commit: https://git.buildroot.net/buildroot/commit/?id=4f467ead8981f8ea9b5cebede4ae2db2aab2e7c8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Drop patch (already in version)
- Update indentation in hash file (two spaces)

https://github.com/owfs/owfs/releases/tag/v3.2p4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/owfs/0001-Fix-compilation-with-GCC10.patch | 41 ----------------------
 package/owfs/owfs.hash                             |  6 ++--
 package/owfs/owfs.mk                               |  2 +-
 3 files changed, 4 insertions(+), 45 deletions(-)

diff --git a/package/owfs/0001-Fix-compilation-with-GCC10.patch b/package/owfs/0001-Fix-compilation-with-GCC10.patch
deleted file mode 100644
index 49b703ee28..0000000000
--- a/package/owfs/0001-Fix-compilation-with-GCC10.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 43a4bc6b750c37f585d03b14941f3633ed5348d8 Mon Sep 17 00:00:00 2001
-From: "Azamat H. Hackimov" <azamat.hackimov@gmail.com>
-Date: Tue, 9 Jun 2020 11:30:38 +0300
-Subject: [PATCH] Fix compilation with GCC10
-
-Fixed compilation with -fno-common, which enabled in GCC 10 by default.
-See https://bugs.gentoo.org/707438.
-[Retrieved from:
-https://github.com/owfs/owfs/commit/43a4bc6b750c37f585d03b14941f3633ed5348d8]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- module/owserver/src/c/owserver.c       | 2 ++
- module/owserver/src/include/owserver.h | 2 +-
- 2 files changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/module/owserver/src/c/owserver.c b/module/owserver/src/c/owserver.c
-index db29988e..2ed29161 100644
---- a/module/owserver/src/c/owserver.c
-+++ b/module/owserver/src/c/owserver.c
-@@ -36,6 +36,8 @@
- 
- #include "owserver.h"
- 
-+pthread_mutex_t persistence_mutex ;
-+
- /* --- Prototypes ------------ */
- static void SetupAntiloop(int argc, char **argv);
- 
-diff --git a/module/owserver/src/include/owserver.h b/module/owserver/src/include/owserver.h
-index 8be582f0..a257ed02 100644
---- a/module/owserver/src/include/owserver.h
-+++ b/module/owserver/src/include/owserver.h
-@@ -18,7 +18,7 @@
- #include "ow.h"
- #include "ow_connection.h"
- 
--pthread_mutex_t persistence_mutex ;
-+extern pthread_mutex_t persistence_mutex ;
- #define PERSISTENCELOCK    _MUTEX_LOCK(   persistence_mutex ) ;
- #define PERSISTENCEUNLOCK  _MUTEX_UNLOCK( persistence_mutex ) ;
- 
diff --git a/package/owfs/owfs.hash b/package/owfs/owfs.hash
index 4c6b15a4e1..e2c51077ac 100644
--- a/package/owfs/owfs.hash
+++ b/package/owfs/owfs.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256 b8d33eba57d4a2f6c8a11ff23f233e3248bd75a42c8219b058a888846edd8717  owfs-3.2p3.tar.gz
-sha256 1f0527ab035eefb5197c68633d06f50f5077c719d82a99344702ceaca29150b9  COPYING
-sha256 8a6601b893d5784d931b2ede64a406fac463acfbb7014914e27de4d6e68457c3  COPYING.LIB
+sha256  af0a5035f3f3df876ca15aea13486bfed6b3ef5409dee016db0be67755c35fcc  owfs-3.2p4.tar.gz
+sha256  1f0527ab035eefb5197c68633d06f50f5077c719d82a99344702ceaca29150b9  COPYING
+sha256  8a6601b893d5784d931b2ede64a406fac463acfbb7014914e27de4d6e68457c3  COPYING.LIB
diff --git a/package/owfs/owfs.mk b/package/owfs/owfs.mk
index 10543d3698..7c69a5251b 100644
--- a/package/owfs/owfs.mk
+++ b/package/owfs/owfs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OWFS_VERSION = 3.2p3
+OWFS_VERSION = 3.2p4
 OWFS_SITE = https://github.com/owfs/owfs/releases/download/v$(OWFS_VERSION)
 OWFS_DEPENDENCIES = host-pkgconf
 OWFS_CONF_OPTS = --disable-owperl --without-perl5 --disable-owtcl --without-tcl
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
