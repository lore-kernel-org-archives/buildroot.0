Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D734EE57D0
	for <buildroot@archiver.kernel.org>; Wed, 11 Sep 2024 19:42:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 23BCE40B8B;
	Wed, 11 Sep 2024 19:42:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C4XXdiE5Vq_S; Wed, 11 Sep 2024 19:42:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B867340FAF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B867340FAF;
	Wed, 11 Sep 2024 19:42:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 75EA31BF369
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 19:41:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6438840F89
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 19:41:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iJvklW0pH6JB for <buildroot@lists.busybox.net>;
 Wed, 11 Sep 2024 19:41:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B983E40197
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B983E40197
 for <buildroot@buildroot.org>; Wed, 11 Sep 2024 19:41:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A423786FB5; Wed, 11 Sep 2024 19:41:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 11 Sep 2024 21:41:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c4b723ecaaa5ec5b719478f471aa1f54becdc809
X-Git-Newrev: 1ae3c6f2ad5fb8bbc46ebe3b7a4bc0d3194d25f2
X-Patchwork-Hint: ignore
Message-Id: <20240911194152.A423786FB5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wireplumber: bump version to 0.5.5
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
Content-Type: multipart/mixed; boundary="===============8201393248956368593=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8201393248956368593==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=1ae3c6f2ad5fb8bbc46ebe3b7a4bc0d3194d25f2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch that was backported from upstream.
Explicitly disable elogind, which doesn't exist in buildroot.
Also disable building tests.

Patch 0001 is upstream.

Signed-off-by: George Kiagiadakis <george.kiagiadakis@collabora.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 .../0001-fix-non-x86_64-architectures.patch        | 215 ---------------------
 package/wireplumber/wireplumber.hash               |   2 +-
 package/wireplumber/wireplumber.mk                 |   4 +-
 3 files changed, 4 insertions(+), 217 deletions(-)

