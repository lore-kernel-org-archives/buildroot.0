Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69DCBCCF9F8
	for <buildroot@archiver.kernel.org>; Thu, 30 Oct 2025 08:11:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 32A6D84016;
	Thu, 30 Oct 2025 08:11:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oHLLQ6N1brDk; Thu, 30 Oct 2025 08:10:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C39B83FC7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C39B83FC7;
	Thu, 30 Oct 2025 08:10:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9FCA32A3
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:10:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 83E7F6139B
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:10:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lLTD8Yvp5XqF for <buildroot@buildroot.org>;
 Thu, 30 Oct 2025 08:10:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 463CA60E79
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 463CA60E79
 for <buildroot@buildroot.org>; Thu, 30 Oct 2025 08:10:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 36F3C879EF; Thu, 30 Oct 2025 08:10:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 30 Oct 2025 08:55:54 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 358dbb116040a17d056aaa9dd275aff906e7c34f
X-Git-Newrev: fdfbad13cad9d7f5640d3bf0aa2abc1c6016fd92
X-Patchwork-Hint: ignore
Message-Id: <20251030081039.36F3C879EF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/python3: security
 bump to v3.12.12
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============8030524496021037251=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8030524496021037251==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=fdfbad13cad9d7f5640d3bf0aa2abc1c6016fd92
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

See the changelog:
https://docs.python.org/release/3.12.12/whatsnew/changelog.html#python-3-12-12

And the announcement:
https://www.python.org/downloads/release/python-31212/

This provides the following security fixes:
- gh-139312: Upgraded bundled libexpat to 2.7.3 to fix CVE-2025-59375

- gh-139700: Check consistency of the zip64 end of central directory record.
  Support records with “zip64 extensible data” if there are no bytes
  prepended to the ZIP file.

- gh-139400: xml.parsers.expat: Make sure that parent Expat parsers are only
  garbage-collected once they are no longer referenced by subparsers created
  by ExternalEntityParserCreate(). Patch by Sebastian Pipping.

- gh-135661: Fix parsing start and end tags in html.parser.HTMLParser
  according to the HTML5 standard.

