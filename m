Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54B37C433F5
	for <buildroot@archiver.kernel.org>; Mon, 31 Jan 2022 12:34:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BC172404E7;
	Mon, 31 Jan 2022 12:34:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WUPbZodW4IQn; Mon, 31 Jan 2022 12:34:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 37C88408E5;
	Mon, 31 Jan 2022 12:34:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E4BCF1BF3A8
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 12:34:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DF3D04092C
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 12:34:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wgFSCkAG7G3c for <buildroot@lists.busybox.net>;
 Mon, 31 Jan 2022 12:34:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd03117.aruba.it (smtpcmd03117.aruba.it [62.149.158.117])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3843840886
 for <buildroot@buildroot.org>; Mon, 31 Jan 2022 12:34:44 +0000 (UTC)
Received: from localhost.localdomain ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id EVtKnXJMR0FuyEVtLnToYK; Mon, 31 Jan 2022 13:34:43 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1643632483; bh=O+EFYzzj3HSpNj2KZWOOpIRhzUMxySfHu4MFodwyS7U=;
 h=From:To:Subject:Date:MIME-Version;
 b=RjlofSViP3NgDC+Vbu3XX12zaLce8yqP+nB3CDMNSpfKz3vX3wq+lxn9BdNkfa0gy
 4O3OrvZPDiGvrvpAUh9TQM2bUwXQJ0zUp0TaOFQUXLop5S8FMr5r8sq/qBFXWNPnxi
 yvPMGFlmBBvEE/jTG7dhQUx5kSz7AjRbo/GIVMwDp9TFNbf75eSBrdQ2ZlVHvX47Am
 aDvlv1r1IVB1teE64Kq7JDtDvukBbteZcy4JAyd6eQkZsof3+AfkYgrq40FmC4Rd+i
 Z919rfJVH0WCJw+i1qFS7Fo/zrckxtS/iOs5oJtfsUM7vTAbHSl8UTCDWVgXM/7gi/
 YVUVTGyw70eUQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Mon, 31 Jan 2022 13:34:41 +0100
Message-Id: <20220131123441.3645526-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfKyIivI7CoTESKavN6rS/Yq1MM+ucPON+EZSNUN6Vg5VrefMNOWtLsBsZTbT6ORbupdrN9QO/6B+CzBmQm4jMWCRrvr9Br7I/Y27/rdUnKbWlsscJIpI
 xG51hiMgPYLoIR3s9atxG4bRV0SwBhTGcADHayC/wqmSlM0EyxeHZFK3TaTjFIyPSh2JvKc8G0eQxWhukxGwO2xOAqf3iRM2nNgKfNwKOrH2Zhl+d8Li0Sxi
 K6IK0+R8TwO7yt7Mul+U5Vh+PrULv7CSZbF9QfDVOEU=
Subject: [Buildroot] [PATCH] package/at: bump version to 3.2.4
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

All local patches except on have been upstreamed, so let's remove them and
rename/rebase the remaining one.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 ...ake-install-for-non-root-don-t-stri.patch} |  24 +++-
 ...Makefile.in-replace-IROOT-by-DESTDIR.patch | 113 ------------------
 ...etloadavg.c-compilation-revert-to-3..patch |  39 ------
 ...-Makefile-fix-parallel-build-failure.patch |  41 -------
 package/at/at.hash                            |   2 +-
 package/at/at.mk                              |   2 +-
 6 files changed, 20 insertions(+), 201 deletions(-)
 rename package/at/{0002-Makefile.in-fix-make-install-for-non-root-don-t-stri.patch => 0001-Makefile.in-fix-make-install-for-non-root-don-t-stri.patch} (89%)
 delete mode 100644 package/at/0001-Makefile.in-replace-IROOT-by-DESTDIR.patch
 delete mode 100644 package/at/0003-getloadavg-fix-getloadavg.c-compilation-revert-to-3..patch
 delete mode 100644 package/at/0004-Makefile-fix-parallel-build-failure.patch

