Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 549ADC27C4F
	for <buildroot@archiver.kernel.org>; Sun, 30 Jun 2024 14:49:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C37E81126;
	Sun, 30 Jun 2024 14:49:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id stdnaVAvp3PE; Sun, 30 Jun 2024 14:49:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7696780F14
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7696780F14;
	Sun, 30 Jun 2024 14:49:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A0B861BF35A
 for <buildroot@lists.busybox.net>; Sun, 30 Jun 2024 14:49:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8E51A80F14
 for <buildroot@lists.busybox.net>; Sun, 30 Jun 2024 14:49:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aZsO3uaj0omH for <buildroot@lists.busybox.net>;
 Sun, 30 Jun 2024 14:49:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 776CF80F41
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 776CF80F41
 for <buildroot@buildroot.org>; Sun, 30 Jun 2024 14:49:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 33CFA836DF; Sun, 30 Jun 2024 14:49:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Jun 2024 16:43:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e0ea4c280c62245525500cc76f53d57b04b8d0a7
X-Git-Newrev: 93868c35e9829c13083fd7e954ac7e4909925758
X-Patchwork-Hint: ignore
Message-Id: <20240630144911.33CFA836DF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cgic: drop package
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=93868c35e9829c13083fd7e954ac7e4909925758
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The upstream site for cgic is now a parking/phishing site, so we can't
download cgic anymore.

The last version was 2.07, released 7 years ago, and nothing uses cgic
in Buildroot.

Drop the package.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: David Bender <codehero@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 .checkpackageignore                                |  3 --
 Config.in.legacy                                   |  6 +++
 DEVELOPERS                                         |  1 -
 package/Config.in                                  |  1 -
 package/cgic/0001-prepare_makefile.patch           | 44 -----------------
 package/cgic/0002-file_enhancements.patch          | 56 ----------------------
 .../0003-restore-cgiFormFileGetTempfileName.patch  | 43 -----------------
 package/cgic/Config.in                             |  6 ---
 package/cgic/cgic.hash                             |  3 --
 package/cgic/cgic.mk                               | 25 ----------
 10 files changed, 6 insertions(+), 182 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index ec95652000..b296451778 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -455,9 +455,6 @@ package/cdrkit/0001-no-rcmd.patch lib_patch.Upstream
 package/cdrkit/0002-define-__THROW-to-avoid-build-issue-with-musl.patch lib_patch.Upstream
 package/cdrkit/0003-Add-extern-to-char-outfile-declaration-to-fix-build-.patch lib_patch.Upstream
 package/cfm/S65cfm lib_sysv.Indent lib_sysv.Variables
-package/cgic/0001-prepare_makefile.patch lib_patch.Upstream
-package/cgic/0002-file_enhancements.patch lib_patch.Upstream
-package/cgic/0003-restore-cgiFormFileGetTempfileName.patch lib_patch.Upstream
 package/cgroupfs-mount/S30cgroupfs Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/chipmunk/0001-Fix-build-failure-on-musl.patch lib_patch.Upstream
 package/chocolate-doom/0001-Remove-redundant-demoextend-definition.patch lib_patch.Upstream
diff --git a/Config.in.legacy b/Config.in.legacy
index 29c386bec4..9dd5bdd2eb 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2024.08"
 
+config BR2_PACKAGE_CGIC
+	bool "cgic has been removed"
+	select BR2_LEGACY
+	help
+	  the cgic upstream no longer exists.
+
 config BR2_PACKAGE_VERSAL_FIRMWARE
 	bool "versal-firmware has been replaced by xilinx-prebuilt"
 	select BR2_TARGET_XILINX_PREBUILT
diff --git a/DEVELOPERS b/DEVELOPERS
index 8a5cceba78..6d9fcd97df 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -788,7 +788,6 @@ F:	package/libmnl/
 
 N:	David Bender <codehero@gmail.com>
 F:	package/benejson/
-F:	package/cgic/
 F:	package/freeradius-client/
 F:	package/openldap/
 
diff --git a/package/Config.in b/package/Config.in
index 550fdc1f41..48ef1a6fdc 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1948,7 +1948,6 @@ menu "Networking"
 	source "package/belle-sip/Config.in"
 	source "package/bluez5_utils-headers/Config.in"
 	source "package/c-ares/Config.in"
