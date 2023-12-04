Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB4BCC4167B
	for <buildroot@archiver.kernel.org>; Mon,  4 Dec 2023 21:10:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 827AA400BA;
	Mon,  4 Dec 2023 21:10:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 827AA400BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h6hRF9OnplN8; Mon,  4 Dec 2023 21:10:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 913B14011A;
	Mon,  4 Dec 2023 21:10:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 913B14011A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 43BB41BF30E
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 21:10:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1C74F60B25
 for <buildroot@lists.busybox.net>; Mon,  4 Dec 2023 21:10:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C74F60B25
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CQApJzxOwREu for <buildroot@lists.busybox.net>;
 Mon,  4 Dec 2023 21:10:18 +0000 (UTC)
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DE26760B09
 for <buildroot@buildroot.org>; Mon,  4 Dec 2023 21:10:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE26760B09
Received: from fli4l.lan.fli4l (p4fd6c4a5.dip0.t-ipconnect.de [79.214.196.165])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B8C5AA4C0C51;
 Mon,  4 Dec 2023 22:10:14 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:52546)
 by fli4l.lan.fli4l with esmtp (Exim 4.96.2)
 (envelope-from <bernd@kuhls.net>) id 1rAGCj-00062p-1a;
 Mon, 04 Dec 2023 22:10:13 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon,  4 Dec 2023 22:10:13 +0100
Message-Id: <20231204211013.12452-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1701724214;
 bh=uEtmqNdHKVwac0MIlSM9bAGVObksUzTEMxoxBOgY6ms=;
 h=From:To:Cc:Subject:Date:From;
 b=cgCL7WkrNYcDCIMYxO6Zbc7pj//jj1BUraObCSaN1icfaM9JV80GkQKm2KKi9UkHb
 1QULuYBmLN+EO356VB0DCE/JgBIYtw6mHQJM9zdQgGhf817fvrsU+9JM2H7hsO0TL2
 CLnkEbOrXwfRA5NlATJ7iGlvt4/Jx2IguVfrgzTEHyoyo7lln7Yg5LvW9LcnrRhilB
 L2NIGpBAoF1+z96JTDQowpXCKwUaX2nrnEj/DBHJq31RHq3q1N9lZTk2c1HZV76Tyc
 xbH74WEIwLkI3uaPeNGUq0xbbJLqdqWjNY2zf7YQdcM8/MR8e02XvFvWp6gz1VopOd
 QUuic4Xb1eggg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=cgCL7Wkr
Subject: [Buildroot] [PATCH 1/1] package/exim: bump version to 4.97
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
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Removed patches which are included in this release:
https://git.exim.org/exim.git/commitdiff/4e9ed49f8f12eb331b29bd5b6dc3693c520fddc2
https://git.exim.org/exim.git/commitdiff/d8ecc7bf97934a1e2244788c610c958cacd740bd
https://git.exim.org/exim.git/commitdiff/158dff9936e36a2d31d037d3988b9353458d6471
https://git.exim.org/exim.git/commitdiff/32da6327e434e986a18b75a84f2d8c687ba14619

