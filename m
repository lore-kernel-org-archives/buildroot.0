Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E288CCD4F47
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 13:30:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B88E561618;
	Fri, 15 May 2026 13:30:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iZafiiugwgO3; Fri, 15 May 2026 13:30:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D78E6161A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778851831;
	bh=OGfZ5OB3oRVRXlLqdNw0FOVUfBTlcaXZXq9CY+IgHm0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=py8lQ8FXwEyy4rkUtrR1jNrmFmr2iVYm7Uesy09u4BxO9FWlGI8jnRg8ekFEfQKdx
	 Y12PrxuSTsDPsdciyKyxLpGnpYmUFm+y8lj0KlXwjRDdX38uhOIFB8RDKblPnaBGv8
	 vj7l53wL01Vc4UiURdz8S5kGZ3Mz0x28OzZeKtfrDGcdCWd8aAVxUPuzRvNZmZYzhZ
	 5N+n/C2tD4GkKVJEPv0de0u/uDjDZmMChMJ5Rrs19L06R2jTCvw6tnT3Jj7R4TKXIX
	 GWMVtirrzVvwdqsLDKUyrbUyI2tWPaxqeEkraI/gcO4UPU8lygmQfsvQCnxbY7n2q7
	 xuWacFovOKF9g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D78E6161A;
	Fri, 15 May 2026 13:30:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 03CC136F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:30:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DBB6A41B18
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:29:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id waIJmViN8LJf for <buildroot@buildroot.org>;
 Fri, 15 May 2026 13:29:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6DF6C41AAF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6DF6C41AAF
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:29:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C20BE86352; Fri, 15 May 2026 13:29:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 13 May 2026 13:57:44 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 932a344da15432a05126959887866c15975e4b82
X-Git-Newrev: 770b3996ed96cf9e4069bc596cb2d2177f4eee5c
X-Patchwork-Hint: ignore
Message-Id: <20260515132948.C20BE86352@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/proftpd: patch
 CVE-2026-42167
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/770b3996ed96cf9e4069bc596cb2d2177f4eee5c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

- CVE-2026-42167:
    mod_sql in ProFTPD before 1.3.9a allows remote attackers to execute
    arbitrary code via a username, in scenarios where there is logging of
    USER requests with an expansion such as %U, and the SQL backend allows
    commands (e.g., COPY TO PROGRAM).

For more information, see:
 - https://www.cve.org/CVERecord?id=CVE-2026-42167
 - https://github.com/proftpd/proftpd/issues/2052
 - https://github.com/proftpd/proftpd/commit/af90843baf7dcb8c6be1e5261be2d0b5b5850673

The backport was provided by the Fedora Community:
 - https://src.fedoraproject.org/rpms/proftpd/raw/epel9/f/2052.patch

(cherry picked from commit 0d5ce9ed84e7dd050624252045caa813c0f05e82)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/proftpd/0001-CVE-2026-42167.patch | 199 ++++++++++++++++++++++++++++++
 package/proftpd/proftpd.mk                |   3 +
 2 files changed, 202 insertions(+)

