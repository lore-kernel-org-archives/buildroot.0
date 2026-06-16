Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B627CD98E1
	for <buildroot@archiver.kernel.org>; Tue, 16 Jun 2026 19:34:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3EA4B60624;
	Tue, 16 Jun 2026 19:34:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FMaw-7elDlPO; Tue, 16 Jun 2026 19:34:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 454BB606CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781638470;
	bh=2xmlmgHY7CtY0AjxMIRegVkUEaVm6WlNDoOpy4RMJb0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pGbBR5LEl0G3NtPunbS7Pss30i55N4Y/sgGve+08j8429F6qcKsIk5G49O+e6iIkX
	 qv78ARJuXd8mwy4aNWkBFe7+vl8ayZmhsSV9CB+briGvcMSHjvNCRwioTESbEGPoTw
	 Euxpk4drgQglxMMBqPpS6sNmVBskvKEYAN9/bc0oGlLWdTXYHTE6+5o6WF7H0K1QsG
	 IIdTChjByIUWexlgRlptjoq6LCrOhs5wv/jOqXw7UKmi7i+4ufh+nSBgUlb2K916qB
	 srs8CLJKZZ01QxET75e+/RDBGOrDZkTs/AEaz6qzrhat3D0YJq+UlO+weV4hT/wyG3
	 EkK9mS+7Jfqug==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 454BB606CC;
	Tue, 16 Jun 2026 19:34:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BEFA7793
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 19:34:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A455642978
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 19:34:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9HBRw_q5-zRu for <buildroot@buildroot.org>;
 Tue, 16 Jun 2026 19:34:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E2AA41232
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0E2AA41232
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 19:34:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C50BB80E0A; Tue, 16 Jun 2026 19:34:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 16 Jun 2026 21:02:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dc43bd6f0590294e122324e1c4999db1400a446e
X-Git-Newrev: 5cd9188c3e1309b178863b5239e08ee2564911cd
X-Patchwork-Hint: ignore
Message-Id: <20260616193405.C50BB80E0A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python3: security bump version to
 3.14.6
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3065548876668862358=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3065548876668862358==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5cd9188c3e1309b178863b5239e08ee2564911cd
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://www.python.org/downloads/release/python-3146/
https://docs.python.org/release/3.14.6/whatsnew/changelog.html

Removed patches which are included in this release.

Fixes CVE-2026-9669:
https://github.com/python/cpython/commit/157a5df8cb5d82b33f918a7489e72ce95ceb12b6
https://seclists.org/oss-sec/2026/q2/846

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...079-Fix-O-n-2-canonical-ordering-in-unico.patch | 277 ---------------------
 ...486-tarfile.data_filter-validate-written-.patch | 268 --------------------
 ...51-Apply-CVE-2021-4189-PASV-fix-to-ftplib.patch | 123 ---------
 package/python3/python3.hash                       |   4 +-
 package/python3/python3.mk                         |  11 +-
 5 files changed, 3 insertions(+), 680 deletions(-)

