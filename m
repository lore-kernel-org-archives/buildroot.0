Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50B0BEDEC7C
	for <buildroot@archiver.kernel.org>; Wed, 13 Sep 2023 16:02:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0637A82F9B;
	Wed, 13 Sep 2023 16:02:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0637A82F9B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B9ZYffDO7bbO; Wed, 13 Sep 2023 16:02:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5EFA483367;
	Wed, 13 Sep 2023 16:02:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5EFA483367
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B38781BF5EA
 for <buildroot@lists.busybox.net>; Wed, 13 Sep 2023 16:01:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3388360BAC
 for <buildroot@lists.busybox.net>; Wed, 13 Sep 2023 16:01:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3388360BAC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qO-amfUeqpez for <buildroot@lists.busybox.net>;
 Wed, 13 Sep 2023 16:01:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7B8A661094
 for <buildroot@buildroot.org>; Wed, 13 Sep 2023 16:01:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7B8A661094
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6C03C86E12; Wed, 13 Sep 2023 16:01:17 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 13 Sep 2023 17:58:58 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 44f9d1189694f50c9d63388078aeb9a1e6b67e20
X-Git-Newrev: f73bf9084df2228bca051f64baeed604d1f8cc0d
X-Patchwork-Hint: ignore
Message-Id: <20230913160117.6C03C86E12@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/screen: security
 bump to version 4.9.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=f73bf9084df2228bca051f64baeed604d1f8cc0d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

See release announce:
https://lists.gnu.org/archive/html/screen-users/2023-08/msg00000.html

Fixes:
CVE-2023-24626: https://www.cve.org/CVERecord?id=CVE-2023-24626

Note: Buildroot installs screen as setuid, so the described scenario
in CVE applies.

This commit also rebases all patches on this release. Patch were
regenerated with 'git format-patch -N', so patch file name changed in
this process. The file .checkpackageignore is also updated accordingly.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 96a54b09074dfc7fc3c24997e1cfc50d6bd67015)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...emcpy-as-an-alternative-for-bcopy-memmov.patch} |  47 ++++---
 ...ot-create-backup-of-old-installed-binary.patch} |   9 +-
 ...ary-permission-flags-even-if-chown-fails.patch} |  11 +-
 ...riding-SCREEN-to-get-a-non-versioned-bin.patch} |  11 +-
 .../0005-Renamed-sched.h-to-eventqueue.h.patch     |  39 ++++++
 package/screen/0005-rename-sched_h.patch           | 142 ---------------------
 ...tch => 0006-comm.h-now-depends-on-term.h.patch} |  20 +--
 ...omm.h-needed-for-list_-display-generic-.o.patch |  10 +-
 package/screen/screen.hash                         |   4 +-
 package/screen/screen.mk                           |   2 +-
 10 files changed, 106 insertions(+), 189 deletions(-)

diff --git a/package/screen/0001-no-memcpy-fallback.patch b/package/screen/0001-Do-not-use-memcpy-as-an-alternative-for-bcopy-memmov.patch
similarity index 77%
rename from package/screen/0001-no-memcpy-fallback.patch
rename to package/screen/0001-Do-not-use-memcpy-as-an-alternative-for-bcopy-memmov.patch
index 2137907199..ab002701d7 100644
--- a/package/screen/0001-no-memcpy-fallback.patch
+++ b/package/screen/0001-Do-not-use-memcpy-as-an-alternative-for-bcopy-memmov.patch
@@ -1,6 +1,7 @@
+From 545875ad0b6c9697fae41ae8770e95d117fe3cca Mon Sep 17 00:00:00 2001
 From: Maarten ter Huurne <maarten@treewalker.org>
 Date: Sat, 13 Sep 2014 11:37:59 +0200
-Subject: Do not use memcpy as an alternative for bcopy/memmove
+Subject: [PATCH] Do not use memcpy as an alternative for bcopy/memmove
 
 The configure script runs a small test program to check whether
 memcpy can handle overlapping memory areas. However, it is not valid
