Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EC6EC44507
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 13:43:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3FBDE60707;
	Fri, 10 Jul 2026 13:43:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zZ72pC3xqQhH; Fri, 10 Jul 2026 13:43:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F463608D0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783691009;
	bh=YCsJTfNt69wolfMOn6gZjOkB0AePi3+Qh5PXx/KsxNk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=KpJ54GuwqhmBLQ0O0StwzVtg5nsEUGBP+k45uLQbqR79rG+ndC4Mdrbvec7mZHX7P
	 uODGHM0qKkWfeJQO/1xDCTrK9XGLvdz9CY1ujlf35y15i5x6LQnXofIfgTzxTwhbMW
	 bvgDoLO9MED2OgQpBg6L68DB1LjV741IMjVK1MUwQSvjsQ+qkUIWa5bNQsjtLbYic9
	 g31Nv/Ufs3fAGt9KW7h4ycQ1IbdHJT4oY0Fhen22/t6WoEahRfnJ/AGLP8zjKVbci4
	 +2C/0UAn/Fhh0VoanQrGu4+rSmiTFrYRdBtKyoQI7DzEq7hk5NOMEqGspOh86GkCoz
	 isPRwPiRh8Nyg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4F463608D0;
	Fri, 10 Jul 2026 13:43:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7E20E2FE
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:42:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7245340768
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:42:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oa1uX5T9_kzw for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 13:42:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 26E81408F7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 26E81408F7
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:42:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5C25C88678; Fri, 10 Jul 2026 13:42:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 8 Jul 2026 14:27:00 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 8e173aa06955e7352d26afbf4b118c6ca52d070b
X-Git-Newrev: 4dec614d3172cad6363e39d84480cfff2970d932
X-Patchwork-Hint: ignore
Message-Id: <20260710134217.5C25C88678@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/jq: patch various
 CVEs
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
Content-Type: multipart/mixed; boundary="===============8139443403734466009=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8139443403734466009==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4dec614d3172cad6363e39d84480cfff2970d932
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Fixes the following vulnerabilities by importing upstream patches:

- CVE-2026-39979: https://github.com/jqlang/jq/commit/2f09060afab23fe9390cce7cb860b10416e1bf5f

- CVE-2026-33948: https://github.com/jqlang/jq/commit/6374ae0bcdfe33a18eb0ae6db28493b1f34a0a5b

- CVE-2026-33947: https://github.com/jqlang/jq/commit/fb59f1491058d58bdc3e8dd28f1773d1ac690a1f

- CVE-2026-32316: https://github.com/jqlang/jq/commit/e47e56d226519635768e6aab2f38f0ab037c09e5

- CVE-2026-40164: https://github.com/jqlang/jq/commit/0c7d133c3c7e37c00b6d46b658a02244fdd3c784

- CVE-2026-40612: https://github.com/jqlang/jq/commit/d1a12569d91641135976a8536776a4a329c02cc2

- CVE-2026-41256: https://github.com/jqlang/jq/commit/5a015deae35d19e3ebbc65db6c157a80e76df738

- CVE-2026-41257: https://github.com/jqlang/jq/commit/01b3cded76daacbfddb7f8763700b0803bcb5c6f

- CVE-2026-43894: https://github.com/jqlang/jq/commit/9761ceb7d6cc48c16b25f0ab1baaef0e701927e4

- CVE-2026-43896: https://github.com/jqlang/jq/commit/532ccea6080ed6758f39fe9f6208a44b665023d2

- CVE-2026-44777: https://github.com/jqlang/jq/commit/f58787c41835d9b17795730cb04925fdba25c71c

- CVE-2026-49839: https://github.com/jqlang/jq/commit/e987df0d463d85fd70825e042a082427e8275b86

- CVE-2026-54679: https://github.com/jqlang/jq/commit/46d1da30944ce93dd671ac72b6513fc0eb747837

Tests were stripped out of the patches.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit e8191c3e17dbcb3388b365c52edd3e928f0ed465)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...-fix-out-of-bounds-read-in-jv-parse-sized.patch |  30 +++++
 ...005-fix-NUL-truncation-in-the-JSON-parser.patch |  35 +++++
 ...imit-path-depth-to-prevent-stack-overflow.patch |  72 +++++++++++
 ...ng-append-and-jvp-string-copy-replace-bad.patch |  53 ++++++++
 ...ed-to-mitigate-hash-collision-DoS-attacks.patch |  90 +++++++++++++
 .../0009-limit-the-containment-check-depth.patch   | 120 +++++++++++++++++
 ...truncation-in-program-files-loaded-with-f.patch |  34 +++++
 ...x-signed-int-overflow-in-stack-reallocate.patch |  53 ++++++++
 ...meric-literals-longer-than-DEC-MAX-DIGITS.patch |  54 ++++++++
 ...ect-merge-depth-to-prevent-stack-overflow.patch |  66 ++++++++++
 ...-module-imports-to-prevent-stack-overflow.patch | 142 +++++++++++++++++++++
 ...-heap-buffer-overflow-in-raw-file-loading.patch |  32 +++++
 ...ounds-and-propagate-invalid-jv-in-implode.patch |  65 ++++++++++
 package/jq/jq.mk                                   |  39 ++++++
 14 files changed, 885 insertions(+)