- gh-135661: Fix CDATA section parsing in html.parser.HTMLParser according to
  the HTML5 standard: ] ]> and ]] > no longer end the CDATA section. Add
  private method _set_support_cdata() which can be used to specify how to
  parse <[CDATA[ — as a CDATA section in foreign content (SVG or MathML) or as
  a bogus comment in the HTML namespace.

- gh-102555: Fix comment parsing in html.parser.HTMLParser according to the
  HTML5 standard. --!> now ends the comment. -- > no longer ends the comment.
  Support abnormally ended empty comments <--> and <--->.

- gh-135462: Fix quadratic complexity in processing specially crafted input
  in html.parser.HTMLParser. End-of-file errors are now handled according
  to the HTML5 specs – comments and declarations are automatically closed,
  tags are ignored.

- gh-118350: Fix support of escapable raw text mode (elements “textarea” and
  “title”) in html.parser.HTMLParser.

- gh-86155: html.parser.HTMLParser.close() no longer loses data when the
  <script> tag is not closed. Patch by Waylan Limberg.

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
(cherry picked from commit d16c812b7e0d9e18ee5ac9211482ac719fd4f77e)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...to-ensure-member-offsets-are-non-negative.patch | 218 ---------------------
 package/python3/python3.hash                       |   4 +-
 package/python3/python3.mk                         |   2 +-
 3 files changed, 3 insertions(+), 221 deletions(-)

diff --git a/package/python3/0013-tarfile-now-validates-archives-to-ensure-member-offsets-are-non-negative.patch b/package/python3/0013-tarfile-now-validates-archives-to-ensure-member-offsets-are-non-negative.patch
deleted file mode 100644
index a078621e77..0000000000
--- a/package/python3/0013-tarfile-now-validates-archives-to-ensure-member-offsets-are-non-negative.patch
+++ /dev/null
@@ -1,218 +0,0 @@
-From c9d9f78feb1467e73fd29356c040bde1c104f29f Mon Sep 17 00:00:00 2001
-From: "Miss Islington (bot)"
- <31488909+miss-islington@users.noreply.github.com>
-Date: Mon, 4 Aug 2025 13:45:06 +0200
-Subject: [PATCH] [3.12] gh-130577: tarfile now validates archives to ensure
- member offsets are non-negative (GH-137027) (#137171)
-
-(cherry picked from commit 7040aa54f14676938970e10c5f74ea93cd56aa38)
-
-Co-authored-by: Alexander Urieles <aeurielesn@users.noreply.github.com>
-Co-authored-by: Gregory P. Smith <greg@krypto.org>
-CVE: CVE-2025-8194
-Upstream: https://github.com/python/cpython/commit/c9d9f78feb1467e73fd29356c040bde1c104f29f
-Signed-off-by: Thomas Perale <thomas.perale@mind.be>
----
- Lib/tarfile.py                                |   3 +
- Lib/test/test_tarfile.py                      | 156 ++++++++++++++++++
- ...-07-23-00-35-29.gh-issue-130577.c7EITy.rst |   3 +
- 3 files changed, 162 insertions(+)
- create mode 100644 Misc/NEWS.d/next/Library/2025-07-23-00-35-29.gh-issue-130577.c7EITy.rst
-
-diff --git a/Lib/tarfile.py b/Lib/tarfile.py
-index 9999a99d54d8b9..59d3f6e5cce165 100755
---- a/Lib/tarfile.py
-+++ b/Lib/tarfile.py
-@@ -1615,6 +1615,9 @@ def _block(self, count):
-         """Round up a byte count by BLOCKSIZE and return it,
-            e.g. _block(834) => 1024.
-         """
-+        # Only non-negative offsets are allowed
-+        if count < 0:
-+            raise InvalidHeaderError("invalid offset")
-         blocks, remainder = divmod(count, BLOCKSIZE)
-         if remainder:
-             blocks += 1
-diff --git a/Lib/test/test_tarfile.py b/Lib/test/test_tarfile.py
-index a184ba75a8851b..759fa03ead70b0 100644
---- a/Lib/test/test_tarfile.py
-+++ b/Lib/test/test_tarfile.py
-@@ -50,6 +50,7 @@ def sha256sum(data):
- xzname = os.path.join(TEMPDIR, "testtar.tar.xz")
- tmpname = os.path.join(TEMPDIR, "tmp.tar")
- dotlessname = os.path.join(TEMPDIR, "testtar")
-+SPACE = b" "
- 
- sha256_regtype = (
-     "e09e4bc8b3c9d9177e77256353b36c159f5f040531bbd4b024a8f9b9196c71ce"
-@@ -4488,6 +4489,161 @@ def extractall(self, ar):
-         ar.extractall(self.testdir, filter='fully_trusted')
- 
- 
-+class OffsetValidationTests(unittest.TestCase):
-+    tarname = tmpname
-+    invalid_posix_header = (
-+        # name: 100 bytes
-+        tarfile.NUL * tarfile.LENGTH_NAME
-+        # mode, space, null terminator: 8 bytes
-+        + b"000755" + SPACE + tarfile.NUL
-+        # uid, space, null terminator: 8 bytes
-+        + b"000001" + SPACE + tarfile.NUL
-+        # gid, space, null terminator: 8 bytes
-+        + b"000001" + SPACE + tarfile.NUL
-+        # size, space: 12 bytes
-+        + b"\xff" * 11 + SPACE
-+        # mtime, space: 12 bytes
-+        + tarfile.NUL * 11 + SPACE
-+        # chksum: 8 bytes
-+        + b"0011407" + tarfile.NUL
-+        # type: 1 byte
-+        + tarfile.REGTYPE
-+        # linkname: 100 bytes
-+        + tarfile.NUL * tarfile.LENGTH_LINK
-+        # magic: 6 bytes, version: 2 bytes
-+        + tarfile.POSIX_MAGIC
-+        # uname: 32 bytes
-+        + tarfile.NUL * 32
-+        # gname: 32 bytes
-+        + tarfile.NUL * 32
-+        # devmajor, space, null terminator: 8 bytes
-+        + tarfile.NUL * 6 + SPACE + tarfile.NUL
-+        # devminor, space, null terminator: 8 bytes
-+        + tarfile.NUL * 6 + SPACE + tarfile.NUL
-+        # prefix: 155 bytes
-+        + tarfile.NUL * tarfile.LENGTH_PREFIX
-+        # padding: 12 bytes
-+        + tarfile.NUL * 12
-+    )
-+    invalid_gnu_header = (
-+        # name: 100 bytes
-+        tarfile.NUL * tarfile.LENGTH_NAME
-+        # mode, null terminator: 8 bytes
-+        + b"0000755" + tarfile.NUL
-+        # uid, null terminator: 8 bytes
-+        + b"0000001" + tarfile.NUL
-+        # gid, space, null terminator: 8 bytes
-+        + b"0000001" + tarfile.NUL
-+        # size, space: 12 bytes
-+        + b"\xff" * 11 + SPACE
-+        # mtime, space: 12 bytes
-+        + tarfile.NUL * 11 + SPACE
-+        # chksum: 8 bytes
-+        + b"0011327" + tarfile.NUL
-+        # type: 1 byte
-+        + tarfile.REGTYPE
-+        # linkname: 100 bytes
-+        + tarfile.NUL * tarfile.LENGTH_LINK
-+        # magic: 8 bytes
-+        + tarfile.GNU_MAGIC
-+        # uname: 32 bytes
-+        + tarfile.NUL * 32
-+        # gname: 32 bytes
-+        + tarfile.NUL * 32
-+        # devmajor, null terminator: 8 bytes
-+        + tarfile.NUL * 8
-+        # devminor, null terminator: 8 bytes
-+        + tarfile.NUL * 8
-+        # padding: 167 bytes
-+        + tarfile.NUL * 167
-+    )
-+    invalid_v7_header = (
-+        # name: 100 bytes
-+        tarfile.NUL * tarfile.LENGTH_NAME
-+        # mode, space, null terminator: 8 bytes
-+        + b"000755" + SPACE + tarfile.NUL
-+        # uid, space, null terminator: 8 bytes
-+        + b"000001" + SPACE + tarfile.NUL
-+        # gid, space, null terminator: 8 bytes
-+        + b"000001" + SPACE + tarfile.NUL
-+        # size, space: 12 bytes
-+        + b"\xff" * 11 + SPACE
-+        # mtime, space: 12 bytes
-+        + tarfile.NUL * 11 + SPACE
-+        # chksum: 8 bytes
-+        + b"0010070" + tarfile.NUL
-+        # type: 1 byte
-+        + tarfile.REGTYPE
-+        # linkname: 100 bytes
-+        + tarfile.NUL * tarfile.LENGTH_LINK
-+        # padding: 255 bytes
-+        + tarfile.NUL * 255
-+    )
-+    valid_gnu_header = tarfile.TarInfo("filename").tobuf(tarfile.GNU_FORMAT)
-+    data_block = b"\xff" * tarfile.BLOCKSIZE
-+
-+    def _write_buffer(self, buffer):
-+        with open(self.tarname, "wb") as f:
-+            f.write(buffer)
-+
-+    def _get_members(self, ignore_zeros=None):
-+        with open(self.tarname, "rb") as f:
-+            with tarfile.open(
-+                mode="r", fileobj=f, ignore_zeros=ignore_zeros
-+            ) as tar:
-+                return tar.getmembers()
-+
-+    def _assert_raises_read_error_exception(self):
-+        with self.assertRaisesRegex(
-+            tarfile.ReadError, "file could not be opened successfully"
-+        ):
-+            self._get_members()
-+
-+    def test_invalid_offset_header_validations(self):
-+        for tar_format, invalid_header in (
-+            ("posix", self.invalid_posix_header),
-+            ("gnu", self.invalid_gnu_header),
-+            ("v7", self.invalid_v7_header),
-+        ):
-+            with self.subTest(format=tar_format):
-+                self._write_buffer(invalid_header)
-+                self._assert_raises_read_error_exception()
-+
-+    def test_early_stop_at_invalid_offset_header(self):
-+        buffer = self.valid_gnu_header + self.invalid_gnu_header + self.valid_gnu_header
-+        self._write_buffer(buffer)
-+        members = self._get_members()
-+        self.assertEqual(len(members), 1)
-+        self.assertEqual(members[0].name, "filename")
-+        self.assertEqual(members[0].offset, 0)
-+
-+    def test_ignore_invalid_archive(self):
-+        # 3 invalid headers with their respective data
-+        buffer = (self.invalid_gnu_header + self.data_block) * 3
-+        self._write_buffer(buffer)
-+        members = self._get_members(ignore_zeros=True)
-+        self.assertEqual(len(members), 0)
-+
-+    def test_ignore_invalid_offset_headers(self):
-+        for first_block, second_block, expected_offset in (
-+            (
-+                (self.valid_gnu_header),
-+                (self.invalid_gnu_header + self.data_block),
-+                0,
-+            ),
-+            (
-+                (self.invalid_gnu_header + self.data_block),
-+                (self.valid_gnu_header),
-+                1024,
-+            ),
-+        ):
-+            self._write_buffer(first_block + second_block)
-+            members = self._get_members(ignore_zeros=True)
-+            self.assertEqual(len(members), 1)
-+            self.assertEqual(members[0].name, "filename")
-+            self.assertEqual(members[0].offset, expected_offset)
-+
-+
- def setUpModule():
-     os_helper.unlink(TEMPDIR)
-     os.makedirs(TEMPDIR)
-diff --git a/Misc/NEWS.d/next/Library/2025-07-23-00-35-29.gh-issue-130577.c7EITy.rst b/Misc/NEWS.d/next/Library/2025-07-23-00-35-29.gh-issue-130577.c7EITy.rst
-new file mode 100644
-index 00000000000000..342cabbc865dc4
---- /dev/null
-+++ b/Misc/NEWS.d/next/Library/2025-07-23-00-35-29.gh-issue-130577.c7EITy.rst
-@@ -0,0 +1,3 @@
-+:mod:`tarfile` now validates archives to ensure member offsets are
-+non-negative.  (Contributed by Alexander Enrique Urieles Nieto in
-+:gh:`130577`.)
diff --git a/package/python3/python3.hash b/package/python3/python3.hash
index 923a632165..ed0d879f11 100644
--- a/package/python3/python3.hash
+++ b/package/python3/python3.hash
@@ -1,5 +1,5 @@
 # From https://www.python.org/downloads/release/python-31211/
-md5  9613d56b90d0d0cfd19980c7e2956a06  Python-3.12.11.tar.xz
+md5  04feb01316c7bb1b448001adbc63dd23  Python-3.12.12.tar.xz
 # Locally computed
-sha256  c30bb24b7f1e9a19b11b55a546434f74e739bb4c271a3e3a80ff4380d49f7adb  Python-3.12.11.tar.xz
+sha256  fb85a13414b028c49ba18bbd523c2d055a30b56b18b92ce454ea2c51edc656c4  Python-3.12.12.tar.xz
 sha256  3b2f81fe21d181c499c59a256c8e1968455d6689d269aa85373bfb6af41da3bf  LICENSE
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 8adc76161d..b4c3cc9a9c 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PYTHON3_VERSION_MAJOR = 3.12
-PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).11
+PYTHON3_VERSION = $(PYTHON3_VERSION_MAJOR).12
 PYTHON3_SOURCE = Python-$(PYTHON3_VERSION).tar.xz
 PYTHON3_SITE = https://python.org/ftp/python/$(PYTHON3_VERSION)
 PYTHON3_LICENSE = Python-2.0, others

--===============8030524496021037251==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8030524496021037251==--