diff --git a/package/python3/0011-3.14-gh-149079-Fix-O-n-2-canonical-ordering-in-unico.patch b/package/python3/0011-3.14-gh-149079-Fix-O-n-2-canonical-ordering-in-unico.patch
deleted file mode 100644
index 3bb0909e70..0000000000
--- a/package/python3/0011-3.14-gh-149079-Fix-O-n-2-canonical-ordering-in-unico.patch
+++ /dev/null
@@ -1,277 +0,0 @@
-From 6b505d1f41f8f3ea0fe5a4786d3a8fff1875cfc0 Mon Sep 17 00:00:00 2001
-From: "Miss Islington (bot)"
- <31488909+miss-islington@users.noreply.github.com>
-Date: Tue, 2 Jun 2026 12:10:30 +0200
-Subject: [PATCH] [3.14] gh-149079: Fix O(n^2) canonical ordering in
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
-(cherry picked from commit 991224b1e8311c85f198f6dd8208bf8cff7fc26f)
-
-Co-authored-by: Seth Larson <seth@python.org>
-Co-authored-by: ch4n3-yoon <ch4n3.yoon@gmail.com>
-Co-authored-by: Seokchan Yoon <13852925+ch4n3-yoon@users.noreply.github.com>
-Co-authored-by: Stan Ulbrych <stan@python.org>
-Co-authored-by: Bénédikt Tran <10796600+picnixz@users.noreply.github.com>
-Co-authored-by: Petr Viktorin <encukou@gmail.com>
-Co-authored-by: Serhiy Storchaka <storchaka@gmail.com>
-Co-authored-by: Maurycy Pawłowski-Wieroński <maurycy@maurycy.com>
-
-Upstream: https://github.com/python/cpython/commit/6b505d1f41f8f3ea0fe5a4786d3a8fff1875cfc0
-CVE: CVE-2026-3276
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- Lib/test/test_unicodedata.py                  |  28 ++++
- ...-04-27-16-36-11.gh-issue-149079.vKl-LM.rst |   5 +
- Modules/unicodedata.c                         | 143 ++++++++++++++----
- 3 files changed, 150 insertions(+), 26 deletions(-)
- create mode 100644 Misc/NEWS.d/next/Security/2026-04-27-16-36-11.gh-issue-149079.vKl-LM.rst
-
-diff --git a/Lib/test/test_unicodedata.py b/Lib/test/test_unicodedata.py
-index a27496a1d83..21a7cb5da41 100644
---- a/Lib/test/test_unicodedata.py
-+++ b/Lib/test/test_unicodedata.py
-@@ -580,6 +580,34 @@ def test_issue10254(self):
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
-index 00000000000..4ed22b58f74
---- /dev/null
-+++ b/Misc/NEWS.d/next/Security/2026-04-27-16-36-11.gh-issue-149079.vKl-LM.rst
-@@ -0,0 +1,5 @@
-+Fix a potential denial of service in :func:`unicodedata.normalize`. The
-+canonical ordering step of Unicode normalization used a quadratic-time insertion
-+sort for reordering combining characters, which could be exploited with
-+crafted input containing many combining characters in non-canonical order.
-+Replaced with a linear-time counting sort for long runs.
-diff --git a/Modules/unicodedata.c b/Modules/unicodedata.c
-index 1c2e7896bdb..d9b477a12b4 100644
---- a/Modules/unicodedata.c
-+++ b/Modules/unicodedata.c
-@@ -510,19 +510,80 @@ get_decomp_record(PyObject *self, Py_UCS4 code,
-     (*index)++;
- }
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
-@@ -542,11 +603,11 @@ nfd_nfkd(PyObject *self, PyObject *input, int k)
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
-@@ -614,34 +675,64 @@ nfd_nfkd(PyObject *self, PyObject *input, int k)
-     if (!result)
-         return NULL;
- 
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
--- 
-2.47.3
-
diff --git a/package/python3/0012-3.14-gh-149486-tarfile.data_filter-validate-written-.patch b/package/python3/0012-3.14-gh-149486-tarfile.data_filter-validate-written-.patch
deleted file mode 100644
index 94377fb832..0000000000
--- a/package/python3/0012-3.14-gh-149486-tarfile.data_filter-validate-written-.patch
+++ /dev/null
@@ -1,268 +0,0 @@
-From 74cca9a92fb7d653e404843a56b8bdc7b0afdbbf Mon Sep 17 00:00:00 2001
-From: "Miss Islington (bot)"
- <31488909+miss-islington@users.noreply.github.com>
-Date: Mon, 11 May 2026 11:57:50 +0200
-Subject: [PATCH] [3.14] gh-149486: tarfile.data_filter: validate written link
- target (GH-149487) (GH-149554)
-
-* gh-149486: tarfile.data_filter: validate written link target (GH-149487)
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
-Upstream: https://github.com/python/cpython/commit/74cca9a92fb7d653e404843a56b8bdc7b0afdbbf
-CVE: CVE-2026-7774
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- Lib/tarfile.py                                |  16 +-
- Lib/test/test_tarfile.py                      | 151 ++++++++++++++----
- ...-05-03-21-00-00.gh-issue-149486.tarflt.rst |   5 +
- 3 files changed, 133 insertions(+), 39 deletions(-)
- create mode 100644 Misc/NEWS.d/next/Security/2026-05-03-21-00-00.gh-issue-149486.tarflt.rst
-
-diff --git a/Lib/tarfile.py b/Lib/tarfile.py
-index 414aefe9744..a9eca7579ef 100644
---- a/Lib/tarfile.py
-+++ b/Lib/tarfile.py
-@@ -830,16 +830,22 @@ def _get_filtered_attrs(member, dest_path, for_data=True):
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
-index 8d9f8824f7c..837b6aa8c03 100644
---- a/Lib/test/test_tarfile.py
-+++ b/Lib/test/test_tarfile.py
-@@ -3682,6 +3682,39 @@ class TestExtractionFilters(unittest.TestCase):
-     # The destination for the extraction, within `outerdir`
-     destdir = outerdir / 'dest'
- 
-+    @classmethod
-+    def setUpClass(cls):
-+        # Posix and Windows have different pathname resolution:
-+        # either symlink or a '..' component resolve first.
-+        # Let's see which we are on.
-+        if os_helper.can_symlink():
-+            testpath = os.path.join(TEMPDIR, 'resolution_test')
-+            os.mkdir(testpath)
-+
-+            # testpath/current links to `.` which is all of:
-+            #   - `testpath`
-+            #   - `testpath/current`
-+            #   - `testpath/current/current`
-+            #   - etc.
-+            os.symlink('.', os.path.join(testpath, 'current'))
-+
-+            # we'll test where `testpath/current/../file` ends up
-+            with open(os.path.join(testpath, 'current', '..', 'file'), 'w'):
-+                pass
-+
-+            if os.path.exists(os.path.join(testpath, 'file')):
-+                # Windows collapses 'current\..' to '.' first, leaving
-+                # 'testpath\file'
-+                cls.dotdot_resolves_early = True
-+            elif os.path.exists(os.path.join(testpath, '..', 'file')):
-+                # Posix resolves 'current' to '.' first, leaving
-+                # 'testpath/../file'
-+                cls.dotdot_resolves_early = False
-+            else:
-+                raise AssertionError('Could not determine link resolution')
-+        else:
-+            cls.dotdot_resolves_early = False
-+
-     @contextmanager
-     def check_context(self, tar, filter, *, check_flag=True):
-         """Extracts `tar` to `self.destdir` and allows checking the result
-@@ -3853,10 +3886,19 @@ def test_parent_symlink(self):
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
-@@ -3946,35 +3988,6 @@ def test_parent_symlink2(self):
-         # Test interplaying symlinks
-         # Inspired by 'dirsymlink2b' in jwilk/traversal-archives
- 
--        # Posix and Windows have different pathname resolution:
--        # either symlink or a '..' component resolve first.
--        # Let's see which we are on.
--        if os_helper.can_symlink():
--            testpath = os.path.join(TEMPDIR, 'resolution_test')
--            os.mkdir(testpath)
--
--            # testpath/current links to `.` which is all of:
--            #   - `testpath`
--            #   - `testpath/current`
--            #   - `testpath/current/current`
--            #   - etc.
--            os.symlink('.', os.path.join(testpath, 'current'))
--
--            # we'll test where `testpath/current/../file` ends up
--            with open(os.path.join(testpath, 'current', '..', 'file'), 'w'):
--                pass
--
--            if os.path.exists(os.path.join(testpath, 'file')):
--                # Windows collapses 'current\..' to '.' first, leaving
--                # 'testpath\file'
--                dotdot_resolves_early = True
--            elif os.path.exists(os.path.join(testpath, '..', 'file')):
--                # Posix resolves 'current' to '.' first, leaving
--                # 'testpath/../file'
--                dotdot_resolves_early = False
--            else:
--                raise AssertionError('Could not determine link resolution')
--
-         with ArchiveMaker() as arc:
- 
-             # `current` links to `.` which is both the destination directory
-@@ -4010,7 +4023,7 @@ def test_parent_symlink2(self):
- 
-         with self.check_context(arc.open(), 'data'):
-             if os_helper.can_symlink():
--                if dotdot_resolves_early:
-+                if self.dotdot_resolves_early:
-                     # Fail when extracting a file outside destination
-                     self.expect_exception(
-                             tarfile.OutsideDestinationError,
-@@ -4130,6 +4143,76 @@ def test_sly_relative2(self):
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
-index 00000000000..7c69edb683c
---- /dev/null
-+++ b/Misc/NEWS.d/next/Security/2026-05-03-21-00-00.gh-issue-149486.tarflt.rst
-@@ -0,0 +1,5 @@
-+:func:`tarfile.data_filter` now validates link targets using the same
-+normalised value that is written to disk, strips trailing separators from
-+the member name when resolving a symlink's directory, and rejects link
-+members that would replace the destination directory itself. This closes
-+several path-traversal bypasses of the ``data`` extraction filter.
--- 
-2.47.3
-
diff --git a/package/python3/0013-3.14-gh-87451-Apply-CVE-2021-4189-PASV-fix-to-ftplib.patch b/package/python3/0013-3.14-gh-87451-Apply-CVE-2021-4189-PASV-fix-to-ftplib.patch
deleted file mode 100644
index 7605e40722..0000000000
--- a/package/python3/0013-3.14-gh-87451-Apply-CVE-2021-4189-PASV-fix-to-ftplib.patch
+++ /dev/null
@@ -1,123 +0,0 @@
-From 7d95a1dc7382b55cba7fdd6a110336077584a4f0 Mon Sep 17 00:00:00 2001
-From: "Miss Islington (bot)"
- <31488909+miss-islington@users.noreply.github.com>
-Date: Wed, 13 May 2026 19:59:11 +0200
-Subject: [PATCH] [3.14] gh-87451: Apply CVE-2021-4189 PASV fix to
- ftplib.ftpcp() (GH-149648) (#149793)
-
-gh-87451: Apply CVE-2021-4189 PASV fix to ftplib.ftpcp() (GH-149648)
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
-Upstream: https://github.com/python/cpython/commit/7d95a1dc7382b55cba7fdd6a110336077584a4f0
-CVE: CVE-2026-8328
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- Lib/ftplib.py                                 | 11 +++++-
- Lib/test/test_ftplib.py                       | 36 ++++++++++++++++++-
- ...6-05-10-18-05-32.gh-issue-87451.XkKB6M.rst |  6 ++++
- 3 files changed, 51 insertions(+), 2 deletions(-)
- create mode 100644 Misc/NEWS.d/next/Security/2026-05-10-18-05-32.gh-issue-87451.XkKB6M.rst
-
-diff --git a/Lib/ftplib.py b/Lib/ftplib.py
-index 50771e8c17c..73882a38dce 100644
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
-index c864d401f9e..f1eff9430f7 100644
---- a/Lib/test/test_ftplib.py
-+++ b/Lib/test/test_ftplib.py
-@@ -16,7 +16,7 @@
- except ImportError:
-     ssl = None
- 
--from unittest import TestCase, skipUnless
-+from unittest import mock, TestCase, skipUnless
- from test import support
- from test.support import requires_subprocess
- from test.support import threading_helper
-@@ -1145,6 +1145,40 @@ def testTimeoutDirectAccess(self):
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
-index 00000000000..21a79c3e0e7
---- /dev/null
-+++ b/Misc/NEWS.d/next/Security/2026-05-10-18-05-32.gh-issue-87451.XkKB6M.rst
-@@ -0,0 +1,6 @@
-+The :mod:`ftplib` module's undocumented ``ftpcp`` function no longer trusts
-+the IPv4 address value returned from the source server in response to the
-+``PASV`` command by default, completing the fix for CVE-2021-4189.  As with
-+:class:`ftplib.FTP`, the former behavior can be re-enabled by setting the
-+``trust_server_pasv_ipv4_address`` attribute on the source :class:`ftplib.FTP`
-+instance to ``True``.  Thanks to Qi Deng at Aurascape AI for the report.
--- 
-2.47.3
-
diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index 2217f688d3..0f2436fb23 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,4 +1,4 @@
-# From https://www.python.org/downloads/release/python-3145/
-sha256  7e32597b99e5d9a39abed35de4693fa169df3e5850d4c334337ffd6a19a36db6  Python-3.14.5.tar.xz
+# From https://www.python.org/downloads/release/python-3146/
+sha256  143b1dddefaec3bd2e21e3b839b34a2b7fb9842272883c576420d605e9f30c63  Python-3.14.6.tar.xz
 # Locally computed
 sha256  b0e25a78cffb43f4d92de8b61ccfa1f1f98ecbc22330b54b5251e7b6ba010231  LICENSE
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 931ad3bae6..ff9afbb5a9 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON3_VERSION_MAJOR = 3.14
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).5
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).6
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others
@@ -13,15 +13,6 @@ PYTHON3_LICENSE_FILES = LICENSE
 PYTHON3_CPE_ID_VENDOR = python
 PYTHON3_CPE_ID_PRODUCT = python
 
-# 0011-3.14-gh-149079-Fix-O-n-2-canonical-ordering-in-unico.patch
-PYTHON3_IGNORE_CVES += CVE-2026-3276
-
-# 0012-3.14-gh-149486-tarfile.data_filter-validate-written-.patch
-PYTHON3_IGNORE_CVES += CVE-2026-7774
-
-# 0013-3.14-gh-87451-Apply-CVE-2021-4189-PASV-fix-to-ftplib.patch
-PYTHON3_IGNORE_CVES += CVE-2026-8328
-
 # This host Python is installed in $(HOST_DIR), as it is needed when
 # cross-compiling third-party Python modules.
 

--===============3065548876668862358==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3065548876668862358==--