Added upstream patch to fix build error.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .checkpackageignore                           |   4 -
 ...Fix-regex-n-use-after-free.-Bug-2915.patch | 173 ------------------
 .../0006-OpenSSL-fix-non-DANE-build.patch     |  28 +++
 ...0007-Fix-non-WITH_CONTENT_SCAN-build.patch |  61 ------
 ...08-Fix-non-WITH_CONTENT_SCAN-build-2.patch | 139 --------------
 ...09-Fix-non-WITH_CONTENT_SCAN-build-3.patch |  49 -----
 package/exim/exim.hash                        |   4 +-
 package/exim/exim.mk                          |   2 +-
 8 files changed, 31 insertions(+), 429 deletions(-)
 delete mode 100644 package/exim/0006-Fix-regex-n-use-after-free.-Bug-2915.patch
 create mode 100644 package/exim/0006-OpenSSL-fix-non-DANE-build.patch
 delete mode 100644 package/exim/0007-Fix-non-WITH_CONTENT_SCAN-build.patch
 delete mode 100644 package/exim/0008-Fix-non-WITH_CONTENT_SCAN-build-2.patch
 delete mode 100644 package/exim/0009-Fix-non-WITH_CONTENT_SCAN-build-3.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index de9a8a5d28..6c959335ed 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -389,10 +389,6 @@ package/exim/0002-Don-t-make-backup-copies-of-installed-files.patch Upstream
 package/exim/0003-Skip-version-check-and-symlink-installation.patch Upstream
 package/exim/0004-exim_lock-fix-lstat-related-build-errors.patch Upstream
 package/exim/0005-sieve-fix-build-errors.patch Upstream
-package/exim/0006-Fix-regex-n-use-after-free.-Bug-2915.patch Upstream
-package/exim/0007-Fix-non-WITH_CONTENT_SCAN-build.patch Upstream
-package/exim/0008-Fix-non-WITH_CONTENT_SCAN-build-2.patch Upstream
-package/exim/0009-Fix-non-WITH_CONTENT_SCAN-build-3.patch Upstream
 package/exim/S86exim Indent Variables
 package/expect/0001-enable-cross-compilation.patch Upstream
 package/expect/0002-allow-tcl-build-directory.patch Upstream
