Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 127C4C624DE
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 16:22:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D524C40BEC;
	Fri,  4 Sep 2026 16:22:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RHqXEWTw240r; Fri,  4 Sep 2026 16:22:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 6BA5040BF0
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788538971;
	b=RGHpuQsK1bFz158iJ5McWD1OC3cZw/dYtNHGd9jZ1YY+/97+rSS66k51Tl/M9JAdYvyc
	 Xa7kUPcS3XJOksv4lB35k+wnRxBnlieOP0DM/nUi66Y6TV2fzuSQ7NtlECZwHrU3nxDR1
	 DHbOk0KH3buvewN5q0KwFrg+VMXLirUKd+XQao4YwIFw2/kf0VAR1t8x6xYxtfiHv+Zc2
	 zNVM4jQg6zRgna1/Rkoh00PXAsoEGTV/4zGFFGPBrbuUgTayfHQotQeXHrNpBEUEIx+lm
	 UsIqcNodJrWI1XllGiJ5s3B5aMACwuv7PVtg6uyhs9yjPAYp3/xoL8glB2ISLOe970Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788538971;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=OBjfhyZGH7S4LzPm9/bZ2tWD3+T3Mv4RY78SfCzuJQg=;
	b=hlw+dMcQipR0tzB/6oTD2YtI7c/ncvXKBNLxT+hcdrfdHBXRCTJ3N2BBnDS7j2VUMezW
	 DmwQKTP4lwArL2wRDezJrpQdnp0O2tLRBfKYZyLk2L9CrktigPETVqbgsnURIcBy1uP3L
	 Gjk/q9x0KAw0bYTKOlZ3/Jg/c4T/6bLdd++BI1W+zA5kfW6GHDT6jCQaaUMo5zOTtoO/9
	 E6ufOauWCeL+FeTIkjBhSET+J9lAKJ7D4AkiEOSXh0ZavXPqMgupsBjoIKxJILBH6BI9c
	 Gs99MvgcJ0T8D0YONJFA1BvJDaAhhv72Ri5mdyM0J2U3FMmNldfLs6Kw9yt/CbNZUNw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788538971;
	bh=OBjfhyZGH7S4LzPm9/bZ2tWD3+T3Mv4RY78SfCzuJQg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=WHnVDmmJ87w+qzePF6GA4+dndQqwt7lHNFASP7ZPAI4Iq7KhTqTFi3PnywDYdgHRB
	 hft/Y94VrXs0GDsU62gstyJwJ/J3OneE6ZxFhm/B6722UHy/6ECOjU9GF8vNCFf+SW
	 eYGXxUpBpTSIOGEZrZXhaC2RNi17A/Te84o465AlpqMPKr0lkOlg9S2qZA2N3Mu2ib
	 /NUBNUn0SwYmZVne6BB6RxV0CHbe5BQ40gLFRdTKuvQ/0bNKe4Hz+WaYpEQ3EOSACs
	 CCGM8UojEVaoGF3faSNaosflxQ3/9tk5+Lr/nc9Z+u1/7Wpb4sVf+bmC+gWFC+5M7a
	 O8fzyn7IRVqSQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6BA5040BF0;
	Fri,  4 Sep 2026 16:22:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 473FE3893
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:22:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4440F40A61
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:22:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ytWkkL6KMHnU for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 16:22:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org B1F8140AFA
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788538927;
 b=Mn0fWxhawPOwzNUS9YX9CRFXfDG4q5ZApOpagRnn4BVr/d8ddhcDoqP5V4fFWAr4cnsM
 cszm2oy/xfYJfqLU/RqHfLbkILHg5Lku5BzTGEe2HFZKzcPWdM3SF76Hd6GIhZsnl5tGJ
 fLezAkiJPe5eheO2zFy3QvG+XbQxL8zId10OBQUwQDO07Qg4xRS+2Cc3RveG3R7o0RHCW
 eNeL2V6o0mhnECb9VompOy+vU2+II7x5hZvw5IzWrDAMnHfcaMyFyfjy+DkBYcsNHa1xM
 sPyb73P4XT188py9dLyLUje8mYbyiHtOO71tQirMimaxqX3uRZgSI6/pmMk7C5U3ZPQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788538927;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Q8B+2o8KEYQ1f0Nb7i6tVByGoqp1ZpnCh0x3zlq2YJs=;
 b=NQnFDMwJ2rNb9v1MfgFORkK37mdFrQHX5UZ3L9l5uExOwUVaY9CTv3fVFEcCNaTk//c5
 jARb54UaZUH+yFd/12CwIOH0x8bIsNreA8cvPx7MXUAdGjY7rbVCeLQAoV8X51o+V6xfF
 47Iz6RZ/3z8qpwtreX6xxcnsTJFMy9WmQIGuGhIIOpyFNT6UKOLcDvB/Ea8ZuIhssock5
 VC8MdWdA0UVsqpIzp91mraRNw/4esd4rE1KSSctw9c16Y23RYiocgfnqag7zUZXO/uPNj
 G8qiCWMhEMZZjAYeIvrgIq2LuOQ60Fq8FIZ+cWM2Uquf+NXheN+HlcRfLd1p/gR5e1w==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B1F8140AFA
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:22:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2FEBA94C40; Fri,  4 Sep 2026 16:21:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Aug 2026 00:15:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1982fdeaa4aa3d5656717bacffc4b1e78bfd6b26
X-Git-Newrev: ed881dfca758240ee304e5a042ffc3f7c47f31d2
X-Patchwork-Hint: ignore
Message-Id: <20260904162107.2FEBA94C40@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ser2net: bump version to 4.6.8
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ed881dfca758240ee304e5a042ffc3f7c47f31d2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Changelog: https://sourceforge.net/p/ser2net/news