diff --git a/package/jq/0004-fix-out-of-bounds-read-in-jv-parse-sized.patch b/package/jq/0004-fix-out-of-bounds-read-in-jv-parse-sized.patch
new file mode 100644
index 0000000000..77fe358e7e
--- /dev/null
+++ b/package/jq/0004-fix-out-of-bounds-read-in-jv-parse-sized.patch
@@ -0,0 +1,30 @@
+From 2f09060afab23fe9390cce7cb860b10416e1bf5f Mon Sep 17 00:00:00 2001
+From: itchyny <itchyny@cybozu.co.jp>
+Date: Mon, 13 Apr 2026 11:04:52 +0900
+Subject: [PATCH] Fix out-of-bounds read in jv_parse_sized()
+
+This fixes CVE-2026-39979.
+
+Co-authored-by: Mattias Wadman <mattias.wadman@gmail.com>
+Upstream: https://github.com/jqlang/jq/commit/2f09060afab23fe9390cce7cb860b10416e1bf5f
+CVE: CVE-2026-39979
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/jv_parse.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/jv_parse.c b/src/jv_parse.c
+index aa2054cc09..56847b5eaa 100644
+--- a/src/jv_parse.c
++++ b/src/jv_parse.c
+@@ -892,8 +892,9 @@ jv jv_parse_sized_custom_flags(const char* string, int length, int flags) {
+ 
+   if (!jv_is_valid(value) && jv_invalid_has_msg(jv_copy(value))) {
+     jv msg = jv_invalid_get_msg(value);
+-    value = jv_invalid_with_msg(jv_string_fmt("%s (while parsing '%s')",
++    value = jv_invalid_with_msg(jv_string_fmt("%s (while parsing '%.*s')",
+                                               jv_string_value(msg),
++                                              length,
+                                               string));
+     jv_free(msg);
+   }
diff --git a/package/jq/0005-fix-NUL-truncation-in-the-JSON-parser.patch b/package/jq/0005-fix-NUL-truncation-in-the-JSON-parser.patch
new file mode 100644
index 0000000000..90d26fbd34
--- /dev/null
+++ b/package/jq/0005-fix-NUL-truncation-in-the-JSON-parser.patch
@@ -0,0 +1,35 @@
+From 6374ae0bcdfe33a18eb0ae6db28493b1f34a0a5b Mon Sep 17 00:00:00 2001
+From: itchyny <itchyny@cybozu.co.jp>
+Date: Mon, 13 Apr 2026 08:46:11 +0900
+Subject: [PATCH] Fix NUL truncation in the JSON parser
+
+This fixes CVE-2026-33948.
+
+Upstream: https://github.com/jqlang/jq/commit/6374ae0bcdfe33a18eb0ae6db28493b1f34a0a5b
+CVE: CVE-2026-33948
+[thomas: remove tests]
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/util.c   | 8 +-------
+ tests/shtest | 6 ++++++
+ 2 files changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/src/util.c b/src/util.c
+index fdfdb96d88..80d65fc808 100644
+--- a/src/util.c
++++ b/src/util.c
+@@ -309,13 +309,7 @@ static int jq_util_input_read_more(jq_util_input_state *state) {
+       if (p != NULL)
+         state->current_line++;
+ 
+-      if (p == NULL && state->parser != NULL) {
+-        /*
+-         * There should be no NULs in JSON texts (but JSON text
+-         * sequences are another story).
+-         */
+-        state->buf_valid_len = strlen(state->buf);
+-      } else if (p == NULL && feof(state->current_input)) {
++      if (p == NULL && feof(state->current_input)) {
+         size_t i;
+ 
+         /*
diff --git a/package/jq/0006-limit-path-depth-to-prevent-stack-overflow.patch b/package/jq/0006-limit-path-depth-to-prevent-stack-overflow.patch
new file mode 100644
index 0000000000..498d4b81f6
--- /dev/null
+++ b/package/jq/0006-limit-path-depth-to-prevent-stack-overflow.patch
@@ -0,0 +1,72 @@
+From fb59f1491058d58bdc3e8dd28f1773d1ac690a1f Mon Sep 17 00:00:00 2001
+From: itchyny <itchyny@cybozu.co.jp>
+Date: Mon, 13 Apr 2026 11:23:40 +0900
+Subject: [PATCH] Limit path depth to prevent stack overflow
+
+Deeply nested path arrays can cause unbounded recursion in
+`jv_setpath`, `jv_getpath`, and `jv_delpaths`, leading to
+stack overflow. Add a depth limit of 10000 to match the
+existing `tojson` depth limit. This fixes CVE-2026-33947.
+
+CVE: CVE-2026-33947
+Upstream: https://github.com/jqlang/jq/commit/fb59f1491058d58bdc3e8dd28f1773d1ac690a1f
+[thomas: remove tests]
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/jv_aux.c  | 21 +++++++++++++++++++++
+ tests/jq.test | 25 +++++++++++++++++++++++++
+ 2 files changed, 46 insertions(+)
+
+diff --git a/src/jv_aux.c b/src/jv_aux.c
+index 018f380b10..fd5ff96684 100644
+--- a/src/jv_aux.c
++++ b/src/jv_aux.c
+@@ -375,6 +375,10 @@ static jv jv_dels(jv t, jv keys) {
+   return t;
+ }
+ 
++#ifndef MAX_PATH_DEPTH
++#define MAX_PATH_DEPTH (10000)
++#endif
++
+ jv jv_setpath(jv root, jv path, jv value) {
+   if (jv_get_kind(path) != JV_KIND_ARRAY) {
+     jv_free(value);
+@@ -382,6 +386,12 @@ jv jv_setpath(jv root, jv path, jv value) {
+     jv_free(path);
+     return jv_invalid_with_msg(jv_string("Path must be specified as an array"));
+   }
++  if (jv_array_length(jv_copy(path)) > MAX_PATH_DEPTH) {
++    jv_free(value);
++    jv_free(root);
++    jv_free(path);
++    return jv_invalid_with_msg(jv_string("Path too deep"));
++  }
+   if (!jv_is_valid(root)){
+     jv_free(value);
+     jv_free(path);
+@@ -434,6 +444,11 @@ jv jv_getpath(jv root, jv path) {
+     jv_free(path);
+     return jv_invalid_with_msg(jv_string("Path must be specified as an array"));
+   }
++  if (jv_array_length(jv_copy(path)) > MAX_PATH_DEPTH) {
++    jv_free(root);
++    jv_free(path);
++    return jv_invalid_with_msg(jv_string("Path too deep"));
++  }
+   if (!jv_is_valid(root)) {
+     jv_free(path);
+     return root;
+@@ -511,6 +526,12 @@ jv jv_delpaths(jv object, jv paths) {
+       jv_free(elem);
+       return err;
+     }
++    if (jv_array_length(jv_copy(elem)) > MAX_PATH_DEPTH) {
++      jv_free(object);
++      jv_free(paths);
++      jv_free(elem);
++      return jv_invalid_with_msg(jv_string("Path too deep"));
++    }
+     jv_free(elem);
+   }
+   if (jv_array_length(jv_copy(paths)) == 0) {
diff --git a/package/jq/0007-fix-heap-buffer-overflow-in-jvp-string-append-and-jvp-string-copy-replace-bad.patch b/package/jq/0007-fix-heap-buffer-overflow-in-jvp-string-append-and-jvp-string-copy-replace-bad.patch
new file mode 100644
index 0000000000..b835c9d1c8
--- /dev/null
+++ b/package/jq/0007-fix-heap-buffer-overflow-in-jvp-string-append-and-jvp-string-copy-replace-bad.patch
@@ -0,0 +1,53 @@
+From e47e56d226519635768e6aab2f38f0ab037c09e5 Mon Sep 17 00:00:00 2001
+From: itchyny <itchyny@cybozu.co.jp>
+Date: Thu, 12 Mar 2026 20:28:43 +0900
+Subject: [PATCH] Fix heap buffer overflow in `jvp_string_append` and
+ `jvp_string_copy_replace_bad`
+
+In `jvp_string_append`, the allocation size `(currlen + len) * 2` could
+overflow `uint32_t` when `currlen + len` exceeds `INT_MAX`, causing a small
+allocation followed by a large `memcpy`.
+
+In `jvp_string_copy_replace_bad`, the output buffer size calculation
+`length * 3 + 1` could overflow `uint32_t`, again resulting in a small
+allocation followed by a large write.
+
+Add overflow checks to both functions to return an error for strings
+that would exceed `INT_MAX` in length. Fixes CVE-2026-32316.
+
+CVE: CVE-2026-32316
+Upstream: https://github.com/jqlang/jq/commit/e47e56d226519635768e6aab2f38f0ab037c09e5
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/jv.c | 11 ++++++++++-
+ 1 file changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/src/jv.c b/src/jv.c
+index 722a539391..2a62b48419 100644
+--- a/src/jv.c
++++ b/src/jv.c
+@@ -1114,7 +1114,12 @@ static jv jvp_string_copy_replace_bad(const char* data, uint32_t length) {
+   const char* end = data + length;
+   const char* i = data;
+ 
+-  uint32_t maxlength = length * 3 + 1; // worst case: all bad bytes, each becomes a 3-byte U+FFFD
++  // worst case: all bad bytes, each becomes a 3-byte U+FFFD
++  uint64_t maxlength = (uint64_t)length * 3 + 1;
++  if (maxlength >= INT_MAX) {
++    return jv_invalid_with_msg(jv_string("String too long"));
++  }
++
+   jvp_string* s = jvp_string_alloc(maxlength);
+   char* out = s->data;
+   int c = 0;
+@@ -1174,6 +1179,10 @@ static uint32_t jvp_string_remaining_space(jvp_string* s) {
+ static jv jvp_string_append(jv string, const char* data, uint32_t len) {
+   jvp_string* s = jvp_string_ptr(string);
+   uint32_t currlen = jvp_string_length(s);
++  if ((uint64_t)currlen + len >= INT_MAX) {
++    jv_free(string);
++    return jv_invalid_with_msg(jv_string("String too long"));
++  }
+ 
+   if (jvp_refcnt_unshared(string.u.ptr) &&
+       jvp_string_remaining_space(s) >= len) {
diff --git a/package/jq/0008-randomize-hash-seed-to-mitigate-hash-collision-DoS-attacks.patch b/package/jq/0008-randomize-hash-seed-to-mitigate-hash-collision-DoS-attacks.patch
new file mode 100644
index 0000000000..ac4d6c445e
--- /dev/null
+++ b/package/jq/0008-randomize-hash-seed-to-mitigate-hash-collision-DoS-attacks.patch
@@ -0,0 +1,90 @@
+From 0c7d133c3c7e37c00b6d46b658a02244fdd3c784 Mon Sep 17 00:00:00 2001
+From: itchyny <itchyny@cybozu.co.jp>
+Date: Mon, 13 Apr 2026 08:53:26 +0900
+Subject: [PATCH] Randomize hash seed to mitigate hash collision DoS attacks
+
+The hash function used a fixed seed, allowing attackers to craft colliding keys
+and cause O(n^2) object parsing performance. Initialize the seed from a random
+source at process startup to prevent the attack. This fixes CVE-2026-40164.
+
+Co-authored-by: Asaf Meizner <asafmeizner@gmail.com>
+CVE: CVE-2026-40164
+Upstream: https://github.com/jqlang/jq/commit/0c7d133c3c7e37c00b6d46b658a02244fdd3c784
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ configure.ac |  2 ++
+ src/jv.c     | 34 ++++++++++++++++++++++++++++++++--
+ 2 files changed, 34 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index 5dac42655a..f7067a4341 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -143,6 +143,8 @@ AC_CHECK_MEMBER([struct tm.tm_gmtoff], [AC_DEFINE([HAVE_TM_TM_GMT_OFF],1,[Define
+ AC_CHECK_MEMBER([struct tm.__tm_gmtoff], [AC_DEFINE([HAVE_TM___TM_GMT_OFF],1,[Define to 1 if the system has the __tm_gmt_off field in struct tm])],
+                 [], [[#include <time.h>]])
+ AC_FIND_FUNC([setlocale], [c], [#include <locale.h>], [0,0])
++AC_FIND_FUNC([arc4random], [c], [#include <stdlib.h>], [])
++AC_FIND_FUNC([getentropy], [c], [#include <unistd.h>], [0, 0])
+ 
+ dnl Figure out if we have the pthread functions we actually need
+ AC_FIND_FUNC_NO_LIBS([pthread_key_create], [], [#include <pthread.h>], [NULL, NULL])
+diff --git a/src/jv.c b/src/jv.c
+index 2a62b48419..607ac174f7 100644
+--- a/src/jv.c
++++ b/src/jv.c
+@@ -40,6 +40,10 @@
+ #include <limits.h>
+ #include <math.h>
+ #include <float.h>
++#include <time.h>
++#include <unistd.h>
++#include <fcntl.h>
++#include <pthread.h>
+ 
+ #include "jv_alloc.h"
+ #include "jv.h"
+@@ -1206,7 +1210,33 @@ static jv jvp_string_append(jv string, const char* data, uint32_t len) {
+   }
+ }
+ 
+-static const uint32_t HASH_SEED = 0x432A9843;
++static uint32_t hash_seed;
++static pthread_once_t hash_seed_once = PTHREAD_ONCE_INIT;
++
++static void jvp_hash_seed_init(void) {
++  uint32_t seed;
++#if defined(HAVE_ARC4RANDOM)
++  seed = arc4random();
++#elif defined(HAVE_GETENTROPY)
++  if (getentropy(&seed, sizeof(seed)) != 0)
++    seed = (uint32_t)getpid() ^ (uint32_t)time(NULL);
++#else
++  int fd = open("/dev/urandom", O_RDONLY);
++  if (fd >= 0) {
++    if (read(fd, &seed, sizeof(seed)) != 4)
++      seed = (uint32_t)getpid() ^ (uint32_t)time(NULL);
++    close(fd);
++  } else {
++    seed = (uint32_t)getpid() ^ (uint32_t)time(NULL);
++  }
++#endif
++  hash_seed = seed;
++}
++
++static uint32_t jvp_hash_seed(void) {
++  pthread_once(&hash_seed_once, jvp_hash_seed_init);
++  return hash_seed;
++}
+ 
+ static uint32_t rotl32 (uint32_t x, int8_t r){
+   return (x << r) | (x >> (32 - r));
+@@ -1225,7 +1255,7 @@ static uint32_t jvp_string_hash(jv jstr) {
+   int len = (int)jvp_string_length(str);
+   const int nblocks = len / 4;
+ 
+-  uint32_t h1 = HASH_SEED;
++  uint32_t h1 = jvp_hash_seed();
+ 
+   const uint32_t c1 = 0xcc9e2d51;
+   const uint32_t c2 = 0x1b873593;
diff --git a/package/jq/0009-limit-the-containment-check-depth.patch b/package/jq/0009-limit-the-containment-check-depth.patch
new file mode 100644
index 0000000000..7834b8ed23
--- /dev/null
+++ b/package/jq/0009-limit-the-containment-check-depth.patch
@@ -0,0 +1,120 @@
+From d1a12569d91641135976a8536776a4a329c02cc2 Mon Sep 17 00:00:00 2001
+From: itchyny <itchyny@cybozu.co.jp>
+Date: Fri, 24 Apr 2026 22:02:24 +0900
+Subject: [PATCH] Limit the containment check depth
+
+This fixes CVE-2026-40612.
+
+CVE: CVE-2026-40612
+Upstream: https://github.com/jqlang/jq/commit/d1a12569d91641135976a8536776a4a329c02cc2
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/builtin.c |  5 ++++-
+ src/jv.c      | 40 +++++++++++++++++++++++++++-------------
+ tests/jq.test |  9 +++++++++
+ 3 files changed, 40 insertions(+), 14 deletions(-)
+
+diff --git a/src/builtin.c b/src/builtin.c
+index d33e9fb162..2b2a2d40da 100644
+--- a/src/builtin.c
++++ b/src/builtin.c
+@@ -419,7 +419,10 @@ jv binop_greatereq(jv a, jv b) {
+ 
+ static jv f_contains(jq_state *jq, jv a, jv b) {
+   if (jv_get_kind(a) == jv_get_kind(b)) {
+-    return jv_bool(jv_contains(a, b));
++    int r = jv_contains(a, b);
++    if (r < 0)
++      return jv_invalid_with_msg(jv_string("Containment check too deep"));
++    return jv_bool(r);
+   } else {
+     return type_error2(a, b, "cannot have their containment checked");
+   }
+diff --git a/src/jv.c b/src/jv.c
+index 607ac174f7..4b18c00cf6 100644
+--- a/src/jv.c
++++ b/src/jv.c
+@@ -938,19 +938,19 @@ static void jvp_clamp_slice_params(int len, int *pstart, int *pend)
+ }
+ 
+ 
+-static int jvp_array_contains(jv a, jv b) {
++static int jvp_contains(jv a, jv b, int depth);
++
++static int jvp_array_contains(jv a, jv b, int depth) {
+   int r = 1;
+   jv_array_foreach(b, bi, belem) {
+     int ri = 0;
+     jv_array_foreach(a, ai, aelem) {
+-      if (jv_contains(aelem, jv_copy(belem))) {
+-        ri = 1;
+-        break;
+-      }
++      ri = jvp_contains(aelem, jv_copy(belem), depth);
++      if (ri) break;
+     }
+     jv_free(belem);
+-    if (!ri) {
+-      r = 0;
++    if (ri <= 0) {
++      r = ri;
+       break;
+     }
+   }
+@@ -1843,7 +1843,7 @@ static int jvp_object_equal(jv o1, jv o2) {
+   return len1 == len2;
+ }
+ 
+-static int jvp_object_contains(jv a, jv b) {
++static int jvp_object_contains(jv a, jv b, int depth) {
+   assert(JVP_HAS_KIND(a, JV_KIND_OBJECT));
+   assert(JVP_HAS_KIND(b, JV_KIND_OBJECT));
+   int r = 1;
+@@ -1851,9 +1851,9 @@ static int jvp_object_contains(jv a, jv b) {
+   jv_object_foreach(b, key, b_val) {
+     jv a_val = jv_object_get(jv_copy(a), key);
+ 
+-    r = jv_contains(a_val, b_val);
++    r = jvp_contains(a_val, b_val, depth);
+ 
+-    if (!r) break;
++    if (r <= 0) break;
+   }
+   return r;
+ }
+@@ -2084,14 +2084,23 @@ int jv_identical(jv a, jv b) {
+   return r;
+ }
+ 
+-int jv_contains(jv a, jv b) {
++#ifndef MAX_CONTAINS_DEPTH
++#define MAX_CONTAINS_DEPTH (10000)
++#endif
++
++static int jvp_contains(jv a, jv b, int depth) {
++  if (depth > MAX_CONTAINS_DEPTH) {
++    jv_free(a);
++    jv_free(b);
++    return -1;
++  }
+   int r = 1;
+   if (jv_get_kind(a) != jv_get_kind(b)) {
+     r = 0;
+   } else if (JVP_HAS_KIND(a, JV_KIND_OBJECT)) {
+-    r = jvp_object_contains(a, b);
++    r = jvp_object_contains(a, b, depth + 1);
+   } else if (JVP_HAS_KIND(a, JV_KIND_ARRAY)) {
+-    r = jvp_array_contains(a, b);
++    r = jvp_array_contains(a, b, depth + 1);
+   } else if (JVP_HAS_KIND(a, JV_KIND_STRING)) {
+     int b_len = jv_string_length_bytes(jv_copy(b));
+     if (b_len != 0) {
+@@ -2107,3 +2116,8 @@ int jv_contains(jv a, jv b) {
+   jv_free(b);
+   return r;
+ }
++
++// Returns 1 (contained), 0 (not contained), or -1 (too deep)
++int jv_contains(jv a, jv b) {
++  return jvp_contains(a, b, 0);
++}
diff --git a/package/jq/0010-fix-NUL-truncation-in-program-files-loaded-with-f.patch b/package/jq/0010-fix-NUL-truncation-in-program-files-loaded-with-f.patch
new file mode 100644
index 0000000000..f67a7c8ed4
--- /dev/null
+++ b/package/jq/0010-fix-NUL-truncation-in-program-files-loaded-with-f.patch
@@ -0,0 +1,34 @@
+From 5a015deae35d19e3ebbc65db6c157a80e76df738 Mon Sep 17 00:00:00 2001
+From: itchyny <itchyny@cybozu.co.jp>
+Date: Fri, 24 Apr 2026 22:15:08 +0900
+Subject: [PATCH] Fix NUL truncation in program files loaded with -f
+
+This fixes CVE-2026-41256.
+
+CVE: CVE-2026-41256
+Upstream: https://github.com/jqlang/jq/commit/5a015deae35d19e3ebbc65db6c157a80e76df738
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/main.c   | 8 ++++++++
+ tests/shtest | 7 +++++++
+ 2 files changed, 15 insertions(+)
+
+diff --git a/src/main.c b/src/main.c
+index ce362607e2..fb5c7ab8e3 100644
+--- a/src/main.c
++++ b/src/main.c
+@@ -611,6 +611,14 @@ int main(int argc, char* argv[]) {
+       ret = JQ_ERROR_SYSTEM;
+       goto out;
+     }
++    int len = jv_string_length_bytes(jv_copy(data));
++    if ((size_t)len != strlen(jv_string_value(data))) {
++      fprintf(stderr, "jq: program file contains NUL bytes\n");
++      free(program_origin);
++      jv_free(data);
++      ret = JQ_ERROR_SYSTEM;
++      goto out;
++    }
+     jq_set_attr(jq, jv_string("PROGRAM_ORIGIN"), jq_realpath(jv_string(dirname(program_origin))));
+     ARGS = JV_OBJECT(jv_string("positional"), ARGS,
+                      jv_string("named"), jv_copy(program_arguments));
diff --git a/package/jq/0011-fix-signed-int-overflow-in-stack-reallocate.patch b/package/jq/0011-fix-signed-int-overflow-in-stack-reallocate.patch
new file mode 100644
index 0000000000..b0c39ed23b
--- /dev/null
+++ b/package/jq/0011-fix-signed-int-overflow-in-stack-reallocate.patch
@@ -0,0 +1,53 @@
+From 01b3cded76daacbfddb7f8763700b0803bcb5c6f Mon Sep 17 00:00:00 2001
+From: itchyny <itchyny@cybozu.co.jp>
+Date: Fri, 24 Apr 2026 22:09:44 +0900
+Subject: [PATCH] Fix signed-int overflow in `stack_reallocate`
+
+This fixes CVE-2026-41257.
+
+CVE: CVE-2026-41257
+Upstream: https://github.com/jqlang/jq/commit/01b3cded76daacbfddb7f8763700b0803bcb5c6f
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/exec_stack.h | 14 ++++++++++----
+ 1 file changed, 10 insertions(+), 4 deletions(-)
+
+diff --git a/src/exec_stack.h b/src/exec_stack.h
+index 2a063e8cf9..159c56e4fb 100644
+--- a/src/exec_stack.h
++++ b/src/exec_stack.h
+@@ -2,8 +2,10 @@
+ #define EXEC_STACK_H
+ #include <stddef.h>
+ #include <stdint.h>
++#include <stdio.h>
+ #include <stdlib.h>
+ #include <string.h>
++#include <limits.h>
+ #include "jv_alloc.h"
+ 
+ /*
+@@ -81,15 +83,19 @@ static stack_ptr* stack_block_next(struct stack* s, stack_ptr p) {
+ }
+ 
+ static void stack_reallocate(struct stack* s, size_t sz) {
+-  int old_mem_length = -(s->bound) + ALIGNMENT;
+-  char* old_mem_start = (s->mem_end != NULL) ? (s->mem_end - old_mem_length) : NULL;
++  size_t old_mem_length = (size_t)(-(s->bound)) + ALIGNMENT;
++  char* old_mem_start = s->mem_end != NULL ? s->mem_end - old_mem_length : NULL;
+ 
+-  int new_mem_length = align_round_up((old_mem_length + sz + 256) * 2);
++  size_t new_mem_length = align_round_up((old_mem_length + sz + 256) * 2);
++  if (new_mem_length > INT_MAX) {
++    fprintf(stderr, "jq: error: cannot allocate memory\n");
++    abort();
++  }
+   char* new_mem_start = jv_mem_realloc(old_mem_start, new_mem_length);
+   memmove(new_mem_start + (new_mem_length - old_mem_length),
+             new_mem_start, old_mem_length);
+   s->mem_end = new_mem_start + new_mem_length;
+-  s->bound = -(new_mem_length - ALIGNMENT);
++  s->bound = -(int)(new_mem_length - ALIGNMENT);
+ }
+ 
+ static stack_ptr stack_push_block(struct stack* s, stack_ptr p, size_t sz) {
diff --git a/package/jq/0012-reject-numeric-literals-longer-than-DEC-MAX-DIGITS.patch b/package/jq/0012-reject-numeric-literals-longer-than-DEC-MAX-DIGITS.patch
new file mode 100644
index 0000000000..73b1fb11f3
--- /dev/null
+++ b/package/jq/0012-reject-numeric-literals-longer-than-DEC-MAX-DIGITS.patch
@@ -0,0 +1,54 @@
+From 9761ceb7d6cc48c16b25f0ab1baaef0e701927e4 Mon Sep 17 00:00:00 2001
+From: itchyny <itchyny@cybozu.co.jp>
+Date: Wed, 6 May 2026 19:45:24 +0900
+Subject: [PATCH] Reject numeric literals longer than DEC_MAX_DIGITS
+ (999999999)
+
+A signed-int overflow in decNumber's D2U macro lets huge literals
+write attacker-controlled bytes past a stack buffer. Cap the length
+before calling decNumberFromString, and pre-slice long strings in
+jv_dump_string_trunc so the resulting error message doesn't itself
+allocate a multi-GiB buffer.
+
+Fixes CVE-2026-43894.
+
+CVE: CVE-2026-43894
+Upstream: https://github.com/jqlang/jq/commit/9761ceb7d6cc48c16b25f0ab1baaef0e701927e4
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/jv.c       | 5 ++++-
+ src/jv_print.c | 4 ++++
+ 2 files changed, 8 insertions(+), 1 deletion(-)
+ 
+diff --git a/src/jv.c b/src/jv.c
+index 34573b8..26ccfc0 100644
+--- a/src/jv.c
++++ b/src/jv.c
+@@ -579,8 +579,11 @@
+ }
+ 
+ static jv jvp_literal_number_new(const char * literal) {
++  size_t len = strlen(literal);
++  if (len > DEC_MAX_DIGITS)
++    return JV_INVALID;
+ 
+-  jvp_literal_number * n = jvp_literal_number_alloc(strlen(literal));
++  jvp_literal_number * n = jvp_literal_number_alloc(len);
+ 
+   n->refcnt = JV_REFCNT_INIT;
+   n->literal_data = NULL;
+diff --git a/src/jv_print.c b/src/jv_print.c
+index 7f1e312..25540c5 100644
+--- a/src/jv_print.c
++++ b/src/jv_print.c
+@@ -387,6 +387,10 @@
+ }
+ 
+ char *jv_dump_string_trunc(jv x, char *outbuf, size_t bufsize) {
++  if (jv_get_kind(x) == JV_KIND_STRING &&
++      (size_t)jv_string_length_bytes(jv_copy(x)) > bufsize) {
++    x = jv_string_slice(x, 0, bufsize);
++  }
+   x = jv_dump_string(x,0);
+   const char* p = jv_string_value(x);
+   const size_t len = strlen(p);
diff --git a/package/jq/0013-limit-recursive-object-merge-depth-to-prevent-stack-overflow.patch b/package/jq/0013-limit-recursive-object-merge-depth-to-prevent-stack-overflow.patch
new file mode 100644
index 0000000000..5f2f10d8af
--- /dev/null
+++ b/package/jq/0013-limit-recursive-object-merge-depth-to-prevent-stack-overflow.patch
@@ -0,0 +1,66 @@
+From 532ccea6080ed6758f39fe9f6208a44b665023d2 Mon Sep 17 00:00:00 2001
+From: itchyny <itchyny@cybozu.co.jp>
+Date: Tue, 5 May 2026 22:44:02 +0900
+Subject: [PATCH] Limit recursive object merge depth to prevent stack overflow
+
+This fixes CVE-2026-43896.
+
+CVE: CVE-2026-43896
+Upstream: https://github.com/jqlang/jq/commit/532ccea6080ed6758f39fe9f6208a44b665023d2
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/jv.c      | 25 +++++++++++++++++++++++--
+ tests/jq.test |  9 +++++++++
+ 2 files changed, 32 insertions(+), 2 deletions(-)
+
+diff --git a/src/jv.c b/src/jv.c
+index feb68d1a1c..84fafef666 100644
+--- a/src/jv.c
++++ b/src/jv.c
+@@ -1933,16 +1933,33 @@ jv jv_object_merge(jv a, jv b) {
+   return a;
+ }
+ 
+-jv jv_object_merge_recursive(jv a, jv b) {
++#ifndef MAX_OBJECT_MERGE_DEPTH
++#define MAX_OBJECT_MERGE_DEPTH (10000)
++#endif
++
++static jv jvp_object_merge_recursive(jv a, jv b, int depth) {
+   assert(JVP_HAS_KIND(a, JV_KIND_OBJECT));
+   assert(JVP_HAS_KIND(b, JV_KIND_OBJECT));
+ 
++  if (depth > MAX_OBJECT_MERGE_DEPTH) {
++    jv_free(a);
++    jv_free(b);
++    return jv_invalid_with_msg(jv_string("Object merge too deep"));
++  }
++
+   jv_object_foreach(b, k, v) {
+     jv elem = jv_object_get(jv_copy(a), jv_copy(k));
+     if (jv_is_valid(elem) &&
+         JVP_HAS_KIND(elem, JV_KIND_OBJECT) &&
+         JVP_HAS_KIND(v, JV_KIND_OBJECT)) {
+-      a = jv_object_set(a, k, jv_object_merge_recursive(elem, v));
++      jv merged = jvp_object_merge_recursive(elem, v, depth + 1);
++      if (!jv_is_valid(merged)) {
++        jv_free(k);
++        jv_free(a);
++        jv_free(b);
++        return merged;
++      }
++      a = jv_object_set(a, k, merged);
+     } else {
+       jv_free(elem);
+       a = jv_object_set(a, k, v);
+@@ -1953,6 +1970,10 @@ jv jv_object_merge_recursive(jv a, jv b) {
+   return a;
+ }
+ 
++jv jv_object_merge_recursive(jv a, jv b) {
++  return jvp_object_merge_recursive(a, b, 0);
++}
++
+ /*
+  * Object iteration (internal helpers)
+  */
diff --git a/package/jq/0014-detect-circular-module-imports-to-prevent-stack-overflow.patch b/package/jq/0014-detect-circular-module-imports-to-prevent-stack-overflow.patch
new file mode 100644
index 0000000000..ca82a3a744
--- /dev/null
+++ b/package/jq/0014-detect-circular-module-imports-to-prevent-stack-overflow.patch
@@ -0,0 +1,142 @@
+From f58787c41835d9b17795730cb04925fdba25c71c Mon Sep 17 00:00:00 2001
+From: itchyny <itchyny@cybozu.co.jp>
+Date: Mon, 11 May 2026 20:41:38 +0900
+Subject: [PATCH] Detect circular module imports to prevent stack overflow
+
+jq used to recurse without bound on mutual or self-referential
+`import` declarations, exhausting the stack. Track each library's
+load state with a `loading` flag set before its dependencies are
+processed; a recursive reference to an in-progress library now
+reports "circular import of X".
+
+Fixes CVE-2026-44777.
+
+CVE: CVE-2026-44777
+Upstream: https://github.com/jqlang/jq/commit/f58787c41835d9b17795730cb04925fdba25c71c
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/linker.c                | 59 ++++++++++++++++++++++++-------------
+ 6 files changed, 70 insertions(+), 20 deletions(-)
+
+diff --git a/src/linker.c b/src/linker.c
+index e9027004cc..03f46db05c 100644
+--- a/src/linker.c
++++ b/src/linker.c
+@@ -21,9 +21,13 @@
+ #include "compile.h"
+ #include "jv_alloc.h"
+ 
++struct lib_entry {
++  char *name;
++  block def;
++  int loading;
++};
+ struct lib_loading_state {
+-  char **names;
+-  block *defs;
++  struct lib_entry *entries;
+   uint64_t ct;
+ };
+ static int load_library(jq_state *jq, jv lib_path,
+@@ -303,14 +307,24 @@ static int process_dependencies(jq_state *jq, jv jq_origin, jv lib_origin, block
+     } else {
+       uint64_t state_idx = 0;
+       for (; state_idx < lib_state->ct; ++state_idx) {
+-        if (strcmp(lib_state->names[state_idx],jv_string_value(resolved)) == 0)
++        if (strcmp(lib_state->entries[state_idx].name, jv_string_value(resolved)) == 0)
+           break;
+       }
+ 
+       if (state_idx < lib_state->ct) { // Found
++        if (lib_state->entries[state_idx].loading) {
++          jq_report_error(jq, jv_string_fmt("jq: error: circular import of %s\n",
++                                            jv_string_value(resolved)));
++          jv_free(resolved);
++          jv_free(as);
++          jv_free(deps);
++          jv_free(jq_origin);
++          jv_free(lib_origin);
++          return 1;
++        }
+         jv_free(resolved);
+         // Bind the library to the program
+-        bk = block_bind_library(lib_state->defs[state_idx], bk, OP_IS_CALL_PSEUDO, as_str);
++        bk = block_bind_library(lib_state->entries[state_idx].def, bk, OP_IS_CALL_PSEUDO, as_str);
+       } else { // Not found.   Add it to the table before binding.
+         block dep_def_block = gen_noop();
+         nerrors += load_library(jq, resolved, is_data, raw, optional, as_str, &dep_def_block, lib_state);
+@@ -352,30 +366,38 @@ static int load_library(jq_state *jq, jv lib_path, int is_data, int raw, int opt
+       jq_report_error(jq, jv_string_fmt("jq: error loading data file %s: %s\n", jv_string_value(lib_path), jv_string_value(data)));
+       nerrors++;
+     }
+-    goto out;
+   } else if (is_data) {
+     // import "foo" as $bar;
+     program = gen_const_global(jv_copy(data), as);
++    state_idx = lib_state->ct++;
++    lib_state->entries = jv_mem_realloc(lib_state->entries, lib_state->ct * sizeof(struct lib_entry));
++    lib_state->entries[state_idx].name = strdup(jv_string_value(lib_path));
++    lib_state->entries[state_idx].def = program;
++    lib_state->entries[state_idx].loading = 0;
+   } else {
+     // import "foo" as bar;
+     src = locfile_init(jq, jv_string_value(lib_path), jv_string_value(data), jv_string_length_bytes(jv_copy(data)));
+     nerrors += jq_parse_library(src, &program);
+     locfile_free(src);
+     if (nerrors == 0) {
++      // Register the library before processing its dependencies so that
++      // circular imports can be detected.
++      state_idx = lib_state->ct++;
++      lib_state->entries = jv_mem_realloc(lib_state->entries, lib_state->ct * sizeof(struct lib_entry));
++      lib_state->entries[state_idx].name = strdup(jv_string_value(lib_path));
++      lib_state->entries[state_idx].def = gen_noop();
++      lib_state->entries[state_idx].loading = 1;
++
+       char *lib_origin = strdup(jv_string_value(lib_path));
+       nerrors += process_dependencies(jq, jq_get_jq_origin(jq),
+                                       jv_string(dirname(lib_origin)),
+                                       &program, lib_state);
+       free(lib_origin);
+       program = block_bind_self(program, OP_IS_CALL_PSEUDO);
++      lib_state->entries[state_idx].def = program;
++      lib_state->entries[state_idx].loading = 0;
+     }
+   }
+-  state_idx = lib_state->ct++;
+-  lib_state->names = jv_mem_realloc(lib_state->names, lib_state->ct * sizeof(const char *));
+-  lib_state->defs = jv_mem_realloc(lib_state->defs, lib_state->ct * sizeof(block));
+-  lib_state->names[state_idx] = strdup(jv_string_value(lib_path));
+-  lib_state->defs[state_idx] = program;
+-out:
+   *out_block = program;
+   jv_free(lib_path);
+   jv_free(data);
+@@ -413,7 +435,7 @@ jv load_module_meta(jq_state *jq, jv mod_relpath) {
+ int load_program(jq_state *jq, struct locfile* src, block *out_block) {
+   int nerrors = 0;
+   block program;
+-  struct lib_loading_state lib_state = {0,0,0};
++  struct lib_loading_state lib_state = {0,0};
+   nerrors = jq_parse(src, &program);
+   if (nerrors)
+     return nerrors;
+@@ -439,14 +461,13 @@ int load_program(jq_state *jq, struct locfile* src, block *out_block) {
+   nerrors = process_dependencies(jq, jq_get_jq_origin(jq), jq_get_prog_origin(jq), &program, &lib_state);
+   block libs = gen_noop();
+   for (uint64_t i = 0; i < lib_state.ct; ++i) {
+-    free(lib_state.names[i]);
+-    if (nerrors == 0 && !block_is_const(lib_state.defs[i]))
+-      libs = block_join(libs, lib_state.defs[i]);
++    free(lib_state.entries[i].name);
++    if (nerrors == 0 && !block_is_const(lib_state.entries[i].def))
++      libs = block_join(libs, lib_state.entries[i].def);
+     else
+-      block_free(lib_state.defs[i]);
++      block_free(lib_state.entries[i].def);
+   }
+-  free(lib_state.names);
+-  free(lib_state.defs);
++  free(lib_state.entries);
+   if (nerrors)
+     block_free(program);
+   else
diff --git a/package/jq/0015-fix-heap-buffer-overflow-in-raw-file-loading.patch b/package/jq/0015-fix-heap-buffer-overflow-in-raw-file-loading.patch
new file mode 100644
index 0000000000..c1b0dadfdb
--- /dev/null
+++ b/package/jq/0015-fix-heap-buffer-overflow-in-raw-file-loading.patch
@@ -0,0 +1,32 @@
+From e987df0d463d85fd70825e042a082427e8275b86 Mon Sep 17 00:00:00 2001
+From: itchyny <itchyny@cybozu.co.jp>
+Date: Mon, 8 Jun 2026 22:14:48 +0900
+Subject: [PATCH] Fix heap-buffer-overflow in raw file loading
+
+When `jv_string_append_buf` overflows the string length limit,
+it returns an invalid `jv`; `jv_load_file` then re-entered it
+on the invalid value and overran the heap. Break out of the loop
+once the value is invalid.
+
+Fixes CVE-2026-49839.
+
+CVE: CVE-2026-49839
+Upstream: https://github.com/jqlang/jq/commit/e987df0d463d85fd70825e042a082427e8275b86
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/jv_file.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/jv_file.c b/src/jv_file.c
+index 7706b0e06e..fbc1e4d653 100644
+--- a/src/jv_file.c
++++ b/src/jv_file.c
+@@ -57,6 +57,8 @@ jv jv_load_file(const char* filename, int raw) {
+ 
+     if (raw) {
+       data = jv_string_append_buf(data, buf, n);
++      if (!jv_is_valid(data))
++        break;
+     } else {
+       jv_parser_set_buf(parser, buf, n, !feof(file));
+       jv value;
diff --git a/package/jq/0016-tighten-string-length-bounds-and-propagate-invalid-jv-in-implode.patch b/package/jq/0016-tighten-string-length-bounds-and-propagate-invalid-jv-in-implode.patch
new file mode 100644
index 0000000000..6a922fba8f
--- /dev/null
+++ b/package/jq/0016-tighten-string-length-bounds-and-propagate-invalid-jv-in-implode.patch
@@ -0,0 +1,65 @@
+From 46d1da30944ce93dd671ac72b6513fc0eb747837 Mon Sep 17 00:00:00 2001
+From: itchyny <itchyny@cybozu.co.jp>
+Date: Tue, 16 Jun 2026 14:31:14 +0900
+Subject: [PATCH] Tighten string length bounds and propagate invalid jv in
+ implode
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+The bound added in CVE-2026-32316 (e47e56d22) still allowed
+`sizeof(jvp_string) + (currlen + len) * 2 + 1` to wrap `size_t` on
+32-bit platforms. Tighten the threshold so the final allocation
+fits in 32-bit `size_t`.
+
+Also break out of `jv_string_implode` and `f_string_implode` once
+`jv_string_append_codepoint` returns an invalid `jv`; otherwise the
+next iteration triggers the assertion in `jvp_string_ptr` (or
+invokes undefined behavior under `-DNDEBUG`).
+
+Fixes CVE-2026-54679.
+
+Co-authored-by: Dirk Müller <dirk@dmllr.de>
+
+CVE: CVE-2026-54679
+Upstream: https://github.com/jqlang/jq/commit/46d1da30944ce93dd671ac72b6513fc0eb747837
+[thomas: backport - jv_string_repeat not present]
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ src/builtin.c | 1 +
+ src/jv.c      | 5 +++--
+ 2 files changed, 4 insertions(+), 2 deletions(-)
+
+diff --git a/src/builtin.c b/src/builtin.c
+index ed205d9935..a3b7a61ae8 100644
+--- a/src/builtin.c
++++ b/src/builtin.c
+@@ -1396,6 +1396,7 @@ static jv f_string_implode(jq_state *jq, jv a) {
+     if (nv < 0 || nv > 0x10FFFF || (nv >= 0xD800 && nv <= 0xDFFF))
+       nv = 0xFFFD; // U+FFFD REPLACEMENT CHARACTER
+     s = jv_string_append_codepoint(s, nv);
++    if (!jv_is_valid(s)) break;
+   }
+ 
+   jv_free(a);
+diff --git a/src/jv.c b/src/jv.c
+index bcd7c9b5b0..48a63e6e55 100644
+--- a/src/jv.c
++++ b/src/jv.c
+@@ -1197,7 +1197,7 @@ static uint32_t jvp_string_remaining_space(jvp_string* s) {
+ static jv jvp_string_append(jv string, const char* data, uint32_t len) {
+   jvp_string* s = jvp_string_ptr(string);
+   uint32_t currlen = jvp_string_length(s);
+-  if ((uint64_t)currlen + len >= INT_MAX) {
++  if ((uint64_t)currlen + len >= INT_MAX - sizeof(jvp_string) / 2) {
+     jv_free(string);
+     return jv_invalid_with_msg(jv_string("String too long"));
+   }
+@@ -1483,6 +1483,7 @@ jv jv_string_implode(jv j) {
+     if (nv < 0 || nv > 0x10FFFF || (nv >= 0xD800 && nv <= 0xDFFF))
+       nv = 0xFFFD; // U+FFFD REPLACEMENT CHARACTER
+     s = jv_string_append_codepoint(s, nv);
++    if (!jv_is_valid(s)) break;
+   }
+ 
+   jv_free(j);
diff --git a/package/jq/jq.mk b/package/jq/jq.mk
index ad3b97ea4b..16124c6b51 100644
--- a/package/jq/jq.mk
+++ b/package/jq/jq.mk
@@ -20,6 +20,45 @@ JQ_IGNORE_CVES += CVE-2024-53427
 # 0003-CVE-2025-48060.patch
 JQ_IGNORE_CVES += CVE-2025-48060
 
+# 0004-fix-out-of-bounds-read-in-jv-parse-sized.patch
+JQ_IGNORE_CVES += CVE-2026-39979
+
+# 0005-fix-NUL-truncation-in-the-JSON-parser.patch
+JQ_IGNORE_CVES += CVE-2026-33948
+
+# 0006-limit-path-depth-to-prevent-stack-overflow.patch
+JQ_IGNORE_CVES += CVE-2026-33947
+
+# 0007-fix-heap-buffer-overflow-in-jvp-string-append-and-jvp-string-copy-replace-bad.patch
+JQ_IGNORE_CVES += CVE-2026-32316
+
+# 0008-randomize-hash-seed-to-mitigate-hash-collision-DoS-attacks.patch
+JQ_IGNORE_CVES += CVE-2026-40164
+
+# 0009-limit-the-containment-check-depth.patch
+JQ_IGNORE_CVES += CVE-2026-40612
+
+# 0010-fix-NUL-truncation-in-program-files-loaded-with-f.patch
+JQ_IGNORE_CVES += CVE-2026-41256
+
+# 0011-fix-signed-int-overflow-in-stack-reallocate.patch
+JQ_IGNORE_CVES += CVE-2026-41257
+
+# 0012-reject-numeric-literals-longer-than-DEC-MAX-DIGITS.patch
+JQ_IGNORE_CVES += CVE-2026-43894
+
+# 0013-limit-recursive-object-merge-depth-to-prevent-stack-overflow.patch
+JQ_IGNORE_CVES += CVE-2026-43896
+
+# 0014-detect-circular-module-imports-to-prevent-stack-overflow.patch
+JQ_IGNORE_CVES += CVE-2026-44777
+
+# 0015-fix-heap-buffer-overflow-in-raw-file-loading.patch
+JQ_IGNORE_CVES += CVE-2026-49839
+
+# 0016-tighten-string-length-bounds-and-propagate-invalid-jv-in-implode.patch
+JQ_IGNORE_CVES += CVE-2026-54679
+
 # uses c99 specific features
 JQ_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -std=c99"
 HOST_JQ_CONF_ENV += CFLAGS="$(HOST_CFLAGS) -std=c99"

--===============8139443403734466009==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8139443403734466009==--
