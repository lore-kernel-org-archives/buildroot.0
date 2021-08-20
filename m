Return-Path: <SRS0=3r6m=NL=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12D83C4338F
	for <buildroot@archiver.kernel.org>; Fri, 20 Aug 2021 08:00:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 969B9610A3
	for <buildroot@archiver.kernel.org>; Fri, 20 Aug 2021 08:00:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 969B9610A3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5CCE14051E;
	Fri, 20 Aug 2021 08:00:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hVqABL4ipAtN; Fri, 20 Aug 2021 08:00:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 61E2340528;
	Fri, 20 Aug 2021 08:00:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 594201BF3A6
 for <buildroot@lists.busybox.net>; Fri, 20 Aug 2021 08:00:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 542624070F
 for <buildroot@lists.busybox.net>; Fri, 20 Aug 2021 08:00:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KrY6TsqY3pxp for <buildroot@lists.busybox.net>;
 Fri, 20 Aug 2021 07:59:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5D65440631
 for <buildroot@buildroot.org>; Fri, 20 Aug 2021 07:59:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 03A298D6B1; Fri, 20 Aug 2021 07:59:13 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 20 Aug 2021 09:55:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6aa318d91e66731d66dca485c4c30391fe0e2423
X-Git-Newrev: 66eb8cd0fb8de2f033ba03a57e82a64f49f6eff6
X-Patchwork-Hint: ignore
Message-Id: <20210820075913.03A298D6B1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mcrypt: drop package
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
Content-Type: multipart/mixed; boundary="===============0339404875891394271=="
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

--===============0339404875891394271==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=66eb8cd0fb8de2f033ba03a57e82a64f49f6eff6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop mcrypt which is a cryptographic package that is not maintained
anymore. Here is an extract of https://en.wikipedia.org/wiki/Mcrypt:
"The last update to libmcrypt was in 2007, despite years of unmerged
patches. These facts have led security experts to declare mcrypt
abandonware and discourage its use in new development."

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Config.in.legacy                        | 10 ++++
 package/Config.in                       |  1 -
 package/mcrypt/0001-CVE-2012-4409.patch | 25 ---------
 package/mcrypt/0002-CVE-2012-4426.patch | 35 ------------
 package/mcrypt/0003-CVE-2012-4527.patch | 99 ---------------------------------
 package/mcrypt/0004-no-rpath.patch      | 17 ------
 package/mcrypt/Config.in                | 12 ----
 package/mcrypt/mcrypt.hash              |  3 -
 package/mcrypt/mcrypt.mk                | 24 --------
 9 files changed, 10 insertions(+), 216 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 54476acf9a..7cb0c40782 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,16 @@ endif
 
 comment "Legacy options removed in 2021.08"
 
+config BR2_PACKAGE_MCRYPT
+	bool "mcrypt package was removed"
+	select BR2_LEGACY
+	help
+	  This package has been removed as "the last update to libmcrypt
+	  was in 2007, despite years of unmerged patches. These facts
+	  have led security experts to declare mcrypt abandonware and
+	  discourage its use in new development" (extract from
+	  https://en.wikipedia.org/wiki/Mcrypt).
+
 config BR2_PACKAGE_PHP_EXT_MCRYPT
 	bool "PHP mcrypt extension removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 046c04e994..6fcdcc38d7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2065,7 +2065,6 @@ menu "Miscellaneous"
 	source "package/gsettings-desktop-schemas/Config.in"
 	source "package/haveged/Config.in"
 	source "package/linux-syscall-support/Config.in"
-	source "package/mcrypt/Config.in"
 	source "package/mobile-broadband-provider-info/Config.in"
 	source "package/netdata/Config.in"
 	source "package/proj/Config.in"