Updated licenses hashes due to upstream commit:
https://github.com/cminyard/ser2net/commit/2bc83f09548dec25b0bec48e11a3ee1942fb3c3e

Drop patch 0001 that was a backport of a upstream security fix.

Add a upstream patch to fix build against uClibc.

Signed-off-by: Mattia Narducci <mattianarducci1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ck-to-crypt-when-crypt_r-is-not-available.patch | 140 +++++++++++++++++++++
 .../0001-Fix-authorization-path-handling.patch     |  89 -------------
 package/ser2net/Config.in                          |   1 +
 package/ser2net/ser2net.hash                       |   8 +-
 package/ser2net/ser2net.mk                         |   8 +-
 5 files changed, 152 insertions(+), 94 deletions(-)

diff --git a/package/ser2net/0001-Fallback-to-crypt-when-crypt_r-is-not-available.patch b/package/ser2net/0001-Fallback-to-crypt-when-crypt_r-is-not-available.patch
new file mode 100644
index 0000000000..a90095fd89
--- /dev/null
+++ b/package/ser2net/0001-Fallback-to-crypt-when-crypt_r-is-not-available.patch
@@ -0,0 +1,140 @@
+From 6af8ca88193b66b0309d9ca355d6c551e0fc1fbe Mon Sep 17 00:00:00 2001
+From: Mattia Narducci <mattianarducci1@gmail.com>
+Date: Fri, 14 Aug 2026 21:55:11 +0200
+Subject: [PATCH] Fallback to crypt() when crypt_r() is not available
+
+Use crypt(3) for hashed passwords on systems where libcrypt does not
+provide the reentrant crypt_r(3), eg. uClibc. Calls to crypt() are
+guarded by a global lock.
+
+Signed-off-by: Mattia Narducci <mattianarducci1@gmail.com>
+Signed-off-by: Corey Minyard <corey@minyard.net>
+
+Upstream: https://github.com/cminyard/ser2net/commit/6af8ca88193b66b0309d9ca355d6c551e0fc1fbe
+
+Signed-off-by: Mattia Narducci <mattianarducci1@gmail.com>
+---
+ auth.c       | 12 ++++++++++++
+ configure.ac | 11 ++++++-----
+ ser2net.c    | 14 ++++++++++++++
+ ser2net.h    |  4 ++++
+ 4 files changed, 36 insertions(+), 5 deletions(-)
+
+diff --git a/auth.c b/auth.c
+index 7e53069..1af057b 100644
+--- a/auth.c
++++ b/auth.c
+@@ -33,6 +33,10 @@
+ #include <gensio/gensio_list.h>
+ #include "ser2net.h"
+ 
++#ifndef HAVE_CRYPT_R
++#include <gensio/gensio_os_funcs_public.h>
++#endif
++
+ #if defined(USE_PAM)
+ #include <pwd.h>
+ #include <security/pam_appl.h>
+@@ -288,7 +292,9 @@ handle_password(struct gensio *net, const char *authdir, const char *password)
+     char readpw[256], *s;
+     int err;
+     bool hashed = true;
++#ifdef HAVE_CRYPT_R
+     struct crypt_data cdata;
++#endif
+     char *newhash;
+ 
+     len = sizeof(username);
+@@ -341,7 +347,13 @@ handle_password(struct gensio *net, const char *authdir, const char *password)
+ 	return GE_NOTSUP;
+     }
+ 
++#ifdef HAVE_CRYPT_R
+     newhash = crypt_r(password, readpw, &cdata);
++#else
++    gensio_os_funcs_lock(so, crypt_lock);
++    newhash = crypt(password, readpw);
++    gensio_os_funcs_unlock(so, crypt_lock);
++#endif
+     if (!newhash)
+ 	return GE_NOTSUP;
+ 
+diff --git a/configure.ac b/configure.ac
+index 1ac44f2..1814286 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -39,11 +39,12 @@ if test "x$use_pam" != "xno"; then
+     AC_DEFINE([USE_PAM], [], [Enable PAM support])
+ fi
+ 
+-have_crypt_r=no
+-AC_CHECK_LIB(crypt, crypt_r, [have_crypt_r=yes], [])
+-if test $have_crypt_r != "yes"; then
+-  AC_MSG_ERROR([No libcrypt with crypt_r()])
+-fi
++AC_CHECK_LIB(crypt, crypt_r,
++  [AC_DEFINE([HAVE_CRYPT_R], [1], [Define if you have crypt_r() in libcrypt])],
++  [AC_CHECK_LIB(crypt, crypt, [],
++    [AC_MSG_ERROR([No libcrypt with crypt_r() or crypt()])]
++  )]
++)
+ LIBS="$LIBS -lcrypt"
+ 
+ AC_ARG_WITH(sysfs-led-support,
+diff --git a/ser2net.c b/ser2net.c
+index 04cbb00..17e0c23 100644
+--- a/ser2net.c
++++ b/ser2net.c
+@@ -604,6 +604,9 @@ do_detach(void)
+ 
+ static struct gensio_lock *config_lock;
+ static struct gensio_lock *maint_lock;
++#ifndef HAVE_CRYPT_R
++struct gensio_lock *crypt_lock;
++#endif
+ 
+ static int in_config_read = 0;
+ 
+@@ -1011,6 +1014,14 @@ main(int argc, char *argv[])
+ 	return 1;
+     }
+ 
++#ifndef HAVE_CRYPT_R
++    crypt_lock = gensio_os_funcs_alloc_lock(so);
++    if (!crypt_lock) {
++	fprintf(stderr, "Could not alloc ser2net crypt lock\n");
++	return 1;
++    }
++#endif
++
+     err = init_dataxfer();
+     if (err) {
+ 	fprintf(stderr,
+@@ -1098,6 +1109,9 @@ main(int argc, char *argv[])
+     if (config_lines)
+ 	free(config_lines);
+ 
++#ifndef HAVE_CRYPT_R
++    gensio_os_funcs_free_lock(so, crypt_lock);
++#endif
+     gensio_os_funcs_free_lock(so, maint_lock);
+     gensio_os_funcs_free_lock(so, config_lock);
+     gensio_os_funcs_free(so);
+diff --git a/ser2net.h b/ser2net.h
+index 8bc9227..d9e361b 100644
+--- a/ser2net.h
++++ b/ser2net.h
+@@ -66,6 +66,10 @@ int sub_time(gensio_time *left, gensio_time *right);
+    integer was invalid.  Spaces are not handled. */
+ int scan_int(const char *str);
+ 
++#ifndef HAVE_CRYPT_R
++/* Used to avoid races in crypt() when crypt_r() is not available */
++extern struct gensio_lock *crypt_lock;
++#endif
+ /*
+  * Handle authorization events from accepters.
+  */
+-- 
+2.55.0
+
diff --git a/package/ser2net/0001-Fix-authorization-path-handling.patch b/package/ser2net/0001-Fix-authorization-path-handling.patch
deleted file mode 100644
index a90130844f..0000000000
--- a/package/ser2net/0001-Fix-authorization-path-handling.patch
+++ /dev/null
@@ -1,89 +0,0 @@
-From fa6c2a8840cbc8d7622e46ce12ba15ecc0fb51b7 Mon Sep 17 00:00:00 2001
-From: Corey Minyard <corey@minyard.net>
-Date: Thu, 23 Jul 2026 10:51:25 -0500
-Subject: [PATCH] Fix authorization path handling
-
-The username is received from the remote end and thus untrusted.  Make
-sure it doesn't have any characters that can cause it to escape the
-directory it is supposed to be in when constructing a path.
-
-Reported-by: TristanInSec
-Signed-off-by: Corey Minyard <corey@minyard.net>
-
-Upstream: https://github.com/cminyard/ser2net/commit/fa6c2a8840cbc8d7622e46ce12ba15ecc0fb51b7
-
-Signed-off-by: Mattia Narducci <mattianarducci1@gmail.com>
----
- auth.c | 42 ++++++++++++++++++++++++++++++++++++++----
- 1 file changed, 38 insertions(+), 4 deletions(-)
-
-diff --git a/auth.c b/auth.c
-index 95c80b4..53c3186 100644
---- a/auth.c
-+++ b/auth.c
-@@ -185,6 +185,40 @@ handle_auth_begin(struct gensio *net, const char *authdir, const char *pamauth,
-     return GE_NOTSUP;
- }
- 
-+/*
-+ * Construct a secure authorization path.
-+ *
-+ * filename must be at least MAX_PATH.
-+ *
-+ * "username" is untrusted, the rest of the data is trusted.
-+ */
-+static bool
-+construct_auth_path(char *filename, const char *authdir, const char *username,
-+		    const char *format, ...)
-+{
-+    size_t baselen;
-+    va_list ap;
-+
-+    /*
-+     * '/', '.', and '\' are all parts of things that can modify the base
-+     * path.  Don't allow them in usernames.
-+     */
-+    if (strchr(username, '.') || strchr(username, '/')
-+		|| strchr(username, '\\'))
-+	return false;
-+
-+    /* Get a good base path ending in / */
-+    baselen = snprintf(filename, PATH_MAX, "%s/%s/",
-+		       authdir, username);
-+
-+    /* Now append the rest of the path. */
-+    va_start(ap, format);
-+    vsnprintf(filename + baselen, PATH_MAX - baselen, format, ap);
-+    va_end(ap);
-+
-+    return true;
-+}
-+
- static int
- handle_precert(struct gensio *net, const char *authdir)
- {
-@@ -228,8 +262,8 @@ handle_precert(struct gensio *net, const char *authdir)
- 	}
-     }
- 
--    snprintf(filename, sizeof(filename), "%s/%s/allowed_certs/",
--	     authdir, s);
-+    if (!construct_auth_path(filename, authdir, s, "allowed_certs/"))
-+	return GE_AUTHREJECT;
-     err = gensio_control(net, 0, false, GENSIO_CONTROL_CERT_AUTH,
- 			 filename, &len);
-     if (err && err != GE_CERTNOTFOUND) {
-@@ -258,8 +292,8 @@ handle_password(struct gensio *net, const char *authdir, const char *password)
- 	return GE_AUTHREJECT;
-     }
- 
--    snprintf(filename, sizeof(filename), "%s/%s/password",
--	     authdir, username);
-+    if (!construct_auth_path(filename, authdir, username, "password"))
-+	return GE_AUTHREJECT;
-     pwfile = fopen(filename, "r");
-     if (!pwfile) {
- 	syslog(LOG_ERR, "Can't open password file %s: %s", filename,
--- 
-2.55.0
-
diff --git a/package/ser2net/Config.in b/package/ser2net/Config.in
index 87ace59deb..e3e8f051c8 100644
--- a/package/ser2net/Config.in
+++ b/package/ser2net/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_SER2NET
 	depends on !BR2_STATIC_LIBS # gensio
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC # gensio
 	select BR2_PACKAGE_GENSIO
+	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_LIBYAML
 	help
 	  Ser2net provides a way for a user to connect from a network
diff --git a/package/ser2net/ser2net.hash b/package/ser2net/ser2net.hash
index 50a2efdee8..19ced28655 100644
--- a/package/ser2net/ser2net.hash
+++ b/package/ser2net/ser2net.hash
@@ -1,6 +1,6 @@
 # From https://sourceforge.net/projects/ser2net/files/ser2net/
-md5  73b4ccc7e9d89034f1a1a20a780b9da9  ser2net-4.3.8.tar.gz
-sha1  d1597d88d154489cb08bac69bb1772712d30cbcd  ser2net-4.3.8.tar.gz
+md5  91594fb9c1d8e03a99a1739539919eba  ser2net-4.6.8.tar.gz
+sha1  ee8c12ce23ee3ebc54a845c2416bee0b6f4ea18c  ser2net-4.6.8.tar.gz
 # Locally computed:
-sha256  e5620975523059a38709bb53c0567600adbbcb8011066a2d2fe1b4db9efe0ba3  ser2net-4.3.8.tar.gz
-sha256  501f3108e6c03e5a0a5585ebaaa369171aead5319cd0a7a4dc1f66211c1f09f1  COPYING
+sha256  e651adcc4cc0d0ceaa36e5997dab9ea7f8aea732b4c87ba6018d2dcc88fbe8e3  ser2net-4.6.8.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/ser2net/ser2net.mk b/package/ser2net/ser2net.mk
index 679aaec29a..bd8f9dc399 100644
--- a/package/ser2net/ser2net.mk
+++ b/package/ser2net/ser2net.mk
@@ -4,11 +4,17 @@
 #
 ################################################################################
 
-SER2NET_VERSION = 4.3.8
+SER2NET_VERSION = 4.6.8
 SER2NET_SITE = https://downloads.sourceforge.net/project/ser2net/ser2net
 SER2NET_LICENSE = GPL-2.0+
 SER2NET_LICENSE_FILES = COPYING
 SER2NET_DEPENDENCIES = gensio libyaml
+# We are patching configure.ac
+SER2NET_AUTORECONF = YES
+
+ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
+SER2NET_DEPENDENCIES += libxcrypt
+endif
 
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
 SER2NET_CONF_OPTS += --with-pthreads
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
