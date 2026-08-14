Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F439C5DF69
	for <buildroot@archiver.kernel.org>; Fri, 14 Aug 2026 13:20:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B763607CD;
	Fri, 14 Aug 2026 13:20:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Gqnnxwca7sPF; Fri, 14 Aug 2026 13:20:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A51BB608FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786713619;
	bh=FHp83tRitRC1Izag/0JsgnYllmRWwp6XesUq7mqbbXc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LCoT29Ozkf1WQw21eZsdiTvmCO87IbOJGTEl6dFW/63KO/xjXQu/MHf6xTwtT94/5
	 0fsQZXZzlmA+vpuZCvp8UyFOMXSjArWD4gtkn8oLObukhH0073a6P7+c2Ygj76Xtu4
	 oipgFSUkpas9Pz/xtWJB3JwMQ1AAxjqWbSU9XiOYfcW3GyjzscyKmLX0t3kJj/MY7i
	 6WEt0s9oRqF6sBSJKLG7nimf6QyrY3GS2lAwOhLaE+yhtnpKnUJbPYFB1+v305inRS
	 MDPIxtSaRFKNc49aowxLQW3yF57JGEfW7RPSmG1Jdg+zd2wZgIUw/oMQzvk1weLydj
	 SBVs0VkjzUpMA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A51BB608FE;
	Fri, 14 Aug 2026 13:20:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 31D0F139B
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:19:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 215B66068A
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:19:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ySxJMRd8oTlQ for <buildroot@buildroot.org>;
 Fri, 14 Aug 2026 13:19:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF118607DD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DF118607DD
 for <buildroot@buildroot.org>; Fri, 14 Aug 2026 13:19:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E36BD8D66B; Fri, 14 Aug 2026 13:18:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 14 Aug 2026 14:40:26 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 0e71eaf8ffaf82b11a310f17d68b2df929733b33
X-Git-Newrev: 80251a06cf88d47385afd74e5e25f68f93bccca7
X-Patchwork-Hint: ignore
Message-Id: <20260814131855.E36BD8D66B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/python3: security
 bump to v3.12.14
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5068343118598547940=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5068343118598547940==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/80251a06cf88d47385afd74e5e25f68f93bccca7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

See the release notes https://www.python.org/downloads/release/python-31214/

Remove patches 0013-0017 which are merged upstream. Also remove md5 checksum
from the hash file, since the download page now provides a sha256

This fixes the following vulnerabilities:
- CVE-2026-7210

https://github.com/python/cpython/issues/149018
https://github.com/python/cpython/commit/e37df2a6a71d6538698e2d3188a7c345b827640b

- CVE-2026-4519

https://github.com/python/cpython/issues/143930
https://github.com/python/cpython/commit/cbba6119391112aba9c5aebf7b94aea447922c48

- CVE-2026-3644

https://github.com/python/cpython/issues/145599
https://github.com/python/cpython/commit/3974092b037f9a3b000fb15b48ea61ce3b25d330

- CVE-2026-15308

 https://github.com/python/cpython/issues/153030
https://github.com/python/cpython/commit/785df8f743800661961528970f8598edcd291c14

- CVE-2025-13462

https://github.com/python/cpython/issues/141707
https://github.com/python/cpython/commit/d10950739a78f54d0718d88fb5a868374603c084

- CVE-2026-2297

https://github.com/python/cpython/issues/145506
https://github.com/python/cpython/commit/c70adad78caeeea33f92f560ecb93331ca11bf66

- CVE-2026-4224

https://github.com/python/cpython/issues/145986
https://github.com/python/cpython/commit/24ce88b285f56ee11626cf5e472af3cd8cc7c621

- CVE‑2026‑4360

https://github.com/python/cpython/issues/151987
https://github.com/python/cpython/commit/0367912be336348b30572f8029cec4a282782d92

- CVE‑2026‑0864

https://github.com/python/cpython/issues/143927
https://github.com/python/cpython/commit/db4a157c790479710a1a840d7937c5c815a6f8b6

- CVE‑2026‑1502

https://github.com/python/cpython/commit/c00c386faa579ad71196d33408644478488e43ec
https://github.com/python/cpython/issues/146211

- CVE‑2026‑3087

https://github.com/python/cpython/commit/a6650a2cdf0c49fb8ce0c982903aa2aa274beefe
https://github.com/python/cpython/issues/146581

- CVE‑2026‑4786

https://github.com/python/cpython/issues/148169
https://github.com/python/cpython/commit/a4d3edf3a6ecfde504d02126410d2a65a859b744

- CVE‑2026‑6100

https://github.com/python/cpython/issues/148395
https://github.com/python/cpython/commit/ea8d735eb084cf8cc021df1a30e90d10a8f052e3

- CVE‑2026‑6879

https://github.com/python/cpython/issues/152674
https://github.com/python/cpython/commit/96510a3758f4a075f43223afdee3b6ee1a7a7f02

- CVE‑2026‑11972

https://github.com/python/cpython/issues/151981
https://github.com/python/cpython/commit/f5e2776ff0383a902c12acf2b703e7e951fc8438

- CVE‑2026‑12003

https://github.com/python/cpython/issues/151544
https://github.com/python/cpython/commit/03ab7b44788bfd6b8927e16bcdbd025aa08dce06

Co-authored-by: Thomas Perale <thomas.perale@mind.be>
(alternative to commit 8583d8b2b452bab02acbd39ac2b0f40889bd99dc)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 ...nonical-ordering-in-unicodedata-normalize.patch | 275 ---------------------
 ...tarfile-data_filter-validate-written-link.patch | 178 -------------
 ...ly-CVE-2021-4189-PASV-fix-to-ftplib-ftpcp.patch | 118 ---------
 ...event-bz2-decompressor-reuse-after-errors.patch | 108 --------
 ...-via-tarfile-hardlink-extraction-fallback.patch |  77 ------
 package/python3/python3.hash                       |   6 +-
 package/python3/python3.mk                         |  13 +-
 7 files changed, 3 insertions(+), 772 deletions(-)