-	source "package/cgic/Config.in"
 	source "package/cni-plugins/Config.in"
 	source "package/cppzmq/Config.in"
 	source "package/curlpp/Config.in"
diff --git a/package/cgic/0001-prepare_makefile.patch b/package/cgic/0001-prepare_makefile.patch
deleted file mode 100644
index 15adc4cda2..0000000000
--- a/package/cgic/0001-prepare_makefile.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-Makefile: fix for cross-compilation
-
-Probably-Signed-off-by: Dave Bender <bender@benegon.com>
-[yann.morin.1998@free.fr: patch was made by Dave, but he
- forgot his SoB line, so I added it]
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-diff -rupN cgic206/Makefile cgic206-br/Makefile
---- cgic206/Makefile	2014-03-16 18:17:11.000000000 -0400
-+++ cgic206-br/Makefile	2015-01-16 11:18:03.714874000 -0500
-@@ -1,15 +1,14 @@
--CFLAGS=-g -Wall
--CC=gcc
--AR=ar
--RANLIB=ranlib
- LIBS=-L./ -lcgic
- 
- all: libcgic.a cgictest.cgi capture
- 
- install: libcgic.a
--	cp libcgic.a /usr/local/lib
--	cp cgic.h /usr/local/include
--	@echo libcgic.a is in /usr/local/lib. cgic.h is in /usr/local/include.
-+	cp libcgic.a $(PREFIX)/usr/lib
-+	cp cgic.h $(PREFIX)/usr/include
-+	@echo libcgic.a is in $(PREFIX)/usr/lib. cgic.h is in $(PREFIX)/usr/include.
-+
-+cgi.o: cgic.c cgic.h
-+	$(CC) $(CFLAGS) cgic.c -o cgic.o
- 
- libcgic.a: cgic.o cgic.h
- 	rm -f libcgic.a
-@@ -19,10 +18,10 @@ libcgic.a: cgic.o cgic.h
- #mingw32 and cygwin users: replace .cgi with .exe
- 
- cgictest.cgi: cgictest.o libcgic.a
--	gcc cgictest.o -o cgictest.cgi ${LIBS}
-+	$(CC) cgictest.o -o cgictest.cgi ${LIBS}
- 
- capture: capture.o libcgic.a
--	gcc capture.o -o capture ${LIBS}
-+	$(CC) capture.o -o capture ${LIBS}
- 
- clean:
- 	rm -f *.o *.a cgictest.cgi capture
diff --git a/package/cgic/0002-file_enhancements.patch b/package/cgic/0002-file_enhancements.patch
deleted file mode 100644
index a6f82fce33..0000000000
--- a/package/cgic/0002-file_enhancements.patch
+++ /dev/null
@@ -1,56 +0,0 @@
-Create better temporary files.
-
-Probably-Signed-off-by: Dave Bender <bender@benegon.com>
-[yann.morin.1998@free.fr: patch was made by Dave, but he
- forgot his SoB line, so I added it; split the patch in two
-  independent fixes]
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-
-diff -rupN cgic206/cgic.c cgic206_tempfile/cgic.c
---- cgic206/cgic.c	2014-03-16 18:17:11.000000000 -0400
-+++ cgic206_tempfile/cgic.c	2015-01-21 11:58:45.436384908 -0500
-@@ -22,6 +22,8 @@
- #define CGICDEBUGEND
- #endif /* CGICDEBUG */
- 
-+#define _GNU_SOURCE
-+
- #include <stdio.h>
- #include <string.h>
- #include <ctype.h>
-@@ -34,11 +36,11 @@
- #include <io.h>
- 
- /* cgic 2.01 */
--#include <fcntl.h>
- 
- #else
- #include <unistd.h>
- #endif /* WIN32 */
-+#include <fcntl.h>
- #include "cgic.h"
- 
- #define cgiStrEq(a, b) (!strcmp((a), (b)))
-@@ -636,16 +638,17 @@ static cgiParseResultType getTempFileNam
- 		window between the file's creation and the
- 		chmod call (glibc 2.0.6 and lower might
- 		otherwise have allowed this). */
-+	mode_t umode;
- 	int outfd; 
-+	umode = umask(0600);
- 	strcpy(tfileName, cgicTempDir "/cgicXXXXXX");
--	outfd = mkstemp(tfileName);
-+	outfd = mkostemp(tfileName, O_CLOEXEC | O_NOATIME);
-+	umask(umode);
- 	if (outfd == -1) {
- 		return cgiParseIO;
- 	}
--	close(outfd);
--	/* Fix the permissions */
--	if (chmod(tfileName, 0600) != 0) {
--		unlink(tfileName);
-+
-+	if (close(outfd)) {
- 		return cgiParseIO;
- 	}
- #else
diff --git a/package/cgic/0003-restore-cgiFormFileGetTempfileName.patch b/package/cgic/0003-restore-cgiFormFileGetTempfileName.patch
deleted file mode 100644
index f66227b6a6..0000000000
--- a/package/cgic/0003-restore-cgiFormFileGetTempfileName.patch
+++ /dev/null
@@ -1,43 +0,0 @@
-Restore lost functionality
-
-Probably-Signed-off-by: Dave Bender <bender@benegon.com>
-[yann.morin.1998@free.fr: patch was made by Dave, but he
- forgot his SoB line, so I added it]
-Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
-
-diff -rupN cgic206/cgic.c cgic206_tempfile/cgic.c
---- cgic206/cgic.c	2014-03-16 18:17:11.000000000 -0400
-+++ cgic206_tempfile/cgic.c	2015-01-21 11:58:45.436384908 -0500
-@@ -1278,6 +1278,20 @@ cgiFormResultType cgiFormFileContentType
- 	}
- }
- 
-+const char* cgiFormFileGetTempfileName(
-+	char* name)
-+{
-+	cgiFormEntry *e;
-+	e = cgiFormEntryFindFirst(name);
-+	if (!e) {
-+		return NULL;
-+	} else if (!strlen(e->tfileName)) {
-+		return NULL;
-+	} else {
-+		return e->tfileName;
-+	}
-+}
-+
- cgiFormResultType cgiFormFileSize(
- 	char *name, int *sizeP)
- {
-diff -rupN cgic206/cgic.h cgic206_tempfile/cgic.h
---- cgic206/cgic.h	2014-03-16 18:17:11.000000000 -0400
-+++ cgic206_tempfile/cgic.h	2015-01-21 11:53:02.915148026 -0500
-@@ -141,6 +141,8 @@ extern cgiFormResultType cgiFormRadio(
- 	char *name, char **valuesText, int valuesTotal, 
- 	int *result, int defaultV);	
- 
-+extern const char* cgiFormFileGetTempfileName(char* name);
-+
- /* The paths returned by this function are the original names of files
- 	as reported by the uploading web browser and shoult NOT be
- 	blindly assumed to be "safe" names for server-side use! */
diff --git a/package/cgic/Config.in b/package/cgic/Config.in
deleted file mode 100644
index 402460d039..0000000000
--- a/package/cgic/Config.in
+++ /dev/null
@@ -1,6 +0,0 @@
-config BR2_PACKAGE_CGIC
-	bool "cgic"
-	help
-	  C CGI library
-
-	  http://www.boutell.com/cgic/
diff --git a/package/cgic/cgic.hash b/package/cgic/cgic.hash
deleted file mode 100644
index 2c68067128..0000000000
--- a/package/cgic/cgic.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally computed
-sha256  1e8834642a4b89528bb7bde2f287e133c6b07e210e68681a34137c436d59d320  cgic207.tar.gz
-sha256  6a7de92593d64dbf7630d8f66f97e04a899769bef1e055f2434bc06b87b9de62  license.txt
diff --git a/package/cgic/cgic.mk b/package/cgic/cgic.mk
deleted file mode 100644
index cd0841302d..0000000000
--- a/package/cgic/cgic.mk
+++ /dev/null
@@ -1,25 +0,0 @@
-################################################################################
-#
-# cgic
-#
-################################################################################
-
-CGIC_VERSION = 2.07
-CGIC_SOURCE = cgic207.tar.gz
-CGIC_SITE = http://boutell.com/cgic
-CGIC_LICENSE = Custom
-CGIC_LICENSE_FILES = license.txt
-
-# Installs only a static library and a header file
-CGIC_INSTALL_STAGING = YES
-CGIC_INSTALL_TARGET = NO
-
-define CGIC_BUILD_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) libcgic.a
-endef
-
-define CGIC_INSTALL_STAGING_CMDS
-	$(TARGET_CONFIGURE_OPTS) $(MAKE) PREFIX=$(STAGING_DIR) -C $(@D) install
-endef
-
-$(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