@@ -16,15 +17,17 @@ Signed-off-by: Maarten ter Huurne <maarten@treewalker.org>
 Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
 [Bernd: rebase on top of 4.7.0]
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+[Julien: rebase on top of 4.9.1]
+Signed-off-by: Julien Olivain <ju.o@free.fr>
 ---
  acconfig.h   |  3 +--
- configure.ac | 18 +-----------------
+ configure.ac | 22 +---------------------
  os.h         |  8 ++------
  osdef.h.in   | 10 +---------
- 4 files changed, 5 insertions(+), 34 deletions(-)
+ 4 files changed, 5 insertions(+), 38 deletions(-)
 
 diff --git a/acconfig.h b/acconfig.h
-index 2e46985..9b0b9d4 100644
+index 46d62b0..f83572c 100644
 --- a/acconfig.h
 +++ b/acconfig.h
 @@ -476,7 +476,7 @@
@@ -45,43 +48,47 @@ index 2e46985..9b0b9d4 100644
  
  /*
 diff --git a/configure.ac b/configure.ac
-index 27690a6..b8e3bec 100644
+index 1a12c04..6f6c2da 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1145,7 +1145,7 @@ AC_TRY_LINK(,[getttyent();], AC_DEFINE(GETTTYENT))
- AC_CHECKING(fdwalk)
- AC_TRY_LINK([#include <stdlib.h>], [fdwalk(NULL, NULL);],AC_DEFINE(HAVE_FDWALK))
+@@ -1278,7 +1278,7 @@ AC_TRY_LINK([
+     fdwalk(NULL, NULL);
+ ],AC_DEFINE(HAVE_FDWALK))
  
 -AC_CHECKING(whether memcpy/memmove/bcopy handles overlapping arguments)
 +AC_CHECKING(whether memmove/bcopy handles overlapping arguments)
  AC_TRY_RUN([
- main() {
-   char buf[10];
-@@ -1175,22 +1175,6 @@ main() {
-   exit(0); /* libc version works properly.  */
- }], AC_DEFINE(USEMEMMOVE))
+ #include <string.h>
+ #include <stdlib.h>
+@@ -1319,26 +1319,6 @@ main() {
+ }], AC_DEFINE(USEMEMMOVE),,
+   AC_NOTE(- skipping check because we are cross compiling; use memmove) AC_DEFINE(USEMEMMOVE))
  
--
 -AC_TRY_RUN([
+-#include <string.h>
+-#include <stdlib.h>
+-
 -#define bcopy(s,d,l) memcpy(d,s,l)
+-
+-int
 -main() {
 -  char buf[10];
 -  strcpy(buf, "abcdefghi");
 -  bcopy(buf, buf + 2, 3);
 -  if (strncmp(buf, "ababcf", 6))
--    exit(1);
+-    return 1;
 -  strcpy(buf, "abcdefghi");
 -  bcopy(buf + 2, buf, 3);
 -  if (strncmp(buf, "cdedef", 6))
--    exit(1);
--  exit(0); /* libc version works properly.  */
+-    return 1;
+-  return 0; /* libc version works properly.  */
 -}], AC_DEFINE(USEMEMCPY),,:)
 -
  AC_SYS_LONG_FILE_NAMES
  
  AC_MSG_CHECKING(for vsprintf)
 diff --git a/os.h b/os.h
-index e827ac9..0b41fb9 100644
+index 2a1c2ca..d1ac87e 100644
 --- a/os.h
 +++ b/os.h
 @@ -142,12 +142,8 @@ extern int errno;
@@ -100,7 +107,7 @@ index e827ac9..0b41fb9 100644
  #endif
  
 diff --git a/osdef.h.in b/osdef.h.in
-index 8687b60..e4057a0 100644
+index 6ddbd66..abdacf7 100644
 --- a/osdef.h.in
 +++ b/osdef.h.in
 @@ -58,16 +58,8 @@ extern int   bcmp __P((char *, char *, int));
