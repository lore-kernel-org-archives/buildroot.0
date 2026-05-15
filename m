Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E8FBCD4851
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 13:28:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DAD6C4047E;
	Fri, 15 May 2026 13:28:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QaufR_4bLY4U; Fri, 15 May 2026 13:28:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AEDA241B0E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778851737;
	bh=+mcPxDjHDiKo+xTbIPMFlr5sOYs4OgeGW2adnoghpPQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=dX5PO22aiNDCKGGo+/N7yea2jOLUo52BCpjQJW83Z0i5FIXSvLcYIZZHDjeWcK6Mf
	 H2OPyuA1gHrTZRkrYaZoA7VnJ5jnviABfzft23XEbATH+KhkxUo+R8uDx7tRp9R89a
	 x4Yho1m518RzfDLL+6eqi1r54WRGGK5ocVPALr3u/wYbVYyDOqW9Mzqz2KUcspl3C8
	 95+ATmA/aYPDonCiyNKqzMKabkWzOklS8vHZn092zPKmKmhmWnvWLUyHdfW4L4BTMT
	 x/5SaMUkPQwpMpIM2fkKWgUmPnc7A7e0pJsk6f62I+6iF0S8aDWCW5TMA33//EWnLt
	 BXA+GvHFNM1Sg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AEDA241B0E;
	Fri, 15 May 2026 13:28:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1391436E
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:28:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AB69B61571
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:28:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8Hgg7_8GSwjC for <buildroot@buildroot.org>;
 Fri, 15 May 2026 13:28:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C610A61547
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C610A61547
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:28:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 25CCB8634F; Fri, 15 May 2026 13:28:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 15 May 2026 13:58:46 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 092e63a37b6ff85d50d8b3bcd5cc278ba9f5c14e
X-Git-Newrev: c3d353737439b208823ca4ba3208345f3d4286ed
X-Patchwork-Hint: ignore
Message-Id: <20260515132817.25CCB8634F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/nginx: security
 bump to 1.28.1
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c3d353737439b208823ca4ba3208345f3d4286ed
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

See here for changes:
https://nginx.org/en/CHANGES-1.28

Following security related issues are fixed:
    *) Security: processing of a specially crafted login/password when using
       the "none" authentication method in the ngx_mail_smtp_module might
       cause worker process memory disclosure to the authentication server
       (CVE-2025-53859).
    *) Security: insufficient check in virtual servers handling with TLSv1.3
       SNI allowed to reuse SSL sessions in a different virtual server, to
       bypass client SSL certificates verification (CVE-2025-23419).
    *) Security: processing of a specially crafted mp4 file by the
       ngx_http_mp4_module might cause a worker process crash
       (CVE-2024-7347).
       Thanks to Nils Bars.
    *) Security: when using HTTP/3, processing of a specially crafted QUIC
       session might cause a worker process crash, worker process memory
       disclosure on systems with MTU larger than 4096 bytes, or might have
       potential other impact (CVE-2024-32760, CVE-2024-31079,
       CVE-2024-35200, CVE-2024-34161).
       Thanks to Nils Bars of CISPA.

Update patch 0007, which does not apply cleanly.
License file was changed, year was bumped to 2025.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit a0081aa1f8c332d5fb6dbb19de9e46cb39be4931)
[thomas: remove previously Cherry picked commit]
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...-ngx_linux_config.h-only-include-dlfcn.h-.patch |  11 +-
 package/nginx/0010-CVE-2025-53859.patch            | 130 ---------------------
 package/nginx/nginx.hash                           |   4 +-
 package/nginx/nginx.mk                             |   5 +-
 4 files changed, 7 insertions(+), 143 deletions(-)

diff --git a/package/nginx/0007-src-os-unix-ngx_linux_config.h-only-include-dlfcn.h-.patch b/package/nginx/0007-src-os-unix-ngx_linux_config.h-only-include-dlfcn.h-.patch
index c10fcd11c9..4656634bd3 100644
--- a/package/nginx/0007-src-os-unix-ngx_linux_config.h-only-include-dlfcn.h-.patch
+++ b/package/nginx/0007-src-os-unix-ngx_linux_config.h-only-include-dlfcn.h-.patch
@@ -10,11 +10,11 @@ Signed-off-by: Martin Bark <martin@barkynet.com>
  1 file changed, 4 insertions(+), 2 deletions(-)
 
 diff --git a/src/os/unix/ngx_linux_config.h b/src/os/unix/ngx_linux_config.h
