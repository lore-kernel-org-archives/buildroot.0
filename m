Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BEA8C00140
	for <buildroot@archiver.kernel.org>; Mon,  8 Aug 2022 21:08:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C33D540986;
	Mon,  8 Aug 2022 21:08:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C33D540986
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VHOZ3ZTWFe2n; Mon,  8 Aug 2022 21:08:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 57F9F4054E;
	Mon,  8 Aug 2022 21:08:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57F9F4054E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 66E6C1BF3BF
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 21:07:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4007E4054E
 for <buildroot@lists.busybox.net>; Mon,  8 Aug 2022 21:07:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4007E4054E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sgfeqRS3_mJF for <buildroot@lists.busybox.net>;
 Mon,  8 Aug 2022 21:07:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F268B40510
 for <buildroot@buildroot.org>; Mon,  8 Aug 2022 21:07:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F268B40510
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id AC82D8688B; Mon,  8 Aug 2022 20:53:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 8 Aug 2022 23:07:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f2eb56459ed3d8f5fdb026a31fe85e8df7d3b42d
X-Git-Newrev: da40cddfbf6b89cbc16f0ee7ac4e0c57400a0d02
X-Patchwork-Hint: ignore
Message-Id: <20220808205319.AC82D8688B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mcelog: bump to version 187
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

commit: https://git.buildroot.net/buildroot/commit/?id=da40cddfbf6b89cbc16f0ee7ac4e0c57400a0d02
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop the patch now that it has been upstreamed.

Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0001-Makefile-add-install-nodoc-target.patch   | 65 ----------------------
 package/mcelog/mcelog.hash                         |  2 +-
 package/mcelog/mcelog.mk                           |  2 +-
 3 files changed, 2 insertions(+), 67 deletions(-)

diff --git a/package/mcelog/0001-Makefile-add-install-nodoc-target.patch b/package/mcelog/0001-Makefile-add-install-nodoc-target.patch
deleted file mode 100644
index a36a54c73c..0000000000
--- a/package/mcelog/0001-Makefile-add-install-nodoc-target.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-From c224ad8bafe859d640dfaf67d396c38c73880409 Mon Sep 17 00:00:00 2001
-From: Vincent Fazio <vfazio@xes-inc.com>
-Date: Wed, 27 Jul 2022 07:18:37 -0500
-Subject: [PATCH] Makefile: add install-nodoc target
-
-This target is useful for "essentials only" installs for embedded
-environments with the added benefit of not requiring a python
-interpreter for installing the package.
-
-Suggested-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
-Signed-off-by: Vincent Fazio <vfazio@xes-inc.com>
----
- Makefile | 19 +++++++++++--------
- 1 file changed, 11 insertions(+), 8 deletions(-)
-
-diff --git a/Makefile b/Makefile
-index 339b8dd..50a322b 100644
---- a/Makefile
-+++ b/Makefile
-@@ -28,7 +28,7 @@ TRIGGERS=cache-error-trigger dimm-error-trigger page-error-trigger \
- 
- all: mcelog
- 
--.PHONY: install clean depend FORCE
-+.PHONY: install install-nodoc clean depend FORCE
- 
- OBJ := p4.o k8.o mcelog.o dmi.o tsc.o core2.o bitfield.o intel.o \
-        nehalem.o dunnington.o tulsa.o config.o memutil.o msg.o   \
-@@ -50,16 +50,11 @@ SRC := $(OBJ:.o=.c)
- mcelog: ${OBJ} version.o
- 
- # dbquery intentionally not installed by default
--install: mcelog mcelog.conf mcelog.conf.5 mcelog.triggers.5
--	mkdir -p $(DESTDIR)${etcprefix}/etc/mcelog $(DESTDIR)${prefix}/sbin $(DESTDIR)$(MANDIR)/man5 $(DESTDIR)$(MANDIR)/man8
--	install -m 755 -p mcelog $(DESTDIR)${prefix}/sbin/mcelog
-+install: install-nodoc mcelog.conf.5 mcelog.triggers.5
-+	mkdir -p $(DESTDIR)$(MANDIR)/man5 $(DESTDIR)$(MANDIR)/man8
- 	install -m 644 -p mcelog.8 $(DESTDIR)$(MANDIR)/man8
- 	install -m 644 -p mcelog.conf.5 $(DESTDIR)$(MANDIR)/man5
- 	install -m 644 -p mcelog.triggers.5 $(DESTDIR)$(MANDIR)/man5
--	install -m 644 -p -b mcelog.conf $(DESTDIR)${etcprefix}/etc/mcelog/mcelog.conf
--	for i in ${TRIGGERS} ; do 						\
--		install -m 755 -p -b triggers/$$i $(DESTDIR)${etcprefix}/etc/mcelog ; 	\
--	done
- ifdef DOCDIR
- 	install -d 755 $(DESTDIR)${DOCDIR}
- 	install -m 644 -p ${DOC} $(DESTDIR)${DOCDIR}
-@@ -68,6 +63,14 @@ else
- 	echo "Consider defining DOCDIR to install additional documentation"
- endif
- 
-+install-nodoc: mcelog mcelog.conf
-+	mkdir -p $(DESTDIR)${etcprefix}/etc/mcelog $(DESTDIR)${prefix}/sbin
-+	install -m 755 -p mcelog $(DESTDIR)${prefix}/sbin/mcelog
-+	install -m 644 -p -b mcelog.conf $(DESTDIR)${etcprefix}/etc/mcelog/mcelog.conf
-+	for i in ${TRIGGERS} ; do 						\
-+		install -m 755 -p -b triggers/$$i $(DESTDIR)${etcprefix}/etc/mcelog ; 	\
-+	done
-+
- mcelog.conf.5: mcelog.conf config-intro.man
- 	./genconfig.py mcelog.conf config-intro.man > mcelog.conf.5
- 
--- 
-2.25.1
-
diff --git a/package/mcelog/mcelog.hash b/package/mcelog/mcelog.hash
index 94b5f2cc37..c64e652453 100644
--- a/package/mcelog/mcelog.hash
+++ b/package/mcelog/mcelog.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  067d52006f0aa42045acc6d9c04d590362448bacd8ef415d42729e6f35825028  mcelog-184.tar.gz
+sha256  02eb3f4cb0976048f191d124fb45a1720caf082cd246d858acb0a39a9d026641  mcelog-187.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/mcelog/mcelog.mk b/package/mcelog/mcelog.mk
index 24aeb5b519..de1b76cfd3 100644
--- a/package/mcelog/mcelog.mk
+++ b/package/mcelog/mcelog.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MCELOG_VERSION = 184
+MCELOG_VERSION = 187
 MCELOG_SITE = $(call github,andikleen,mcelog,v$(MCELOG_VERSION))
 MCELOG_LICENSE = GPL-2.0
 MCELOG_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
