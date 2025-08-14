Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEF8DCA0EDC
	for <buildroot@archiver.kernel.org>; Thu, 14 Aug 2025 20:06:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C908480DD8;
	Thu, 14 Aug 2025 20:06:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HxXpZufNb6au; Thu, 14 Aug 2025 20:06:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0AB0280DCE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0AB0280DCE;
	Thu, 14 Aug 2025 20:06:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1775493E
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:06:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 707A880D70
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:06:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rPdjgyDbjmXf for <buildroot@buildroot.org>;
 Thu, 14 Aug 2025 20:06:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B49380D3B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4B49380D3B
 for <buildroot@buildroot.org>; Thu, 14 Aug 2025 20:06:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4967C8758C; Thu, 14 Aug 2025 20:06:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 14 Aug 2025 09:29:51 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: de04bbfdcc4a002695d4f85d53042f9ab0f5c52d
X-Git-Newrev: 630a22d09339f94c5b166e3b71c1a12938cbc46b
X-Patchwork-Hint: ignore
Message-Id: <20250814200604.4967C8758C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/python3: add
 upstream post-3.13.5 security fix for CVE-2025-8194
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
Content-Type: multipart/mixed; boundary="===============0262323224580913684=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0262323224580913684==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=630a22d09339f94c5b166e3b71c1a12938cbc46b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

Fixes the following vulnerability:

CVE-2025-8194: There is a defect in the CPython “tarfile” module affecting
the “TarFile” extraction and entry enumeration APIs.  The tar implementation
would process tar archives with negative offsets without error, resulting in
an infinite loop and deadlock during the parsing of maliciously crafted tar
archives.

https://nvd.nist.gov/vuln/detail/CVE-2025-8194
https://www.openwall.com/lists/oss-security/2025/07/28/1

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 681575c73cc0f5be2644bb87f73dcc50c602a690)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...577-tarfile-now-validates-archives-to-ens.patch | 221 +++++++++++++++++++++
 package/python3/python3.mk                         |   3 +
 2 files changed, 224 insertions(+)