@@ -122,5 +129,5 @@ index 8687b60..e4057a0 100644
  extern void  bcopy __P((char *, char *, int));
  #endif
 -- 
-1.8.4.5
+2.41.0
 
diff --git a/package/screen/0002-install-no-backup-binary.patch b/package/screen/0002-Do-not-create-backup-of-old-installed-binary.patch
similarity index 85%
rename from package/screen/0002-install-no-backup-binary.patch
rename to package/screen/0002-Do-not-create-backup-of-old-installed-binary.patch
index 7842662b57..ef82cd3e76 100644
--- a/package/screen/0002-install-no-backup-binary.patch
+++ b/package/screen/0002-Do-not-create-backup-of-old-installed-binary.patch
@@ -1,18 +1,21 @@
+From 86b5c7677c5bef780bd4c28cbbdaa97eda938230 Mon Sep 17 00:00:00 2001
 From: Maarten ter Huurne <maarten@treewalker.org>
 Date: Sun, 14 Sep 2014 23:58:34 +0200
-Subject: Do not create backup of old installed binary
+Subject: [PATCH] Do not create backup of old installed binary
 
 This is a rather unusual feature that packagers will not expect.
 
 Signed-off-by: Maarten ter Huurne <maarten@treewalker.org>
 [baruch: update for 4.6.2]
 Signed-off-by: Baruch Siach <baruch@tkos.co.il>
+[Julien: rebase on top of 4.9.1]
+Signed-off-by: Julien Olivain <ju.o@free.fr>
 ---
  Makefile.in | 4 ----
  1 file changed, 4 deletions(-)
 
 diff --git a/Makefile.in b/Makefile.in
-index 187a69b..65549e9 100644
+index 26ec404..3efbbfd 100644
 --- a/Makefile.in
 +++ b/Makefile.in
 @@ -83,12 +83,9 @@ screen: $(OFILES)
@@ -37,5 +40,5 @@ index 187a69b..65549e9 100644
  	cd doc; $(MAKE) uninstall
  
 -- 
-1.8.4.5
+2.41.0
 
diff --git a/package/screen/0003-install-always-chmod.patch b/package/screen/0003-Change-binary-permission-flags-even-if-chown-fails.patch
similarity index 73%
rename from package/screen/0003-install-always-chmod.patch
rename to package/screen/0003-Change-binary-permission-flags-even-if-chown-fails.patch
index 0aa7690b08..bc3f676af3 100644
--- a/package/screen/0003-install-always-chmod.patch
+++ b/package/screen/0003-Change-binary-permission-flags-even-if-chown-fails.patch
@@ -1,22 +1,25 @@
+From 4231969c47a8379f9113e0c9c9586bcfdd545c37 Mon Sep 17 00:00:00 2001
 From: Maarten ter Huurne <maarten@treewalker.org>
 Date: Mon, 15 Sep 2014 00:03:05 +0200
-Subject: Change binary permission flags even if chown fails
+Subject: [PATCH] Change binary permission flags even if chown fails
 
 Typically when creating a package, the build is not run as root, so
 the chown will fail. But the chmod can still be done.
 
 Signed-off-by: Maarten ter Huurne <maarten@treewalker.org>
+[Julien: rebase on top of 4.9.1]
+Signed-off-by: Julien Olivain <ju.o@free.fr>
 ---
  Makefile.in | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/Makefile.in b/Makefile.in
-index 65549e9..3c12fdb 100644
+index 3efbbfd..0315fde 100644
 --- a/Makefile.in
 +++ b/Makefile.in
 @@ -84,7 +84,8 @@ screen: $(OFILES)
  
- install_bin: .version screen
+ install_bin: .version screen installdirs
  	$(INSTALL_PROGRAM) screen $(DESTDIR)$(bindir)/$(SCREEN)
 -	-chown root $(DESTDIR)$(bindir)/$(SCREEN) && chmod 4755 $(DESTDIR)$(bindir)/$(SCREEN)
 +	-chown root $(DESTDIR)$(bindir)/$(SCREEN)