diff --git a/package/at/0002-Makefile.in-fix-make-install-for-non-root-don-t-stri.patch b/package/at/0001-Makefile.in-fix-make-install-for-non-root-don-t-stri.patch
similarity index 89%
rename from package/at/0002-Makefile.in-fix-make-install-for-non-root-don-t-stri.patch
rename to package/at/0001-Makefile.in-fix-make-install-for-non-root-don-t-stri.patch
index f6c07e9fe2..74972d5dd3 100644
--- a/package/at/0002-Makefile.in-fix-make-install-for-non-root-don-t-stri.patch
+++ b/package/at/0001-Makefile.in-fix-make-install-for-non-root-don-t-stri.patch
@@ -1,4 +1,4 @@
-From 71d9a23ab6a73ec1287acc683716481090095de0 Mon Sep 17 00:00:00 2001
+From d3ebf63f0e1274eb7835983cb7d79216aa0a0137 Mon Sep 17 00:00:00 2001
 From: Peter Korsgaard <jacmet@sunsite.dk>
 Date: Fri, 23 Jul 2021 16:47:56 +0200
 Subject: [PATCH] Makefile.in: fix make install for non-root, don't strip
@@ -10,16 +10,28 @@ Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
 Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 [Vincent: tweak the patch for the new version]
 Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
-[Giulio: convert patch to git format and rebase to version 3.2.2]
+[Giulio: convert patch to git format and rebase to version 3.2.2 and
+3.2.4]
 ---
- Makefile.in | 47 +++++++++++++++++++++++------------------------
- 1 file changed, 23 insertions(+), 24 deletions(-)
+ Makefile.in | 51 +++++++++++++++++++++++++++------------------------
+ 1 file changed, 27 insertions(+), 24 deletions(-)
 
 diff --git a/Makefile.in b/Makefile.in
-index a7197f2..0b35a67 100644
+index 4ae194f..e6892d9 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -99,43 +99,42 @@ atrun: atrun.in
+@@ -25,6 +25,10 @@ DESTDIR 	= $(IROOT)
+ $(warning IROOT is deprecated, you should use DESTDIR instead)
+ endif
+ 
++ifdef IROOT
++DESTDIR		= $(DESTDIR)
++endif
++
+ DAEMON_USERNAME	= @DAEMON_USERNAME@
+ DAEMON_GROUPNAME= @DAEMON_GROUPNAME@
+ LOADAVG_MX	= @LOADAVG_MX@
+@@ -102,43 +106,42 @@ atrun: atrun.in
  	$(CC) -c $(CFLAGS) $(DEFS) $*.c
  
  install: all
