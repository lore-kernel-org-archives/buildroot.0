Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01262C6FA83
	for <buildroot@archiver.kernel.org>; Sun, 11 Sep 2022 08:55:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9DAA26104C;
	Sun, 11 Sep 2022 08:55:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9DAA26104C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mBadsHjwFek8; Sun, 11 Sep 2022 08:55:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C06406103B;
	Sun, 11 Sep 2022 08:55:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C06406103B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9DA201BF9A4
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 08:48:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 829966107E
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 08:48:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 829966107E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4VdvupB1N_s6 for <buildroot@lists.busybox.net>;
 Sun, 11 Sep 2022 08:48:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4484461034
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 08:48:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4484461034
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 42A5883518; Sun, 11 Sep 2022 08:48:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Aug 2022 14:12:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 22b3b3a77720d9527b8279d033d9fbca65b2bcba
X-Git-Newrev: 11e11b8fda94dd12d4b8cb6565808e91c4743fed
X-Patchwork-Hint: ignore
Message-Id: <20220911084824.42A5883518@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/crda: bump to version 4.15
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

commit: https://git.buildroot.net/buildroot/commit/?id=11e11b8fda94dd12d4b8cb6565808e91c4743fed
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/crda/0002-drop-ldconfig-call.patch | 4 +++-
 package/crda/crda.hash                     | 2 +-
 package/crda/crda.mk                       | 2 +-
 3 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/crda/0002-drop-ldconfig-call.patch b/package/crda/0002-drop-ldconfig-call.patch
index f09e258adb..567840c07e 100644
--- a/package/crda/0002-drop-ldconfig-call.patch
+++ b/package/crda/0002-drop-ldconfig-call.patch
@@ -1,6 +1,8 @@
 Drop ldconfig call, it's useless for cross-compiling.
 
 Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+[Fabrice: update for 4.15]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 
 diff -Nura crda-3.18.orig/Makefile crda-3.18/Makefile
 --- crda-3.18.orig/Makefile	2015-02-18 10:34:23.841259401 -0300
@@ -8,7 +10,7 @@ diff -Nura crda-3.18.orig/Makefile crda-3.18/Makefile
 @@ -127,7 +127,6 @@
  	$(NQ) '  INSTALL  libreg'
  	$(Q)mkdir -p $(DESTDIR)/$(LIBDIR)
- 	$(Q)cp $(LIBREG) $(DESTDIR)/$(LIBDIR)/
+	$(Q)$(INSTALL) -m 644 $(LIBREG) $(DESTDIR)/$(LIBDIR)/
 -	$(Q)ldconfig
  
  %.o: %.c regdb.h $(LIBREG)
diff --git a/package/crda/crda.hash b/package/crda/crda.hash
index 2a263d172a..3b0610994e 100644
--- a/package/crda/crda.hash
+++ b/package/crda/crda.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  5a8f35bb8b27474f466b0e75d451ba917433d8aab1889678a64d9c4e72a8b8c2  crda-4.14.tar.gz
+sha256  99eb58f774f6016c380def0d80fffd573d2be0ad5f117b678c1968ed5657af82  crda-4.15.tar.gz
 sha256  c16224b376128b589eea69a8fdd1f09818b8cb995e10d1e37f72dff22233d7b0  LICENSE
diff --git a/package/crda/crda.mk b/package/crda/crda.mk
index 31a64d004b..a73c9aa26d 100644
--- a/package/crda/crda.mk
+++ b/package/crda/crda.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CRDA_VERSION = 4.14
+CRDA_VERSION = 4.15
 CRDA_SITE = https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/crda.git/snapshot
 CRDA_DEPENDENCIES = host-pkgconf host-python-pycryptodomex libnl libgcrypt
 CRDA_LICENSE = ISC
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