diff --git a/package/wireplumber/0001-fix-non-x86_64-architectures.patch b/package/wireplumber/0001-fix-non-x86_64-architectures.patch
deleted file mode 100644
index 19c34e4e1a..0000000000
--- a/package/wireplumber/0001-fix-non-x86_64-architectures.patch
+++ /dev/null
@@ -1,215 +0,0 @@
-From e429db7e8c266045aee25e153fb2308bd61fe233 Mon Sep 17 00:00:00 2001
-From: Julian Bouzas <julian.bouzas@collabora.com>
-Date: Wed, 9 Feb 2022 07:59:59 -0500
-Subject: [PATCH] spa-json: fix va_list APIs for different architectures
-
-The va_list type might not always be a pointer in some architectures, so we
-cannot guarantee it will be modified after using it for a second time in another
-function. This fixes the issue by using macros so args does not get copied, and
-always gets modified when using it more than once.
-
-Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
-Upstream: https://gitlab.freedesktop.org/pipewire/wireplumber/-/commit/e429db7e8c266045aee25e153fb2308bd61fe233
----
- lib/wp/spa-json.c | 156 ++++++++++++++++++++++++----------------------
- 1 file changed, 80 insertions(+), 76 deletions(-)
-
-diff --git a/lib/wp/spa-json.c b/lib/wp/spa-json.c
-index f14f395d..c5e59a3e 100644
---- a/lib/wp/spa-json.c
-+++ b/lib/wp/spa-json.c
-@@ -363,33 +363,33 @@ wp_spa_json_new_string (const gchar *value)
-       wp_spa_json_builder_new_formatted ("\"%s\"", value));
- }
- 
--static void
--wp_spa_json_builder_add_value (WpSpaJsonBuilder *self, const gchar *fmt,
--    va_list args)
--{
--  switch (*fmt) {
--    case 'n':
--      wp_spa_json_builder_add_null (self);
--      break;
--    case 'b':
--      wp_spa_json_builder_add_boolean (self, va_arg(args, gboolean));
--      break;
--    case 'i':
--      wp_spa_json_builder_add_int (self, va_arg(args, gint));
--      break;
--    case 'f':
--      wp_spa_json_builder_add_float (self, (float)va_arg(args, double));
--      break;
--    case 's':
--      wp_spa_json_builder_add_string (self, va_arg(args, const gchar *));
--      break;
--    case 'J':
--      wp_spa_json_builder_add_json (self, va_arg(args, WpSpaJson *));
--      break;
--    default:
--      return;
--  }
--}
-+/* Args is not a pointer in some architectures, so this needs to be a macro to
-+ * avoid args being copied */
-+#define wp_spa_json_builder_add_value(self,fmt,args)                           \
-+do {                                                                           \
-+  switch (*fmt) {                                                              \
-+    case 'n':                                                                  \
-+      wp_spa_json_builder_add_null (self);                                     \
-+      break;                                                                   \
-+    case 'b':                                                                  \
-+      wp_spa_json_builder_add_boolean (self, va_arg(args, gboolean));          \
-+      break;                                                                   \
-+    case 'i':                                                                  \
-+      wp_spa_json_builder_add_int (self, va_arg(args, gint));                  \
-+      break;                                                                   \
-+    case 'f':                                                                  \
-+      wp_spa_json_builder_add_float (self, (float)va_arg(args, double));       \
-+      break;                                                                   \
-+    case 's':                                                                  \
-+      wp_spa_json_builder_add_string (self, va_arg(args, const gchar *));      \
-+      break;                                                                   \
-+    case 'J':                                                                  \
-+      wp_spa_json_builder_add_json (self, va_arg(args, WpSpaJson *));          \
-+      break;                                                                   \
-+    default:                                                                   \
-+      break;                                                                   \
-+  }								               \
-+} while(false)
- 
- /*!
-  * \brief Creates a spa json of type array
-@@ -724,48 +724,46 @@ wp_spa_json_parse_object_valist (WpSpaJson *self, va_list args)
-   return res;
- }
- 
--static gboolean
--wp_spa_json_parse_value (const gchar *data, int len, const gchar *fmt,
--    va_list args)
--{
--  switch (*fmt) {
--    case 'n':
--      if (!spa_json_is_null (data, len))
--        return FALSE;
--      break;
--    case 'b':
--      if (!wp_spa_json_parse_boolean_internal (data, len,
--          va_arg(args, gboolean *)))
--        return FALSE;
--      break;
--    case 'i':
--      if (spa_json_parse_int (data, len, va_arg(args, gint *)) < 0)
--        return FALSE;
--      break;
--    case 'f':
--      if (spa_json_parse_float (data, len,
--          (float *)va_arg(args, double *)) < 0)
--        return FALSE;
--      break;
--    case 's': {
--      gchar *str = wp_spa_json_parse_string_internal (data, len);
--      if (!str)
--        return FALSE;
--      *va_arg(args, gchar **) = str;
--      break;
--    }
--    case 'J': {
--      WpSpaJson *j = wp_spa_json_new (data, len);
--      if (!j)
--        return FALSE;
--      *va_arg(args, WpSpaJson **) = j;
--      break;
--    }
--    default:
--      return FALSE;
--  }
--  return TRUE;
--}
-+/* Args is not a pointer in some architectures, so this needs to be a macro to
-+ * avoid args being copied */
-+#define wp_spa_json_parse_value(data,len,fmt,args)                             \
-+do {                                                                           \
-+  switch (*fmt) {                                                              \
-+    case 'n':                                                                  \
-+      if (!spa_json_is_null (data, len))                                       \
-+        return FALSE;                                                          \
-+      break;                                                                   \
-+    case 'b':                                                                  \
-+      if (!wp_spa_json_parse_boolean_internal (data, len,                      \
-+          va_arg(args, gboolean *)))                                           \
-+        return FALSE;                                                          \
-+      break;                                                                   \
-+    case 'i':                                                                  \
-+      if (spa_json_parse_int (data, len, va_arg(args, gint *)) < 0)            \
-+        return FALSE;                                                          \
-+      break;                                                                   \
-+    case 'f':                                                                  \
-+      if (spa_json_parse_float (data, len, va_arg(args, float *)) < 0)         \
-+        return FALSE;                                                          \
-+      break;                                                                   \
-+    case 's': {                                                                \
-+      gchar *str = wp_spa_json_parse_string_internal (data, len);              \
-+      if (!str)                                                                \
-+        return FALSE;                                                          \
-+      *va_arg(args, gchar **) = str;                                           \
-+      break;                                                                   \
-+    }                                                                          \
-+    case 'J': {                                                                \
-+      WpSpaJson *j = wp_spa_json_new (data, len);                              \
-+      if (!j)                                                                  \
-+        return FALSE;                                                          \
-+      *va_arg(args, WpSpaJson **) = j;                                         \
-+      break;                                                                   \
-+    }                                                                          \
-+    default:                                                                   \
-+      return FALSE;                                                            \
-+  }                                                                            \
-+} while(false)
- 
- /*!
-  * \brief Parses the object property values of a spa json object
-@@ -827,8 +825,7 @@ wp_spa_json_object_get_valist (WpSpaJson *self, va_list args)
-     value = g_value_get_boxed (&item);
- 
-     if (g_strcmp0 (key_str, lookup_key) == 0) {
--      if (!wp_spa_json_parse_value (value->data, value->size, lookup_fmt, args))
--        return FALSE;
-+      wp_spa_json_parse_value (value->data, value->size, lookup_fmt, args);
-       lookup_key = va_arg(args, const gchar *);
-       if (!lookup_key)
-         return TRUE;
-@@ -1366,9 +1363,12 @@ gboolean
- wp_spa_json_parser_get_value (WpSpaJsonParser *self, const gchar *fmt,
-     va_list args)
- {
--  return wp_spa_json_parser_advance (self) &&
--      wp_spa_json_parse_value (self->curr.cur,
--          self->curr.end - self->curr.cur, fmt, args);
-+  if (wp_spa_json_parser_advance (self)) {
-+    wp_spa_json_parse_value (self->curr.cur, self->curr.end - self->curr.cur,
-+        fmt, args);
-+    return TRUE;
-+  }
-+  return FALSE;
- }
- 
- /*!
-@@ -1419,9 +1419,13 @@ wp_spa_json_parser_get_valist (WpSpaJsonParser *self, va_list args)
-     if (!format)
-       return TRUE;
- 
--    /* parse value */
--    if (!wp_spa_json_parser_get_value (self, format, args))
-+    /* advance */
-+    if (!wp_spa_json_parser_advance (self))
-       return FALSE;
-+
-+    /* parse value */
-+    wp_spa_json_parse_value (self->curr.cur, self->curr.end - self->curr.cur,
-+        format, args);
-   } while (TRUE);
- 
-   return FALSE;
--- 
-GitLab
-
diff --git a/package/wireplumber/wireplumber.hash b/package/wireplumber/wireplumber.hash
index 206d7d15af..7fff34a7a7 100644
--- a/package/wireplumber/wireplumber.hash
+++ b/package/wireplumber/wireplumber.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  6429e8a95e355ce21b4c4f1a5ebc769f037e8dbeec51905ad909ce609a38d0ce  wireplumber-0.4.8.tar.bz2
+sha256  4926399cffe3da12f1338e1feec53ef944e86ae7c719384bff87490d7e3edbc7  wireplumber-0.5.5.tar.bz2
 sha256  ff2eb9af5b05d92ac3a38cffcad27582ef555a31ff1781e1c1d4e087f77c9c81  LICENSE
diff --git a/package/wireplumber/wireplumber.mk b/package/wireplumber/wireplumber.mk
index 763e3d7639..c8cc1ad106 100644
--- a/package/wireplumber/wireplumber.mk
+++ b/package/wireplumber/wireplumber.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WIREPLUMBER_VERSION = 0.4.8
+WIREPLUMBER_VERSION = 0.5.5
 WIREPLUMBER_SOURCE = wireplumber-$(WIREPLUMBER_VERSION).tar.bz2
 WIREPLUMBER_SITE = https://gitlab.freedesktop.org/pipewire/wireplumber/-/archive/$(WIREPLUMBER_VERSION)
 WIREPLUMBER_LICENSE = MIT
@@ -13,6 +13,8 @@ WIREPLUMBER_DEPENDENCIES = host-pkgconf pipewire libglib2 lua
 
 WIREPLUMBER_CONF_OPTS = \
 	-Ddoc=disabled \
+	-Dtests=false \
+	-Delogind=disabled \
 	-Dsystem-lua=true \
 	-Dsystem-lua-version=
 

--===============8201393248956368593==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8201393248956368593==--