diff --git a/package/at/0001-Makefile.in-replace-IROOT-by-DESTDIR.patch b/package/at/0001-Makefile.in-replace-IROOT-by-DESTDIR.patch
deleted file mode 100644
index a9538589c1..0000000000
--- a/package/at/0001-Makefile.in-replace-IROOT-by-DESTDIR.patch
+++ /dev/null
@@ -1,113 +0,0 @@
-From cbfd3296d7d0742d9e35b01ec9e433afe2c36c63 Mon Sep 17 00:00:00 2001
-From: Marc Kleine-Budde <mkl@pengutronix.de>
-Date: Tue, 1 Dec 2009 20:57:45 +0100
-Subject: [PATCH] Makefile.in: replace IROOT by DESTDIR
-
-This patch replaces IROOT by DESTDIR, which is the autotools standard
-variable. For backwards compatibilty IROOT overwrites the DESTDIR.
-
-Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
-Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
-[Vincent: tweak the patch for the new version]
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
-[Giulio: convert patch to git format and rebase to version 3.2.2]
----
- Makefile.in | 72 ++++++++++++++++++++++++++++-------------------------
- 1 file changed, 38 insertions(+), 34 deletions(-)
-
-diff --git a/Makefile.in b/Makefile.in
-index 3e8303c..a7197f2 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -20,6 +20,10 @@ etcdir		= @ETCDIR@
- atjobdir	= @ATJBD@
- systemdsystemunitdir = @systemdsystemunitdir@
- 
-+ifdef IROOT
-+DESTDIR		= $(DESTDIR)
-+endif
-+
- DAEMON_USERNAME	= @DAEMON_USERNAME@
- DAEMON_GROUPNAME= @DAEMON_GROUPNAME@
- LOADAVG_MX	= @LOADAVG_MX@
-@@ -95,43 +99,43 @@ atrun: atrun.in
- 	$(CC) -c $(CFLAGS) $(DEFS) $*.c
- 
- install: all
--	$(INSTALL) -g root -o root -m 755 -d $(IROOT)$(etcdir)
--	$(INSTALL) -g root -o root -m 755 -d $(IROOT)$(bindir)
--	$(INSTALL) -g root -o root -m 755 -d $(IROOT)$(sbindir)
--	$(INSTALL) -g root -o root -m 755 -d $(IROOT)$(atdatadir)
--	$(INSTALL) -g root -o root -m 755 -d $(IROOT)$(docdir)
--	$(INSTALL) -g root -o root -m 755 -d $(IROOT)$(atdocdir)
--	$(INSTALL) -g $(DAEMON_GROUPNAME) -o $(DAEMON_USERNAME) -m 755 -d $(IROOT)$(ATSPOOL_DIR) $(IROOT)$(ATJOB_DIR)
--	chmod 1770 $(IROOT)$(ATSPOOL_DIR) $(IROOT)$(ATJOB_DIR)
--	touch $(IROOT)$(LFILE)
--	chmod 600 $(IROOT)$(LFILE)
--	chown $(DAEMON_USERNAME):$(DAEMON_GROUPNAME) $(IROOT)$(LFILE)
--	test -f $(IROOT)$(etcdir)/at.allow || test -f $(IROOT)$(etcdir)/at.deny || $(INSTALL) -o root -g $(DAEMON_GROUPNAME) -m 640 at.deny $(IROOT)$(etcdir)/
--	$(INSTALL) -g $(DAEMON_GROUPNAME) -o $(DAEMON_USERNAME) -m 6755 at $(IROOT)$(bindir)
--	$(LN_S) -f at $(IROOT)$(bindir)/atq
--	$(LN_S) -f at $(IROOT)$(bindir)/atrm
--	$(INSTALL) -g root -o root -m 755 batch $(IROOT)$(bindir)
--	$(INSTALL) -g root -o root -m 755 batch-job $(IROOT)$(atdatadir)
--	$(INSTALL) -d -o root -g root -m 755 $(IROOT)$(man1dir)
--	$(INSTALL) -d -o root -g root -m 755 $(IROOT)$(man5dir)
--	$(INSTALL) -d -o root -g root -m 755 $(IROOT)$(man8dir)
--	$(INSTALL) -g root -o root -m 755 atd $(IROOT)$(sbindir)
--	$(INSTALL) -g root -o root -m 755 atrun $(IROOT)$(sbindir)
--	$(INSTALL) -g root -o root -m 644 at.1 $(IROOT)$(man1dir)/
--	cd $(IROOT)$(man1dir) && $(LN_S) -f at.1 atq.1 && $(LN_S) -f at.1 batch.1 && $(LN_S) -f at.1 atrm.1
--	$(INSTALL) -g root -o root -m 644 atd.8 $(IROOT)$(man8dir)/
-+	$(INSTALL) -g root -o root -m 755 -d $(DESTDIR)$(etcdir)
-+	$(INSTALL) -g root -o root -m 755 -d $(DESTDIR)$(bindir)
-+	$(INSTALL) -g root -o root -m 755 -d $(DESTDIR)$(sbindir)
-+	$(INSTALL) -g root -o root -m 755 -d $(DESTDIR)$(atdatadir)
-+	$(INSTALL) -g root -o root -m 755 -d $(DESTDIR)$(docdir)
-+	$(INSTALL) -g root -o root -m 755 -d $(DESTDIR)$(atdocdir)
-+	$(INSTALL) -g $(DAEMON_GROUPNAME) -o $(DAEMON_USERNAME) -m 755 -d $(DESTDIR)$(ATSPOOL_DIR) $(DESTDIR)$(ATJOB_DIR)
-+	chmod 1770 $(DESTDIR)$(ATSPOOL_DIR) $(DESTDIR)$(ATJOB_DIR)
-+	touch $(DESTDIR)$(LFILE)
-+	chmod 600 $(DESTDIR)$(LFILE)
-+	chown $(DAEMON_USERNAME):$(DAEMON_GROUPNAME) $(DESTDIR)$(LFILE)
-+	test -f $(DESTDIR)$(etcdir)/at.allow || test -f $(DESTDIR)$(etcdir)/at.deny || $(INSTALL) -o root -g $(DAEMON_GROUPNAME) -m 640 at.deny $(DESTDIR)$(etcdir)/
-+	$(INSTALL) -g $(DAEMON_GROUPNAME) -o $(DAEMON_USERNAME) -m 6755 at $(DESTDIR)$(bindir)
-+	$(LN_S) -f at $(DESTDIR)$(bindir)/atq
-+	$(LN_S) -f at $(DESTDIR)$(bindir)/atrm
-+	$(INSTALL) -g root -o root -m 755 batch $(DESTDIR)$(bindir)
-+	$(INSTALL) -g root -o root -m 755 batch-job $(DESTDIR)$(atdatadir)
-+	$(INSTALL) -d -o root -g root -m 755 $(DESTDIR)$(man1dir)
-+	$(INSTALL) -d -o root -g root -m 755 $(DESTDIR)$(man5dir)
-+	$(INSTALL) -d -o root -g root -m 755 $(DESTDIR)$(man8dir)
-+	$(INSTALL) -g root -o root -m 755 atd $(DESTDIR)$(sbindir)
-+	$(INSTALL) -g root -o root -m 755 atrun $(DESTDIR)$(sbindir)
-+	$(INSTALL) -g root -o root -m 644 at.1 $(DESTDIR)$(man1dir)/
-+	cd $(DESTDIR)$(man1dir) && $(LN_S) -f at.1 atq.1 && $(LN_S) -f at.1 batch.1 && $(LN_S) -f at.1 atrm.1
-+	$(INSTALL) -g root -o root -m 644 atd.8 $(DESTDIR)$(man8dir)/
- 	sed "s,\$${exec_prefix},$(exec_prefix),g" <atrun.8>tmpman
--	$(INSTALL) -g root -o root -m 644 tmpman $(IROOT)$(man8dir)/atrun.8
-+	$(INSTALL) -g root -o root -m 644 tmpman $(DESTDIR)$(man8dir)/atrun.8
- 	rm -f tmpman
--	$(INSTALL) -g root -o root -m 644 at.allow.5 $(IROOT)$(man5dir)/
--	cd $(IROOT)$(man5dir) && $(LN_S) -f at.allow.5 at.deny.5
--	$(INSTALL) -g root -o root -m 644 $(DOCS) $(IROOT)$(atdocdir)
--	rm -f $(IROOT)$(mandir)/cat1/at.1* $(IROOT)$(mandir)/cat1/batch.1* \
--		$(IROOT)$(mandir)/cat1/atq.1*
--	rm -f $(IROOT)$(mandir)/cat1/atd.8*
-+	$(INSTALL) -g root -o root -m 644 at.allow.5 $(DESTDIR)$(man5dir)/
-+	cd $(DESTDIR)$(man5dir) && $(LN_S) -f at.allow.5 at.deny.5
-+	$(INSTALL) -g root -o root -m 644 $(DOCS) $(DESTDIR)$(atdocdir)
-+	rm -f $(DESTDIR)$(mandir)/cat1/at.1* $(DESTDIR)$(mandir)/cat1/batch.1* \
-+		$(DESTDIR)$(mandir)/cat1/atq.1*
-+	rm -f $(DESTDIR)$(mandir)/cat1/atd.8*
- 	if test x"$(systemdsystemunitdir)" != xno; then \
--		$(INSTALL) -o root -g root -m 755 -d $(IROOT)$(systemdsystemunitdir); \
--		$(INSTALL) -o root -g root -m 644 atd.service $(IROOT)$(systemdsystemunitdir); \
-+		$(INSTALL) -o root -g root -m 755 -d $(DESTDIR)$(systemdsystemunitdir); \
-+		$(INSTALL) -o root -g root -m 644 atd.service $(DESTDIR)$(systemdsystemunitdir); \
- 	fi
- 
- dist: checkin $(DIST) $(LIST) Filelist.asc
--- 
-2.25.1
-
diff --git a/package/at/0003-getloadavg-fix-getloadavg.c-compilation-revert-to-3..patch b/package/at/0003-getloadavg-fix-getloadavg.c-compilation-revert-to-3..patch
deleted file mode 100644
index fb515af8d9..0000000000
--- a/package/at/0003-getloadavg-fix-getloadavg.c-compilation-revert-to-3..patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 4eda31cea9fb3c77fe2748a65960f24ffb42f9ff Mon Sep 17 00:00:00 2001
-From: Peter Korsgaard <jacmet@sunsite.dk>
-Date: Fri, 23 Jul 2021 16:51:17 +0200
-Subject: [PATCH] getloadavg: fix getloadavg.c compilation, revert to 3.1.10
- version
-
-getloadavg.c shipped with 3.1.13 doesn't compile because it references
-headers not shipped. Fix it by simply reverting to the 3.1.10 version.
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
-[Giulio: convert patch to git format]
----
- getloadavg.c | 7 ++++---
- 1 file changed, 4 insertions(+), 3 deletions(-)
-
-diff --git a/getloadavg.c b/getloadavg.c
-index cf5869f..23d18eb 100644
---- a/getloadavg.c
-+++ b/getloadavg.c
-@@ -66,11 +66,12 @@ Boston, MA  02110-1301  USA */
- 
- /* This should always be first.  */
- #ifdef HAVE_CONFIG_H
--#include <config.h>
-+#include "config.h"
- #endif
- 
--#include "lisp.h"
--#include "sysfile.h" /* for encapsulated open, close, read, write */
-+#include <sys/types.h>
-+#include <sys/stat.h>
-+#include <fcntl.h>
- 
- #ifndef HAVE_GETLOADAVG
- 
--- 
-2.25.1
-
diff --git a/package/at/0004-Makefile-fix-parallel-build-failure.patch b/package/at/0004-Makefile-fix-parallel-build-failure.patch
deleted file mode 100644
index 6e3dc24ca4..0000000000
--- a/package/at/0004-Makefile-fix-parallel-build-failure.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 3ace0b57e2aacb784c01a3c7694c6c92461937ff Mon Sep 17 00:00:00 2001
-From: Giulio Benetti <giulio.benetti@benettiengineering.com>
-Date: Thu, 20 Feb 2020 22:00:11 +0100
-Subject: [PATCH] Makefile: fix parallel build failure
-
-At the moment parallel build fails due to 2 causes:
-1) parsetime.l tries to include incomplete y.tab.h, since y.tab.h is the
-result of yacc -d parsetime.y
-2) when compiling y.tab.c, y.tab.c itself is not complete, since it is
-the result of yacc -d parsetime.y
-
-So fix it by:
-1) making parsetime.l to wait for y.tab.h to be created by yacc
-2) waiting for y.tab.c and y.tab.h to be created before compile them
-
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- Makefile.in | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/Makefile.in b/Makefile.in
-index 4c11913..57c3a0c 100644
---- a/Makefile.in
-+++ b/Makefile.in
-@@ -83,6 +83,8 @@ y.tab.c y.tab.h: parsetime.y
- lex.yy.c: parsetime.l
- 	$(LEX) -i parsetime.l
- 
-+parsetime.l: y.tab.h
-+
- atd.service: atd.service.in
- 	cat $< | sed -e 's![@]sbindir[@]!$(sbindir)!g' | sed -e 's![@]atjobdir[@]!$(atjobdir)!g' > $@
- 
-@@ -173,3 +175,4 @@ perm.o: perm.c config.h privs.h at.h
- posixtm.o: posixtm.c posixtm.h
- daemon.o: daemon.c config.h daemon.h privs.h
- getloadavg.o: getloadavg.c config.h getloadavg.h
-+y.tab.o: y.tab.c y.tab.h
--- 
-2.20.1
-
diff --git a/package/at/at.hash b/package/at/at.hash
index 88a9e8a91d..d4ad9aa436 100644
--- a/package/at/at.hash
+++ b/package/at/at.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  2211da14914fde1f9cc83592838fb6385a32fb11fcecb7816c77700df6559088  at_3.2.2.orig.tar.gz
+sha256  76990cbb6f4b9bfedb926637904fdcc0d4fa20b6596b9c932117a49a0624c684  at_3.2.4.orig.tar.gz
 
 sha256  01dccc0975aa9ba1a9f83e7c5e04f16077353d3c72a0a759b8846ee7a5b2b616  Copyright
 sha256  c38aee9e3c8c4d5d594ff548a1be05453023016d6286931f6512db215ec1fd42  COPYING
diff --git a/package/at/at.mk b/package/at/at.mk
index bbeed2a0e8..6637f0df64 100644
--- a/package/at/at.mk
+++ b/package/at/at.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AT_VERSION = 3.2.2
+AT_VERSION = 3.2.4
 AT_SOURCE = at_$(AT_VERSION).orig.tar.gz
 AT_SITE = http://software.calhariz.com/at
 AT_AUTORECONF = YES
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
