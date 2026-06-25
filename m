Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B98A1C43638
	for <buildroot@archiver.kernel.org>; Fri, 26 Jun 2026 14:50:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 906B260F41;
	Fri, 26 Jun 2026 14:50:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id agaJ88YN85wz; Fri, 26 Jun 2026 14:50:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D19860F5C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782485403;
	bh=CXrgnUG/9Q7Cl26EWvj+sWX8Cxm5wbCN6gVedNPSu7I=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=JRh+vN5REU1ghnpN3xb2fhfkJfWbfbZDexznb/X60uUfhSF6Jlo+pkJlUL2uxwNZp
	 EMvC1oLJOrMOi2b3riLKjGW7oPecXDjJHiH+6K8A7BJG6gmt5dNq4NOmoRVrVCrpWj
	 XKtm4qB8UDUTI4Gns53M3leF9phpttvgrmYzzy9Ka0BGoZ6zF875Z3AQFTZ3tL32M5
	 zhP0N5j845IT5Wo2nMNQq6VMxmbadYOAf8WUUjGwLVWARaSs6HhfolXx5ky++36qMT
	 g8c/MNhNJcjHl8r0LqE0sG/s8KMfA6O4kZAOCkzHfHfCG5kR4RCP8bE8kToNgK9XAG
	 eNWMeUKVyAwkw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D19860F5C;
	Fri, 26 Jun 2026 14:50:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 660F814A4
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:49:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 582DA8221E
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:49:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2GsTBP9ICg6J for <buildroot@buildroot.org>;
 Fri, 26 Jun 2026 14:49:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D913581FBD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D913581FBD
 for <buildroot@buildroot.org>; Fri, 26 Jun 2026 14:49:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D9841864AD; Fri, 26 Jun 2026 14:49:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 25 Jun 2026 16:26:50 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: defefd4ddfca989aa42a3d70c658d5e0e4d48433
X-Git-Newrev: 4d20d7f1ca069957c94bb38b77416b8e6d5d44ac
X-Patchwork-Hint: ignore
Message-Id: <20260626144919.D9841864AD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/python3: add
 patch for CVE-2026-9669
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4d20d7f1ca069957c94bb38b77416b8e6d5d44ac
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

This fixes the following vulnerability:
- CVE-2026-9669:
    bz2.BZ2Decompressor objects could be reused after a decompression
    error. If an application caught the resulting OSError and retried with
    the same decompressor, crafted input could cause the decompressor to
    resume from an invalid internal state and perform out-of-bounds writes
    to a stack buffer. This could crash the process when processing
    untrusted data.
    https://www.cve.org/CVERecord?id=CVE-2026-9669

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
(cherry picked from commit 5cd9188c3e1309b178863b5239e08ee2564911cd)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...event-bz2-decompressor-reuse-after-errors.patch | 108 +++++++++++++++++++++
 package/python3/python3.mk                         |   2 +
 2 files changed, 110 insertions(+)