@@ -25,5 +28,5 @@ index 65549e9..3c12fdb 100644
  	rm -f $(DESTDIR)$(bindir)/screen
  	(cd $(DESTDIR)$(bindir) && ln -f -s $(SCREEN) screen)
 -- 
-1.8.4.5
+2.41.0
 
diff --git a/package/screen/0004-install-nonversioned-binary.patch b/package/screen/0004-Support-overriding-SCREEN-to-get-a-non-versioned-bin.patch
similarity index 72%
rename from package/screen/0004-install-nonversioned-binary.patch
rename to package/screen/0004-Support-overriding-SCREEN-to-get-a-non-versioned-bin.patch
index ecbbd65197..15795874ae 100644
--- a/package/screen/0004-install-nonversioned-binary.patch
+++ b/package/screen/0004-Support-overriding-SCREEN-to-get-a-non-versioned-bin.patch
@@ -1,20 +1,23 @@
+From 07d6e4d9da8bc7c6ed31aa9b643410ea093d164f Mon Sep 17 00:00:00 2001
 From: Maarten ter Huurne <maarten@treewalker.org>
 Date: Mon, 15 Sep 2014 00:06:20 +0200
-Subject: Support overriding SCREEN to get a non-versioned binary
+Subject: [PATCH] Support overriding SCREEN to get a non-versioned binary
 
 If a packager runs "make install SCREEN=screen", do not create
 "screen" as a symlink to itself.
 
 Signed-off-by: Maarten ter Huurne <maarten@treewalker.org>
+[Julien: rebase on top of 4.9.1]
+Signed-off-by: Julien Olivain <ju.o@free.fr>
 ---
  Makefile.in | 2 ++
  1 file changed, 2 insertions(+)
 
 diff --git a/Makefile.in b/Makefile.in
-index 3c12fdb..860f351 100644
+index 0315fde..4718f08 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -86,9 +86,11 @@ install_bin: .version screen
+@@ -86,9 +86,11 @@ install_bin: .version screen installdirs
  	$(INSTALL_PROGRAM) screen $(DESTDIR)$(bindir)/$(SCREEN)
  	-chown root $(DESTDIR)$(bindir)/$(SCREEN)
  	-chmod 4755 $(DESTDIR)$(bindir)/$(SCREEN)
@@ -27,5 +30,5 @@ index 3c12fdb..860f351 100644
  
  ###############################################################################
 -- 
-1.8.4.5
+2.41.0
 
