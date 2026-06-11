Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8757CCD98D9
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 11:24:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 466976110A;
	Fri, 12 Jun 2026 11:24:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kCdOhUjDN3xH; Fri, 12 Jun 2026 11:24:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 51AC061154
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781263483;
	bh=d1srqyCWeZrFQxqZc1/FlGO7FpiuoI5C6j0uDTurTtk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=IEA1SxI/lHzYTTBpVKSD1v/j7R13G94b96uEZd3c3Z+NZdr7b1ZSse3eouCIpEhrg
	 hPoGY5ieIZbFo95inVjPerzEuWTnX7CdCxLeRhsD9if07JV1KKBWW8kjCA3SGvrTpN
	 lUpjmiQgBMVM0ojiuT5JzLsOTO+0u5pkmqmkLB59vZPsxdqGyaRNosqMB0hOjlLrHN
	 6JRkQvrB0FdS0QPd4wKbRwb/O9hZJI4iSW6h3tY3HDoYaNNJz3YK//OKgF9lVJoWUE
	 /WdJ7wIaVDLjBicPTEqy0nHyfUozapWt2/drH6SLthhnVNt+e+y8MrH4r32vstO+P7
	 nQyotvvxZKc9Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 51AC061154;
	Fri, 12 Jun 2026 11:24:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 865BAF4
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:24:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5012840674
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:24:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HJXcXgLZGUoJ for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 11:24:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 59EDC4067A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 59EDC4067A
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:24:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 33857880E9; Fri, 12 Jun 2026 11:23:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Jun 2026 11:45:40 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: eb324a07fb686203a37f91eeeeb2e65455ac9799
X-Git-Newrev: 42581bd3cf7708d4dd1b19c543157c013caae61a
X-Patchwork-Hint: ignore
Message-Id: <20260612112350.33857880E9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/python3: add
 upstream security patch for CVE-2026-3276
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
Content-Type: multipart/mixed; boundary="===============3777662241478627214=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3777662241478627214==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/42581bd3cf7708d4dd1b19c543157c013caae61a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

https://seclists.org/oss-sec/2026/q2/801

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 9cba1cfaaf7acb64d7e73ffeb4ad455c784d7764)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...079-Fix-O-n-2-canonical-ordering-in-unico.patch | 277 +++++++++++++++++++++
 package/python3/python3.mk                         |   3 +
 2 files changed, 280 insertions(+)

