Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAF00C43602
	for <buildroot@archiver.kernel.org>; Fri,  3 Jul 2026 14:27:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 833E88235C;
	Fri,  3 Jul 2026 14:27:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wg9Y2ZAKg5rI; Fri,  3 Jul 2026 14:27:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6C53A80E77
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783088829;
	bh=ZDN5HhIJmivQeyCKxT76X++a5bSMgNu1IBkvxlNEH30=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=k6A7EAzH6u0samhGQkH4WgfE93j6QcHVLOL1FJZ+8CK78AU2db5FLAuD/hkD+wP4J
	 QZU/p6JcbjeM6+vT79PRhys06t77C+3hrT1ftaMGkyIFC9233WqHYz/AAMt/K/4qrd
	 gGOB9JFOq3YsOiDEKfYvAtZdNAaYyAAct3CqtqHOt/R5a3K8bPYbuILr6OP9AifbQX
	 +VxWtMyiooCgYVgbRH75ftyYJcz2WPynm8fBmeLM44RN1eKC4gm1gueqf/MqmKaK3m
	 LtV10jxREwStbABajtKwP46YgyiOdtwa+LHBrLAWJ7/XaTVUzfws0BuUjDdZta2tNd
	 Kr9g53p5wLaeg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6C53A80E77;
	Fri,  3 Jul 2026 14:27:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id DBED614F
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:26:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CD4D560648
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:26:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id olbnLMyjQJSY for <buildroot@buildroot.org>;
 Fri,  3 Jul 2026 14:26:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3433160ADC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3433160ADC
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:26:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CAEC8883A1; Fri,  3 Jul 2026 14:26:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 2 Jul 2026 21:55:12 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: b559719207ea94e53b56a537f6a8205a136e942a
X-Git-Newrev: 5c906d4a3142020696581f0a1f9a62db55976586
X-Patchwork-Hint: ignore
Message-Id: <20260703142615.CAEC8883A1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libglib2:
 backport security fixes for CVE-2025-14087
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
Content-Type: multipart/mixed; boundary="===============4857778645731279329=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4857778645731279329==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5c906d4a3142020696581f0a1f9a62db55976586
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Fixes CVE-2025-14087: A flaw was found in GLib (Gnome Lib).  This
vulnerability allows a remote attacker to cause heap corruption, leading to
a denial of service or potential code execution via a buffer-underflow in
the GVariant parser when processing maliciously crafted input strings.

https://gitlab.gnome.org/GNOME/glib/-/issues/3834

The fixes were applied upstream as part of 2.86.3, so backport them for the
2.82.5 version currently used by Buildroot LTS.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...rser-Fix-potential-integer-overflow-parsi.patch |  72 ++++++
 ...rser-Use-size_t-to-count-numbers-of-child.patch | 243 +++++++++++++++++++++
 ...rser-Convert-error-handling-code-to-use-s.patch | 153 +++++++++++++
 package/libglib2/libglib2.mk                       |   5 +
 4 files changed, 473 insertions(+)