diff --git a/package/python3/0009-3.13-gh-130577-tarfile-now-validates-archives-to-ens.patch b/package/python3/0009-3.13-gh-130577-tarfile-now-validates-archives-to-ens.patch
new file mode 100644
index 0000000000..1848ec2745
--- /dev/null
+++ b/package/python3/0009-3.13-gh-130577-tarfile-now-validates-archives-to-ens.patch
@@ -0,0 +1,221 @@
+From cdae923ffe187d6ef916c0f665a31249619193fe Mon Sep 17 00:00:00 2001
+From: "Miss Islington (bot)"
+ <31488909+miss-islington@users.noreply.github.com>
+Date: Mon, 28 Jul 2025 17:59:33 +0200
+Subject: [PATCH] [3.13] gh-130577: tarfile now validates archives to ensure
+ member offsets are non-negative (GH-137027) (#137170)
+
+gh-130577: tarfile now validates archives to ensure member offsets are non-negative (GH-137027)
+(cherry picked from commit 7040aa54f14676938970e10c5f74ea93cd56aa38)
+
+Upstream: https://github.com/python/cpython/commit/cdae923ffe187d6ef916c0f665a31249619193fe
+Co-authored-by: Alexander Urieles <aeurielesn@users.noreply.github.com>
+Co-authored-by: Gregory P. Smith <greg@krypto.org>
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ Lib/tarfile.py                                |   3 +
+ Lib/test/test_tarfile.py                      | 156 ++++++++++++++++++
+ ...-07-23-00-35-29.gh-issue-130577.c7EITy.rst |   3 +
+ 3 files changed, 162 insertions(+)
+ create mode 100644 Misc/NEWS.d/next/Library/2025-07-23-00-35-29.gh-issue-130577.c7EITy.rst
+
+diff --git a/Lib/tarfile.py b/Lib/tarfile.py
+index 0980f6a8175..9ff9df696de 100755
+--- a/Lib/tarfile.py
++++ b/Lib/tarfile.py
+@@ -1636,6 +1636,9 @@ def _block(self, count):
+         """Round up a byte count by BLOCKSIZE and return it,
+            e.g. _block(834) => 1024.
+         """
++        # Only non-negative offsets are allowed
++        if count < 0:
++            raise InvalidHeaderError("invalid offset")
+         blocks, remainder = divmod(count, BLOCKSIZE)
+         if remainder:
+             blocks += 1
+diff --git a/Lib/test/test_tarfile.py b/Lib/test/test_tarfile.py
+index ac31be0f050..7024be46de5 100644
+--- a/Lib/test/test_tarfile.py
++++ b/Lib/test/test_tarfile.py
+@@ -50,6 +50,7 @@ def sha256sum(data):
+ xzname = os.path.join(TEMPDIR, "testtar.tar.xz")
+ tmpname = os.path.join(TEMPDIR, "tmp.tar")
+ dotlessname = os.path.join(TEMPDIR, "testtar")
++SPACE = b" "
+ 
+ sha256_regtype = (
+     "e09e4bc8b3c9d9177e77256353b36c159f5f040531bbd4b024a8f9b9196c71ce"
+@@ -4578,6 +4579,161 @@ def extractall(self, ar):
+         ar.extractall(self.testdir, filter='fully_trusted')
+ 
+ 
++class OffsetValidationTests(unittest.TestCase):
++    tarname = tmpname
++    invalid_posix_header = (
++        # name: 100 bytes
++        tarfile.NUL * tarfile.LENGTH_NAME
++        # mode, space, null terminator: 8 bytes
++        + b"000755" + SPACE + tarfile.NUL
++        # uid, space, null terminator: 8 bytes
++        + b"000001" + SPACE + tarfile.NUL
++        # gid, space, null terminator: 8 bytes
++        + b"000001" + SPACE + tarfile.NUL
++        # size, space: 12 bytes
++        + b"\xff" * 11 + SPACE
++        # mtime, space: 12 bytes
++        + tarfile.NUL * 11 + SPACE
++        # chksum: 8 bytes
++        + b"0011407" + tarfile.NUL
++        # type: 1 byte
++        + tarfile.REGTYPE
++        # linkname: 100 bytes
++        + tarfile.NUL * tarfile.LENGTH_LINK
++        # magic: 6 bytes, version: 2 bytes
++        + tarfile.POSIX_MAGIC
++        # uname: 32 bytes
++        + tarfile.NUL * 32
++        # gname: 32 bytes
++        + tarfile.NUL * 32
++        # devmajor, space, null terminator: 8 bytes
++        + tarfile.NUL * 6 + SPACE + tarfile.NUL
++        # devminor, space, null terminator: 8 bytes
++        + tarfile.NUL * 6 + SPACE + tarfile.NUL
++        # prefix: 155 bytes
++        + tarfile.NUL * tarfile.LENGTH_PREFIX
++        # padding: 12 bytes
++        + tarfile.NUL * 12
++    )
++    invalid_gnu_header = (
++        # name: 100 bytes
++        tarfile.NUL * tarfile.LENGTH_NAME
++        # mode, null terminator: 8 bytes
++        + b"0000755" + tarfile.NUL
++        # uid, null terminator: 8 bytes
++        + b"0000001" + tarfile.NUL
++        # gid, space, null terminator: 8 bytes
++        + b"0000001" + tarfile.NUL
++        # size, space: 12 bytes
++        + b"\xff" * 11 + SPACE
++        # mtime, space: 12 bytes
++        + tarfile.NUL * 11 + SPACE
++        # chksum: 8 bytes
++        + b"0011327" + tarfile.NUL
++        # type: 1 byte
++        + tarfile.REGTYPE
++        # linkname: 100 bytes
++        + tarfile.NUL * tarfile.LENGTH_LINK
++        # magic: 8 bytes
++        + tarfile.GNU_MAGIC
++        # uname: 32 bytes
++        + tarfile.NUL * 32
++        # gname: 32 bytes
++        + tarfile.NUL * 32
++        # devmajor, null terminator: 8 bytes
++        + tarfile.NUL * 8
++        # devminor, null terminator: 8 bytes
++        + tarfile.NUL * 8
++        # padding: 167 bytes
++        + tarfile.NUL * 167
++    )
++    invalid_v7_header = (
++        # name: 100 bytes
++        tarfile.NUL * tarfile.LENGTH_NAME
++        # mode, space, null terminator: 8 bytes
++        + b"000755" + SPACE + tarfile.NUL
++        # uid, space, null terminator: 8 bytes
++        + b"000001" + SPACE + tarfile.NUL
++        # gid, space, null terminator: 8 bytes
++        + b"000001" + SPACE + tarfile.NUL
++        # size, space: 12 bytes
++        + b"\xff" * 11 + SPACE
++        # mtime, space: 12 bytes
++        + tarfile.NUL * 11 + SPACE
++        # chksum: 8 bytes
++        + b"0010070" + tarfile.NUL
++        # type: 1 byte
++        + tarfile.REGTYPE
++        # linkname: 100 bytes
++        + tarfile.NUL * tarfile.LENGTH_LINK
++        # padding: 255 bytes
++        + tarfile.NUL * 255
++    )
++    valid_gnu_header = tarfile.TarInfo("filename").tobuf(tarfile.GNU_FORMAT)
++    data_block = b"\xff" * tarfile.BLOCKSIZE
++
++    def _write_buffer(self, buffer):
++        with open(self.tarname, "wb") as f:
++            f.write(buffer)
++
++    def _get_members(self, ignore_zeros=None):
++        with open(self.tarname, "rb") as f:
++            with tarfile.open(
++                mode="r", fileobj=f, ignore_zeros=ignore_zeros
++            ) as tar:
++                return tar.getmembers()
++
++    def _assert_raises_read_error_exception(self):
++        with self.assertRaisesRegex(
++            tarfile.ReadError, "file could not be opened successfully"
++        ):
++            self._get_members()
++
++    def test_invalid_offset_header_validations(self):
++        for tar_format, invalid_header in (
++            ("posix", self.invalid_posix_header),
++            ("gnu", self.invalid_gnu_header),
++            ("v7", self.invalid_v7_header),
++        ):
++            with self.subTest(format=tar_format):
++                self._write_buffer(invalid_header)
++                self._assert_raises_read_error_exception()
++
++    def test_early_stop_at_invalid_offset_header(self):
++        buffer = self.valid_gnu_header + self.invalid_gnu_header + self.valid_gnu_header
++        self._write_buffer(buffer)
++        members = self._get_members()
++        self.assertEqual(len(members), 1)
++        self.assertEqual(members[0].name, "filename")
++        self.assertEqual(members[0].offset, 0)
++
++    def test_ignore_invalid_archive(self):
++        # 3 invalid headers with their respective data
++        buffer = (self.invalid_gnu_header + self.data_block) * 3
++        self._write_buffer(buffer)
++        members = self._get_members(ignore_zeros=True)
++        self.assertEqual(len(members), 0)
++
++    def test_ignore_invalid_offset_headers(self):
++        for first_block, second_block, expected_offset in (
++            (
++                (self.valid_gnu_header),
++                (self.invalid_gnu_header + self.data_block),
++                0,
++            ),
++            (
++                (self.invalid_gnu_header + self.data_block),
++                (self.valid_gnu_header),
++                1024,
++            ),
++        ):
++            self._write_buffer(first_block + second_block)
++            members = self._get_members(ignore_zeros=True)
++            self.assertEqual(len(members), 1)
++            self.assertEqual(members[0].name, "filename")
++            self.assertEqual(members[0].offset, expected_offset)
++
++
+ def setUpModule():
+     os_helper.unlink(TEMPDIR)
+     os.makedirs(TEMPDIR)
+diff --git a/Misc/NEWS.d/next/Library/2025-07-23-00-35-29.gh-issue-130577.c7EITy.rst b/Misc/NEWS.d/next/Library/2025-07-23-00-35-29.gh-issue-130577.c7EITy.rst
+new file mode 100644
+index 00000000000..342cabbc865
+--- /dev/null
++++ b/Misc/NEWS.d/next/Library/2025-07-23-00-35-29.gh-issue-130577.c7EITy.rst
+@@ -0,0 +1,3 @@
++:mod:`tarfile` now validates archives to ensure member offsets are
++non-negative.  (Contributed by Alexander Enrique Urieles Nieto in
++:gh:`130577`.)
+-- 
+2.39.5
+
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index ec210ccac8..337e1401de 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -13,6 +13,9 @@ PYTHON3_LICENSE_FILES = LICENSE
 PYTHON3_CPE_ID_VENDOR = python
 PYTHON3_CPE_ID_PRODUCT = python
 
+# 0009-3.13-gh-130577-tarfile-now-validates-archives-to-ens.patch
+PYTHON3_IGNORE_CVES += CVE-2025-8194
+
 # This host Python is installed in $(HOST_DIR), as it is needed when
 # cross-compiling third-party Python modules.
 

--===============0262323224580913684==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0262323224580913684==--