diff --git a/package/screen/0005-Renamed-sched.h-to-eventqueue.h.patch b/package/screen/0005-Renamed-sched.h-to-eventqueue.h.patch
new file mode 100644
index 0000000000..24df05de8c
--- /dev/null
+++ b/package/screen/0005-Renamed-sched.h-to-eventqueue.h.patch
@@ -0,0 +1,39 @@
+From 8b066a777b61600ff2c60cad0725f2089299ff56 Mon Sep 17 00:00:00 2001
+From: Maarten ter Huurne <maarten@treewalker.org>
+Date: Mon, 15 Sep 2014 00:24:41 +0200
+Subject: [PATCH] Renamed sched.h to eventqueue.h
+
+There is a <sched.h> system header that got shadowed by "sched.h".
+While Screen itself doesn't include <sched.h>, other system headers
+might include it indirectly. This broke the build when using uClibc
+with pthread support.
+
+Signed-off-by: Maarten ter Huurne <maarten@treewalker.org>
+[Julien: rebase on top of 4.9.1]
+Signed-off-by: Julien Olivain <ju.o@free.fr>
+---
+ sched.h => eventqueue.h | 0
+ screen.h                | 2 +-
+ 2 files changed, 1 insertion(+), 1 deletion(-)
+ rename sched.h => eventqueue.h (100%)
+
+diff --git a/sched.h b/eventqueue.h
+similarity index 100%
+rename from sched.h
+rename to eventqueue.h
+diff --git a/screen.h b/screen.h
+index 4823efb..2d51788 100644
+--- a/screen.h
++++ b/screen.h
+@@ -43,7 +43,7 @@
+ #include "osdef.h"
+ 
+ #include "ansi.h"
+-#include "sched.h"
++#include "eventqueue.h"
+ #include "acls.h"
+ #include "comm.h"
+ #include "layer.h"
+-- 
+2.41.0
+
diff --git a/package/screen/0005-rename-sched_h.patch b/package/screen/0005-rename-sched_h.patch
deleted file mode 100644
index 9b29b76e07..0000000000
--- a/package/screen/0005-rename-sched_h.patch
+++ /dev/null
@@ -1,142 +0,0 @@
-From: Maarten ter Huurne <maarten@treewalker.org>
-Date: Mon, 15 Sep 2014 00:24:41 +0200
-Subject: Renamed sched.h to eventqueue.h
-
-There is a <sched.h> system header that got shadowed by "sched.h".
-While Screen itself doesn't include <sched.h>, other system headers
-might include it indirectly. This broke the build when using uClibc
-with pthread support.
-
-Signed-off-by: Maarten ter Huurne <maarten@treewalker.org>
----
- eventqueue.h | 48 ++++++++++++++++++++++++++++++++++++++++++++++++
- sched.h      | 48 ------------------------------------------------
- screen.h     |  2 +-
- 3 files changed, 49 insertions(+), 49 deletions(-)
- create mode 100644 eventqueue.h
- delete mode 100644 sched.h
-
-diff --git a/eventqueue.h b/eventqueue.h
-new file mode 100644
-index 0000000..fdc3fc4
---- /dev/null
-+++ b/eventqueue.h
-@@ -0,0 +1,48 @@
-+/* Copyright (c) 2008, 2009
-+ *      Juergen Weigert (jnweiger@immd4.informatik.uni-erlangen.de)
-+ *      Michael Schroeder (mlschroe@immd4.informatik.uni-erlangen.de)
-+ *      Micah Cowan (micah@cowan.name)
-+ *      Sadrul Habib Chowdhury (sadrul@users.sourceforge.net)
-+ * Copyright (c) 1993-2002, 2003, 2005, 2006, 2007
-+ *      Juergen Weigert (jnweiger@immd4.informatik.uni-erlangen.de)
-+ *      Michael Schroeder (mlschroe@immd4.informatik.uni-erlangen.de)
-+ * Copyright (c) 1987 Oliver Laumann
-+ *
-+ * This program is free software; you can redistribute it and/or modify
-+ * it under the terms of the GNU General Public License as published by
-+ * the Free Software Foundation; either version 3, or (at your option)
-+ * any later version.
-+ *
-+ * This program is distributed in the hope that it will be useful,
-+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
-+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-+ * GNU General Public License for more details.
-+ *
-+ * You should have received a copy of the GNU General Public License
-+ * along with this program (see the file COPYING); if not, see
-+ * https://www.gnu.org/licenses/, or contact Free Software Foundation, Inc.,
-+ * 51 Franklin Street, Fifth Floor, Boston, MA  02111-1301  USA
-+ *
-+ ****************************************************************
-+ * $Id$ GNU
-+ */
-+
-+struct event
-+{
-+  struct event *next;
-+  void (*handler) __P((struct event *, char *));
-+  char *data;
-+  int fd;
-+  int type;
-+  int pri;
-+  struct timeval timeout;
-+  int queued;		/* in evs queue */
-+  int active;		/* in fdset */
-+  int *condpos;		/* only active if condpos - condneg > 0 */
-+  int *condneg;
-+};
-+
-+#define EV_TIMEOUT	0
-+#define EV_READ		1
-+#define EV_WRITE	2
-+#define EV_ALWAYS	3
-diff --git a/sched.h b/sched.h
-deleted file mode 100644
-index fdc3fc4..0000000
---- a/sched.h
-+++ /dev/null
-@@ -1,48 +0,0 @@
--/* Copyright (c) 2008, 2009
-- *      Juergen Weigert (jnweiger@immd4.informatik.uni-erlangen.de)
-- *      Michael Schroeder (mlschroe@immd4.informatik.uni-erlangen.de)
-- *      Micah Cowan (micah@cowan.name)
-- *      Sadrul Habib Chowdhury (sadrul@users.sourceforge.net)
-- * Copyright (c) 1993-2002, 2003, 2005, 2006, 2007
-- *      Juergen Weigert (jnweiger@immd4.informatik.uni-erlangen.de)
-- *      Michael Schroeder (mlschroe@immd4.informatik.uni-erlangen.de)
-- * Copyright (c) 1987 Oliver Laumann
-- *
-- * This program is free software; you can redistribute it and/or modify
-- * it under the terms of the GNU General Public License as published by
-- * the Free Software Foundation; either version 3, or (at your option)
-- * any later version.
-- *
-- * This program is distributed in the hope that it will be useful,
-- * but WITHOUT ANY WARRANTY; without even the implied warranty of
-- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- * GNU General Public License for more details.
-- *
-- * You should have received a copy of the GNU General Public License
-- * along with this program (see the file COPYING); if not, see
-- * https://www.gnu.org/licenses/, or contact Free Software Foundation, Inc.,
-- * 51 Franklin Street, Fifth Floor, Boston, MA  02111-1301  USA
-- *
-- ****************************************************************
-- * $Id$ GNU
-- */
--
--struct event
--{
--  struct event *next;
--  void (*handler) __P((struct event *, char *));
--  char *data;
--  int fd;
--  int type;
--  int pri;
--  struct timeval timeout;
--  int queued;		/* in evs queue */
--  int active;		/* in fdset */
--  int *condpos;		/* only active if condpos - condneg > 0 */
--  int *condneg;
--};
--
--#define EV_TIMEOUT	0
--#define EV_READ		1
--#define EV_WRITE	2
--#define EV_ALWAYS	3
-diff --git a/screen.h b/screen.h
-index 603ca3f..34238c8 100644
---- a/screen.h
-+++ b/screen.h
-@@ -43,7 +43,7 @@
- #include "osdef.h"
- 
- #include "ansi.h"
--#include "sched.h"
-+#include "eventqueue.h"
- #include "acls.h"
- #include "comm.h"
- #include "layer.h"
--- 
-1.8.4.5
-
diff --git a/package/screen/0006-comm-h-now-depends-on-term-h.patch b/package/screen/0006-comm.h-now-depends-on-term.h.patch
similarity index 59%
rename from package/screen/0006-comm-h-now-depends-on-term-h.patch
rename to package/screen/0006-comm.h-now-depends-on-term.h.patch
index 6ff6f3da0b..088dfb340c 100644
--- a/package/screen/0006-comm-h-now-depends-on-term-h.patch
+++ b/package/screen/0006-comm.h-now-depends-on-term.h.patch
@@ -1,28 +1,30 @@
-From 39c5f1c76f1fcef4b5958bf828a63f53426b6984 Mon Sep 17 00:00:00 2001
+From 23a8ca6be87ad374d66854cee66ab758880cc651 Mon Sep 17 00:00:00 2001
 From: Mike Gerwitz <mike@mikegerwitz.com>
 Date: Tue, 24 Dec 2013 22:16:31 -0500