diff --git a/package/python3/0016-prevent-bz2-decompressor-reuse-after-errors.patch b/package/python3/0016-prevent-bz2-decompressor-reuse-after-errors.patch
new file mode 100644
index 0000000000..3fecf86ab7
--- /dev/null
+++ b/package/python3/0016-prevent-bz2-decompressor-reuse-after-errors.patch
@@ -0,0 +1,108 @@
+From c36ef35e7e5601739755d883f5dab5c6e02b2e30 Mon Sep 17 00:00:00 2001
+From: Stan Ulbrych <stan@python.org>
+Date: Sun, 7 Jun 2026 19:37:10 +0100
+Subject: [PATCH] [3.12] gh-150599: Prevent bz2 decompressor reuse after
+ errors (#150600) (#151054)
+
+(cherry picked from commit 5755d0f083949ff3c5bf3a37e673e24e306b036e)
+
+Upstream: https://github.com/python/cpython/pull/151057
+CVE: CVE-2026-9669
+[Titouan: Squash fixup commit 0c2466a0fc2270c87e9f67c250c9454c28c09c3
+          from the upstream PR in the patch below]
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ Lib/test/test_bz2.py                           | 15 +++++++++++++++
+ ...6-05-30-09-36-20.gh-issue-150599.nlHqU-.rst |  3 +++
+ Modules/_bz2module.c                           | 18 +++++++++++++++---
+ 3 files changed, 33 insertions(+), 3 deletions(-)
+ create mode 100644 Misc/NEWS.d/next/Security/2026-05-30-09-36-20.gh-issue-150599.nlHqU-.rst
+
+diff --git a/Lib/test/test_bz2.py b/Lib/test/test_bz2.py
+index cb730a1a46e25a1..dcbf6a298264a40 100644
+--- a/Lib/test/test_bz2.py
++++ b/Lib/test/test_bz2.py
+@@ -958,6 +958,21 @@ def test_failure(self):
+         # Previously, a second call could crash due to internal inconsistency
+         self.assertRaises(Exception, bzd.decompress, self.BAD_DATA * 30)
+ 
++    def test_decompress_after_data_error(self):
++        data = bytes.fromhex(
++            "425a6839314159265359000000000000007fffff000000000000000000000000"
++            "00000000000000000000000000000000000000e0370000000000000000000000"
++            "000000000000000000000000000000000000000000000000000083f3"
++        )
++        bzd = BZ2Decompressor()
++        with self.assertRaisesRegex(OSError, "Invalid data stream"):
++            bzd.decompress(data)
++        # Previously, a second call could crash due to internal inconsistency
++        self.assertFalse(bzd.needs_input)
++        self.assertFalse(bzd.eof)
++        with self.assertRaisesRegex(ValueError, "previous error"):
++            bzd.decompress(b'\x00' * 18)
++
+     @support.refcount_test
+     def test_refleaks_in___init__(self):
+         gettotalrefcount = support.get_attribute(sys, 'gettotalrefcount')
+diff --git a/Misc/NEWS.d/next/Security/2026-05-30-09-36-20.gh-issue-150599.nlHqU-.rst b/Misc/NEWS.d/next/Security/2026-05-30-09-36-20.gh-issue-150599.nlHqU-.rst
+new file mode 100644
+index 000000000000000..a37d86cf423f820
+--- /dev/null
++++ b/Misc/NEWS.d/next/Security/2026-05-30-09-36-20.gh-issue-150599.nlHqU-.rst
+@@ -0,0 +1,3 @@
++Fix a possible stack buffer overflow in :mod:`bz2` when a
++:class:`bz2.BZ2Decompressor` is reused after a decompression error.
++The decompressor now becomes unusable after libbz2 reports an error.
+diff --git a/Modules/_bz2module.c b/Modules/_bz2module.c
+index 97bd44b4ac96944..0b0916142f575be 100644
+--- a/Modules/_bz2module.c
++++ b/Modules/_bz2module.c
+@@ -114,6 +114,7 @@ typedef struct {
+ typedef struct {
+     PyObject_HEAD
+     bz_stream bzs;
++    int bzerror;
+     char eof;           /* T_BOOL expects a char */
+     PyObject *unused_data;
+     char needs_input;
+@@ -453,8 +454,11 @@ decompress_buf(BZ2Decompressor *d, Py_ssize_t max_length)
+ 
+         d->bzs_avail_in_real += bzs->avail_in;
+ 
+-        if (catch_bz2_error(bzret))
++        if (catch_bz2_error(bzret)) {
++            d->bzerror = bzret;
++            d->needs_input = 0;
+             goto error;
++        }
+         if (bzret == BZ_STREAM_END) {
+             d->eof = 1;
+             break;
+@@ -621,10 +625,17 @@ _bz2_BZ2Decompressor_decompress_impl(BZ2Decompressor *self, Py_buffer *data,
+     PyObject *result = NULL;
+ 
+     ACQUIRE_LOCK(self);
+-    if (self->eof)
++    if (self->eof) {
+         PyErr_SetString(PyExc_EOFError, "End of stream already reached");
+-    else
++    }
++    else if (self->bzerror) {
++        // Re-entering BZ2_bzDecompress() after an error can write out of bounds.
++        PyErr_SetString(PyExc_ValueError,
++                        "Decompressor is unusable after a previous error");
++    }
++    else {
+         result = decompress(self, data->buf, data->len, max_length);
++    }
+     RELEASE_LOCK(self);
+     return result;
+ }
+@@ -658,6 +669,7 @@ _bz2_BZ2Decompressor_impl(PyTypeObject *type)
+         return NULL;
+     }
+ 
++    self->bzerror = 0;
+     self->needs_input = 1;
+     self->bzs_avail_in_real = 0;
+     self->input_buffer = NULL;
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 52f06e08df..1c181f0d33 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -19,6 +19,8 @@ PYTHON3_IGNORE_CVES += CVE-2026-3276
 PYTHON3_IGNORE_CVES += CVE-2026-7774
 # 0015-Apply-CVE-2021-4189-PASV-fix-to-ftplib-ftpcp.patch
 PYTHON3_IGNORE_CVES += CVE-2026-8328
+# 0016-prevent-bz2-decompressor-reuse-after-errors.patch
+PYTHON3_IGNORE_CVES += CVE-2026-9669
 
 # This host Python is installed in $(HOST_DIR), as it is needed when
 # cross-compiling third-party Python modules.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