diff --git a/package/mcrypt/0001-CVE-2012-4409.patch b/package/mcrypt/0001-CVE-2012-4409.patch
deleted file mode 100644
index 97c658bb2d..0000000000
--- a/package/mcrypt/0001-CVE-2012-4409.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From 3efb40e17ce4f76717ae17a1ce1e1f747ddf59fd Mon Sep 17 00:00:00 2001
-From: Alon Bar-Lev <alon.barlev@gmail.com>
-Date: Sat, 22 Dec 2012 22:37:06 +0200
-Subject: [PATCH] cleanup: buffer overflow
-
----
- src/extra.c |    2 ++
- 1 files changed, 2 insertions(+), 0 deletions(-)
-
-diff --git a/src/extra.c b/src/extra.c
-index 3082f82..c7a1ac0 100644
---- a/src/extra.c
-+++ b/src/extra.c
-@@ -241,6 +241,8 @@ int check_file_head(FILE * fstream, char *algorithm, char *mode,
- 		if (m_getbit(6, flags) == 1) { /* if the salt bit is set */
- 			if (m_getbit(0, sflag) != 0) { /* if the first bit is set */
- 				*salt_size = m_setbit(0, sflag, 0);
-+				if (*salt_size > sizeof(tmp_buf))
-+					err_quit(_("Salt is too long\n"));
- 				if (*salt_size > 0) {
- 					fread(tmp_buf, 1, *salt_size,
- 					      fstream);
--- 
-1.7.8.6
-
diff --git a/package/mcrypt/0002-CVE-2012-4426.patch b/package/mcrypt/0002-CVE-2012-4426.patch
deleted file mode 100644
index 708d4a579e..0000000000
--- a/package/mcrypt/0002-CVE-2012-4426.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-Patch taken from gentoo.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
---- a/src/errors.c
-+++ b/src/errors.c
-@@ -25,24 +25,24 @@
- 
- void err_quit(char *errmsg)
- {
--	fprintf(stderr, errmsg);
-+	fprintf(stderr, "%s", errmsg);
- 	exit(-1);
- }
- 
- void err_warn(char *errmsg)
- {
- 	if (quiet <= 1)
--		fprintf(stderr, errmsg);
-+		fprintf(stderr, "%s", errmsg);
- }
- 
- void err_info(char *errmsg)
- {
- 	if (quiet == 0)
--		fprintf(stderr, errmsg);
-+		fprintf(stderr, "%s", errmsg);
- }
- 
- void err_crit(char *errmsg)
- {
- 	if (quiet <= 2)
--		fprintf(stderr, errmsg);
-+		fprintf(stderr, "%s", errmsg);
- }
diff --git a/package/mcrypt/0003-CVE-2012-4527.patch b/package/mcrypt/0003-CVE-2012-4527.patch
deleted file mode 100644
index a8cf6f449a..0000000000
--- a/package/mcrypt/0003-CVE-2012-4527.patch
+++ /dev/null
@@ -1,99 +0,0 @@
-Fix for CVE-2012-4527.
-Authored by Attila Bogar and Jean-Michel Vourgère <jmv_deb@nirgal.com>
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff -Nura mcrypt-2.6.8.orig/src/mcrypt.c mcrypt-2.6.8/src/mcrypt.c
---- mcrypt-2.6.8.orig/src/mcrypt.c	2013-01-14 19:15:49.465925072 -0300
-+++ mcrypt-2.6.8/src/mcrypt.c	2013-01-14 19:28:13.711478000 -0300
-@@ -44,7 +44,9 @@
- static char rcsid[] =
-     "$Id: mcrypt.c,v 1.2 2007/11/07 17:10:21 nmav Exp $";
- 
--char tmperr[128];
-+/* Temporary error message can contain one file name and 1k of text */
-+#define ERRWIDTH ((PATH_MAX)+1024)
-+char tmperr[ERRWIDTH];
- unsigned int stream_flag = FALSE;
- char *keymode = NULL;
- char *mode = NULL;
-@@ -482,7 +484,7 @@
- #ifdef HAVE_STAT
-       if (stream_flag == FALSE) {
- 	 if (is_normal_file(file[i]) == FALSE) {
--	    sprintf(tmperr,
-+	    snprintf(tmperr, ERRWIDTH,
- 		    _
- 		    ("%s: %s is not a regular file. Skipping...\n"),
- 		    program_name, file[i]);
-@@ -501,7 +503,7 @@
- 	    dinfile = file[i];
- 	 if ((isatty(fileno((FILE *) (stdin))) == 1)
- 	     && (stream_flag == TRUE) && (force == 0)) {	/* not a tty */
--	    sprintf(tmperr,
-+	    snprintf(tmperr, ERRWIDTH,
- 		    _
- 		    ("%s: Encrypted data will not be read from a terminal.\n"),
- 		    program_name);
-@@ -520,7 +522,7 @@
- 	    einfile = file[i];
- 	 if ((isatty(fileno((FILE *) (stdout))) == 1)
- 	     && (stream_flag == TRUE) && (force == 0)) {	/* not a tty */
--	    sprintf(tmperr,
-+	    snprintf(tmperr, ERRWIDTH,
- 		    _
- 		    ("%s: Encrypted data will not be written to a terminal.\n"),
- 		    program_name);
-@@ -544,7 +546,7 @@
- 	    strcpy(outfile, einfile);
- 	    /* if file has already the .nc ignore it */
- 	    if (strstr(outfile, ".nc") != NULL) {
--	       sprintf(tmperr,
-+	       snprintf(tmperr, ERRWIDTH,
- 		       _
- 		       ("%s: file %s has the .nc suffix... skipping...\n"),
- 		       program_name, outfile);
-@@ -590,10 +592,10 @@
- 
- 	 if (x == 0) {
- 	    if (stream_flag == FALSE) {
--	       sprintf(tmperr, _("File %s was decrypted.\n"), dinfile);
-+	       snprintf(tmperr, ERRWIDTH, _("File %s was decrypted.\n"), dinfile);
- 	       err_warn(tmperr);
- 	    } else {
--	       sprintf(tmperr, _("Stdin was decrypted.\n"));
-+	       snprintf(tmperr, ERRWIDTH, _("Stdin was decrypted.\n"));
- 	       err_warn(tmperr);
- 	    }
- #ifdef HAVE_STAT
-@@ -610,7 +612,7 @@
- 
- 	 } else {
- 	    if (stream_flag == FALSE) {
--	       sprintf(tmperr,
-+	       snprintf(tmperr, ERRWIDTH,
- 		       _
- 		       ("File %s was NOT decrypted successfully.\n"),
- 		       dinfile);
-@@ -636,10 +638,10 @@
- 
- 	 if (x == 0) {
- 	    if (stream_flag == FALSE) {
--	       sprintf(tmperr, _("File %s was encrypted.\n"), einfile);
-+	       snprintf(tmperr, ERRWIDTH, _("File %s was encrypted.\n"), einfile);
- 	       err_warn(tmperr);
- 	    } else {
--	       sprintf(tmperr, _("Stdin was encrypted.\n"));
-+	       snprintf(tmperr, ERRWIDTH, _("Stdin was encrypted.\n"));
- 	       err_warn(tmperr);
- 	    }
- #ifdef HAVE_STAT
-@@ -655,7 +657,7 @@
- 
- 	 } else {
- 	    if (stream_flag == FALSE) {
--	       sprintf(tmperr,
-+	       snprintf(tmperr, ERRWIDTH,
- 		       _
- 		       ("File %s was NOT encrypted successfully.\n"),
- 		       einfile);
diff --git a/package/mcrypt/0004-no-rpath.patch b/package/mcrypt/0004-no-rpath.patch
deleted file mode 100644
index a0813bcf00..0000000000
--- a/package/mcrypt/0004-no-rpath.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-Patch out rpath hardcoding since it completely ignores --disable-rpath
-and other configure ways.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff -Nura mcrypt-2.6.8.orig/config.rpath mcrypt-2.6.8/config.rpath
---- mcrypt-2.6.8.orig/config.rpath	2013-01-07 13:05:22.626883480 -0300
-+++ mcrypt-2.6.8/config.rpath	2013-01-07 13:12:47.196090608 -0300
-@@ -153,7 +153,7 @@
-   # here allows them to be overridden if necessary.
-   # Unlike libtool, we use -rpath here, not --rpath, since the documented
-   # option of GNU ld is called -rpath, not --rpath.
--  hardcode_libdir_flag_spec='${wl}-rpath ${wl}$libdir'
-+  hardcode_libdir_flag_spec=
-   case "$host_os" in
-     aix3* | aix4* | aix5*)
-       # On AIX/PPC, the GNU linker is very broken
diff --git a/package/mcrypt/Config.in b/package/mcrypt/Config.in
deleted file mode 100644
index e3b9541f04..0000000000
--- a/package/mcrypt/Config.in
+++ /dev/null
@@ -1,12 +0,0 @@
-config BR2_PACKAGE_MCRYPT
-	bool "mcrypt"
-	depends on BR2_USE_MMU # fork()
-	select BR2_PACKAGE_LIBMCRYPT
-	select BR2_PACKAGE_LIBMHASH
-	help
-	  MCrypt is a replacement for the old crypt() package and
-	  crypt(1) command, with extensions.
-	  It allows developers to use a wide range of encryption
-	  functions, without making drastic changes to their code.
-
-	  http://mcrypt.sourceforge.net/
diff --git a/package/mcrypt/mcrypt.hash b/package/mcrypt/mcrypt.hash
deleted file mode 100644
index c6c8871f4f..0000000000
--- a/package/mcrypt/mcrypt.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally computed:
-sha256  5145aa844e54cca89ddab6fb7dd9e5952811d8d787c4f4bf27eb261e6c182098  mcrypt-2.6.8.tar.gz
-sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/mcrypt/mcrypt.mk b/package/mcrypt/mcrypt.mk
deleted file mode 100644
index a04b973750..0000000000
--- a/package/mcrypt/mcrypt.mk
+++ /dev/null
@@ -1,24 +0,0 @@
-################################################################################
-#
-# mcrypt
-#
-################################################################################
-
-MCRYPT_VERSION = 2.6.8
-MCRYPT_SITE = http://downloads.sourceforge.net/project/mcrypt/MCrypt/$(MCRYPT_VERSION)
-MCRYPT_DEPENDENCIES = libmcrypt libmhash \
-	$(if $(BR2_PACKAGE_ZLIB),zlib) \
-	$(if $(BR2_PACKAGE_LIBICONV),libiconv) \
-	$(TARGET_NLS_DEPENDENCIES)
-MCRYPT_CONF_OPTS = --with-libmcrypt-prefix=$(STAGING_DIR)/usr
-MCRYPT_LICENSE = GPL-3.0
-MCRYPT_LICENSE_FILES = COPYING
-
-# 0001-CVE-2012-4409.patch
-MCRYPT_IGNORE_CVES += CVE-2012-4409
-# 0002-CVE-2012-4426.patch
-MCRYPT_IGNORE_CVES += CVE-2012-4426
-# 0003-CVE-2012-4527.patch
-MCRYPT_IGNORE_CVES += CVE-2012-4527
-
-$(eval $(autotools-package))

--===============0339404875891394271==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--===============0339404875891394271==--