diff --git a/package/python3/0013-Fix-O-n-2-canonical-ordering-in-unicodedata-normalize.patch b/package/python3/0013-Fix-O-n-2-canonical-ordering-in-unicodedata-normalize.patch
deleted file mode 100644
index 1bfce116dc..0000000000
--- a/package/python3/0013-Fix-O-n-2-canonical-ordering-in-unicodedata-normalize.patch
+++ /dev/null
@@ -1,275 +0,0 @@
-From d8deb45e25f8eae007449f4018a4f1e117a772d4 Mon Sep 17 00:00:00 2001
-From: Petr Viktorin <encukou@gmail.com>
-Date: Tue, 2 Jun 2026 18:12:42 +0200
-Subject: [PATCH] [3.12] gh-149079: Fix O(n^2) canonical ordering in
- unicodedata.normalize() (GH-149080)
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Replace the insertion sort used for canonical ordering of combining
-characters with a hybrid approach: insertion sort for short runs (< 20)
-and counting sort for longer runs, reducing worst-case complexity from
-O(n^2) to O(n). This prevents denial of service via crafted Unicode
-strings with many combining characters in alternating CCC order.
-
-(cherry picked from commit 991224b1e8311c85f198f6dd8208bf8cff7fc26f)
-
-Co-authored-by: Seth Larson <seth@python.org>
-Co-authored-by: ch4n3-yoon <ch4n3.yoon@gmail.com>
-Co-authored-by: Seokchan Yoon <13852925+ch4n3-yoon@users.noreply.github.com>
-Co-authored-by: Stan Ulbrych <stan@python.org>
-Co-authored-by: Bénédikt Tran <10796600+picnixz@users.noreply.github.com>
-Co-authored-by: Serhiy Storchaka <storchaka@gmail.com>
-Co-authored-by: Maurycy Pawłowski-Wieroński <maurycy@maurycy.com>
-
-Upstream: https://github.com/python/cpython/pull/150843
-CVE: CVE-2026-3276
-Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
----
- Lib/test/test_unicodedata.py                  |  28 ++++
- ...-04-27-16-36-11.gh-issue-149079.vKl-LM.rst |   5 +
- Modules/unicodedata.c                         | 144 ++++++++++++++----
- 3 files changed, 151 insertions(+), 26 deletions(-)
- create mode 100644 Misc/NEWS.d/next/Security/2026-04-27-16-36-11.gh-issue-149079.vKl-LM.rst
-
-diff --git a/Lib/test/test_unicodedata.py b/Lib/test/test_unicodedata.py
-index 515c3840cb36474..6b4bff194eb4b59 100644
---- a/Lib/test/test_unicodedata.py
-+++ b/Lib/test/test_unicodedata.py
-@@ -203,6 +203,34 @@ def test_issue10254(self):
-         b = 'C\u0338' * 20  + '\xC7'
-         self.assertEqual(self.db.normalize('NFC', a), b)
- 
-+    def test_long_combining_mark_run(self):
-+        # gh-149079: avoid quadratic canonical ordering.
-+        payload = "a" + ("\u0300\u0327" * 32)
-+        nfd = "a" + ("\u0327" * 32) + ("\u0300" * 32)
-+        nfc = "\u00e0" + ("\u0327" * 32) + ("\u0300" * 31)
-+
-+        self.assertEqual(self.db.normalize("NFD", payload), nfd)
-+        self.assertEqual(self.db.normalize("NFKD", payload), nfd)
-+        self.assertEqual(self.db.normalize("NFC", payload), nfc)
-+        self.assertEqual(self.db.normalize("NFKC", payload), nfc)
-+
-+    def test_combining_mark_run_fast_paths(self):
-+        # gh-149079: cover short runs and already-sorted long runs.
-+        short_payload = "a" + ("\u0300\u0327" * 9) + "\u0300"
-+        short_nfd = "a" + ("\u0327" * 9) + ("\u0300" * 10)
-+        short_nfc = "\u00e0" + ("\u0327" * 9) + ("\u0300" * 9)
-+        long_sorted = "a" + ("\u0327" * 30) + ("\u0300" * 30)
-+        long_sorted_nfc = "\u00e0" + ("\u0327" * 30) + ("\u0300" * 29)
-+
-+        self.assertEqual(self.db.normalize("NFD", short_payload), short_nfd)
-+        self.assertEqual(self.db.normalize("NFKD", short_payload), short_nfd)
-+        self.assertEqual(self.db.normalize("NFC", short_payload), short_nfc)
-+        self.assertEqual(self.db.normalize("NFKC", short_payload), short_nfc)
-+        self.assertEqual(self.db.normalize("NFD", long_sorted), long_sorted)
-+        self.assertEqual(self.db.normalize("NFKD", long_sorted), long_sorted)
-+        self.assertEqual(self.db.normalize("NFC", long_sorted), long_sorted_nfc)
-+        self.assertEqual(self.db.normalize("NFKC", long_sorted), long_sorted_nfc)
-+
-     def test_issue29456(self):
-         # Fix #29456
-         u1176_str_a = '\u1100\u1176\u11a8'
-diff --git a/Misc/NEWS.d/next/Security/2026-04-27-16-36-11.gh-issue-149079.vKl-LM.rst b/Misc/NEWS.d/next/Security/2026-04-27-16-36-11.gh-issue-149079.vKl-LM.rst
-new file mode 100644
-index 000000000000000..4ed22b58f7405f5
---- /dev/null
-+++ b/Misc/NEWS.d/next/Security/2026-04-27-16-36-11.gh-issue-149079.vKl-LM.rst
-@@ -0,0 +1,5 @@
-+Fix a potential denial of service in :func:`unicodedata.normalize`. The
-+canonical ordering step of Unicode normalization used a quadratic-time insertion
-+sort for reordering combining characters, which could be exploited with
-+crafted input containing many combining characters in non-canonical order.
-+Replaced with a linear-time counting sort for long runs.
-diff --git a/Modules/unicodedata.c b/Modules/unicodedata.c
-index 41dcd5f8f883f2c..de3451628c6ef9f 100644
---- a/Modules/unicodedata.c
-+++ b/Modules/unicodedata.c
-@@ -490,19 +490,80 @@ get_decomp_record(PyObject *self, Py_UCS4 code,
- #define NCount  (VCount*TCount)
- #define SCount  (LCount*NCount)
- 
-+/* Small combining runs are usually cheaper with insertion sort. */
-+#define CANONICAL_ORDERING_COUNTING_SORT_THRESHOLD 20
-+
-+static void
-+canonical_ordering_sort_insertion(int kind, void *data,
-+                                  Py_ssize_t start, Py_ssize_t end)
-+{
-+    for (Py_ssize_t i = start + 1; i < end; i++) {
-+        Py_UCS4 code = PyUnicode_READ(kind, data, i);
-+        unsigned char combining = _getrecord_ex(code)->combining;
-+        Py_ssize_t j = i;
-+
-+        while (j > start) {
-+            Py_UCS4 previous = PyUnicode_READ(kind, data, j - 1);
-+            if (_getrecord_ex(previous)->combining <= combining) {
-+                break;
-+            }
-+            PyUnicode_WRITE(kind, data, j, previous);
-+            j--;
-+        }
-+        if (j != i) {
-+            PyUnicode_WRITE(kind, data, j, code);
-+        }
-+    }
-+}
-+
-+static void
-+canonical_ordering_sort_counting(int kind, void *data,
-+                                 Py_ssize_t start, Py_ssize_t end,
-+                                 Py_UCS4 *sortbuf)
-+{
-+    Py_ssize_t counts[256] = {0};
-+    Py_ssize_t run_length = end - start;
-+    Py_ssize_t total = 0;
-+
-+    for (Py_ssize_t i = start; i < end; i++) {
-+        Py_UCS4 code = PyUnicode_READ(kind, data, i);
-+        unsigned char combining = _getrecord_ex(code)->combining;
-+        counts[combining]++;
-+    }
-+
-+    for (size_t i = 0; i < Py_ARRAY_LENGTH(counts); i++) {
-+        Py_ssize_t count = counts[i];
-+        counts[i] = total;
-+        total += count;
-+    }
-+
-+    /* Reuse counts[] as the next output slot for each CCC. */
-+    for (Py_ssize_t i = start; i < end; i++) {
-+        Py_UCS4 code = PyUnicode_READ(kind, data, i);
-+        unsigned char combining = _getrecord_ex(code)->combining;
-+        sortbuf[counts[combining]++] = code;
-+    }
-+    for (Py_ssize_t i = 0; i < run_length; i++) {
-+        PyUnicode_WRITE(kind, data, start + i, sortbuf[i]);
-+    }
-+}
-+
- static PyObject*
- nfd_nfkd(PyObject *self, PyObject *input, int k)
- {
-     PyObject *result;
-     Py_UCS4 *output;
-     Py_ssize_t i, o, osize;
--    int kind;
--    const void *data;
-+    int input_kind, result_kind;
-+    const void *input_data;
-+    void *result_data;
-     /* Longest decomposition in Unicode 3.2: U+FDFA */
-     Py_UCS4 stack[20];
-     Py_ssize_t space, isize;
-     int index, prefix, count, stackptr;
-     unsigned char prev, cur;
-+    Py_UCS4 *sortbuf = NULL;
-+    Py_ssize_t sortbuflen = 0;
- 
-     stackptr = 0;
-     isize = PyUnicode_GET_LENGTH(input);
-@@ -522,11 +583,11 @@ nfd_nfkd(PyObject *self, PyObject *input, int k)
-         return NULL;
-     }
-     i = o = 0;
--    kind = PyUnicode_KIND(input);
--    data = PyUnicode_DATA(input);
-+    input_kind = PyUnicode_KIND(input);
-+    input_data = PyUnicode_DATA(input);
- 
-     while (i < isize) {
--        stack[stackptr++] = PyUnicode_READ(kind, data, i++);
-+        stack[stackptr++] = PyUnicode_READ(input_kind, input_data, i++);
-         while(stackptr) {
-             Py_UCS4 code = stack[--stackptr];
-             /* Hangul Decomposition adds three characters in
-@@ -591,35 +652,66 @@ nfd_nfkd(PyObject *self, PyObject *input, int k)
-     PyMem_Free(output);
-     if (!result)
-         return NULL;
-+
-     /* result is guaranteed to be ready, as it is compact. */
--    kind = PyUnicode_KIND(result);
--    data = PyUnicode_DATA(result);
-+    result_kind = PyUnicode_KIND(result);
-+    result_data = PyUnicode_DATA(result);
- 
--    /* Sort canonically. */
-+    /* Sort each consecutive combining-character run canonically. */
-     i = 0;
--    prev = _getrecord_ex(PyUnicode_READ(kind, data, i))->combining;
--    for (i++; i < PyUnicode_GET_LENGTH(result); i++) {
--        cur = _getrecord_ex(PyUnicode_READ(kind, data, i))->combining;
--        if (prev == 0 || cur == 0 || prev <= cur) {
--            prev = cur;
-+    while (i < o) {
-+        Py_ssize_t run_length, run_start;
-+        int needs_sort = 0;
-+
-+        Py_UCS4 ch = PyUnicode_READ(result_kind, result_data, i);
-+        prev = _getrecord_ex(ch)->combining;
-+        if (prev == 0) {
-+            i++;
-             continue;
-         }
--        /* Non-canonical order. Need to switch *i with previous. */
--        o = i - 1;
--        while (1) {
--            Py_UCS4 tmp = PyUnicode_READ(kind, data, o+1);
--            PyUnicode_WRITE(kind, data, o+1,
--                            PyUnicode_READ(kind, data, o));
--            PyUnicode_WRITE(kind, data, o, tmp);
--            o--;
--            if (o < 0)
--                break;
--            prev = _getrecord_ex(PyUnicode_READ(kind, data, o))->combining;
--            if (prev == 0 || prev <= cur)
-+
-+        run_start = i++;
-+        while (i < o) {
-+            Py_UCS4 ch = PyUnicode_READ(result_kind, result_data, i);
-+            cur = _getrecord_ex(ch)->combining;
-+            if (cur == 0) {
-                 break;
-+            }
-+            if (prev > cur) {
-+                needs_sort = 1;
-+            }
-+            prev = cur;
-+            i++;
-+        }
-+        if (!needs_sort) {
-+            continue;
-+        }
-+
-+        run_length = i - run_start;
-+        if (run_length < CANONICAL_ORDERING_COUNTING_SORT_THRESHOLD) {
-+            canonical_ordering_sort_insertion(result_kind, result_data,
-+                                              run_start, i);
-+            continue;
-         }
--        prev = _getrecord_ex(PyUnicode_READ(kind, data, i))->combining;
-+
-+        if (run_length > sortbuflen) {
-+            Py_UCS4 *new_sortbuf = PyMem_Resize(sortbuf,
-+                                                Py_UCS4,
-+                                                run_length);
-+            if (new_sortbuf == NULL) {
-+                PyErr_NoMemory();
-+                PyMem_Free(sortbuf);
-+                Py_DECREF(result);
-+                return NULL;
-+            }
-+            sortbuf = new_sortbuf;
-+            sortbuflen = run_length;
-+        }
-+
-+        canonical_ordering_sort_counting(result_kind, result_data,
-+                                         run_start, i, sortbuf);
-     }
-+    PyMem_Free(sortbuf);
-     return result;
- }
- 
diff --git a/package/python3/0014-tarfile-data_filter-validate-written-link.patch b/package/python3/0014-tarfile-data_filter-validate-written-link.patch
deleted file mode 100644
index b6337e9cbd..0000000000
--- a/package/python3/0014-tarfile-data_filter-validate-written-link.patch
+++ /dev/null
@@ -1,178 +0,0 @@
-From 6df9892a802c124c4223e17c4a05ea7054166ac7 Mon Sep 17 00:00:00 2001
-From: Petr Viktorin <encukou@gmail.com>
-Date: Fri, 8 May 2026 14:16:06 +0200
-Subject: [PATCH] [3.12] gh-149486: tarfile.data_filter: validate written
- link target (GH-149487)
-
-The data filter rewrote linknames with normpath() but ran the
-containment check against the un-normalised value, and computed a
-symlink's directory before stripping trailing slashes.  Both let a
-crafted archive create links pointing outside the destination.  Also
-reject link members that resolve to the destination directory itself,
-which could otherwise replace it with a symlink and redirect all
-subsequent members.
-
-(Patch by Greg; Petr's just reviewing & merging.)
-(cherry picked from commit 578411982c16f753f4893532510099ef665117da)
-
-Co-authored-by: Petr Viktorin <encukou@gmail.com>
-Co-authored-by: Gregory P. Smith <greg@krypto.org>
-
-Upstream: https://github.com/python/cpython/pull/149556
-CVE: CVE-2026-7774
-Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
----
- Lib/tarfile.py                                | 16 ++--
- Lib/test/test_tarfile.py                      | 87 ++++++++++++++++++-
- ...-05-03-21-00-00.gh-issue-149486.tarflt.rst |  5 ++
- 3 files changed, 99 insertions(+), 9 deletions(-)
- create mode 100644 Misc/NEWS.d/next/Security/2026-05-03-21-00-00.gh-issue-149486.tarflt.rst
-
-diff --git a/Lib/tarfile.py b/Lib/tarfile.py
-index 59d3f6e5cce1650..fcb1040f2aefe29 100755
---- a/Lib/tarfile.py
-+++ b/Lib/tarfile.py
-@@ -816,16 +816,22 @@ def _get_filtered_attrs(member, dest_path, for_data=True):
-         if member.islnk() or member.issym():
-             if os.path.isabs(member.linkname):
-                 raise AbsoluteLinkError(member)
-+            # A link member that resolves to the destination directory itself
-+            # would replace it with a (sym)link, redirecting the destination
-+            # for all subsequent members.
-+            if target_path == dest_path:
-+                raise OutsideDestinationError(member, target_path)
-             normalized = os.path.normpath(member.linkname)
-             if normalized != member.linkname:
-                 new_attrs['linkname'] = normalized
-             if member.issym():
--                target_path = os.path.join(dest_path,
--                                           os.path.dirname(name),
--                                           member.linkname)
-+                # The symlink is created at `name` with trailing separators
-+                # stripped, so its target is relative to the directory
-+                # containing that path.
-+                link_dir = os.path.dirname(name.rstrip('/' + os.sep))
-+                target_path = os.path.join(dest_path, link_dir, normalized)
-             else:
--                target_path = os.path.join(dest_path,
--                                           member.linkname)
-+                target_path = os.path.join(dest_path, normalized)
-             target_path = os.path.realpath(target_path,
-                                            strict=os.path.ALLOW_MISSING)
-             if os.path.commonpath([target_path, dest_path]) != dest_path:
-diff --git a/Lib/test/test_tarfile.py b/Lib/test/test_tarfile.py
-index 759fa03ead70b04..fefae4b64c6182c 100644
---- a/Lib/test/test_tarfile.py
-+++ b/Lib/test/test_tarfile.py
-@@ -3701,10 +3701,19 @@ def test_parent_symlink(self):
-                     + "which is outside the destination")
- 
-             with self.check_context(arc.open(), 'data'):
--                self.expect_exception(
--                    tarfile.LinkOutsideDestinationError,
--                    """'parent' would link to ['"].*outerdir['"], """
--                    + "which is outside the destination")
-+                if self.dotdot_resolves_early:
-+                    # 'current/../..' normalises to '..', which is rejected.
-+                    self.expect_exception(
-+                        tarfile.LinkOutsideDestinationError,
-+                        """'parent' would link to ['"].*outerdir['"], """
-+                        + "which is outside the destination")
-+                else:
-+                    # 'current/..' normalises to '.'; the rewritten link is
-+                    # created and 'parent/evil' lands harmlessly inside the
-+                    # destination.
-+                    self.expect_file('current', symlink_to='.')
-+                    self.expect_file('parent', symlink_to='.')
-+                    self.expect_file('evil')
- 
-         else:
-             # No symlink support. The symlinks are ignored.
-@@ -3978,6 +3987,76 @@ def test_sly_relative2(self):
-                     + """['"].*moo['"], which is outside the """
-                     + "destination")
- 
-+    @symlink_test
-+    @os_helper.skip_unless_symlink
-+    def test_normpath_realpath_mismatch(self):
-+        # The link-target check must validate the value that will actually
-+        # be written to disk (the normalised linkname), not the original.
-+        # Here 'a' is a symlink to a deep nonexistent path, so realpath()
-+        # of 'a/../../...' stays inside the destination while normpath()
-+        # collapses 'a/..' lexically and escapes.
-+        depth = len(self.destdir.parts) + 5
-+        deep = '/'.join(f'p{i}' for i in range(depth))
-+        sneaky = 'a/' + '../' * depth + 'flag'
-+        for kind in 'symlink_to', 'hardlink_to':
-+            with self.subTest(kind):
-+                with ArchiveMaker() as arc:
-+                    arc.add('a', symlink_to=deep)
-+                    arc.add('escape', **{kind: sneaky})
-+                with self.check_context(arc.open(), 'data'):
-+                    self.expect_exception(
-+                        tarfile.LinkOutsideDestinationError)
-+
-+    @symlink_test
-+    @os_helper.skip_unless_symlink
-+    def test_symlink_trailing_slash(self):
-+        # A trailing slash on a symlink member's name must not cause the
-+        # link target to be resolved relative to the wrong directory.
-+        with ArchiveMaker() as arc:
-+            t = tarfile.TarInfo('x/')
-+            t.type = tarfile.SYMTYPE
-+            t.linkname = '..'
-+            arc.tar_w.addfile(t)
-+            arc.add('x/escaped', content='hi')
-+
-+        with self.check_context(arc.open(), 'data'):
-+            self.expect_exception(tarfile.LinkOutsideDestinationError)
-+
-+    @symlink_test
-+    @os_helper.skip_unless_symlink
-+    def test_link_at_destination(self):
-+        # A link member whose name resolves to the destination directory
-+        # itself must be rejected: otherwise the destination is replaced
-+        # by a symlink and later members can be redirected through it.
-+        for name in '', '.', './':
-+            with ArchiveMaker() as arc:
-+                t = tarfile.TarInfo(name)
-+                t.type = tarfile.SYMTYPE
-+                t.linkname = '.'
-+                arc.tar_w.addfile(t)
-+
-+            with self.check_context(arc.open(), 'data'):
-+                self.expect_exception(tarfile.OutsideDestinationError)
-+
-+    @symlink_test
-+    @os_helper.skip_unless_symlink
-+    def test_empty_name_symlink_chain(self):
-+        # Regression test for a chain of empty-named symlinks that
-+        # incrementally redirects the destination outwards.
-+        with ArchiveMaker() as arc:
-+            for name, target in [('', ''), ('a/', '..'),
-+                                 ('', 'dummy'), ('', 'a'),
-+                                 ('b/', '..'),
-+                                 ('', 'dummy'), ('', 'a/b')]:
-+                t = tarfile.TarInfo(name)
-+                t.type = tarfile.SYMTYPE
-+                t.linkname = target
-+                arc.tar_w.addfile(t)
-+            arc.add('escaped', content='hi')
-+
-+        with self.check_context(arc.open(), 'data'):
-+            self.expect_exception(tarfile.FilterError)
-+
-     @symlink_test
-     def test_deep_symlink(self):
-         # Test that symlinks and hardlinks inside a directory
-diff --git a/Misc/NEWS.d/next/Security/2026-05-03-21-00-00.gh-issue-149486.tarflt.rst b/Misc/NEWS.d/next/Security/2026-05-03-21-00-00.gh-issue-149486.tarflt.rst
-new file mode 100644
-index 000000000000000..7c69edb683cf80a
---- /dev/null
-+++ b/Misc/NEWS.d/next/Security/2026-05-03-21-00-00.gh-issue-149486.tarflt.rst
-@@ -0,0 +1,5 @@
-+:func:`tarfile.data_filter` now validates link targets using the same
-+normalised value that is written to disk, strips trailing separators from
-+the member name when resolving a symlink's directory, and rejects link
-+members that would replace the destination directory itself. This closes
-+several path-traversal bypasses of the ``data`` extraction filter.
diff --git a/package/python3/0015-Apply-CVE-2021-4189-PASV-fix-to-ftplib-ftpcp.patch b/package/python3/0015-Apply-CVE-2021-4189-PASV-fix-to-ftplib-ftpcp.patch
deleted file mode 100644
index c39ebfa1c3..0000000000
--- a/package/python3/0015-Apply-CVE-2021-4189-PASV-fix-to-ftplib-ftpcp.patch
+++ /dev/null
@@ -1,118 +0,0 @@
-From b026be60f7e023719a4d8de89ae3c3248b7c5d40 Mon Sep 17 00:00:00 2001
-From: "Gregory P. Smith" <68491+gpshead@users.noreply.github.com>
-Date: Wed, 13 May 2026 10:33:43 -0700
-Subject: [PATCH] gh-87451: Apply CVE-2021-4189 PASV fix to ftplib.ftpcp()
- (GH-149648)
-
-ftpcp() called parse227() directly and passed the source server's
-self-reported PASV IPv4 address to the target server's PORT command,
-bypassing the CVE-2021-4189 fix that was applied only to FTP.makepasv().
-A malicious source FTP server could use this to redirect the target
-server's data connection to an arbitrary host:port (SSRF).
-
-ftpcp() now uses the source server's actual peer address, honoring the
-existing trust_server_pasv_ipv4_address opt-out, the same as makepasv().
-
-Thanks to Qi Ding at Aurascape AI for the report. (GHSA-w8c5-q2xf-gf7c)
-(cherry picked from commit eac4fe3b2c77693790a5ef7dfab127c1fee81bf9)
-
-Co-authored-by: Gregory P. Smith <68491+gpshead@users.noreply.github.com>
-
-Upstream: https://github.com/python/cpython/pull/149795
-CVE: CVE-2026-8328
-Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
----
- Lib/ftplib.py                                 | 11 +++++-
- Lib/test/test_ftplib.py                       | 36 ++++++++++++++++++-
- ...6-05-10-18-05-32.gh-issue-87451.XkKB6M.rst |  6 ++++
- 3 files changed, 51 insertions(+), 2 deletions(-)
- create mode 100644 Misc/NEWS.d/next/Security/2026-05-10-18-05-32.gh-issue-87451.XkKB6M.rst
-
-diff --git a/Lib/ftplib.py b/Lib/ftplib.py
-index 10c5d1ea08ab115..463da58de85d721 100644
---- a/Lib/ftplib.py
-+++ b/Lib/ftplib.py
-@@ -883,7 +883,16 @@ def ftpcp(source, sourcename, target, targetname = '', type = 'I'):
-     type = 'TYPE ' + type
-     source.voidcmd(type)
-     target.voidcmd(type)
--    sourcehost, sourceport = parse227(source.sendcmd('PASV'))
-+    # Don't trust the IPv4 address the source server advertises in its PASV
-+    # reply: a malicious source could otherwise point the target's data
-+    # connection at an arbitrary host (SSRF).  A caller that needs the old
-+    # behavior can set trust_server_pasv_ipv4_address on the source FTP
-+    # object.  See FTP.makepasv(), which applies the same rule.
-+    untrusted_host, sourceport = parse227(source.sendcmd('PASV'))
-+    if source.trust_server_pasv_ipv4_address:
-+        sourcehost = untrusted_host
-+    else:
-+        sourcehost = source.sock.getpeername()[0]
-     target.sendport(sourcehost, sourceport)
-     # RFC 959: the user must "listen" [...] BEFORE sending the
-     # transfer request.
-diff --git a/Lib/test/test_ftplib.py b/Lib/test/test_ftplib.py
-index 204a77d14f03a50..7542f015f78c421 100644
---- a/Lib/test/test_ftplib.py
-+++ b/Lib/test/test_ftplib.py
-@@ -16,7 +16,7 @@
- except ImportError:
-     ssl = None
- 
--from unittest import TestCase, skipUnless
-+from unittest import mock, TestCase, skipUnless
- from test import support
- from test.support import threading_helper
- from test.support import socket_helper
-@@ -1142,6 +1142,40 @@ def testTimeoutDirectAccess(self):
-         ftp.close()
- 
- 
-+class TestFtpcpSecurity(TestCase):
-+    """ftpcp() must not trust the host a source server advertises in PASV.
-+
-+    A malicious source server can otherwise redirect the target server's
-+    data connection to an arbitrary host:port (SSRF), so ftpcp() uses the
-+    source server's actual peer address instead, the same as FTP.makepasv().
-+    """
-+
-+    def _make_pair(self, *, advertised_host, real_host, trust=False):
-+        source = mock.Mock(spec=ftplib.FTP)
-+        source.trust_server_pasv_ipv4_address = trust
-+        source.sock.getpeername.return_value = (real_host, 21)
-+        # PASV replies give the host as comma-separated octets, not dotted.
-+        advertised = advertised_host.replace('.', ',')
-+        source.sendcmd.side_effect = lambda cmd: (
-+            f'227 Entering Passive Mode ({advertised},1,2).'
-+            if cmd == 'PASV' else '150 ok')
-+        target = mock.Mock(spec=ftplib.FTP)
-+        target.sendcmd.return_value = '150 ok'
-+        return source, target
-+
-+    def test_ftpcp_ignores_untrusted_pasv_host(self):
-+        source, target = self._make_pair(advertised_host='10.0.0.5',
-+                                         real_host='198.51.100.7')
-+        ftplib.ftpcp(source, 'a', target, 'b')
-+        target.sendport.assert_called_once_with('198.51.100.7', 258)
-+
-+    def test_ftpcp_trust_server_pasv_ipv4_address(self):
-+        source, target = self._make_pair(advertised_host='10.0.0.5',
-+                                         real_host='198.51.100.7', trust=True)
-+        ftplib.ftpcp(source, 'a', target, 'b')
-+        target.sendport.assert_called_once_with('10.0.0.5', 258)
-+
-+
- class MiscTestCase(TestCase):
-     def test__all__(self):
-         not_exported = {
-diff --git a/Misc/NEWS.d/next/Security/2026-05-10-18-05-32.gh-issue-87451.XkKB6M.rst b/Misc/NEWS.d/next/Security/2026-05-10-18-05-32.gh-issue-87451.XkKB6M.rst
-new file mode 100644
-index 000000000000000..21a79c3e0e7db74
---- /dev/null
-+++ b/Misc/NEWS.d/next/Security/2026-05-10-18-05-32.gh-issue-87451.XkKB6M.rst
-@@ -0,0 +1,6 @@
-+The :mod:`ftplib` module's undocumented ``ftpcp`` function no longer trusts
-+the IPv4 address value returned from the source server in response to the
-+``PASV`` command by default, completing the fix for CVE-2021-4189.  As with
-+:class:`ftplib.FTP`, the former behavior can be re-enabled by setting the
-+``trust_server_pasv_ipv4_address`` attribute on the source :class:`ftplib.FTP`
-+instance to ``True``.  Thanks to Qi Deng at Aurascape AI for the report.
diff --git a/package/python3/0016-prevent-bz2-decompressor-reuse-after-errors.patch b/package/python3/0016-prevent-bz2-decompressor-reuse-after-errors.patch
deleted file mode 100644
index 3fecf86ab7..0000000000
--- a/package/python3/0016-prevent-bz2-decompressor-reuse-after-errors.patch
+++ /dev/null
@@ -1,108 +0,0 @@
-From c36ef35e7e5601739755d883f5dab5c6e02b2e30 Mon Sep 17 00:00:00 2001
-From: Stan Ulbrych <stan@python.org>
-Date: Sun, 7 Jun 2026 19:37:10 +0100
-Subject: [PATCH] [3.12] gh-150599: Prevent bz2 decompressor reuse after
- errors (#150600) (#151054)
-
-(cherry picked from commit 5755d0f083949ff3c5bf3a37e673e24e306b036e)
-
-Upstream: https://github.com/python/cpython/pull/151057
-CVE: CVE-2026-9669
-[Titouan: Squash fixup commit 0c2466a0fc2270c87e9f67c250c9454c28c09c3
-          from the upstream PR in the patch below]
-Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
----
- Lib/test/test_bz2.py                           | 15 +++++++++++++++
- ...6-05-30-09-36-20.gh-issue-150599.nlHqU-.rst |  3 +++
- Modules/_bz2module.c                           | 18 +++++++++++++++---
- 3 files changed, 33 insertions(+), 3 deletions(-)
- create mode 100644 Misc/NEWS.d/next/Security/2026-05-30-09-36-20.gh-issue-150599.nlHqU-.rst
-
-diff --git a/Lib/test/test_bz2.py b/Lib/test/test_bz2.py
-index cb730a1a46e25a1..dcbf6a298264a40 100644
---- a/Lib/test/test_bz2.py
-+++ b/Lib/test/test_bz2.py
-@@ -958,6 +958,21 @@ def test_failure(self):
-         # Previously, a second call could crash due to internal inconsistency
-         self.assertRaises(Exception, bzd.decompress, self.BAD_DATA * 30)
- 
-+    def test_decompress_after_data_error(self):
-+        data = bytes.fromhex(
-+            "425a6839314159265359000000000000007fffff000000000000000000000000"
-+            "00000000000000000000000000000000000000e0370000000000000000000000"
-+            "000000000000000000000000000000000000000000000000000083f3"
-+        )
-+        bzd = BZ2Decompressor()
-+        with self.assertRaisesRegex(OSError, "Invalid data stream"):
-+            bzd.decompress(data)
-+        # Previously, a second call could crash due to internal inconsistency
-+        self.assertFalse(bzd.needs_input)
-+        self.assertFalse(bzd.eof)
-+        with self.assertRaisesRegex(ValueError, "previous error"):
-+            bzd.decompress(b'\x00' * 18)
-+
-     @support.refcount_test
-     def test_refleaks_in___init__(self):
-         gettotalrefcount = support.get_attribute(sys, 'gettotalrefcount')
-diff --git a/Misc/NEWS.d/next/Security/2026-05-30-09-36-20.gh-issue-150599.nlHqU-.rst b/Misc/NEWS.d/next/Security/2026-05-30-09-36-20.gh-issue-150599.nlHqU-.rst
-new file mode 100644
-index 000000000000000..a37d86cf423f820
---- /dev/null
-+++ b/Misc/NEWS.d/next/Security/2026-05-30-09-36-20.gh-issue-150599.nlHqU-.rst
-@@ -0,0 +1,3 @@
-+Fix a possible stack buffer overflow in :mod:`bz2` when a
-+:class:`bz2.BZ2Decompressor` is reused after a decompression error.
-+The decompressor now becomes unusable after libbz2 reports an error.
-diff --git a/Modules/_bz2module.c b/Modules/_bz2module.c
-index 97bd44b4ac96944..0b0916142f575be 100644
---- a/Modules/_bz2module.c
-+++ b/Modules/_bz2module.c
-@@ -114,6 +114,7 @@ typedef struct {
- typedef struct {
-     PyObject_HEAD
-     bz_stream bzs;
-+    int bzerror;
-     char eof;           /* T_BOOL expects a char */
-     PyObject *unused_data;
-     char needs_input;
-@@ -453,8 +454,11 @@ decompress_buf(BZ2Decompressor *d, Py_ssize_t max_length)
- 
-         d->bzs_avail_in_real += bzs->avail_in;
- 
--        if (catch_bz2_error(bzret))
-+        if (catch_bz2_error(bzret)) {
-+            d->bzerror = bzret;
-+            d->needs_input = 0;
-             goto error;
-+        }
-         if (bzret == BZ_STREAM_END) {
-             d->eof = 1;
-             break;
-@@ -621,10 +625,17 @@ _bz2_BZ2Decompressor_decompress_impl(BZ2Decompressor *self, Py_buffer *data,
-     PyObject *result = NULL;
- 
-     ACQUIRE_LOCK(self);
--    if (self->eof)
-+    if (self->eof) {
-         PyErr_SetString(PyExc_EOFError, "End of stream already reached");
--    else
-+    }
-+    else if (self->bzerror) {
-+        // Re-entering BZ2_bzDecompress() after an error can write out of bounds.
-+        PyErr_SetString(PyExc_ValueError,
-+                        "Decompressor is unusable after a previous error");
-+    }
-+    else {
-         result = decompress(self, data->buf, data->len, max_length);
-+    }
-     RELEASE_LOCK(self);
-     return result;
- }
-@@ -658,6 +669,7 @@ _bz2_BZ2Decompressor_impl(PyTypeObject *type)
-         return NULL;
-     }
- 
-+    self->bzerror = 0;
-     self->needs_input = 1;
-     self->bzs_avail_in_real = 0;
-     self->input_buffer = NULL;
diff --git a/package/python3/0017-Fix-symlink-escape-via-tarfile-hardlink-extraction-fallback.patch b/package/python3/0017-Fix-symlink-escape-via-tarfile-hardlink-extraction-fallback.patch
deleted file mode 100644
index d5ec1626bf..0000000000
--- a/package/python3/0017-Fix-symlink-escape-via-tarfile-hardlink-extraction-fallback.patch
+++ /dev/null
@@ -1,77 +0,0 @@
-From d0ba16dce6df2f68e8968699d5c247eddeef9960 Mon Sep 17 00:00:00 2001
-From: Stan Ulbrych <stan@python.org>
-Date: Tue, 23 Jun 2026 14:31:38 +0100
-Subject: [PATCH] gh-151558: Fix symlink escape via `tarfile`
- hardlink-extraction fallback (GH-151559) (cherry picked from commit
- 27dd970bf6b17ebca7c8ed486a40ab043ed7af8f)
-
-Co-authored-by: Stan Ulbrych <stan@python.org>
-
-Upstream: https://github.com/python/cpython/pull/152000
-CVE: CVE-2026-11940
-Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
----
- Lib/tarfile.py                                |  3 +++
- Lib/test/test_tarfile.py                      | 24 +++++++++++++++++++
- ...-06-10-13-08-19.gh-issue-151558.mL74i2.rst |  3 +++
- 3 files changed, 30 insertions(+)
- create mode 100644 Misc/NEWS.d/next/Security/2026-06-10-13-08-19.gh-issue-151558.mL74i2.rst
-
-diff --git a/Lib/tarfile.py b/Lib/tarfile.py
-index 461ec16dcd8592..73e9ece4153170 100755
---- a/Lib/tarfile.py
-+++ b/Lib/tarfile.py
-@@ -2677,6 +2677,9 @@ def makelink_with_filter(self, tarinfo, targetpath,
-                     "makelink_with_filter: if filter_function is not None, "
-                     + "extraction_root must also not be None")
-             try:
-+                filter_function(
-+                    unfiltered.replace(name=tarinfo.name, deep=False),
-+                    extraction_root)
-                 filtered = filter_function(unfiltered, extraction_root)
-             except _FILTER_ERRORS as cause:
-                 raise LinkFallbackError(tarinfo, unfiltered.name) from cause
-diff --git a/Lib/test/test_tarfile.py b/Lib/test/test_tarfile.py
-index 9a4c5a301b30d0..902538d2262ceb 100644
---- a/Lib/test/test_tarfile.py
-+++ b/Lib/test/test_tarfile.py
-@@ -4182,6 +4182,30 @@ def test_sneaky_hardlink_fallback(self):
-                     self.expect_file("boom", symlink_to='../../link_here')
-                     self.expect_file("c", symlink_to='b')
- 
-+    @symlink_test
-+    def test_sneaky_hardlink_fallback_deep(self):
-+        # (CVE-2026-11940)
-+        with ArchiveMaker() as arc:
-+            arc.add("a/b/s", symlink_to=os.path.join("..", "escape"))
-+            arc.add("s", hardlink_to=os.path.join("a", "b", "s"))
-+
-+        with self.check_context(arc.open(), 'data'):
-+            e = self.expect_exception(
-+                tarfile.LinkFallbackError,
-+                "link 's' would be extracted as a copy of "
-+                + "'a/b/s', which was rejected")
-+            self.assertIsInstance(e.__cause__,
-+                                  tarfile.LinkOutsideDestinationError)
-+
-+        for filter in 'tar', 'fully_trusted':
-+            with self.subTest(filter), self.check_context(arc.open(), filter):
-+                if not os_helper.can_symlink():
-+                    self.expect_file("a/")
-+                    self.expect_file("a/b/")
-+                else:
-+                    self.expect_file("a/b/s", symlink_to=os.path.join('..', 'escape'))
-+                    self.expect_file("s", symlink_to=os.path.join('..', 'escape'))
-+
-     @symlink_test
-     def test_exfiltration_via_symlink(self):
-         # (CVE-2025-4138)
-diff --git a/Misc/NEWS.d/next/Security/2026-06-10-13-08-19.gh-issue-151558.mL74i2.rst b/Misc/NEWS.d/next/Security/2026-06-10-13-08-19.gh-issue-151558.mL74i2.rst
-new file mode 100644
-index 00000000000000..74459d5680e21a
---- /dev/null
-+++ b/Misc/NEWS.d/next/Security/2026-06-10-13-08-19.gh-issue-151558.mL74i2.rst
-@@ -0,0 +1,3 @@
-+Fixed an vulnerability in the :mod:`tarfile` ``data`` and ``tar`` extraction
-+filters where crafted archives could create a symlink pointing outside the
-+destination directory. This was a bypass of :cve:`2025-4330`.
diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index 5b10f24f70..cf4b6b8667 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,5 +1,3 @@
-# From https://www.python.org/downloads/release/python-31213/
-md5  b67dc5d55b27c98a36615f7d0dfa6e4c  Python-3.12.13.tar.xz
-# Locally computed
-sha256  c08bc65a81971c1dd5783182826503369466c7e67374d1646519adf05207b684  Python-3.12.13.tar.xz
+# From https://www.python.org/downloads/release/python-31214/
+sha256  5c8462af5790baf43a321a1559dbe0db06d1be4300fb85fb53c40060668e548a  Python-3.12.14.tar.xz
 sha256  3b2f81fe21d181c499c59a256c8e1968455d6689d269aa85373bfb6af41da3bf  LICENSE
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 4fd16b4204..6266c8220a 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON3_VERSION_MAJOR = 3.12
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).13
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).14
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others
@@ -13,17 +13,6 @@ PYTHON3_LICENSE_FILES = LICENSE
 PYTHON3_CPE_ID_VENDOR = python
 PYTHON3_CPE_ID_PRODUCT = python
 
-# 0013-Fix-O-n-2-canonical-ordering-in-unicodedata-normalize.patch
-PYTHON3_IGNORE_CVES += CVE-2026-3276
-# 0014-tarfile-data_filter-validate-written-link.patch
-PYTHON3_IGNORE_CVES += CVE-2026-7774
-# 0015-Apply-CVE-2021-4189-PASV-fix-to-ftplib-ftpcp.patch
-PYTHON3_IGNORE_CVES += CVE-2026-8328
-# 0016-prevent-bz2-decompressor-reuse-after-errors.patch
-PYTHON3_IGNORE_CVES += CVE-2026-9669
-# 0017-Fix-symlink-escape-via-tarfile-hardlink-extraction-fallback.patch
-PYTHON3_IGNORE_CVES += CVE-2026-11940
-
 # This host Python is installed in $(HOST_DIR), as it is needed when
 # cross-compiling third-party Python modules.
 

--===============5068343118598547940==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5068343118598547940==--