diff --git a/package/python3/0011-3.14-gh-149079-Fix-O-n-2-canonical-ordering-in-unico.patch b/package/python3/0011-3.14-gh-149079-Fix-O-n-2-canonical-ordering-in-unico.patch
new file mode 100644
index 0000000000..3bb0909e70
--- /dev/null
+++ b/package/python3/0011-3.14-gh-149079-Fix-O-n-2-canonical-ordering-in-unico.patch
@@ -0,0 +1,277 @@
+From 6b505d1f41f8f3ea0fe5a4786d3a8fff1875cfc0 Mon Sep 17 00:00:00 2001
+From: "Miss Islington (bot)"
+ <31488909+miss-islington@users.noreply.github.com>
+Date: Tue, 2 Jun 2026 12:10:30 +0200
+Subject: [PATCH] [3.14] gh-149079: Fix O(n^2) canonical ordering in
+ unicodedata.normalize() (GH-149080)
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Replace the insertion sort used for canonical ordering of combining
+characters with a hybrid approach: insertion sort for short runs (< 20)
+and counting sort for longer runs, reducing worst-case complexity from
+O(n^2) to O(n). This prevents denial of service via crafted Unicode
+strings with many combining characters in alternating CCC order.
+(cherry picked from commit 991224b1e8311c85f198f6dd8208bf8cff7fc26f)
+
+Co-authored-by: Seth Larson <seth@python.org>
+Co-authored-by: ch4n3-yoon <ch4n3.yoon@gmail.com>
+Co-authored-by: Seokchan Yoon <13852925+ch4n3-yoon@users.noreply.github.com>
+Co-authored-by: Stan Ulbrych <stan@python.org>
+Co-authored-by: Bénédikt Tran <10796600+picnixz@users.noreply.github.com>
+Co-authored-by: Petr Viktorin <encukou@gmail.com>
+Co-authored-by: Serhiy Storchaka <storchaka@gmail.com>
+Co-authored-by: Maurycy Pawłowski-Wieroński <maurycy@maurycy.com>
+
+Upstream: https://github.com/python/cpython/commit/6b505d1f41f8f3ea0fe5a4786d3a8fff1875cfc0
+CVE: CVE-2026-3276
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ Lib/test/test_unicodedata.py                  |  28 ++++
+ ...-04-27-16-36-11.gh-issue-149079.vKl-LM.rst |   5 +
+ Modules/unicodedata.c                         | 143 ++++++++++++++----
+ 3 files changed, 150 insertions(+), 26 deletions(-)
+ create mode 100644 Misc/NEWS.d/next/Security/2026-04-27-16-36-11.gh-issue-149079.vKl-LM.rst
+
+diff --git a/Lib/test/test_unicodedata.py b/Lib/test/test_unicodedata.py
+index a27496a1d83..21a7cb5da41 100644
+--- a/Lib/test/test_unicodedata.py
++++ b/Lib/test/test_unicodedata.py
+@@ -580,6 +580,34 @@ def test_issue10254(self):
+         b = 'C\u0338' * 20  + '\xC7'
+         self.assertEqual(self.db.normalize('NFC', a), b)
+ 
++    def test_long_combining_mark_run(self):
++        # gh-149079: avoid quadratic canonical ordering.
++        payload = "a" + ("\u0300\u0327" * 32)
++        nfd = "a" + ("\u0327" * 32) + ("\u0300" * 32)
++        nfc = "\u00e0" + ("\u0327" * 32) + ("\u0300" * 31)
++
++        self.assertEqual(self.db.normalize("NFD", payload), nfd)
++        self.assertEqual(self.db.normalize("NFKD", payload), nfd)
++        self.assertEqual(self.db.normalize("NFC", payload), nfc)
++        self.assertEqual(self.db.normalize("NFKC", payload), nfc)
++
++    def test_combining_mark_run_fast_paths(self):
++        # gh-149079: cover short runs and already-sorted long runs.
++        short_payload = "a" + ("\u0300\u0327" * 9) + "\u0300"
++        short_nfd = "a" + ("\u0327" * 9) + ("\u0300" * 10)
++        short_nfc = "\u00e0" + ("\u0327" * 9) + ("\u0300" * 9)
++        long_sorted = "a" + ("\u0327" * 30) + ("\u0300" * 30)
++        long_sorted_nfc = "\u00e0" + ("\u0327" * 30) + ("\u0300" * 29)
++
++        self.assertEqual(self.db.normalize("NFD", short_payload), short_nfd)
++        self.assertEqual(self.db.normalize("NFKD", short_payload), short_nfd)
++        self.assertEqual(self.db.normalize("NFC", short_payload), short_nfc)
++        self.assertEqual(self.db.normalize("NFKC", short_payload), short_nfc)
++        self.assertEqual(self.db.normalize("NFD", long_sorted), long_sorted)
++        self.assertEqual(self.db.normalize("NFKD", long_sorted), long_sorted)
++        self.assertEqual(self.db.normalize("NFC", long_sorted), long_sorted_nfc)
++        self.assertEqual(self.db.normalize("NFKC", long_sorted), long_sorted_nfc)
++
+     def test_issue29456(self):
+         # Fix #29456
+         u1176_str_a = '\u1100\u1176\u11a8'
+diff --git a/Misc/NEWS.d/next/Security/2026-04-27-16-36-11.gh-issue-149079.vKl-LM.rst b/Misc/NEWS.d/next/Security/2026-04-27-16-36-11.gh-issue-149079.vKl-LM.rst
+new file mode 100644
+index 00000000000..4ed22b58f74
+--- /dev/null
++++ b/Misc/NEWS.d/next/Security/2026-04-27-16-36-11.gh-issue-149079.vKl-LM.rst
+@@ -0,0 +1,5 @@
++Fix a potential denial of service in :func:`unicodedata.normalize`. The
++canonical ordering step of Unicode normalization used a quadratic-time insertion
++sort for reordering combining characters, which could be exploited with
++crafted input containing many combining characters in non-canonical order.
++Replaced with a linear-time counting sort for long runs.
+diff --git a/Modules/unicodedata.c b/Modules/unicodedata.c
+index 1c2e7896bdb..d9b477a12b4 100644
+--- a/Modules/unicodedata.c
++++ b/Modules/unicodedata.c
+@@ -510,19 +510,80 @@ get_decomp_record(PyObject *self, Py_UCS4 code,
+     (*index)++;
+ }
+ 
++/* Small combining runs are usually cheaper with insertion sort. */
++#define CANONICAL_ORDERING_COUNTING_SORT_THRESHOLD 20
++
++static void
++canonical_ordering_sort_insertion(int kind, void *data,
++                                  Py_ssize_t start, Py_ssize_t end)
++{
++    for (Py_ssize_t i = start + 1; i < end; i++) {
++        Py_UCS4 code = PyUnicode_READ(kind, data, i);
++        unsigned char combining = _getrecord_ex(code)->combining;
++        Py_ssize_t j = i;
++
++        while (j > start) {
++            Py_UCS4 previous = PyUnicode_READ(kind, data, j - 1);
++            if (_getrecord_ex(previous)->combining <= combining) {
++                break;
++            }
++            PyUnicode_WRITE(kind, data, j, previous);
++            j--;
++        }
++        if (j != i) {
++            PyUnicode_WRITE(kind, data, j, code);
++        }
++    }
++}
++
++static void
++canonical_ordering_sort_counting(int kind, void *data,
++                                 Py_ssize_t start, Py_ssize_t end,
++                                 Py_UCS4 *sortbuf)
++{
++    Py_ssize_t counts[256] = {0};
++    Py_ssize_t run_length = end - start;
++    Py_ssize_t total = 0;
++
++    for (Py_ssize_t i = start; i < end; i++) {
++        Py_UCS4 code = PyUnicode_READ(kind, data, i);
++        unsigned char combining = _getrecord_ex(code)->combining;
++        counts[combining]++;
++    }
++
++    for (size_t i = 0; i < Py_ARRAY_LENGTH(counts); i++) {
++        Py_ssize_t count = counts[i];
++        counts[i] = total;
++        total += count;
++    }
++
++    /* Reuse counts[] as the next output slot for each CCC. */
++    for (Py_ssize_t i = start; i < end; i++) {
++        Py_UCS4 code = PyUnicode_READ(kind, data, i);
++        unsigned char combining = _getrecord_ex(code)->combining;
++        sortbuf[counts[combining]++] = code;
++    }
++    for (Py_ssize_t i = 0; i < run_length; i++) {
++        PyUnicode_WRITE(kind, data, start + i, sortbuf[i]);
++    }
++}
++
+ static PyObject*
+ nfd_nfkd(PyObject *self, PyObject *input, int k)
+ {
+     PyObject *result;
+     Py_UCS4 *output;
+     Py_ssize_t i, o, osize;
+-    int kind;
+-    const void *data;
++    int input_kind, result_kind;
++    const void *input_data;
++    void *result_data;
+     /* Longest decomposition in Unicode 3.2: U+FDFA */
+     Py_UCS4 stack[20];
+     Py_ssize_t space, isize;
+     int index, prefix, count, stackptr;
+     unsigned char prev, cur;
++    Py_UCS4 *sortbuf = NULL;
++    Py_ssize_t sortbuflen = 0;
+ 
+     stackptr = 0;
+     isize = PyUnicode_GET_LENGTH(input);
+@@ -542,11 +603,11 @@ nfd_nfkd(PyObject *self, PyObject *input, int k)
+         return NULL;
+     }
+     i = o = 0;
+-    kind = PyUnicode_KIND(input);
+-    data = PyUnicode_DATA(input);
++    input_kind = PyUnicode_KIND(input);
++    input_data = PyUnicode_DATA(input);
+ 
+     while (i < isize) {
+-        stack[stackptr++] = PyUnicode_READ(kind, data, i++);
++        stack[stackptr++] = PyUnicode_READ(input_kind, input_data, i++);
+         while(stackptr) {
+             Py_UCS4 code = stack[--stackptr];
+             /* Hangul Decomposition adds three characters in
+@@ -614,34 +675,64 @@ nfd_nfkd(PyObject *self, PyObject *input, int k)
+     if (!result)
+         return NULL;
+ 
+-    kind = PyUnicode_KIND(result);
+-    data = PyUnicode_DATA(result);
++    result_kind = PyUnicode_KIND(result);
++    result_data = PyUnicode_DATA(result);
+ 
+-    /* Sort canonically. */
++    /* Sort each consecutive combining-character run canonically. */
+     i = 0;
+-    prev = _getrecord_ex(PyUnicode_READ(kind, data, i))->combining;
+-    for (i++; i < PyUnicode_GET_LENGTH(result); i++) {
+-        cur = _getrecord_ex(PyUnicode_READ(kind, data, i))->combining;
+-        if (prev == 0 || cur == 0 || prev <= cur) {
+-            prev = cur;
++    while (i < o) {
++        Py_ssize_t run_length, run_start;
++        int needs_sort = 0;
++
++        Py_UCS4 ch = PyUnicode_READ(result_kind, result_data, i);
++        prev = _getrecord_ex(ch)->combining;
++        if (prev == 0) {
++            i++;
+             continue;
+         }
+-        /* Non-canonical order. Need to switch *i with previous. */
+-        o = i - 1;
+-        while (1) {
+-            Py_UCS4 tmp = PyUnicode_READ(kind, data, o+1);
+-            PyUnicode_WRITE(kind, data, o+1,
+-                            PyUnicode_READ(kind, data, o));
+-            PyUnicode_WRITE(kind, data, o, tmp);
+-            o--;
+-            if (o < 0)
+-                break;
+-            prev = _getrecord_ex(PyUnicode_READ(kind, data, o))->combining;
+-            if (prev == 0 || prev <= cur)
++
++        run_start = i++;
++        while (i < o) {
++            Py_UCS4 ch = PyUnicode_READ(result_kind, result_data, i);
++            cur = _getrecord_ex(ch)->combining;
++            if (cur == 0) {
+                 break;
++            }
++            if (prev > cur) {
++                needs_sort = 1;
++            }
++            prev = cur;
++            i++;
++        }
++        if (!needs_sort) {
++            continue;
++        }
++
++        run_length = i - run_start;
++        if (run_length < CANONICAL_ORDERING_COUNTING_SORT_THRESHOLD) {
++            canonical_ordering_sort_insertion(result_kind, result_data,
++                                              run_start, i);
++            continue;
+         }
+-        prev = _getrecord_ex(PyUnicode_READ(kind, data, i))->combining;
++
++        if (run_length > sortbuflen) {
++            Py_UCS4 *new_sortbuf = PyMem_Resize(sortbuf,
++                                                Py_UCS4,
++                                                run_length);
++            if (new_sortbuf == NULL) {
++                PyErr_NoMemory();
++                PyMem_Free(sortbuf);
++                Py_DECREF(result);
++                return NULL;
++            }
++            sortbuf = new_sortbuf;
++            sortbuflen = run_length;
++        }
++
++        canonical_ordering_sort_counting(result_kind, result_data,
++                                         run_start, i, sortbuf);
+     }
++    PyMem_Free(sortbuf);
+     return result;
+ }
+ 
+-- 
+2.47.3
+
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index eeeb1c7e2a..61fab7e350 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -13,6 +13,9 @@ PYTHON3_LICENSE_FILES = LICENSE
 PYTHON3_CPE_ID_VENDOR = python
 PYTHON3_CPE_ID_PRODUCT = python
 
+# 0011-3.14-gh-149079-Fix-O-n-2-canonical-ordering-in-unico.patch
+PYTHON3_IGNORE_CVES += CVE-2026-3276
+
 # This host Python is installed in $(HOST_DIR), as it is needed when
 # cross-compiling third-party Python modules.
 

--===============3777662241478627214==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3777662241478627214==--