-index 2f6129d..4244086 100644
+index d99358c93..612935524 100644
 --- a/src/os/unix/ngx_linux_config.h
 +++ b/src/os/unix/ngx_linux_config.h
-@@ -55,10 +55,12 @@
- #include <crypt.h>
+@@ -54,10 +54,12 @@
+ #include <sys/ioctl.h>
  #include <sys/utsname.h>        /* uname() */
  
 -#include <dlfcn.h>
@@ -27,7 +27,4 @@ index 2f6129d..4244086 100644
 +#endif
  
  
- #if (NGX_HAVE_POSIX_SEM)
--- 
-2.8.2
-
+ #if (NGX_HAVE_CRYPT_H)
diff --git a/package/nginx/0010-CVE-2025-53859.patch b/package/nginx/0010-CVE-2025-53859.patch
deleted file mode 100644
index 34befebd8a..0000000000
--- a/package/nginx/0010-CVE-2025-53859.patch
+++ /dev/null
@@ -1,130 +0,0 @@
-CVE: CVE-2025-53859
-Upstream: https://nginx.org/download/patch.2025.smtp.txt
-Signed-off-by: Thomas Perale <thomas.perale@mind.be>
-
-diff --git a/src/mail/ngx_mail_handler.c b/src/mail/ngx_mail_handler.c
-index 1167df3fb..d3be7f3b3 100644
---- a/src/mail/ngx_mail_handler.c
-+++ b/src/mail/ngx_mail_handler.c
-@@ -523,7 +523,7 @@ ngx_mail_starttls_only(ngx_mail_session_t *s, ngx_connection_t *c)
- ngx_int_t
- ngx_mail_auth_plain(ngx_mail_session_t *s, ngx_connection_t *c, ngx_uint_t n)
- {
--    u_char     *p, *last;
-+    u_char     *p, *pos, *last;
-     ngx_str_t  *arg, plain;
- 
-     arg = s->args.elts;
-@@ -555,7 +555,7 @@ ngx_mail_auth_plain(ngx_mail_session_t *s, ngx_connection_t *c, ngx_uint_t n)
-         return NGX_MAIL_PARSE_INVALID_COMMAND;
-     }
- 
--    s->login.data = p;
-+    pos = p;
- 
-     while (p < last && *p) { p++; }
- 
-@@ -565,7 +565,8 @@ ngx_mail_auth_plain(ngx_mail_session_t *s, ngx_connection_t *c, ngx_uint_t n)
-         return NGX_MAIL_PARSE_INVALID_COMMAND;
-     }
- 
--    s->login.len = p++ - s->login.data;
-+    s->login.len = p++ - pos;
-+    s->login.data = pos;
- 
-     s->passwd.len = last - p;
-     s->passwd.data = p;
-@@ -583,24 +584,26 @@ ngx_int_t
- ngx_mail_auth_login_username(ngx_mail_session_t *s, ngx_connection_t *c,
-     ngx_uint_t n)
- {
--    ngx_str_t  *arg;
-+    ngx_str_t  *arg, login;
- 
-     arg = s->args.elts;
- 
-     ngx_log_debug1(NGX_LOG_DEBUG_MAIL, c->log, 0,
-                    "mail auth login username: \"%V\"", &arg[n]);
- 
--    s->login.data = ngx_pnalloc(c->pool, ngx_base64_decoded_length(arg[n].len));
--    if (s->login.data == NULL) {
-+    login.data = ngx_pnalloc(c->pool, ngx_base64_decoded_length(arg[n].len));
-+    if (login.data == NULL) {
-         return NGX_ERROR;
-     }
- 
--    if (ngx_decode_base64(&s->login, &arg[n]) != NGX_OK) {
-+    if (ngx_decode_base64(&login, &arg[n]) != NGX_OK) {
-         ngx_log_error(NGX_LOG_INFO, c->log, 0,
-             "client sent invalid base64 encoding in AUTH LOGIN command");
-         return NGX_MAIL_PARSE_INVALID_COMMAND;
-     }
- 
-+    s->login = login;
-+
-     ngx_log_debug1(NGX_LOG_DEBUG_MAIL, c->log, 0,
-                    "mail auth login username: \"%V\"", &s->login);
- 
-@@ -611,7 +614,7 @@ ngx_mail_auth_login_username(ngx_mail_session_t *s, ngx_connection_t *c,
- ngx_int_t
- ngx_mail_auth_login_password(ngx_mail_session_t *s, ngx_connection_t *c)
- {
--    ngx_str_t  *arg;
-+    ngx_str_t  *arg, passwd;
- 
-     arg = s->args.elts;
- 
-@@ -620,18 +623,19 @@ ngx_mail_auth_login_password(ngx_mail_session_t *s, ngx_connection_t *c)
-                    "mail auth login password: \"%V\"", &arg[0]);
- #endif
- 
--    s->passwd.data = ngx_pnalloc(c->pool,
--                                 ngx_base64_decoded_length(arg[0].len));
--    if (s->passwd.data == NULL) {
-+    passwd.data = ngx_pnalloc(c->pool, ngx_base64_decoded_length(arg[0].len));
-+    if (passwd.data == NULL) {
-         return NGX_ERROR;
-     }
- 
--    if (ngx_decode_base64(&s->passwd, &arg[0]) != NGX_OK) {
-+    if (ngx_decode_base64(&passwd, &arg[0]) != NGX_OK) {
-         ngx_log_error(NGX_LOG_INFO, c->log, 0,
-             "client sent invalid base64 encoding in AUTH LOGIN command");
-         return NGX_MAIL_PARSE_INVALID_COMMAND;
-     }
- 
-+    s->passwd = passwd;
-+
- #if (NGX_DEBUG_MAIL_PASSWD)
-     ngx_log_debug1(NGX_LOG_DEBUG_MAIL, c->log, 0,
-                    "mail auth login password: \"%V\"", &s->passwd);
-@@ -674,24 +678,26 @@ ngx_int_t
- ngx_mail_auth_cram_md5(ngx_mail_session_t *s, ngx_connection_t *c)
- {
-     u_char     *p, *last;
--    ngx_str_t  *arg;
-+    ngx_str_t  *arg, login;
- 
-     arg = s->args.elts;
- 
-     ngx_log_debug1(NGX_LOG_DEBUG_MAIL, c->log, 0,
-                    "mail auth cram-md5: \"%V\"", &arg[0]);
- 
--    s->login.data = ngx_pnalloc(c->pool, ngx_base64_decoded_length(arg[0].len));
--    if (s->login.data == NULL) {
-+    login.data = ngx_pnalloc(c->pool, ngx_base64_decoded_length(arg[0].len));
-+    if (login.data == NULL) {
-         return NGX_ERROR;
-     }
- 
--    if (ngx_decode_base64(&s->login, &arg[0]) != NGX_OK) {
-+    if (ngx_decode_base64(&login, &arg[0]) != NGX_OK) {
-         ngx_log_error(NGX_LOG_INFO, c->log, 0,
-             "client sent invalid base64 encoding in AUTH CRAM-MD5 command");
-         return NGX_MAIL_PARSE_INVALID_COMMAND;
-     }
- 
-+    s->login = login;
-+
-     p = s->login.data;
-     last = p + s->login.len;
diff --git a/package/nginx/nginx.hash b/package/nginx/nginx.hash
index 77220665f3..7b79036b20 100644
--- a/package/nginx/nginx.hash
+++ b/package/nginx/nginx.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256  69ee2b237744036e61d24b836668aad3040dda461fe6f570f1787eab570c75aa  nginx-1.26.3.tar.gz
+sha256  40e7a0916d121e8905ef50f2a738b675599e42b2224a582dd938603fed15788e  nginx-1.28.1.tar.gz
 # License files, locally calculated
-sha256  f19c4caea60247490199c5a6d0134281e3fb20b3d7577e6873c628597f5381d9  LICENSE
+sha256  77c01620abf36ed747b7eca4bd271e49023fe3a8e2b3525bcf4b09c8e3aa28e4  LICENSE
diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
index 9ea432abdb..41490caee2 100644
--- a/package/nginx/nginx.mk
+++ b/package/nginx/nginx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NGINX_VERSION = 1.26.3
+NGINX_VERSION = 1.28.1
 NGINX_SITE = https://nginx.org/download
 NGINX_LICENSE = BSD-2-Clause
 NGINX_LICENSE_FILES = LICENSE
@@ -19,9 +19,6 @@ NGINX_CONF_OPTS = \
 	--with-cpp="$(TARGET_CC)" \
 	--with-ld-opt="$(TARGET_LDFLAGS)"
 
-# 0010-CVE-2025-53859.patch
-NGINX_IGNORE_CVES += CVE-2025-53859
-
 # www-data user and group are used for nginx. Because these user and group
 # are already set by buildroot, it is not necessary to redefine them.
 # See system/skeleton/etc/passwd
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