diff --git a/package/exim/0006-Fix-regex-n-use-after-free.-Bug-2915.patch b/package/exim/0006-Fix-regex-n-use-after-free.-Bug-2915.patch
deleted file mode 100644
index 57fa189b04..0000000000
--- a/package/exim/0006-Fix-regex-n-use-after-free.-Bug-2915.patch
+++ /dev/null
@@ -1,173 +0,0 @@
-From 4e9ed49f8f12eb331b29bd5b6dc3693c520fddc2 Mon Sep 17 00:00:00 2001
-From: Jeremy Harris <jgh146exb@wizmail.org>
-Date: Wed, 31 Aug 2022 15:37:40 +0100
-Subject: [PATCH] Fix $regex<n> use-after-free.  Bug 2915
-
-[Upstream: https://sources.debian.org/data/main/e/exim4/4.96-9/debian/patches/75_08-Fix-regex-n-use-after-free.-Bug-2915.patch]
-[Peter: drop Changelog hunk]
-Signed-off-by: Peter Korsgaard <peter@korsgard.com>
----
- src/exim.c                  |  4 +---
- src/expand.c                |  2 +-
- src/functions.h             |  1 +
- src/globals.c               |  2 +-
- src/regex.c                 | 29 ++++++++++++++++++-----------
- src/smtp_in.c               |  2 ++
- test/confs/4002                 | 10 ++++++++++
- test/mail/4002.userx            |  7 +++++++
- test/scripts/4000-scanning/4002 |  7 +++++++
- 9 files changed, 53 insertions(+), 17 deletions(-)
-
---- a/src/exim.c
-+++ b/src/exim.c
-@@ -1999,12 +1999,10 @@
- 
- regex_whitelisted_macro =
-   regex_must_compile(US"^[A-Za-z0-9_/.-]*$", FALSE, TRUE);
- #endif
- 
--for (i = 0; i < REGEX_VARS; i++) regex_vars[i] = NULL;
--
- /* If the program is called as "mailq" treat it as equivalent to "exim -bp";
- this seems to be a generally accepted convention, since one finds symbolic
- links called "mailq" in standard OS configurations. */
- 
- if ((namelen == 5 && Ustrcmp(argv[0], "mailq") == 0) ||
-@@ -6082,11 +6080,11 @@
-   callout_address = NULL;
-   sending_ip_address = NULL;
-   deliver_localpart_data = deliver_domain_data =
-   recipient_data = sender_data = NULL;
-   acl_var_m = NULL;
--  for(int i = 0; i < REGEX_VARS; i++) regex_vars[i] = NULL;
-+  regex_vars_clear();
- 
-   store_reset(reset_point);
-   }
- 
- exim_exit(EXIT_SUCCESS);   /* Never returns */
---- a/src/expand.c
-+++ b/src/expand.c
-@@ -1871,11 +1871,11 @@
-   {
-   tree_node * node = tree_search(router_var, name + 2);
-   return node ? node->data.ptr : strict_acl_vars ? NULL : US"";
-   }
- 
--/* Handle $auth<n> variables. */
-+/* Handle $auth<n>, $regex<n> variables. */
- 
- if (Ustrncmp(name, "auth", 4) == 0)
-   {
-   uschar *endptr;
-   int n = Ustrtoul(name + 4, &endptr, 10);
---- a/src/functions.h
-+++ b/src/functions.h
-@@ -436,10 +436,11 @@
- extern int     regex(const uschar **);
- #endif
- extern BOOL    regex_match(const pcre2_code *, const uschar *, int, uschar **);
- extern BOOL    regex_match_and_setup(const pcre2_code *, const uschar *, int, int);
- extern const pcre2_code *regex_must_compile(const uschar *, BOOL, BOOL);
-+extern void    regex_vars_clear(void);
- extern void    retry_add_item(address_item *, uschar *, int);
- extern BOOL    retry_check_address(const uschar *, host_item *, uschar *, BOOL,
-                  uschar **, uschar **);
- extern retry_config *retry_find_config(const uschar *, const uschar *, int, int);
- extern BOOL    retry_ultimate_address_timeout(uschar *, const uschar *,
---- a/src/globals.c
-+++ b/src/globals.c
-@@ -1313,11 +1313,11 @@
- #ifndef DISABLE_PIPE_CONNECT
- const pcre2_code *regex_EARLY_PIPE   = NULL;
- #endif
- const pcre2_code *regex_ismsgid      = NULL;
- const pcre2_code *regex_smtp_code    = NULL;
--const uschar *regex_vars[REGEX_VARS];
-+const uschar *regex_vars[REGEX_VARS] = { 0 };;
- #ifdef WHITELIST_D_MACROS
- const pcre2_code *regex_whitelisted_macro = NULL;
- #endif
- #ifdef WITH_CONTENT_SCAN
- uschar *regex_match_string     = NULL;
---- a/src/regex.c
-+++ b/src/regex.c
-@@ -94,22 +94,32 @@
-   }
- pcre2_match_data_free(md);
- return FAIL;
- }
- 
-+
-+/* reset expansion variables */
-+void
-+regex_vars_clear(void)
-+{
-+regex_match_string = NULL;
-+for (int i = 0; i < REGEX_VARS; i++) regex_vars[i] = NULL;
-+}
-+
-+
-+
- int
--regex(const uschar **listptr)
-+regex(const uschar ** listptr)
- {
- unsigned long mbox_size;
--FILE *mbox_file;
--pcre_list *re_list_head;
--uschar *linebuffer;
-+FILE * mbox_file;
-+pcre_list * re_list_head;
-+uschar * linebuffer;
- long f_pos = 0;
- int ret = FAIL;
- 
--/* reset expansion variable */
--regex_match_string = NULL;
-+regex_vars_clear();
- 
- if (!mime_stream)				/* We are in the DATA ACL */
-   {
-   if (!(mbox_file = spool_mbox(&mbox_size, NULL, NULL)))
-     {						/* error while spooling */
-@@ -167,18 +177,17 @@
- 
- 
- int
- mime_regex(const uschar **listptr)
- {
--pcre_list *re_list_head = NULL;
--FILE *f;
--uschar *mime_subject = NULL;
-+pcre_list * re_list_head = NULL;
-+FILE * f;
-+uschar * mime_subject = NULL;
- int mime_subject_len = 0;
- int ret;
- 
--/* reset expansion variable */
--regex_match_string = NULL;
-+regex_vars_clear();
- 
- /* precompile our regexes */
- if (!(re_list_head = compile(*listptr)))
-   return FAIL;			/* no regexes -> nothing to do */
- 
---- a/src/smtp_in.c
-+++ b/src/smtp_in.c
-@@ -2155,12 +2155,14 @@
- prdr_requested = FALSE;
- #endif
- #ifdef SUPPORT_I18N
- message_smtputf8 = FALSE;
- #endif
-+regex_vars_clear();
- body_linecount = body_zerocount = 0;
- 
-+lookup_value = NULL;				/* Can be set by ACL */
- sender_rate = sender_rate_limit = sender_rate_period = NULL;
- ratelimiters_mail = NULL;           /* Updated by ratelimit ACL condition */
-                    /* Note that ratelimiters_conn persists across resets. */
- 
- /* Reset message ACL variables */
diff --git a/package/exim/0006-OpenSSL-fix-non-DANE-build.patch b/package/exim/0006-OpenSSL-fix-non-DANE-build.patch
new file mode 100644
index 0000000000..8ae63d2226
--- /dev/null
+++ b/package/exim/0006-OpenSSL-fix-non-DANE-build.patch
@@ -0,0 +1,28 @@
+From 37b849dca4dfd855212a763662825e967a4d77b1 Mon Sep 17 00:00:00 2001
+From: Jeremy Harris <jgh146exb@wizmail.org>
+Date: Tue, 7 Nov 2023 15:02:18 +0000
+Subject: [PATCH] OpenSSL: fix non-DANE build
+
+Upstream: https://git.exim.org/exim.git/commitdiff/37b849dca4dfd855212a763662825e967a4d77b1
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/tls-openssl.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/src/tls-openssl.c b/src/src/tls-openssl.c
+index ef11de593..851ac77c5 100644
+--- a/src/tls-openssl.c
++++ b/src/tls-openssl.c
+@@ -2605,7 +2605,7 @@ if (!(bs = OCSP_response_get1_basic(rsp)))
+     asking for certificate-status under DANE, so this callback won't run for
+     that combination. It still will for non-DANE. */
+ 
+-#ifdef EXIM_HAVE_OPENSSL_OCSP_RESP_GET0_SIGNER
++#if defined(EXIM_HAVE_OPENSSL_OCSP_RESP_GET0_SIGNER) && defined(SUPPORT_DANE)
+     X509 * signer;
+ 
+     if (  tls_out.dane_verified
+-- 
+2.30.2
+
diff --git a/package/exim/0007-Fix-non-WITH_CONTENT_SCAN-build.patch b/package/exim/0007-Fix-non-WITH_CONTENT_SCAN-build.patch
deleted file mode 100644
index 9f87f18e00..0000000000
--- a/package/exim/0007-Fix-non-WITH_CONTENT_SCAN-build.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From d8ecc7bf97934a1e2244788c610c958cacd740bd Mon Sep 17 00:00:00 2001
-From: Jeremy Harris <jgh146exb@wizmail.org>
-Date: Wed, 31 Aug 2022 17:03:37 +0100
-Subject: [PATCH] Fix non-WITH_CONTENT_SCAN build.
-
-Broken-by: 4e9ed49f8f
-
-[Upstream: https://sources.debian.org/data/main/e/exim4/4.96-9/debian/patches/75_09-Fix-non-WITH_CONTENT_SCAN-build.patch]
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- src/exim.c  | 11 +++++++++++
- src/regex.c | 10 ----------
- 2 files changed, 11 insertions(+), 10 deletions(-)
-
---- a/src/exim.c
-+++ b/src/exim.c
-@@ -1677,10 +1677,21 @@
-   if ((s = expand_string(big_buffer))) printf("%s\n", CS s);
-   else printf("Failed: %s\n", expand_string_message);
- }
- 
- 
-+/* reset regex expansion variables */
-+void
-+regex_vars_clear(void)
-+{
-+regex_match_string = NULL;
-+for (int i = 0; i < REGEX_VARS; i++) regex_vars[i] = NULL;
-+}
-+
-+
-+
-+
- 
- /*************************************************
- *          Entry point and high-level code       *
- *************************************************/
- 
---- a/src/regex.c
-+++ b/src/regex.c
-@@ -95,20 +95,10 @@
- pcre2_match_data_free(md);
- return FAIL;
- }
- 
- 
--/* reset expansion variables */
--void
--regex_vars_clear(void)
--{
--regex_match_string = NULL;
--for (int i = 0; i < REGEX_VARS; i++) regex_vars[i] = NULL;
--}
--
--
--
- int
- regex(const uschar ** listptr)
- {
- unsigned long mbox_size;
- FILE * mbox_file;
diff --git a/package/exim/0008-Fix-non-WITH_CONTENT_SCAN-build-2.patch b/package/exim/0008-Fix-non-WITH_CONTENT_SCAN-build-2.patch
deleted file mode 100644
index 43cc1d79a9..0000000000
--- a/package/exim/0008-Fix-non-WITH_CONTENT_SCAN-build-2.patch
+++ /dev/null
@@ -1,139 +0,0 @@
-From 158dff9936e36a2d31d037d3988b9353458d6471 Mon Sep 17 00:00:00 2001
-From: Jeremy Harris <jgh146exb@wizmail.org>
-Date: Wed, 31 Aug 2022 17:17:59 +0100
-Subject: [PATCH] Fix non-WITH_CONTENT_SCAN build (2)
-
-Broken-by: d8ecc7bf97
-
-[Upstream: https://sources.debian.org/data/main/e/exim4/4.96-9/debian/patches/75_10-Fix-non-WITH_CONTENT_SCAN-build-2.patch]
-[Peter: drop Changelog hunk]
-Signed-off-by: Peter Korsgaard <peter@korsgard.com>
----
- src/exim.c      | 13 +------------
- src/functions.h |  2 +-
- src/globals.h   |  2 +-
- src/regex.c     | 10 ++++++++++
- src/smtp_in.c   |  2 ++
- 5 files changed, 15 insertions(+), 14 deletions(-)
-
---- a/src/exim.c
-+++ b/src/exim.c
-@@ -1677,21 +1677,10 @@
-   if ((s = expand_string(big_buffer))) printf("%s\n", CS s);
-   else printf("Failed: %s\n", expand_string_message);
- }
- 
- 
--/* reset regex expansion variables */
--void
--regex_vars_clear(void)
--{
--regex_match_string = NULL;
--for (int i = 0; i < REGEX_VARS; i++) regex_vars[i] = NULL;
--}
--
--
--
--
- 
- /*************************************************
- *          Entry point and high-level code       *
- *************************************************/
- 
-@@ -6085,17 +6074,17 @@
-   deliver_domain_orig = NULL;
-   deliver_host = deliver_host_address = NULL;
-   dnslist_domain = dnslist_matched = NULL;
- #ifdef WITH_CONTENT_SCAN
-   malware_name = NULL;
-+  regex_vars_clear();
- #endif
-   callout_address = NULL;
-   sending_ip_address = NULL;
-   deliver_localpart_data = deliver_domain_data =
-   recipient_data = sender_data = NULL;
-   acl_var_m = NULL;
--  regex_vars_clear();
- 
-   store_reset(reset_point);
-   }
- 
- exim_exit(EXIT_SUCCESS);   /* Never returns */
---- a/src/functions.h
-+++ b/src/functions.h
-@@ -432,15 +432,15 @@
- extern BOOL    receive_msg(BOOL);
- extern int_eximarith_t receive_statvfs(BOOL, int *);
- extern void    receive_swallow_smtp(void);
- #ifdef WITH_CONTENT_SCAN
- extern int     regex(const uschar **);
-+extern void    regex_vars_clear(void);
- #endif
- extern BOOL    regex_match(const pcre2_code *, const uschar *, int, uschar **);
- extern BOOL    regex_match_and_setup(const pcre2_code *, const uschar *, int, int);
- extern const pcre2_code *regex_must_compile(const uschar *, BOOL, BOOL);
--extern void    regex_vars_clear(void);
- extern void    retry_add_item(address_item *, uschar *, int);
- extern BOOL    retry_check_address(const uschar *, host_item *, uschar *, BOOL,
-                  uschar **, uschar **);
- extern retry_config *retry_find_config(const uschar *, const uschar *, int, int);
- extern BOOL    retry_ultimate_address_timeout(uschar *, const uschar *,
---- a/src/globals.h
-+++ b/src/globals.h
-@@ -895,16 +895,16 @@
- #ifndef DISABLE_PIPE_CONNECT
- extern const pcre2_code  *regex_EARLY_PIPE;  /* For recognizing PIPE_CONNCT */
- #endif
- extern const pcre2_code  *regex_ismsgid;     /* Compiled r.e. for message ID */
- extern const pcre2_code  *regex_smtp_code;   /* For recognizing SMTP codes */
--extern const uschar *regex_vars[];           /* $regexN variables */
- #ifdef WHITELIST_D_MACROS
- extern const pcre2_code  *regex_whitelisted_macro; /* For -D macro values */
- #endif
- #ifdef WITH_CONTENT_SCAN
- extern uschar *regex_match_string;     /* regex that matched a line (regex ACL condition) */
-+extern const uschar *regex_vars[];
- #endif
- extern int     remote_delivery_count;  /* Number of remote addresses */
- extern int     remote_max_parallel;    /* Maximum parallel delivery */
- extern uschar *remote_sort_domains;    /* Remote domain sorting order */
- extern retry_config *retries;          /* Chain of retry config information */
---- a/src/regex.c
-+++ b/src/regex.c
-@@ -95,10 +95,20 @@
- pcre2_match_data_free(md);
- return FAIL;
- }
- 
- 
-+/* reset expansion variables */
-+void
-+regex_vars_clear(void)
-+{
-+regex_match_string = NULL;
-+for (int i = 0; i < REGEX_VARS; i++) regex_vars[i] = NULL;
-+}
-+
-+
-+
- int
- regex(const uschar ** listptr)
- {
- unsigned long mbox_size;
- FILE * mbox_file;
---- a/src/smtp_in.c
-+++ b/src/smtp_in.c
-@@ -2155,11 +2155,13 @@
- prdr_requested = FALSE;
- #endif
- #ifdef SUPPORT_I18N
- message_smtputf8 = FALSE;
- #endif
-+#ifdef WITH_CONTENT_SCAN
- regex_vars_clear();
-+#endif
- body_linecount = body_zerocount = 0;
- 
- lookup_value = NULL;				/* Can be set by ACL */
- sender_rate = sender_rate_limit = sender_rate_period = NULL;
- ratelimiters_mail = NULL;           /* Updated by ratelimit ACL condition */
diff --git a/package/exim/0009-Fix-non-WITH_CONTENT_SCAN-build-3.patch b/package/exim/0009-Fix-non-WITH_CONTENT_SCAN-build-3.patch
deleted file mode 100644
index f9675c80d3..0000000000
--- a/package/exim/0009-Fix-non-WITH_CONTENT_SCAN-build-3.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 32da6327e434e986a18b75a84f2d8c687ba14619 Mon Sep 17 00:00:00 2001
-From: Jeremy Harris <jgh146exb@wizmail.org>
-Date: Thu, 1 Sep 2022 15:54:35 +0100
-Subject: [PATCH] Fix non-WITH_CONTENT_SCAN build (3)
-
-Broken-by: d8ecc7bf97
-
-[Upstream: https://sources.debian.org/data/main/e/exim4/4.96-9/debian/patches/75_11-Fix-non-WITH_CONTENT_SCAN-build-3.patch]
-[Peter: drop Changelog hunk]
-Signed-off-by: Peter Korsgaard <peter@korsgard.com>
----
- src/expand.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/src/expand.c b/src/expand.c
-index 89de56255..831ca2b75 100644
---- a/src/expand.c
-+++ b/src/expand.c
-@@ -1869,6 +1869,7 @@ if (Ustrncmp(name, "auth", 4) == 0)
-   if (!*endptr && n != 0 && n <= AUTH_VARS)
-     return auth_vars[n-1] ? auth_vars[n-1] : US"";
-   }
-+#ifdef WITH_CONTENT_SCAN
- else if (Ustrncmp(name, "regex", 5) == 0)
-   {
-   uschar *endptr;
-@@ -1876,6 +1877,7 @@ else if (Ustrncmp(name, "regex", 5) == 0)
-   if (!*endptr && n != 0 && n <= REGEX_VARS)
-     return regex_vars[n-1] ? regex_vars[n-1] : US"";
-   }
-+#endif
- 
- /* For all other variables, search the table */
- 
-@@ -8715,9 +8717,11 @@ assert_variable_notin() treats as const, so deconst is safe. */
- for (int i = 0; i < AUTH_VARS; i++) if (auth_vars[i])
-   assert_variable_notin(US"auth<n>", US auth_vars[i], &e);
- 
-+#ifdef WITH_CONTENT_SCAN
- /* check regex<n> variables. assert_variable_notin() treats as const. */
- for (int i = 0; i < REGEX_VARS; i++) if (regex_vars[i])
-   assert_variable_notin(US"regex<n>", US regex_vars[i], &e);
-+#endif
- 
- /* check known-name variables */
- for (var_entry * v = var_table; v < var_table + var_table_size; v++)
--- 
-2.35.1
-
diff --git a/package/exim/exim.hash b/package/exim/exim.hash
index e784bf7521..6336a40427 100644
--- a/package/exim/exim.hash
+++ b/package/exim/exim.hash
@@ -1,6 +1,6 @@
 # From https://ftp.exim.org/pub/exim/exim4/00-sha256sums.txt
-sha256  038e327e8d1e93d005bac9bb06fd22aec44d5028930d6dbe8817ad44bbfc1de6  exim-4.96.2.tar.xz
+sha256  428150e67c494fa14fe5195d81b972c1b23e651ee4f9f2ff1788250266d31e9c  exim-4.97.tar.xz
 # From https://ftp.exim.org/pub/exim/exim4/00-sha512sums.txt
-sha512  dc9f6a114e64ac826489edff88d50a24195b64714428e691c10a7bfb119b3ebb6455bf80cbb34dfd0a4e2e44cbde72effb009357a8e0a6065e512fe32092e3ed  exim-4.96.2.tar.xz
+sha512  b28cbb49fa7e143dfcc94e004d57cf98a1945013e676cd103c1ee4cf52933d49d378baa13bea2663353dba97745d6b2ab8b7b66cde870788a2d85d7abd716968  exim-4.97.tar.xz
 # Locally calculated
 sha256  49240db527b7e55b312a46fc59794fde5dd006422e422257f4f057bfd27b3c8f  LICENCE
diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index 166a4ead54..23d888e6f2 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXIM_VERSION = 4.96.2
+EXIM_VERSION = 4.97
 EXIM_SOURCE = exim-$(EXIM_VERSION).tar.xz
 EXIM_SITE = https://ftp.exim.org/pub/exim/exim4
 EXIM_LICENSE = GPL-2.0+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