-Subject: comm.h now depends on term.h
+Subject: [PATCH] comm.h now depends on term.h
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 [Patch retrieved and updated from:
 http://git.savannah.gnu.org/cgit/screen.git/commit/?id=39c5f1c]
+[Julien: rebase on top of 4.9.1]
+Signed-off-by: Julien Olivain <ju.o@free.fr>
 ---
- src/Makefile.in | 2 +-
+ Makefile.in | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/Makefile.in b/Makefile.in
-index e791e79..d4f7c0b 100644
+index 4718f08..7082a3e 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -113,7 +113,7 @@ term.h: term.c term.sh
- 
- kmapdef.c: term.h
+@@ -132,7 +132,7 @@ kmapdef.c: term.h
+ tty.c:	tty.sh 
+ 	sh $(srcdir)/tty.sh tty.c
  
 -comm.h: comm.c comm.sh config.h
 +comm.h: comm.c comm.sh config.h term.h
  	AWK=$(AWK) CC="$(CC) $(CFLAGS)" srcdir=${srcdir} sh $(srcdir)/comm.sh
  
- docs:
+ osdef.h: osdef.sh config.h osdef.h.in
 -- 
-cgit v1.0-41-gc330
+2.41.0
 
diff --git a/package/screen/0007-comm.h-needed-for-list_-display-generic-.o.patch b/package/screen/0007-comm.h-needed-for-list_-display-generic-.o.patch
index f406a1afac..d46bf723b8 100644
--- a/package/screen/0007-comm.h-needed-for-list_-display-generic-.o.patch
+++ b/package/screen/0007-comm.h-needed-for-list_-display-generic-.o.patch
@@ -1,4 +1,4 @@
-From b719314d201a3e9e1e57c65746a468c47bfc847f Mon Sep 17 00:00:00 2001
+From 8d8899b3ffd26d5049f8a9ccf12ff9ac65c352b4 Mon Sep 17 00:00:00 2001
 From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 Date: Wed, 3 Oct 2018 22:29:32 +0200
 Subject: [PATCH] comm.h needed for list_{display,generic}.o
@@ -12,15 +12,17 @@ Fixes:
 
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 [Upstream status: https://savannah.gnu.org/bugs/index.php?54776]
+[Julien: rebase on top of 4.9.1]
+Signed-off-by: Julien Olivain <ju.o@free.fr>
 ---
  Makefile.in | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/Makefile.in b/Makefile.in
-index af5938b..e6d5247 100644
+index 7082a3e..cd363b7 100644
 --- a/Makefile.in
 +++ b/Makefile.in
-@@ -265,7 +265,7 @@  braille.h
+@@ -349,7 +349,7 @@ layout.o: layout.h viewport.h canvas.h layout.c config.h screen.h os.h osdef.h a
  viewport.o: layout.h viewport.h canvas.h viewport.c config.h screen.h os.h osdef.h ansi.h acls.h \
   comm.h layer.h term.h image.h display.h window.h extern.h \
   braille.h
@@ -31,5 +33,5 @@ index af5938b..e6d5247 100644
  list_window.o: list_generic.h list_window.c window.h layer.h screen.h osdef.h comm.h
  
 -- 
-2.17.1
+2.41.0
 
diff --git a/package/screen/screen.hash b/package/screen/screen.hash
index a261d3100d..ef32eb0696 100644
--- a/package/screen/screen.hash
+++ b/package/screen/screen.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://ftp.gnu.org/gnu/screen/screen-4.9.0.tar.gz.sig
-sha256  f9335281bb4d1538ed078df78a20c2f39d3af9a4e91c57d084271e0289c730f4  screen-4.9.0.tar.gz
+# https://ftp.gnu.org/gnu/screen/screen-4.9.1.tar.gz.sig
+sha256  26cef3e3c42571c0d484ad6faf110c5c15091fbf872b06fa7aa4766c7405ac69  screen-4.9.1.tar.gz
 # Locally calculated
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/screen/screen.mk b/package/screen/screen.mk
index 3239a1c1f3..d4052b1191 100644
--- a/package/screen/screen.mk
+++ b/package/screen/screen.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SCREEN_VERSION = 4.9.0
+SCREEN_VERSION = 4.9.1
 SCREEN_SITE = $(BR2_GNU_MIRROR)/screen
 SCREEN_LICENSE = GPL-3.0+
 SCREEN_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
