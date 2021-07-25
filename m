Return-Path: <SRS0=8L+i=MR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD069C4338F
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 13:10:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C74C60E78
	for <buildroot@archiver.kernel.org>; Sun, 25 Jul 2021 13:10:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9C74C60E78
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A0784040D;
	Sun, 25 Jul 2021 13:10:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DawI8JtoYZO8; Sun, 25 Jul 2021 13:10:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AFB6340192;
	Sun, 25 Jul 2021 13:10:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A2F8E1BF3C1
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 13:09:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8B877403CB
 for <buildroot@lists.busybox.net>; Sun, 25 Jul 2021 13:09:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tIQzn3_dbPr2 for <buildroot@lists.busybox.net>;
 Sun, 25 Jul 2021 13:09:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8B5BE40374
 for <buildroot@buildroot.org>; Sun, 25 Jul 2021 13:09:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 5D1B988DCE; Sun, 25 Jul 2021 12:34:31 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 25 Jul 2021 15:03:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c77d8494a115bf4d72b7bbb87e236be62aa6f909
X-Git-Newrev: 214fe531068f15fb98d24097b12d2cbf18ab5c5a
X-Patchwork-Hint: ignore
Message-Id: <20210725123431.5D1B988DCE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/at: bump version to 3.2.2
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=214fe531068f15fb98d24097b12d2cbf18ab5c5a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Let's bump at to version 3.2.2 by:
- moving SITE to http://software.calhariz.com/at that is the official at
 realease site while the actual(https://salsa.debian.org/debian/at)
 doesn't provide consitent tarballs.
- rebasing 2 local patches(some some of them has not been accepted upstream
 because of removing -g root -o root while installing, while other simply
 has not been taken into account for 1 year.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../at/0001-Makefile.in-replace-IROOT-by-DESTDIR.patch | 18 +++++++++++-------
 ...e.in-fix-make-install-for-non-root-don-t-stri.patch | 16 ++++++++++------
 package/at/at.hash                                     |  2 +-
 package/at/at.mk                                       |  6 +++---
 4 files changed, 25 insertions(+), 17 deletions(-)

diff --git a/package/at/0001-Makefile.in-replace-IROOT-by-DESTDIR.patch b/package/at/0001-Makefile.in-replace-IROOT-by-DESTDIR.patch
index f595bce9cf..a9538589c1 100644
--- a/package/at/0001-Makefile.in-replace-IROOT-by-DESTDIR.patch
+++ b/package/at/0001-Makefile.in-replace-IROOT-by-DESTDIR.patch
@@ -1,4 +1,4 @@
-From d2bdcff4748f4c1961118b9467bab302b403ef9f Mon Sep 17 00:00:00 2001
+From cbfd3296d7d0742d9e35b01ec9e433afe2c36c63 Mon Sep 17 00:00:00 2001
 From: Marc Kleine-Budde <mkl@pengutronix.de>
 Date: Tue, 1 Dec 2009 20:57:45 +0100
 Subject: [PATCH] Makefile.in: replace IROOT by DESTDIR
@@ -10,16 +10,16 @@ Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
 Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 [Vincent: tweak the patch for the new version]
 Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
-[Giulio: convert patch to git format]
+[Giulio: convert patch to git format and rebase to version 3.2.2]
 ---
- Makefile.in | 68 ++++++++++++++++++++++++++++-------------------------
- 1 file changed, 36 insertions(+), 32 deletions(-)
+ Makefile.in | 72 ++++++++++++++++++++++++++++-------------------------
+ 1 file changed, 38 insertions(+), 34 deletions(-)
 
 diff --git a/Makefile.in b/Makefile.in
-index 4c11913..61e7b1d 100644
+index 3e8303c..a7197f2 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -18,6 +18,10 @@ etcdir		= @ETCDIR@
+@@ -20,6 +20,10 @@ etcdir		= @ETCDIR@
  atjobdir	= @ATJBD@
  systemdsystemunitdir = @systemdsystemunitdir@
  
@@ -30,13 +30,14 @@ index 4c11913..61e7b1d 100644
  DAEMON_USERNAME	= @DAEMON_USERNAME@
  DAEMON_GROUPNAME= @DAEMON_GROUPNAME@
  LOADAVG_MX	= @LOADAVG_MX@
-@@ -93,41 +97,41 @@ atrun: atrun.in
+@@ -95,43 +99,43 @@ atrun: atrun.in
  	$(CC) -c $(CFLAGS) $(DEFS) $*.c
  
  install: all
 -	$(INSTALL) -g root -o root -m 755 -d $(IROOT)$(etcdir)
 -	$(INSTALL) -g root -o root -m 755 -d $(IROOT)$(bindir)
 -	$(INSTALL) -g root -o root -m 755 -d $(IROOT)$(sbindir)
+-	$(INSTALL) -g root -o root -m 755 -d $(IROOT)$(atdatadir)
 -	$(INSTALL) -g root -o root -m 755 -d $(IROOT)$(docdir)
 -	$(INSTALL) -g root -o root -m 755 -d $(IROOT)$(atdocdir)
 -	$(INSTALL) -g $(DAEMON_GROUPNAME) -o $(DAEMON_USERNAME) -m 755 -d $(IROOT)$(ATSPOOL_DIR) $(IROOT)$(ATJOB_DIR)
@@ -49,6 +50,7 @@ index 4c11913..61e7b1d 100644
 -	$(LN_S) -f at $(IROOT)$(bindir)/atq
 -	$(LN_S) -f at $(IROOT)$(bindir)/atrm
 -	$(INSTALL) -g root -o root -m 755 batch $(IROOT)$(bindir)
+-	$(INSTALL) -g root -o root -m 755 batch-job $(IROOT)$(atdatadir)
 -	$(INSTALL) -d -o root -g root -m 755 $(IROOT)$(man1dir)
 -	$(INSTALL) -d -o root -g root -m 755 $(IROOT)$(man5dir)
 -	$(INSTALL) -d -o root -g root -m 755 $(IROOT)$(man8dir)
@@ -60,6 +62,7 @@ index 4c11913..61e7b1d 100644
 +	$(INSTALL) -g root -o root -m 755 -d $(DESTDIR)$(etcdir)
 +	$(INSTALL) -g root -o root -m 755 -d $(DESTDIR)$(bindir)
 +	$(INSTALL) -g root -o root -m 755 -d $(DESTDIR)$(sbindir)
++	$(INSTALL) -g root -o root -m 755 -d $(DESTDIR)$(atdatadir)
 +	$(INSTALL) -g root -o root -m 755 -d $(DESTDIR)$(docdir)
 +	$(INSTALL) -g root -o root -m 755 -d $(DESTDIR)$(atdocdir)
 +	$(INSTALL) -g $(DAEMON_GROUPNAME) -o $(DAEMON_USERNAME) -m 755 -d $(DESTDIR)$(ATSPOOL_DIR) $(DESTDIR)$(ATJOB_DIR)
@@ -72,6 +75,7 @@ index 4c11913..61e7b1d 100644
 +	$(LN_S) -f at $(DESTDIR)$(bindir)/atq
 +	$(LN_S) -f at $(DESTDIR)$(bindir)/atrm
 +	$(INSTALL) -g root -o root -m 755 batch $(DESTDIR)$(bindir)
++	$(INSTALL) -g root -o root -m 755 batch-job $(DESTDIR)$(atdatadir)
 +	$(INSTALL) -d -o root -g root -m 755 $(DESTDIR)$(man1dir)
 +	$(INSTALL) -d -o root -g root -m 755 $(DESTDIR)$(man5dir)
 +	$(INSTALL) -d -o root -g root -m 755 $(DESTDIR)$(man8dir)
diff --git a/package/at/0002-Makefile.in-fix-make-install-for-non-root-don-t-stri.patch b/package/at/0002-Makefile.in-fix-make-install-for-non-root-don-t-stri.patch
index 866175ddb4..f6c07e9fe2 100644
--- a/package/at/0002-Makefile.in-fix-make-install-for-non-root-don-t-stri.patch
+++ b/package/at/0002-Makefile.in-fix-make-install-for-non-root-don-t-stri.patch
@@ -1,4 +1,4 @@
-From 2dd7c3c5b590a3115568175acc888f8e36919d71 Mon Sep 17 00:00:00 2001
+From 71d9a23ab6a73ec1287acc683716481090095de0 Mon Sep 17 00:00:00 2001
 From: Peter Korsgaard <jacmet@sunsite.dk>
 Date: Fri, 23 Jul 2021 16:47:56 +0200
 Subject: [PATCH] Makefile.in: fix make install for non-root, don't strip
@@ -10,28 +10,30 @@ Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
 Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 [Vincent: tweak the patch for the new version]
 Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
-[Giulio: convert patch to git format]
+[Giulio: convert patch to git format and rebase to version 3.2.2]
 ---
- Makefile.in | 43 +++++++++++++++++++++----------------------
- 1 file changed, 21 insertions(+), 22 deletions(-)
+ Makefile.in | 47 +++++++++++++++++++++++------------------------
+ 1 file changed, 23 insertions(+), 24 deletions(-)
 
 diff --git a/Makefile.in b/Makefile.in
-index 61e7b1d..9f89b1f 100644
+index a7197f2..0b35a67 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -97,41 +97,40 @@ atrun: atrun.in
+@@ -99,43 +99,42 @@ atrun: atrun.in
  	$(CC) -c $(CFLAGS) $(DEFS) $*.c
  
  install: all
 -	$(INSTALL) -g root -o root -m 755 -d $(DESTDIR)$(etcdir)
 -	$(INSTALL) -g root -o root -m 755 -d $(DESTDIR)$(bindir)
 -	$(INSTALL) -g root -o root -m 755 -d $(DESTDIR)$(sbindir)
+-	$(INSTALL) -g root -o root -m 755 -d $(DESTDIR)$(atdatadir)
 -	$(INSTALL) -g root -o root -m 755 -d $(DESTDIR)$(docdir)
 -	$(INSTALL) -g root -o root -m 755 -d $(DESTDIR)$(atdocdir)
 -	$(INSTALL) -g $(DAEMON_GROUPNAME) -o $(DAEMON_USERNAME) -m 755 -d $(DESTDIR)$(ATSPOOL_DIR) $(DESTDIR)$(ATJOB_DIR)
 +	$(INSTALL) -m 755 -d $(DESTDIR)$(etcdir)
 +	$(INSTALL) -m 755 -d $(DESTDIR)$(bindir)
 +	$(INSTALL) -m 755 -d $(DESTDIR)$(sbindir)
++	$(INSTALL) -m 755 -d $(DESTDIR)$(atdatadir)
 +	$(INSTALL) -m 755 -d $(DESTDIR)$(docdir)
 +	$(INSTALL) -m 755 -d $(DESTDIR)$(atdocdir)
 +	$(INSTALL) -m 755 -d $(DESTDIR)$(ATSPOOL_DIR) $(DESTDIR)$(ATJOB_DIR)
@@ -46,6 +48,7 @@ index 61e7b1d..9f89b1f 100644
  	$(LN_S) -f at $(DESTDIR)$(bindir)/atq
  	$(LN_S) -f at $(DESTDIR)$(bindir)/atrm
 -	$(INSTALL) -g root -o root -m 755 batch $(DESTDIR)$(bindir)
+-	$(INSTALL) -g root -o root -m 755 batch-job $(DESTDIR)$(atdatadir)
 -	$(INSTALL) -d -o root -g root -m 755 $(DESTDIR)$(man1dir)
 -	$(INSTALL) -d -o root -g root -m 755 $(DESTDIR)$(man5dir)
 -	$(INSTALL) -d -o root -g root -m 755 $(DESTDIR)$(man8dir)
@@ -53,6 +56,7 @@ index 61e7b1d..9f89b1f 100644
 -	$(INSTALL) -g root -o root -m 755 atrun $(DESTDIR)$(sbindir)
 -	$(INSTALL) -g root -o root -m 644 at.1 $(DESTDIR)$(man1dir)/
 +	$(INSTALL) -m 755 batch $(DESTDIR)$(bindir)
++	$(INSTALL) -m 755 batch-job $(DESTDIR)$(atdatadir)
 +	$(INSTALL) -d -m 755 $(DESTDIR)$(man1dir)
 +	$(INSTALL) -d -m 755 $(DESTDIR)$(man5dir)
 +	$(INSTALL) -d -m 755 $(DESTDIR)$(man8dir)
diff --git a/package/at/at.hash b/package/at/at.hash
index c5daf4ef86..88a9e8a91d 100644
--- a/package/at/at.hash
+++ b/package/at/at.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  62123a6fcf02b2606673afca80c2874358b83880c12db7f276a7c6cc70068cb2  at-upstream-3.2.1.tar.bz2
+sha256  2211da14914fde1f9cc83592838fb6385a32fb11fcecb7816c77700df6559088  at_3.2.2.orig.tar.gz
 
 sha256  01dccc0975aa9ba1a9f83e7c5e04f16077353d3c72a0a759b8846ee7a5b2b616  Copyright
 sha256  c38aee9e3c8c4d5d594ff548a1be05453023016d6286931f6512db215ec1fd42  COPYING
diff --git a/package/at/at.mk b/package/at/at.mk
index 6ac82e2de3..bbeed2a0e8 100644
--- a/package/at/at.mk
+++ b/package/at/at.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-AT_VERSION = 3.2.1
-AT_SOURCE = at-upstream-$(AT_VERSION).tar.bz2
-AT_SITE = https://salsa.debian.org/debian/at/-/archive/upstream/$(AT_VERSION)
+AT_VERSION = 3.2.2
+AT_SOURCE = at_$(AT_VERSION).orig.tar.gz
+AT_SITE = http://software.calhariz.com/at
 AT_AUTORECONF = YES
 AT_DEPENDENCIES = $(if $(BR2_PACKAGE_FLEX),flex) host-bison host-flex
 AT_LICENSE = GPL-2.0+, GPL-3.0+, ISC
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
