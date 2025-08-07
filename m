Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC6B8C87FCA
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 17:01:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE8EA80D11;
	Thu,  7 Aug 2025 17:01:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CuX-liE0ZWr0; Thu,  7 Aug 2025 17:01:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B3A0080C9B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B3A0080C9B;
	Thu,  7 Aug 2025 17:01:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F6CD31
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:01:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B80C080C01
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:00:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FtGhti-FjDwm for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 17:00:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4F60180C32
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4F60180C32
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:00:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4BAC382AE0; Thu,  7 Aug 2025 17:00:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 7 Aug 2025 12:15:47 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: cfb6cf9fbe7ae6e182dd6ba21dd6cb8e9197e92f
X-Git-Newrev: 9015b1e79cee3d2f0fd477a7028f8820fbbfc227
X-Patchwork-Hint: ignore
Message-Id: <20250807170023.4BAC382AE0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/orc: add patch
 for CVE-2024-40897
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

commit: https://git.buildroot.net/buildroot/commit/?id=9015b1e79cee3d2f0fd477a7028f8820fbbfc227
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

This fixes the following vulnerabilities:

- CVE-2024-40897

 Stack-based buffer overflow vulnerability exists in orcparse.c of ORC
 versions prior to 0.4.39. If a developer is tricked to process a
 specially crafted file with the affected ORC compiler, an arbitrary
 code may be executed on the developer's build environment. This may
 lead to compromise of developer machines or CI build environments.
 https://www.cve.org/CVERecord?id=CVE-2024-40897

For more information, see:
 - https://www.cve.org/CVERecord?id=CVE-2024-40897
 - https://gitlab.freedesktop.org/gstreamer/orc/-/commit/fb7db9ae3e8ac271651d1884a3611d30bac04a98

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 2f7afa54ce8d8f9afd39228b429fbb6290316bc0)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...or-error-messages-and-otherwise-vsnprintf.patch | 94 ++++++++++++++++++++++
 package/orc/orc.mk                                 |  3 +
 2 files changed, 97 insertions(+)

diff --git a/package/orc/0001-use-vasprintf-if-available-for-error-messages-and-otherwise-vsnprintf.patch b/package/orc/0001-use-vasprintf-if-available-for-error-messages-and-otherwise-vsnprintf.patch
new file mode 100644
index 0000000000..41c5290722
--- /dev/null
+++ b/package/orc/0001-use-vasprintf-if-available-for-error-messages-and-otherwise-vsnprintf.patch
@@ -0,0 +1,94 @@
+From fb7db9ae3e8ac271651d1884a3611d30bac04a98 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Sebastian=20Dr=C3=B6ge?= <sebastian@centricular.com>
+Date: Tue, 9 Jul 2024 12:11:37 +0300
+Subject: [PATCH] Use vasprintf() if available for error messages and otherwise
+ vsnprintf()
+
+vasprintf() is a GNU/BSD extension and would allocate as much memory as required
+on the heap, similar to g_strdup_printf(). It's ridiculous that such a function
+is still not provided as part of standard C.
+
+If it's not available, use vsnprintf() to at least avoid stack/heap buffer
+overflows, which can lead to arbitrary code execution.
+
+Thanks to Noriko Totsuka for reporting.
+
+Fixes JVN#02030803 / JPCERT#92912620 / CVE-2024-40897
+Fixes #69
+
+Part-of: <https://gitlab.freedesktop.org/gstreamer/orc/-/merge_requests/191>
+Upstream: https://gitlab.freedesktop.org/gstreamer/orc/-/commit/fb7db9ae3e8ac271651d1884a3611d30bac04a98
+CVE: CVE-2024-40897
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ meson.build       |  1 +
+ orc/orccompiler.c |  6 +++++-
+ orc/orcparse.c    | 14 +++++++++++---
+ 3 files changed, 17 insertions(+), 4 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index c7ba5d7d..fe8c6016 100644
+--- a/meson.build
++++ b/meson.build
+@@ -128,6 +128,7 @@ int main() {
+ '''
+ cdata.set('HAVE_MONOTONIC_CLOCK', cc.compiles(monotonic_test))
+ cdata.set('HAVE_GETTIMEOFDAY', cc.has_function('gettimeofday'))
++cdata.set('HAVE_VASPRINTF', cc.has_function('vasprintf'))
+ cdata.set('HAVE_POSIX_MEMALIGN', cc.has_function('posix_memalign', prefix : '#include <stdlib.h>'))
+ cdata.set('HAVE_MMAP', cc.has_function('mmap'))
+ cdata.set('HAVE_SYS_TIME_H', cc.has_header('sys/time.h'))
+diff --git a/orc/orccompiler.c b/orc/orccompiler.c
+index 1e24b8a3..d3394612 100644
+--- a/orc/orccompiler.c
++++ b/orc/orccompiler.c
+@@ -1332,8 +1332,12 @@ orc_compiler_error_valist (OrcCompiler *compiler, const char *fmt,
+ 
+   if (compiler->error_msg) return;
+ 
++#ifdef HAVE_VASPRINTF
++  vasprintf (&s, fmt, args);
++#else
+   s = malloc (ORC_COMPILER_ERROR_BUFFER_SIZE);
+-  vsprintf (s, fmt, args);
++  vsnprintf (s, ORC_COMPILER_ERROR_BUFFER_SIZE, fmt, args);
++#endif
+   compiler->error_msg = s;
+   compiler->error = TRUE;
+   compiler->result = ORC_COMPILE_RESULT_UNKNOWN_COMPILE;
+diff --git a/orc/orcparse.c b/orc/orcparse.c
+index b0d67095..ae4f1b6b 100644
+--- a/orc/orcparse.c
++++ b/orc/orcparse.c
+@@ -424,17 +424,25 @@ orc_parse_get_error_where (OrcParser *parser)
+ static void
+ orc_parse_add_error_valist (OrcParser *parser, const char *format, va_list args)
+ {
+-  char text[ORC_ERROR_LENGTH] = { '\0' };
+-
+   if (parser->error_program != parser->program) {
+     parser->error_program = parser->program;
+   }
+ 
+-  vsprintf (text, format, args);
++#ifdef HAVE_VASPRINTF
++  char *text;
++  vasprintf (&text, format, args);
++#else
++  char text[ORC_ERROR_LENGTH] = { '\0' };
++  vsnprintf (text, sizeof (text), format, args);
++#endif
+ 
+   orc_vector_append (&parser->errors,
+                      orc_parse_error_new (orc_parse_get_error_where (parser),
+                                           parser->line_number, -1, text));
++
++#ifdef HAVE_VASPRINTF
++  free (text);
++#endif
+ }
+ 
+ static void
+-- 
+GitLab
+
diff --git a/package/orc/orc.mk b/package/orc/orc.mk
index 436dc9d629..466e554f6b 100644
--- a/package/orc/orc.mk
+++ b/package/orc/orc.mk
@@ -20,5 +20,8 @@ ORC_CONF_OPTS = \
 	-Dtests=disabled \
 	-Dtools=disabled
 
+# 0001-use-vasprintf-if-available-for-error-messages-and-otherwise-vsnprintf.patch
+ORC_IGNORE_CVES += CVE-2024-40897
+
 $(eval $(meson-package))
 $(eval $(host-meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