diff --git a/package/libglib2/0003-gvariant-parser-Fix-potential-integer-overflow-parsi.patch b/package/libglib2/0003-gvariant-parser-Fix-potential-integer-overflow-parsi.patch
new file mode 100644
index 0000000000..1105d32421
--- /dev/null
+++ b/package/libglib2/0003-gvariant-parser-Fix-potential-integer-overflow-parsi.patch
@@ -0,0 +1,72 @@
+From c4a9a331b8a120cb2b44cab4bf93e331e8d87dea Mon Sep 17 00:00:00 2001
+From: Philip Withnall <pwithnall@gnome.org>
+Date: Tue, 25 Nov 2025 19:02:56 +0000
+Subject: [PATCH] gvariant-parser: Fix potential integer overflow parsing
+ (byte)strings
+
+The termination condition for parsing string and bytestring literals in
+GVariant text format input was subject to an integer overflow for input
+string (or bytestring) literals longer than `INT_MAX`.
+
+Fix that by counting as a `size_t` rather than as an `int`. The counter
+can never correctly be negative.
+
+Spotted by treeplus. Thanks to the Sovereign Tech Resilience programme
+from the Sovereign Tech Agency. ID: #YWH-PGM9867-145
+
+CVE: CVE-2025-14087
+Upstream: https://gitlab.gnome.org/GNOME/glib/-/commit/3e72fe0fbb32c18a66486c4da8bc851f656af287
+Signed-off-by: Philip Withnall <pwithnall@gnome.org>
+Fixes: #3834
+(cherry picked from commit 3e72fe0fbb32c18a66486c4da8bc851f656af287)
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ glib/gvariant-parser.c | 10 +++++-----
+ 1 file changed, 5 insertions(+), 5 deletions(-)
+
+diff --git a/glib/gvariant-parser.c b/glib/gvariant-parser.c
+index 8bd16766c..6331e0c95 100644
+--- a/glib/gvariant-parser.c
++++ b/glib/gvariant-parser.c
+@@ -597,7 +597,7 @@ ast_resolve (AST     *ast,
+ {
+   GVariant *value;
+   gchar *pattern;
+-  gint i, j = 0;
++  size_t i, j = 0;
+ 
+   pattern = ast_get_pattern (ast, error);
+ 
+@@ -1621,9 +1621,9 @@ string_free (AST *ast)
+  * No leading/trailing space allowed. */
+ static gboolean
+ unicode_unescape (const gchar  *src,
+-                  gint         *src_ofs,
++                  size_t       *src_ofs,
+                   gchar        *dest,
+-                  gint         *dest_ofs,
++                  size_t       *dest_ofs,
+                   gsize         length,
+                   SourceRef    *ref,
+                   GError      **error)
+@@ -1684,7 +1684,7 @@ string_parse (TokenStream  *stream,
+   gsize length;
+   gchar quote;
+   gchar *str;
+-  gint i, j;
++  size_t i, j;
+ 
+   token_stream_start_ref (stream, &ref);
+   token = token_stream_get (stream);
+@@ -1814,7 +1814,7 @@ bytestring_parse (TokenStream  *stream,
+   gsize length;
+   gchar quote;
+   gchar *str;
+-  gint i, j;
++  size_t i, j;
+ 
+   token_stream_start_ref (stream, &ref);
+   token = token_stream_get (stream);
+-- 
+2.43.0
+
diff --git a/package/libglib2/0004-gvariant-parser-Use-size_t-to-count-numbers-of-child.patch b/package/libglib2/0004-gvariant-parser-Use-size_t-to-count-numbers-of-child.patch
new file mode 100644
index 0000000000..574872cd83
--- /dev/null
+++ b/package/libglib2/0004-gvariant-parser-Use-size_t-to-count-numbers-of-child.patch
@@ -0,0 +1,243 @@
+From d2a32af9109d4021d724c4b228f04e853a02fb50 Mon Sep 17 00:00:00 2001
+From: Philip Withnall <pwithnall@gnome.org>
+Date: Tue, 25 Nov 2025 19:19:16 +0000
+Subject: [PATCH] gvariant-parser: Use size_t to count numbers of child
+ elements
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Rather than using `gint`, which could overflow for arrays (or dicts, or
+tuples) longer than `INT_MAX`. There may be other limits which prevent
+parsed containers becoming that long, but we might as well make the type
+system reflect the programmer’s intention as best it can anyway.
+
+For arrays and tuples this is straightforward. For dictionaries, it’s
+slightly complicated by the fact that the code used
+`dict->n_children == -1` to indicate that the `Dictionary` struct in
+question actually represented a single freestanding dict entry. In
+GVariant text format, that would be `{1, "one"}`.
+
+The implementation previously didn’t define the semantics of
+`dict->n_children < -1`.
+
+Now, instead, change `Dictionary.n_children` to `size_t`, and define a
+magic value `DICTIONARY_N_CHILDREN_FREESTANDING_ENTRY` to indicate that
+the `Dictionary` represents a single freestanding dict entry.
+
+This magic value is `SIZE_MAX`, and given that a dictionary entry takes
+more than one byte to represent in GVariant text format, that means it’s
+not possible to have that many entries in a parsed dictionary, so this
+magic value won’t be hit by a normal dictionary. An assertion checks
+this anyway.
+
+Spotted while working on #3834.
+
+CVE: CVE-2025-14087
+Upstream: https://gitlab.gnome.org/GNOME/glib/-/commit/6fe481cec709ec65b5846113848723bc25a8782a
+Signed-off-by: Philip Withnall <pwithnall@gnome.org>
+(cherry picked from commit 6fe481cec709ec65b5846113848723bc25a8782a)
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ glib/gvariant-parser.c | 58 ++++++++++++++++++++++++------------------
+ 1 file changed, 33 insertions(+), 25 deletions(-)
+
+diff --git a/glib/gvariant-parser.c b/glib/gvariant-parser.c
+index 6331e0c95..6d20db7ef 100644
+--- a/glib/gvariant-parser.c
++++ b/glib/gvariant-parser.c
+@@ -650,9 +650,9 @@ static AST *parse (TokenStream  *stream,
+                    GError      **error);
+ 
+ static void
+-ast_array_append (AST  ***array,
+-                  gint   *n_items,
+-                  AST    *ast)
++ast_array_append (AST    ***array,
++                  size_t   *n_items,
++                  AST      *ast)
+ {
+   if ((*n_items & (*n_items - 1)) == 0)
+     *array = g_renew (AST *, *array, *n_items ? 2 ** n_items : 1);
+@@ -661,10 +661,10 @@ ast_array_append (AST  ***array,
+ }
+ 
+ static void
+-ast_array_free (AST  **array,
+-                gint   n_items)
++ast_array_free (AST    **array,
++                size_t   n_items)
+ {
+-  gint i;
++  size_t i;
+ 
+   for (i = 0; i < n_items; i++)
+     ast_free (array[i]);
+@@ -673,11 +673,11 @@ ast_array_free (AST  **array,
+ 
+ static gchar *
+ ast_array_get_pattern (AST    **array,
+-                       gint     n_items,
++                       size_t   n_items,
+                        GError **error)
+ {
+   gchar *pattern;
+-  gint i;
++  size_t i;
+ 
+   /* Find the pattern which applies to all children in the array, by l-folding a
+    * coalesce operation.
+@@ -709,7 +709,7 @@ ast_array_get_pattern (AST    **array,
+          * pair of values.
+          */
+         {
+-          int j = 0;
++          size_t j = 0;
+ 
+           while (TRUE)
+             {
+@@ -957,7 +957,7 @@ typedef struct
+   AST ast;
+ 
+   AST **children;
+-  gint n_children;
++  size_t n_children;
+ } Array;
+ 
+ static gchar *
+@@ -990,7 +990,7 @@ array_get_value (AST                 *ast,
+   Array *array = (Array *) ast;
+   const GVariantType *childtype;
+   GVariantBuilder builder;
+-  gint i;
++  size_t i;
+ 
+   if (!g_variant_type_is_array (type))
+     return ast_type_error (ast, type, error);
+@@ -1076,7 +1076,7 @@ typedef struct
+   AST ast;
+ 
+   AST **children;
+-  gint n_children;
++  size_t n_children;
+ } Tuple;
+ 
+ static gchar *
+@@ -1086,7 +1086,7 @@ tuple_get_pattern (AST     *ast,
+   Tuple *tuple = (Tuple *) ast;
+   gchar *result = NULL;
+   gchar **parts;
+-  gint i;
++  size_t i;
+ 
+   parts = g_new (gchar *, tuple->n_children + 4);
+   parts[tuple->n_children + 1] = (gchar *) ")";
+@@ -1116,7 +1116,7 @@ tuple_get_value (AST                 *ast,
+   Tuple *tuple = (Tuple *) ast;
+   const GVariantType *childtype;
+   GVariantBuilder builder;
+-  gint i;
++  size_t i;
+ 
+   if (!g_variant_type_is_tuple (type))
+     return ast_type_error (ast, type, error);
+@@ -1308,9 +1308,16 @@ typedef struct
+ 
+   AST **keys;
+   AST **values;
+-  gint n_children;
++
++  /* Iff this is DICTIONARY_N_CHILDREN_FREESTANDING_ENTRY then this struct
++   * represents a single freestanding dict entry (`{1, "one"}`) rather than a
++   * full dict. In the freestanding case, @keys and @values have exactly one
++   * member each. */
++  size_t n_children;
+ } Dictionary;
+ 
++#define DICTIONARY_N_CHILDREN_FREESTANDING_ENTRY ((size_t) -1)
++
+ static gchar *
+ dictionary_get_pattern (AST     *ast,
+                         GError **error)
+@@ -1325,7 +1332,7 @@ dictionary_get_pattern (AST     *ast,
+     return g_strdup ("Ma{**}");
+ 
+   key_pattern = ast_array_get_pattern (dict->keys,
+-                                       abs (dict->n_children),
++                                       (dict->n_children == DICTIONARY_N_CHILDREN_FREESTANDING_ENTRY) ? 1 : dict->n_children,
+                                        error);
+ 
+   if (key_pattern == NULL)
+@@ -1356,7 +1363,7 @@ dictionary_get_pattern (AST     *ast,
+     return NULL;
+ 
+   result = g_strdup_printf ("M%s{%c%s}",
+-                            dict->n_children > 0 ? "a" : "",
++                            (dict->n_children > 0 && dict->n_children != DICTIONARY_N_CHILDREN_FREESTANDING_ENTRY) ? "a" : "",
+                             key_char, value_pattern);
+   g_free (value_pattern);
+ 
+@@ -1370,7 +1377,7 @@ dictionary_get_value (AST                 *ast,
+ {
+   Dictionary *dict = (Dictionary *) ast;
+ 
+-  if (dict->n_children == -1)
++  if (dict->n_children == DICTIONARY_N_CHILDREN_FREESTANDING_ENTRY)
+     {
+       const GVariantType *subtype;
+       GVariantBuilder builder;
+@@ -1403,7 +1410,7 @@ dictionary_get_value (AST                 *ast,
+     {
+       const GVariantType *entry, *key, *val;
+       GVariantBuilder builder;
+-      gint i;
++      size_t i;
+ 
+       if (!g_variant_type_is_subtype_of (type, G_VARIANT_TYPE_DICTIONARY))
+         return ast_type_error (ast, type, error);
+@@ -1444,12 +1451,12 @@ static void
+ dictionary_free (AST *ast)
+ {
+   Dictionary *dict = (Dictionary *) ast;
+-  gint n_children;
++  size_t n_children;
+ 
+-  if (dict->n_children > -1)
+-    n_children = dict->n_children;
+-  else
++  if (dict->n_children == DICTIONARY_N_CHILDREN_FREESTANDING_ENTRY)
+     n_children = 1;
++  else
++    n_children = dict->n_children;
+ 
+   ast_array_free (dict->keys, n_children);
+   ast_array_free (dict->values, n_children);
+@@ -1467,7 +1474,7 @@ dictionary_parse (TokenStream  *stream,
+     maybe_wrapper, dictionary_get_value,
+     dictionary_free
+   };
+-  gint n_keys, n_values;
++  size_t n_keys, n_values;
+   gboolean only_one;
+   Dictionary *dict;
+   AST *first;
+@@ -1510,7 +1517,7 @@ dictionary_parse (TokenStream  *stream,
+         goto error;
+ 
+       g_assert (n_keys == 1 && n_values == 1);
+-      dict->n_children = -1;
++      dict->n_children = DICTIONARY_N_CHILDREN_FREESTANDING_ENTRY;
+ 
+       return (AST *) dict;
+     }
+@@ -1543,6 +1550,7 @@ dictionary_parse (TokenStream  *stream,
+     }
+ 
+   g_assert (n_keys == n_values);
++  g_assert (n_keys != DICTIONARY_N_CHILDREN_FREESTANDING_ENTRY);
+   dict->n_children = n_keys;
+ 
+   return (AST *) dict;
+-- 
+2.43.0
+
diff --git a/package/libglib2/0005-gvariant-parser-Convert-error-handling-code-to-use-s.patch b/package/libglib2/0005-gvariant-parser-Convert-error-handling-code-to-use-s.patch
new file mode 100644
index 0000000000..f38b2b3686
--- /dev/null
+++ b/package/libglib2/0005-gvariant-parser-Convert-error-handling-code-to-use-s.patch
@@ -0,0 +1,153 @@
+From f856ca2b86dcbfd8983fed7b6e9b43cf3ae2a5ad Mon Sep 17 00:00:00 2001
+From: Philip Withnall <pwithnall@gnome.org>
+Date: Tue, 25 Nov 2025 19:25:58 +0000
+Subject: [PATCH] gvariant-parser: Convert error handling code to use size_t
+
+The error handling code allows for printing out the range of input bytes
+related to a parsing error. This was previously done using `gint`, but
+the input could be longer than `INT_MAX`, so it should really be done
+using `size_t`.
+
+Spotted while working on #3834.
+
+CVE: CVE-2025-14087
+Upstream: https://gitlab.gnome.org/GNOME/glib/-/commit/dd333a40aa95819720a01caf6de564cd8a4a6310
+Signed-off-by: Philip Withnall <pwithnall@gnome.org>
+(cherry picked from commit dd333a40aa95819720a01caf6de564cd8a4a6310)
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ glib/gvariant-parser.c | 36 +++++++++++++++++++++++-------------
+ 1 file changed, 23 insertions(+), 13 deletions(-)
+
+diff --git a/glib/gvariant-parser.c b/glib/gvariant-parser.c
+index 6d20db7ef..163e2b586 100644
+--- a/glib/gvariant-parser.c
++++ b/glib/gvariant-parser.c
+@@ -91,7 +91,9 @@ g_variant_parser_get_error_quark (void)
+ 
+ typedef struct
+ {
+-  gint start, end;
++  /* Offsets from the start of the input, in bytes. Can be equal when referring
++   * to a point rather than a range. The invariant `end >= start` always holds. */
++  size_t start, end;
+ } SourceRef;
+ 
+ G_GNUC_PRINTF(5, 0)
+@@ -106,14 +108,16 @@ parser_set_error_va (GError      **error,
+   GString *msg = g_string_new (NULL);
+ 
+   if (location->start == location->end)
+-    g_string_append_printf (msg, "%d", location->start);
++    g_string_append_printf (msg, "%" G_GSIZE_FORMAT, location->start);
+   else
+-    g_string_append_printf (msg, "%d-%d", location->start, location->end);
++    g_string_append_printf (msg, "%" G_GSIZE_FORMAT "-%" G_GSIZE_FORMAT,
++                            location->start, location->end);
+ 
+   if (other != NULL)
+     {
+       g_assert (other->start != other->end);
+-      g_string_append_printf (msg, ",%d-%d", other->start, other->end);
++      g_string_append_printf (msg, ",%" G_GSIZE_FORMAT "-%" G_GSIZE_FORMAT,
++                              other->start, other->end);
+     }
+   g_string_append_c (msg, ':');
+ 
+@@ -140,11 +144,15 @@ parser_set_error (GError      **error,
+ 
+ typedef struct
+ {
++  /* We should always have the following ordering constraint:
++   *   start <= this <= stream <= end
++   * Additionally, unless in an error or EOF state, `this < stream`.
++   */
+   const gchar *start;
+   const gchar *stream;
+   const gchar *end;
+ 
+-  const gchar *this;
++  const gchar *this;  /* (nullable) */
+ } TokenStream;
+ 
+ 
+@@ -175,7 +183,7 @@ token_stream_set_error (TokenStream  *stream,
+ static gboolean
+ token_stream_prepare (TokenStream *stream)
+ {
+-  gint brackets = 0;
++  gssize brackets = 0;
+   const gchar *end;
+ 
+   if (stream->this != NULL)
+@@ -405,7 +413,7 @@ static void
+ pattern_copy (gchar       **out,
+               const gchar **in)
+ {
+-  gint brackets = 0;
++  gssize brackets = 0;
+ 
+   while (**in == 'a' || **in == 'm' || **in == 'M')
+     *(*out)++ = *(*in)++;
+@@ -2743,7 +2751,7 @@ g_variant_builder_add_parsed (GVariantBuilder *builder,
+ static gboolean
+ parse_num (const gchar *num,
+            const gchar *limit,
+-           guint       *result)
++           size_t      *result)
+ {
+   gchar *endptr;
+   gint64 bignum;
+@@ -2753,10 +2761,12 @@ parse_num (const gchar *num,
+   if (endptr != limit)
+     return FALSE;
+ 
++  /* The upper bound here is more restrictive than it technically needs to be,
++   * but should be enough for any practical situation: */
+   if (bignum < 0 || bignum > G_MAXINT)
+     return FALSE;
+ 
+-  *result = (guint) bignum;
++  *result = (size_t) bignum;
+ 
+   return TRUE;
+ }
+@@ -2767,7 +2777,7 @@ add_last_line (GString     *err,
+ {
+   const gchar *last_nl;
+   gchar *chomped;
+-  gint i;
++  size_t i;
+ 
+   /* This is an error at the end of input.  If we have a file
+    * with newlines, that's probably the empty string after the
+@@ -2912,7 +2922,7 @@ g_variant_parse_error_print_context (GError      *error,
+ 
+   if (dash == NULL || colon < dash)
+     {
+-      guint point;
++      size_t point;
+ 
+       /* we have a single point */
+       if (!parse_num (error->message, colon, &point))
+@@ -2930,7 +2940,7 @@ g_variant_parse_error_print_context (GError      *error,
+       /* We have one or two ranges... */
+       if (comma && comma < colon)
+         {
+-          guint start1, end1, start2, end2;
++          size_t start1, end1, start2, end2;
+           const gchar *dash2;
+ 
+           /* Two ranges */
+@@ -2946,7 +2956,7 @@ g_variant_parse_error_print_context (GError      *error,
+         }
+       else
+         {
+-          guint start, end;
++          size_t start, end;
+ 
+           /* One range */
+           if (!parse_num (error->message, dash, &start) || !parse_num (dash + 1, colon, &end))
+-- 
+2.43.0
+
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index e0ef652593..c18c626ef8 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -28,6 +28,11 @@ LIBGLIB2_IGNORE_CVES += CVE-2025-6052
 # 0002-gfileutils-fix-computation-of-temporary-file-name.patch
 LIBGLIB2_IGNORE_CVES += CVE-2025-7039
 
+# 0003-gvariant-parser-Fix-potential-integer-overflow-parsi.patch
+# 0004-gvariant-parser-Use-size_t-to-count-numbers-of-child.patch
+# 0005-gvariant-parser-Convert-error-handling-code-to-use-s.patch
+LIBGLIB2_IGNORE_CVES += CVE-2025-14087
+
 HOST_LIBGLIB2_CONF_OPTS = \
 	-Ddtrace=false \
 	-Dglib_debug=disabled \

--===============4857778645731279329==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4857778645731279329==--
