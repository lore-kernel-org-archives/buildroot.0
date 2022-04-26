Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D60D3C433F5
	for <buildroot@archiver.kernel.org>; Tue, 26 Apr 2022 21:54:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95BF94195B;
	Tue, 26 Apr 2022 21:54:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nyPLVjUYry1Z; Tue, 26 Apr 2022 21:54:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4AB284193B;
	Tue, 26 Apr 2022 21:54:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 725D71BF3A6
 for <buildroot@lists.busybox.net>; Tue, 26 Apr 2022 21:54:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6039A60FEC
 for <buildroot@lists.busybox.net>; Tue, 26 Apr 2022 21:54:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9Wc7bnfarilq for <buildroot@lists.busybox.net>;
 Tue, 26 Apr 2022 21:54:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9598B606F9
 for <buildroot@buildroot.org>; Tue, 26 Apr 2022 21:54:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id EA0E9844FE; Tue, 26 Apr 2022 21:43:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 26 Apr 2022 23:53:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2e49ff10202e28a8dc942bfe11d7a623aca0bf6c
X-Git-Newrev: b3f42bf1005e3395f03ac4db0a0583306c9467b0
X-Patchwork-Hint: ignore
Message-Id: <20220426214347.EA0E9844FE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/htpdate: bump to version 1.3.4
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b3f42bf1005e3395f03ac4db0a0583306c9467b0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removing also the upstreamed patch.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...SL_LIBS-to-be-configured-from-environment.patch | 37 ----------------------
 package/htpdate/htpdate.hash                       |  2 +-
 package/htpdate/htpdate.mk                         |  2 +-
 3 files changed, 2 insertions(+), 39 deletions(-)

diff --git a/package/htpdate/0001-Allow-SSL_LIBS-to-be-configured-from-environment.patch b/package/htpdate/0001-Allow-SSL_LIBS-to-be-configured-from-environment.patch
deleted file mode 100644
index 6dca2babab..0000000000
--- a/package/htpdate/0001-Allow-SSL_LIBS-to-be-configured-from-environment.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 4ba90fedd553c3b06c925fb6ff5245a5dcabace9 Mon Sep 17 00:00:00 2001
-From: Eddy Vervest <eddy@vervest.org>
-Date: Sat, 29 Jan 2022 10:58:13 +0100
-Subject: [PATCH] Allow SSL_LIBS to be configured from environment
-
-[Retrieved from:
-https://github.com/twekkel/htpdate/commit/4ba90fedd553c3b06c925fb6ff5245a5dcabace9]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- Makefile | 7 ++++---
- 1 file changed, 4 insertions(+), 3 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index 4796efa..cf077e6 100644
---- a/Makefile
-+++ b/Makefile
-@@ -2,8 +2,9 @@ prefix = $(DESTDIR)/usr
- bindir = ${prefix}/sbin
- mandir = ${prefix}/share/man
- 
--CC     ?= gcc
--CFLAGS += -Wall -std=c11 -pedantic -O2
-+CC       ?= gcc
-+CFLAGS   += -Wall -std=c11 -pedantic -O2
-+SSL_LIBS ?= -lssl
- 
- INSTALL ?= install -c
- STRIP   ?= strip -s
-@@ -14,7 +15,7 @@ htpdate: htpdate.c
- 	$(CC) $(CFLAGS) -o htpdate htpdate.c
- 
- https: htpdate.c
--	$(CC) $(CFLAGS) -DENABLE_HTTPS -o htpdate htpdate.c -lssl
-+	$(CC) $(CFLAGS) -DENABLE_HTTPS -o htpdate htpdate.c $(SSL_LIBS)
- 
- install: all
- 	$(STRIP) htpdate
diff --git a/package/htpdate/htpdate.hash b/package/htpdate/htpdate.hash
index b56522ea99..11e743c569 100644
--- a/package/htpdate/htpdate.hash
+++ b/package/htpdate/htpdate.hash
@@ -1,3 +1,3 @@
 # Locally calculated:
-sha256  74f34b013eba6f99369819fa4b3d48e9ab5e531ad04f6af59cc04e8777c76ed7  htpdate-1.3.3.tar.gz
+sha256  744f9200cfd3b008a5516c5eb6da727af532255a329126a7b8f49a5623985642  htpdate-1.3.4.tar.gz
 sha256  7989949df09a0489434723c571541604cd3f2e0418c6a6aa9179bfaf8ec807cc  LICENSE
diff --git a/package/htpdate/htpdate.mk b/package/htpdate/htpdate.mk
index e32480fc85..35ae25929c 100644
--- a/package/htpdate/htpdate.mk
+++ b/package/htpdate/htpdate.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HTPDATE_VERSION = 1.3.3
+HTPDATE_VERSION = 1.3.4
 HTPDATE_SITE = $(call github,twekkel,htpdate,v$(HTPDATE_VERSION))
 HTPDATE_LICENSE = GPL-2.0+
 HTPDATE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
