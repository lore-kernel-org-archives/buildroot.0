Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F53CCD98D9
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 11:23:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3818560A4A;
	Fri, 12 Jun 2026 11:23:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tvKz1oH4xssp; Fri, 12 Jun 2026 11:23:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E33A60A8A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781263380;
	bh=z+b/tDn5K1e6RJyf2yzayBbaD0G36uROC3/OYswHmtQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=BffmwCpk+ACU4McZypqyyhGm70vQT3eCqcJ96qIxIJiNXkF5/7A3KLCCLDKXzdX4J
	 HMUVMcpxKfjrj1EPAHAO2clwCpPvO5+WwlSsh6EaqJjqZ5zWIlWokKIKCrwcNVRTme
	 ilSEL5P6mZP29KRnh2fvS85pB6JwjXmNwqo6poYaHXjUh06bBVzy2cosal6HMStHJv
	 bhfvr2j125drAoLkQ7k6KqJJlQZOkJB87jgKZm7meXlVUP00rMpABA89sJFTMd/dEs
	 4xcgfh/YOFhL8t/8bryyso1Ea+VyBbIqFji8OTNw4vP15wMKNHAuKOGtTOxdBlklRN
	 6jEYG3tTqnelw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E33A60A8A;
	Fri, 12 Jun 2026 11:23:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 25FB8F4
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:22:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 173D84116A
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:22:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HyADKChZ_p0Z for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 11:22:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F1A5E41114
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F1A5E41114
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:22:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CA390880EA; Fri, 12 Jun 2026 11:22:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Jun 2026 11:46:33 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 024b81ced42a095cd460783c4eddded72fe0872f
X-Git-Newrev: 9e387ea498fdacfdc98430c0a1406b0690f5adc3
X-Patchwork-Hint: ignore
Message-Id: <20260612112214.CA390880EA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/python3: add
 patch for CVE-2026-3276
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
Content-Type: multipart/mixed; boundary="===============2860602214203865392=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2860602214203865392==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9e387ea498fdacfdc98430c0a1406b0690f5adc3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

This fixes the following vulnerability:

- CVE-2026-3276:
    unicodedata.normalize() can take excessive CPU time when processing
    specially crafted Unicode input containing long runs of combining
    characters with alternating Canonical Combining Class values. This
    affects all normalization forms.
    https://www.cve.org/CVERecord?id=CVE-2026-3276

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...nonical-ordering-in-unicodedata-normalize.patch | 275 +++++++++++++++++++++
 package/python3/python3.mk                         |   3 +
 2 files changed, 278 insertions(+)

diff --git a/package/python3/0013-Fix-O-n-2-canonical-ordering-in-unicodedata-normalize.patch b/package/python3/0013-Fix-O-n-2-canonical-ordering-in-unicodedata-normalize.patch
new file mode 100644
index 0000000000..1bfce116dc
--- /dev/null
+++ b/package/python3/0013-Fix-O-n-2-canonical-ordering-in-unicodedata-normalize.patch
@@ -0,0 +1,275 @@
+From d8deb45e25f8eae007449f4018a4f1e117a772d4 Mon Sep 17 00:00:00 2001
+From: Petr Viktorin <encukou@gmail.com>
+Date: Tue, 2 Jun 2026 18:12:42 +0200
+Subject: [PATCH] [3.12] gh-149079: Fix O(n^2) canonical ordering in
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
+
+(cherry picked from commit 991224b1e8311c85f198f6dd8208bf8cff7fc26f)
+
+Co-authored-by: Seth Larson <seth@python.org>
+Co-authored-by: ch4n3-yoon <ch4n3.yoon@gmail.com>
+Co-authored-by: Seokchan Yoon <13852925+ch4n3-yoon@users.noreply.github.com>
+Co-authored-by: Stan Ulbrych <stan@python.org>
+Co-authored-by: Bénédikt Tran <10796600+picnixz@users.noreply.github.com>
+Co-authored-by: Serhiy Storchaka <storchaka@gmail.com>
+Co-authored-by: Maurycy Pawłowski-Wieroński <maurycy@maurycy.com>
+
+Upstream: https://github.com/python/cpython/pull/150843
+CVE: CVE-2026-3276
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ Lib/test/test_unicodedata.py                  |  28 ++++
+ ...-04-27-16-36-11.gh-issue-149079.vKl-LM.rst |   5 +
+ Modules/unicodedata.c                         | 144 ++++++++++++++----
+ 3 files changed, 151 insertions(+), 26 deletions(-)
+ create mode 100644 Misc/NEWS.d/next/Security/2026-04-27-16-36-11.gh-issue-149079.vKl-LM.rst
+
+diff --git a/Lib/test/test_unicodedata.py b/Lib/test/test_unicodedata.py
+index 515c3840cb36474..6b4bff194eb4b59 100644
+--- a/Lib/test/test_unicodedata.py
++++ b/Lib/test/test_unicodedata.py
+@@ -203,6 +203,34 @@ def test_issue10254(self):
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
+index 000000000000000..4ed22b58f7405f5
+--- /dev/null
++++ b/Misc/NEWS.d/next/Security/2026-04-27-16-36-11.gh-issue-149079.vKl-LM.rst
+@@ -0,0 +1,5 @@
++Fix a potential denial of service in :func:`unicodedata.normalize`. The
++canonical ordering step of Unicode normalization used a quadratic-time insertion
++sort for reordering combining characters, which could be exploited with
++crafted input containing many combining characters in non-canonical order.
++Replaced with a linear-time counting sort for long runs.
+diff --git a/Modules/unicodedata.c b/Modules/unicodedata.c
+index 41dcd5f8f883f2c..de3451628c6ef9f 100644
+--- a/Modules/unicodedata.c
++++ b/Modules/unicodedata.c
+@@ -490,19 +490,80 @@ get_decomp_record(PyObject *self, Py_UCS4 code,
+ #define NCount  (VCount*TCount)
+ #define SCount  (LCount*NCount)
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
+@@ -522,11 +583,11 @@ nfd_nfkd(PyObject *self, PyObject *input, int k)
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
+@@ -591,35 +652,66 @@ nfd_nfkd(PyObject *self, PyObject *input, int k)
+     PyMem_Free(output);
+     if (!result)
+         return NULL;
++
+     /* result is guaranteed to be ready, as it is compact. */
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
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 7336c09ae8..0881625ea3 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -13,6 +13,9 @@ PYTHON3_LICENSE_FILES = LICENSE
 PYTHON3_CPE_ID_VENDOR = python
 PYTHON3_CPE_ID_PRODUCT = python
 
+# 0013-Fix-O-n-2-canonical-ordering-in-unicodedata-normalize.patch
+PYTHON3_IGNORE_CVES += CVE-2026-3276
+
 # This host Python is installed in $(HOST_DIR), as it is needed when
 # cross-compiling third-party Python modules.
 

--===============2860602214203865392==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2860602214203865392==--
