Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4490C4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 21:45:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 61CD5431C9;
	Wed,  1 Nov 2023 21:45:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 61CD5431C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cmixlQ5scrH2; Wed,  1 Nov 2023 21:45:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DA34A43295;
	Wed,  1 Nov 2023 21:45:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DA34A43295
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AFFF11BF966
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 21:44:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9858384D86
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 21:44:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9858384D86
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GhHYuHOCkyLR for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 21:44:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6C67084D87
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 21:44:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C67084D87
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5A1CE864C1; Wed,  1 Nov 2023 21:44:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 1 Nov 2023 22:43:27 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 810a7bba04fde47c20ce26bbe7a4189bcf2d1135
X-Git-Newrev: 9c7e0f011906646e45a23139c3006b4d767e19fa
X-Patchwork-Hint: ignore
Message-Id: <20231101214427.5A1CE864C1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sslh: bump to version 2.0.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=9c7e0f011906646e45a23139c3006b4d767e19fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libev is an optional dependency since version 2.0 and
https://github.com/yrutschle/sslh/commit/711c11c820f8be4f1399024bcaa1d7072de33217

https://github.com/yrutschle/sslh/blob/v2.0.1/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sslh/0001-Makefile-add-USE_LIBEV.patch | 59 ++++++++++++++++++++++++++
 package/sslh/sslh.hash                         |  2 +-
 package/sslh/sslh.mk                           |  9 +++-
 3 files changed, 68 insertions(+), 2 deletions(-)

diff --git a/package/sslh/0001-Makefile-add-USE_LIBEV.patch b/package/sslh/0001-Makefile-add-USE_LIBEV.patch
new file mode 100644
index 0000000000..858d30fa15
--- /dev/null
+++ b/package/sslh/0001-Makefile-add-USE_LIBEV.patch
@@ -0,0 +1,59 @@
+From 3e93c1d43de8a662e402127462f28ef0bebf8997 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 1 Oct 2023 18:45:53 +0200
+Subject: [PATCH] Makefile: add USE_LIBEV
+
+Add USE_LIBEV to avoid the following build failure without libev raised
+since version 2.0 and
+https://github.com/yrutschle/sslh/commit/711c11c820f8be4f1399024bcaa1d7072de33217:
+
+sslh-ev.c:24:10: fatal error: ev.h: Aucun fichier ou dossier de ce type
+   24 | #include <ev.h>
+      |          ^~~~~~
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/yrutschle/sslh/commit/3e93c1d43de8a662e402127462f28ef0bebf8997
+---
+ Makefile | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/Makefile b/Makefile
+index a4425c3..aa2689e 100644
+--- a/Makefile
++++ b/Makefile
+@@ -6,6 +6,7 @@ VERSION=$(shell ./genver.sh -r)
+ ENABLE_SANITIZER= # Enable ASAN/LSAN/UBSAN
+ ENABLE_REGEX=1  # Enable regex probes
+ USELIBCONFIG=1	# Use libconfig? (necessary to use configuration files)
++USELIBEV=1	# Use libev?
+ USELIBWRAP?=	# Use libwrap?
+ USELIBCAP=	# Use libcap?
+ USESYSTEMD=     # Make use of systemd socket activation
+@@ -72,6 +73,9 @@ ifneq ($(strip $(USELIBBSD)),)
+         CPPFLAGS+=-DLIBBSD
+ endif
+ 
++ifneq ($(strip $(USELIBEV)),)
++        CONDITIONAL_TARGETS+=sslh-ev
++endif
+ 
+ all: sslh $(MAN) echosrv $(CONDITIONAL_TARGETS)
+ 
+@@ -84,7 +88,7 @@ $(OBJS_A): $(OBJS)
+ version.h:
+ 	./genver.sh >version.h
+ 
+-sslh: sslh-fork sslh-select sslh-ev
++sslh: sslh-fork sslh-select
+ 
+ $(OBJS) $(FORK_OBJS) $(SELECT_OBJS) $(EV_OBJS): argtable3.h collection.h common.h gap.h hash.h log.h probe.h processes.h sslh-conf.h tcp-listener.h tcp-probe.h tls.h udp-listener.h version.h
+ 
+@@ -153,7 +157,7 @@ distclean: clean
+ 	rm -f tags sslh-conf.[ch] echosrv-conf.[ch] cscope.*
+ 
+ clean:
+-	rm -f sslh-fork sslh-select sslh-ev echosrv version.h $(MAN) systemd-sslh-generator *.o *.gcov *.gcno *.gcda *.png *.html *.css *.info
++	rm -f sslh-fork sslh-select $(CONDITIONAL_TARGETS) echosrv version.h $(MAN) systemd-sslh-generator *.o *.gcov *.gcno *.gcda *.png *.html *.css *.info
+ 
+ tags:
+ 	ctags --globals -T *.[ch]
diff --git a/package/sslh/sslh.hash b/package/sslh/sslh.hash
index ae678563da..839e7b7f1c 100644
--- a/package/sslh/sslh.hash
+++ b/package/sslh/sslh.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  8e3742d14edf4119350cfdc7bb96b89134d9218eb6d2a6e1f70891ca18a649b1  sslh-v1.22c.tar.gz
+sha256  d88d43ee11cf1324983c196c894b41766c33d957b6af53b62c8479703bbbd26c  sslh-v2.0.1.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/sslh/sslh.mk b/package/sslh/sslh.mk
index 6ef7cda1a9..5dad6aafc2 100644
--- a/package/sslh/sslh.mk
+++ b/package/sslh/sslh.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SSLH_VERSION = 1.22c
+SSLH_VERSION = 2.0.1
 SSLH_SOURCE = sslh-v$(SSLH_VERSION).tar.gz
 SSLH_SITE = http://www.rutschle.net/tech/sslh
 SSLH_LICENSE = GPL-2.0+
@@ -35,6 +35,13 @@ else
 SSLH_MAKE_OPTS += USELIBCONFIG=
 endif
 
+ifeq ($(BR2_PACKAGE_LIBEV),y)
+SSLH_DEPENDENCIES += libev
+SSLH_MAKE_OPTS += USELIBEV=1
+else
+SSLH_MAKE_OPTS += USELIBEV=
+endif
+
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
 SSLH_DEPENDENCIES += systemd
 SSLH_MAKE_OPTS += USESYSTEMD=1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