diff --git a/package/proftpd/0001-CVE-2026-42167.patch b/package/proftpd/0001-CVE-2026-42167.patch
new file mode 100644
index 0000000000..8ac4803d3d
--- /dev/null
+++ b/package/proftpd/0001-CVE-2026-42167.patch
@@ -0,0 +1,199 @@
+From 415395b795436ae47cc25b2394e80033b80f11be Mon Sep 17 00:00:00 2001
+From: TJ Saunders <tj@castaglia.org>
+Date: Mon, 27 Apr 2026 12:13:09 -0700
+Subject: [PATCH] Issue #2052: When resolving any variable whose value is
+ supplied by the client, make sure we **always** escape that value text.
+
+CVE: CVE-2026-42167
+Upstream: https://github.com/proftpd/proftpd/commit/af90843baf7dcb8c6be1e5261be2d0b5b5850673
+Upstream: https://src.fedoraproject.org/rpms/proftpd/raw/epel9/f/2052.patch
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ contrib/mod_sql.c | 103 ++++++++++++++++++++++++++++------------------
+ 1 file changed, 64 insertions(+), 39 deletions(-)
+
+diff --git a/contrib/mod_sql.c b/contrib/mod_sql.c
+index 4978b38b70..4872f5fa64 100644
+--- a/contrib/mod_sql.c
++++ b/contrib/mod_sql.c
+@@ -2,7 +2,7 @@
+  * ProFTPD: mod_sql -- SQL frontend
+  * Copyright (c) 1998-1999 Johnie Ingram.
+  * Copyright (c) 2001 Andrew Houghton.
+- * Copyright (c) 2004-2022 TJ Saunders
++ * Copyright (c) 2004-2026 TJ Saunders
+  *  
+  * This program is free software; you can redistribute it and/or modify
+  * it under the terms of the GNU General Public License as published by
+@@ -760,40 +760,46 @@ static int is_escaped_text(const char *text, size_t text_len) {
+ }
+ 
+ static int sql_resolved_append_text(pool *p, struct sql_resolved *resolved,
+-    const char *text, size_t text_len) {
+-  char *new_text;
+-  size_t new_textlen;
++    const char *text, size_t text_len, int already_escaped) {
++  char *new_text = NULL;
++  size_t new_textlen = 0;
+ 
+   if (text == NULL ||
+       text_len == 0) {
+     return 0;
+   }
+ 
+-  /* For backward compatibility (see Issue #1149), we indulge in a little
+-   * heuristic here, and only escape the text if it hasn't already been
+-   * escaped.  How to properly tell?  If the first and last characters of
+-   * the given text are `'`, AND there are no other occurrences of that
+-   * character in the text, assume it has already been quoted.
+-   */
+-  if (is_escaped_text(text, text_len) == FALSE) {
+-    modret_t *mr;
++  new_text = (char *) text;
++  new_textlen = text_len;
+ 
+-    mr = sql_dispatch(sql_make_cmd(p, 2, resolved->conn_name, text),
+-      "sql_escapestring");
+-    if (check_response(mr, resolved->conn_flags) < 0) {
+-      errno = EIO;
+-      return -1;
+-    }
++  if (already_escaped == FALSE) {
++    /* For backward compatibility (see Issue #1149), we indulge in a little
++     * heuristic here, and only escape the text if it hasn't already been
++     * escaped.  How to properly tell?  If the first and last characters of
++     * the given text are `'`, AND there are no other occurrences of that
++     * character in the text, assume it has already been quoted.
++     *
++     * Per Issue #2052, we refine this to use this heuristic only if we do
++     * not already know that the text has been escaped.  Some callers may
++     * have already escaped the provided text for us.
++     */
++    if (is_escaped_text(text, text_len) == FALSE) {
++      modret_t *mr;
+ 
+-    new_text = (char *) mr->data;
+-    new_textlen = strlen(new_text);
++      mr = sql_dispatch(sql_make_cmd(p, 2, resolved->conn_name, text),
++        "sql_escapestring");
++      if (check_response(mr, resolved->conn_flags) < 0) {
++        errno = EIO;
++        return -1;
++      }
+ 
+-  } else {
+-    pr_trace_msg(trace_channel, 17,
+-      "text '%s' is already escaped, skipping escaping it again", text);
++      new_text = (char *) mr->data;
++      new_textlen = strlen(new_text);
+ 
+-    new_text = (char *) text;
+-    new_textlen = text_len;
++    } else {
++      pr_trace_msg(trace_channel, 17,
++        "text '%s' is already escaped, skipping escaping it again", text);
++    }
+   }
+ 
+   if (new_textlen > resolved->buflen) {
+@@ -811,7 +817,7 @@ static int sql_resolved_append_text(pool *p, struct sql_resolved *resolved,
+ 
+ static int sql_resolve_on_meta(pool *p, pr_jot_ctx_t *jot_ctx,
+     unsigned char logfmt_id, const char *jot_hint, const void *val) {
+-  int res = 0;
++  int res = 0, already_escaped = FALSE;
+   struct sql_resolved *resolved;
+ 
+   resolved = jot_ctx->log;
+@@ -970,35 +976,53 @@ static int sql_resolve_on_meta(pool *p, pr_jot_ctx_t *jot_ctx,
+         break;
+       }
+ 
++      /* Per Issue #2052, the following variable values can all be supplied
++       * remotely by the client.  As such, they should be escaped preemptively.
++       */
+       case LOGFMT_META_ANON_PASS:
+       case LOGFMT_META_BASENAME:
+-      case LOGFMT_META_CLASS:
+       case LOGFMT_META_CMD_PARAMS:
+       case LOGFMT_META_COMMAND:
+       case LOGFMT_META_DIR_NAME:
+       case LOGFMT_META_DIR_PATH:
++      case LOGFMT_META_FILENAME:
++      case LOGFMT_META_IDENT_USER:
++      case LOGFMT_META_METHOD:
++      case LOGFMT_META_ORIGINAL_USER:
++      case LOGFMT_META_RESPONSE_STR:
++      case LOGFMT_META_REMOTE_HOST:
++      case LOGFMT_META_RENAME_FROM:
++      case LOGFMT_META_USER:
++      case LOGFMT_META_XFER_PATH: {
++        modret_t *mr;
++
++        mr = sql_dispatch(sql_make_cmd(p, 2, resolved->conn_name,
++          (const char *) val), "sql_escapestring");
++        if (check_response(mr, resolved->conn_flags) < 0) {
++          errno = EIO;
++          return -1;
++        }
++
++        text = (char *) mr->data;
++        text_len = strlen(text);
++        already_escaped = TRUE;
++        break;
++      }
++
++      case LOGFMT_META_CLASS:
+       case LOGFMT_META_ENV_VAR:
+       case LOGFMT_META_EOS_REASON:
+-      case LOGFMT_META_FILENAME:
+       case LOGFMT_META_GROUP:
+-      case LOGFMT_META_IDENT_USER:
+       case LOGFMT_META_ISO8601:
+       case LOGFMT_META_LOCAL_FQDN:
+       case LOGFMT_META_LOCAL_IP:
+       case LOGFMT_META_LOCAL_NAME:
+-      case LOGFMT_META_METHOD:
+       case LOGFMT_META_NOTE_VAR:
+-      case LOGFMT_META_ORIGINAL_USER:
+       case LOGFMT_META_PROTOCOL:
+-      case LOGFMT_META_REMOTE_HOST:
+       case LOGFMT_META_REMOTE_IP:
+-      case LOGFMT_META_RENAME_FROM:
+-      case LOGFMT_META_RESPONSE_STR:
+-      case LOGFMT_META_USER:
+       case LOGFMT_META_VERSION:
+       case LOGFMT_META_VHOST_IP:
+       case LOGFMT_META_XFER_FAILURE:
+-      case LOGFMT_META_XFER_PATH:
+       case LOGFMT_META_XFER_STATUS:
+       case LOGFMT_META_XFER_TYPE:
+       default:
+@@ -1011,7 +1035,8 @@ static int sql_resolve_on_meta(pool *p, pr_jot_ctx_t *jot_ctx,
+       text_len = strlen(text);
+     }
+ 
+-    res = sql_resolved_append_text(p, resolved, text, text_len);
++    res = sql_resolved_append_text(p, resolved, text, text_len,
++      already_escaped);
+   }
+ 
+   return res;
+@@ -1074,7 +1099,7 @@ static int sql_resolve_on_default(pool *p, pr_jot_ctx_t *jot_ctx,
+         break;
+     }
+ 
+-    res = sql_resolved_append_text(p, resolved, text, text_len);
++    res = sql_resolved_append_text(p, resolved, text, text_len, FALSE);
+   }
+ 
+   return res;
+@@ -3175,7 +3200,7 @@ static int showinfo_on_meta(pool *p, pr_jot_ctx_t *jot_ctx,
+       }
+ 
+       text_len = strlen(text);
+-      res = sql_resolved_append_text(p, resolved, text, text_len);
++      res = sql_resolved_append_text(p, resolved, text, text_len, FALSE);
+ 
+     } else {
+       res = sql_resolve_on_meta(p, jot_ctx, logfmt_id, jot_hint, val);
diff --git a/package/proftpd/proftpd.mk b/package/proftpd/proftpd.mk
index d450489cb0..2f6058be24 100644
--- a/package/proftpd/proftpd.mk
+++ b/package/proftpd/proftpd.mk
@@ -11,6 +11,9 @@ PROFTPD_LICENSE_FILES = COPYING
 PROFTPD_CPE_ID_VENDOR = proftpd
 PROFTPD_SELINUX_MODULES = ftp
 
+# 0001-CVE-2026-42167.patch
+PROFTPD_IGNORE_CVES += CVE-2026-42167
+
 PROFTPD_CONF_ENV = \
 	ac_cv_func_setpgrp_void=yes \
 	ac_cv_func_setgrent_void=yes
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
