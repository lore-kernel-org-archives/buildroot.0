Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 126F8C43458
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 16:36:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2F6F40874;
	Fri, 10 Jul 2026 16:36:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qgCOUYZG2YDb; Fri, 10 Jul 2026 16:35:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4CEFB40878
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783701359;
	bh=Zdx6QNphTKE7UZpxYxzqndjip2F/pRs4ZLBoxMNo6gQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=JXNiHuD9KFvd8IRVP9mI+df2HDnus47QOYvjVLW0vxYcufI5DQXGjnUtrWbIUNcn2
	 FpOqpg5yEEqU9p+VgZQQQU6OA0Z2ipFekNx9c2G0cILOlt3NXzIApmaq66buoigj5f
	 bUAND6YFU3KHQ3o0eh9RiQysSUPpt9qZ/rULA5O7hpuS8crzJ9hNpUqYfTR292vgOg
	 uuVcpq3/0naiDOtqzcMQx/wNnjcaUF1hIUEE6znSwldGR6pkPPo4H1h45D6ZSvFtnl
	 e+u+qsdPXvXR32F7qdxLvJX7L9Hkz3PeLfjd+e9Tc0NuXNFZDhx8pGvTajrLqWXJ8B
	 ZFacjiIrhAvHQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4CEFB40878;
	Fri, 10 Jul 2026 16:35:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id EB82A2FE
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 16:35:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D4DE040874
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 16:35:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id il3ag4Zz4PlJ for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 16:35:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A1F540878
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8A1F540878
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 16:35:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A04628869B; Fri, 10 Jul 2026 16:35:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 10 Jul 2026 18:34:29 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d1111db6fc1b96579d799acba3edc177de9dc7a9
X-Git-Newrev: e36f9af3a5a2899dd0f48699c6cf4b46970041cd
X-Patchwork-Hint: ignore
Message-Id: <20260710163523.A04628869B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python3: add upstream security
 patches for CVE-2026-0864, CVE-2026-11972, CVE-2026-4360 & CVE-2026-15308
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e36f9af3a5a2899dd0f48699c6cf4b46970041cd
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

CVE-2026-0864:
https://mail.python.org/archives/list/security-announce@python.org/thread/CV4NE6AFCRJL7XQOHX7J5TSDHUWVWGJS/

CVE-2026-11972:
https://mail.python.org/archives/list/security-announce@python.org/thread/AXPSKKTSRKXTTJULW3XSIC74WZNAAPPB/

CVE-2026-4360:
https://mail.python.org/archives/list/security-announce@python.org/thread/TWZW2PC2AZOV6FENIHFSRC63OM7MBGSB/

CVE-2026-15308:
https://mail.python.org/archives/list/security-announce@python.org/thread/F6453LWKSHKCTWFLCOURWPLETNUIW2Z5/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...927-Normalize-all-line-endings-CR-CRLF-an.patch |  71 ++++++++++
 ...981-Make-tarfile._Stream.seek-break-at-EO.patch |  76 +++++++++++
 ...987-Pass-filter_function-to-TarFile._extr.patch | 151 +++++++++++++++++++++
 ...030-Fix-quadratic-complexity-in-increment.patch | 123 +++++++++++++++++
 package/python3/python3.mk                         |  12 ++
 5 files changed, 433 insertions(+)

diff --git a/package/python3/0012-3.14-gh-143927-Normalize-all-line-endings-CR-CRLF-an.patch b/package/python3/0012-3.14-gh-143927-Normalize-all-line-endings-CR-CRLF-an.patch
new file mode 100644
index 0000000000..8c9b35a8d2
--- /dev/null
+++ b/package/python3/0012-3.14-gh-143927-Normalize-all-line-endings-CR-CRLF-an.patch
@@ -0,0 +1,71 @@
+From 71f2e02a52d47417a6fd69f456346cd8aa7aca98 Mon Sep 17 00:00:00 2001
+From: "Miss Islington (bot)"
+ <31488909+miss-islington@users.noreply.github.com>
+Date: Wed, 24 Jun 2026 11:46:33 +0200
+Subject: [PATCH] [3.14] gh-143927: Normalize all line endings (CR, CRLF, and
+ LF) in configparser (GH-143929) (GH-152003)
+
+gh-143927: Normalize all line endings (CR, CRLF, and LF) in configparser (GH-143929)
+(cherry picked from commit 5858e42c539dac8394636a6e9b30472b8994851f)
+
+Co-authored-by: Seth Larson <seth@python.org>
+
+Upstream: https://github.com/python/cpython/commit/71f2e02a52d47417a6fd69f456346cd8aa7aca98
+CVE: CVE-2026-0864
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ Lib/configparser.py                                   |  4 +++-
+ Lib/test/test_configparser.py                         | 11 +++++++++++
+ .../2026-01-16-11-58-19.gh-issue-143927.aviFeG.rst    |  2 ++
+ 3 files changed, 16 insertions(+), 1 deletion(-)
+ create mode 100644 Misc/NEWS.d/next/Security/2026-01-16-11-58-19.gh-issue-143927.aviFeG.rst
+
+diff --git a/Lib/configparser.py b/Lib/configparser.py
+index a53ac872764..3c452afe8ad 100644
+--- a/Lib/configparser.py
++++ b/Lib/configparser.py
+@@ -992,7 +992,9 @@ def _write_section(self, fp, section_name, section_items, delimiter, unnamed=Fal
+             value = self._interpolation.before_write(self, section_name, key,
+                                                      value)
+             if value is not None or not self._allow_no_value:
+-                value = delimiter + str(value).replace('\n', '\n\t')
++                # Convert all possible line-endings into '\n\t'
++                value = (delimiter + str(value).replace('\r\n', '\n')
++                         .replace('\r', '\n').replace('\n', '\n\t'))
+             else:
+                 value = ""
+             fp.write("{}{}\n".format(key, value))
+diff --git a/Lib/test/test_configparser.py b/Lib/test/test_configparser.py
+index 8d8dd2a2bf2..4783943f71a 100644
+--- a/Lib/test/test_configparser.py
++++ b/Lib/test/test_configparser.py
+@@ -526,6 +526,17 @@ def test_default_case_sensitivity(self):
+             cf.get(self.default_section, "Foo"), "Bar",
+             "could not locate option, expecting case-insensitive defaults")
+ 
++    def test_crlf_normalization(self):
++        cf = self.newconfig({"key1": "a\nb","key2": "a\rb", "key3": "a\r\nb", "key4": "a\r\nb"})
++        buf = io.StringIO()
++        cf.write(buf)
++        cf_str = buf.getvalue()
++        self.assertNotIn("\r", cf_str)
++        self.assertNotIn("\r\n", cf_str)
++        self.assertEqual(cf_str.count("\n"), 10)
++        self.assertEqual(cf_str.count("\n\t"), 4)
++        self.assertTrue(cf_str.endswith("\n\n"))
++
+     def test_parse_errors(self):
+         cf = self.newconfig()
+         self.parse_error(cf, configparser.ParsingError,
+diff --git a/Misc/NEWS.d/next/Security/2026-01-16-11-58-19.gh-issue-143927.aviFeG.rst b/Misc/NEWS.d/next/Security/2026-01-16-11-58-19.gh-issue-143927.aviFeG.rst
+new file mode 100644
+index 00000000000..ca554997e5c
+--- /dev/null
++++ b/Misc/NEWS.d/next/Security/2026-01-16-11-58-19.gh-issue-143927.aviFeG.rst
+@@ -0,0 +1,2 @@
++Normalize all line endings (CR, CRLF, and LF) to LF+TAB when writing
++multi-line configparser values.
+-- 
+2.47.3
+
diff --git a/package/python3/0013-3.14-gh-151981-Make-tarfile._Stream.seek-break-at-EO.patch b/package/python3/0013-3.14-gh-151981-Make-tarfile._Stream.seek-break-at-EO.patch
new file mode 100644
index 0000000000..7db9439639
--- /dev/null
+++ b/package/python3/0013-3.14-gh-151981-Make-tarfile._Stream.seek-break-at-EO.patch
@@ -0,0 +1,76 @@
+From e86666c9dd256d52d0fbef6feb1ea4a51768fdec Mon Sep 17 00:00:00 2001
+From: "Miss Islington (bot)"
+ <31488909+miss-islington@users.noreply.github.com>
+Date: Tue, 23 Jun 2026 15:46:18 +0200
+Subject: [PATCH] [3.14] gh-151981: Make tarfile._Stream.seek break at EOF
+ (GH-151982) (#151992)
+
+(cherry picked from commit f50bf13566189c8d0ce5a814f33eff3d89951896)
+
+Co-authored-by: Petr Viktorin <encukou@gmail.com>
+Co-authored-by: Stan Ulbrych <stan@python.org>
+
+Upstream: https://github.com/python/cpython/commit/e86666c9dd256d52d0fbef6feb1ea4a51768fdec
+CVE: CVE-2026-11972
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ Lib/tarfile.py                                   |  4 +++-
+ Lib/test/test_tarfile.py                         | 16 ++++++++++++++++
+ ...026-06-23-13-28-16.gh-issue-151981.xBHEcU.rst |  2 ++
+ 3 files changed, 21 insertions(+), 1 deletion(-)
+ create mode 100644 Misc/NEWS.d/next/Security/2026-06-23-13-28-16.gh-issue-151981.xBHEcU.rst
+
+diff --git a/Lib/tarfile.py b/Lib/tarfile.py
+index e6734db24f6..39b1cd6514c 100644
+--- a/Lib/tarfile.py
++++ b/Lib/tarfile.py
+@@ -524,7 +524,9 @@ def seek(self, pos=0):
+         if pos - self.pos >= 0:
+             blocks, remainder = divmod(pos - self.pos, self.bufsize)
+             for i in range(blocks):
+-                self.read(self.bufsize)
++                data = self.read(self.bufsize)
++                if not data:
++                    break
+             self.read(remainder)
+         else:
+             raise StreamError("seeking backwards is not allowed")
+diff --git a/Lib/test/test_tarfile.py b/Lib/test/test_tarfile.py
+index d974c7d46ec..8503024a690 100644
+--- a/Lib/test/test_tarfile.py
++++ b/Lib/test/test_tarfile.py
+@@ -4762,6 +4762,22 @@ def valueerror_filter(tarinfo, path):
+         with self.check_context(arc.open(errorlevel='boo!'), filtererror_filter):
+             self.expect_exception(TypeError)  # errorlevel is not int
+ 
++    @support.subTests('format', [tarfile.GNU_FORMAT, tarfile.PAX_FORMAT])
++    def test_getmembers_big_size(self, format):
++        # gh-151981: A loop in seek() for streaming files tried to read the
++        # declared number of blocks even at EOF
++        tinfo = tarfile.TarInfo("huge-file")
++        tinfo.size = 1 << 64
++        bio = io.BytesIO()
++        # Write header without data
++        bio.write(tinfo.tobuf(format))
++
++        # Reset & try to get contents
++        bio.seek(0)
++        with tarfile.open(fileobj=bio, mode="r|") as tar:
++            with self.assertRaises(tarfile.ReadError):
++                tar.getmembers()
++
+ 
+ class OverwriteTests(archiver_tests.OverwriteTests, unittest.TestCase):
+     testdir = os.path.join(TEMPDIR, "testoverwrite")
+diff --git a/Misc/NEWS.d/next/Security/2026-06-23-13-28-16.gh-issue-151981.xBHEcU.rst b/Misc/NEWS.d/next/Security/2026-06-23-13-28-16.gh-issue-151981.xBHEcU.rst
+new file mode 100644
+index 00000000000..2123ab8e081
+--- /dev/null
++++ b/Misc/NEWS.d/next/Security/2026-06-23-13-28-16.gh-issue-151981.xBHEcU.rst
+@@ -0,0 +1,2 @@
++In :mod:`tarfile`, seeking a stream now stops when end of the stream is
++reached.
+-- 
+2.47.3
+
diff --git a/package/python3/0014-3.14-gh-151987-Pass-filter_function-to-TarFile._extr.patch b/package/python3/0014-3.14-gh-151987-Pass-filter_function-to-TarFile._extr.patch
new file mode 100644
index 0000000000..3b38594c75
--- /dev/null
+++ b/package/python3/0014-3.14-gh-151987-Pass-filter_function-to-TarFile._extr.patch
@@ -0,0 +1,151 @@
+From 5e0ef3f1afe892e4f64eb83368db57ac4c40cba0 Mon Sep 17 00:00:00 2001
+From: "Miss Islington (bot)"
+ <31488909+miss-islington@users.noreply.github.com>
+Date: Mon, 29 Jun 2026 21:11:22 +0200
+Subject: [PATCH] [3.14] gh-151987: Pass filter_function to
+ `TarFile._extract_one()` during `.extract()` (GH-151988) (#152609)
+
+(cherry picked from commit 7ccdbaba2c54250a70d7f25632152df7655a5e0a)
+
+Co-authored-by: Petr Viktorin <encukou@gmail.com>
+Co-authored-by: Seth Michael Larson <seth@python.org>
+
+Upstream: https://github.com/python/cpython/commit/5e0ef3f1afe892e4f64eb83368db57ac4c40cba0
+CVE: CVE-2026-4360
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ Lib/tarfile.py                                |  3 +-
+ Lib/test/test_tarfile.py                      | 92 +++++++++++++++++++
+ ...-06-23-14-19-30.gh-issue-151987.8mNIMf.rst |  2 +
+ 3 files changed, 96 insertions(+), 1 deletion(-)
+ create mode 100644 Misc/NEWS.d/next/Security/2026-06-23-14-19-30.gh-issue-151987.8mNIMf.rst
+
+diff --git a/Lib/tarfile.py b/Lib/tarfile.py
+index cb09e307c46..d3c48999700 100644
+--- a/Lib/tarfile.py
++++ b/Lib/tarfile.py
+@@ -2538,7 +2538,8 @@ def extract(self, member, path="", set_attrs=True, *, numeric_owner=False,
+         tarinfo, unfiltered = self._get_extract_tarinfo(
+             member, filter_function, path)
+         if tarinfo is not None:
+-            self._extract_one(tarinfo, path, set_attrs, numeric_owner)
++            self._extract_one(tarinfo, path, set_attrs, numeric_owner,
++                              filter_function=filter_function)
+ 
+     def _get_extract_tarinfo(self, member, filter_function, path):
+         """Get (filtered, unfiltered) TarInfos from *member*
+diff --git a/Lib/test/test_tarfile.py b/Lib/test/test_tarfile.py
+index 804c3e6d809..f3b61d9fbad 100644
+--- a/Lib/test/test_tarfile.py
++++ b/Lib/test/test_tarfile.py
+@@ -4470,6 +4470,98 @@ def test_chmod_outside_dir(self):
+                     st_mode = cc.outerdir.stat().st_mode
+                     self.assertNotEqual(st_mode & 0o777, 0o777)
+ 
++    @symlink_test
++    @unittest.skipUnless(hasattr(os, 'chown'), "missing os.chown")
++    @unittest.skipUnless(hasattr(os, 'lchown'), "missing os.lchown")
++    @unittest.skipUnless(hasattr(os, 'geteuid'), "missing os.geteuid")
++    @support.subTests('link_type', (tarfile.SYMTYPE, tarfile.LNKTYPE))
++    def test_chown_links_on_extract(self, link_type):
++        with ArchiveMaker() as arc:
++            arc.add("test.txt",
++                    uid=1337, gid=1337, uname="", gname="", mode='-rwxr-xr-x')
++            arc.add("link",
++                    type=link_type,
++                    linkname='test.txt',
++                    uid=1337, gid=1337, uname="", gname="", mode='-rwxr-xr-x')
++
++        with (
++            os_helper.temp_dir() as tmpdir,
++            arc.open() as tar,
++            unittest.mock.patch("os.chown") as mock_chown,
++            unittest.mock.patch("os.lchown") as mock_lchown,
++            unittest.mock.patch("os.geteuid") as mock_geteuid,
++        ):
++            # Set UID to 0 so chown() is attempted.
++            mock_geteuid.return_value = 0
++            tar.extract("link", path=tmpdir, filter='data')
++            extract_path = os.path.join(tmpdir, "link")
++
++            if link_type == tarfile.SYMTYPE:
++                mock_chown.assert_not_called()
++                mock_lchown.assert_called_once_with(extract_path, -1, -1)
++            else:
++                mock_chown.assert_has_calls([
++                    unittest.mock.call(extract_path, -1, -1),
++                    unittest.mock.call(extract_path, -1, -1)
++                ])
++                mock_lchown.assert_not_called()
++
++    @symlink_test
++    @unittest.skipUnless(hasattr(os, 'chown'), "missing os.chown")
++    @unittest.skipUnless(hasattr(os, 'lchown'), "missing os.lchown")
++    @unittest.skipUnless(hasattr(os, 'geteuid'), "missing os.geteuid")
++    @support.subTests('link_type', (tarfile.SYMTYPE, tarfile.LNKTYPE))
++    def test_chown_links_on_extractall(self, link_type):
++        with ArchiveMaker() as arc:
++            arc.add("test.txt",
++                    uid=1337, gid=1337, uname="", gname="", mode='-rwxr-xr-x')
++            arc.add("link",
++                    type=link_type,
++                    linkname='test.txt',
++                    uid=1337, gid=1337, uname="", gname="", mode='-rwxr-xr-x')
++
++        with (
++            os_helper.temp_dir() as tmpdir,
++            arc.open() as tar,
++            unittest.mock.patch("os.chown") as mock_chown,
++            unittest.mock.patch("os.lchown") as mock_lchown,
++            unittest.mock.patch("os.geteuid") as mock_geteuid,
++        ):
++            # Set UID to 0 so chown() is attempted.
++            mock_geteuid.return_value = 0
++            tar.extractall(path=tmpdir, filter='data')
++            extract_link_path = os.path.join(tmpdir, "link")
++            extract_file_path = os.path.join(tmpdir, "test.txt")
++
++            if link_type == tarfile.SYMTYPE:
++                mock_chown.assert_called_once_with(extract_file_path, -1, -1)
++                mock_lchown.assert_called_once_with(extract_link_path, -1, -1)
++            else:
++                mock_chown.assert_has_calls([
++                    unittest.mock.call(extract_file_path, -1, -1),
++                    unittest.mock.call(extract_link_path, -1, -1)
++                ])
++                mock_lchown.assert_not_called()
++
++    def test_extract_filters_target(self):
++        # Test that when extract() falls back to extracting (rather than
++        # linking) a hardlink target, it filters the target.
++        with ArchiveMaker() as arc:
++            arc.add("target")
++            arc.add("link", hardlink_to="target")
++        def testing_filter(member, path):
++            if member.name == 'target':
++                # target: set read-only
++                return member.replace(mode=stat.S_IRUSR)
++            # link: don't overwrite the mode
++            return member.replace(mode=None)
++        tempdir = pathlib.Path(TEMPDIR) / 'extract'
++        with os_helper.temp_dir(tempdir), arc.open() as tar:
++            tar.extract("link", path=tempdir, filter=testing_filter)
++            path = tempdir / 'link'
++            if os_helper.can_chmod():
++                self.assertFalse(path.stat().st_mode & stat.S_IWUSR)
++
+     def test_link_fallback_normalizes(self):
+         # Make sure hardlink fallbacks work for non-normalized paths for all
+         # filters
+diff --git a/Misc/NEWS.d/next/Security/2026-06-23-14-19-30.gh-issue-151987.8mNIMf.rst b/Misc/NEWS.d/next/Security/2026-06-23-14-19-30.gh-issue-151987.8mNIMf.rst
+new file mode 100644
+index 00000000000..9eea7b32c4d
+--- /dev/null
++++ b/Misc/NEWS.d/next/Security/2026-06-23-14-19-30.gh-issue-151987.8mNIMf.rst
+@@ -0,0 +1,2 @@
++The :meth:`tarfile.TarFile.extract` method now applies the given filter when
++it extracts a link target from the archive as a fallback.
+-- 
+2.47.3
+
diff --git a/package/python3/0015-3.14-gh-153030-Fix-quadratic-complexity-in-increment.patch b/package/python3/0015-3.14-gh-153030-Fix-quadratic-complexity-in-increment.patch
new file mode 100644
index 0000000000..e9c3f40cc0
--- /dev/null
+++ b/package/python3/0015-3.14-gh-153030-Fix-quadratic-complexity-in-increment.patch
@@ -0,0 +1,123 @@
+From 07efb08123ba9367a7107325adb9d5626dca1ca9 Mon Sep 17 00:00:00 2001
+From: "Miss Islington (bot)"
+ <31488909+miss-islington@users.noreply.github.com>
+Date: Sat, 4 Jul 2026 20:08:05 +0200
+Subject: [PATCH] [3.14] gh-153030: Fix quadratic complexity in incremental
+ parsing in HTMLParser (GH-153031) (GH-153039)
+
+When an unterminated construct (e.g. a tag or comment) spanned many
+feed() calls, rescanning the growing buffer and concatenating new data
+onto it were both quadratic.  New data is now accumulated in a list and
+only joined and parsed once enough has piled up.
+(cherry picked from commit bcf98ddbc40ec9b3ee87da0124a5660b19b7e606)
+
+Co-authored-by: Serhiy Storchaka <storchaka@gmail.com>
+Co-authored-by: Claude Opus 4.8 <noreply@anthropic.com>
+
+Upstream: https://github.com/python/cpython/commit/07efb08123ba9367a7107325adb9d5626dca1ca9
+CVE: CVE-2026-15308
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ Lib/html/parser.py                            | 32 +++++++++++++++++--
+ Lib/test/test_htmlparser.py                   | 20 ++++++++++++
+ ...-07-04-17-00-00.gh-issue-153030.RovkP6.rst |  3 ++
+ 3 files changed, 53 insertions(+), 2 deletions(-)
+ create mode 100644 Misc/NEWS.d/next/Security/2026-07-04-17-00-00.gh-issue-153030.RovkP6.rst
+
+diff --git a/Lib/html/parser.py b/Lib/html/parser.py
+index 38ddf9ef442..fbe0d3665e0 100644
+--- a/Lib/html/parser.py
++++ b/Lib/html/parser.py
+@@ -157,6 +157,9 @@ def reset(self):
+         self.cdata_elem = None
+         self._support_cdata = True
+         self._escapable = True
++        self._pending = []
++        self._pending_len = 0
++        self._parse_threshold = 1
+         super().reset()
+ 
+     def feed(self, data):
+@@ -165,11 +168,36 @@ def feed(self, data):
+         Call this as often as you want, with as little or as much text
+         as you want (may include '\n').
+         """
+-        self.rawdata = self.rawdata + data
+-        self.goahead(0)
++        # Accumulate new data in a list and only join and parse it once
++        # enough has piled up.  Rescanning an unparsed buffer (e.g. an
++        # unterminated tag) and concatenating onto it on every call would
++        # both be quadratic in the input size.
++        self._pending_len += len(data)
++        if self._pending_len < self._parse_threshold:
++            self._pending.append(data)
++        else:
++            if not self._pending:
++                self.rawdata += data
++            else:
++                self._pending.append(data)
++                self.rawdata += ''.join(self._pending)
++                self._pending.clear()
++            self._pending_len = 0
++            n = len(self.rawdata)
++            self.goahead(0)
++            if len(self.rawdata) < n:
++                # Some data was parsed; resume on the next call.
++                self._parse_threshold = 1
++            else:
++                # Nothing was parsed; wait until the buffer doubles.
++                self._parse_threshold = len(self.rawdata)
+ 
+     def close(self):
+         """Handle any buffered data."""
++        if self._pending:
++            self.rawdata += ''.join(self._pending)
++            self._pending.clear()
++            self._pending_len = 0
+         self.goahead(1)
+ 
+     __starttag_text = None
+diff --git a/Lib/test/test_htmlparser.py b/Lib/test/test_htmlparser.py
+index 6b7624f1150..3fdaed4ff46 100644
+--- a/Lib/test/test_htmlparser.py
++++ b/Lib/test/test_htmlparser.py
+@@ -1041,6 +1041,26 @@ def check(source):
+         check("<![CDATA[" * 9 * n)
+         check("<!doctype" * 35 * n)
+ 
++    @support.requires_resource('cpu')
++    def test_incremental_no_quadratic_complexity(self):
++        # An unterminated construct fed in many small chunks used to take
++        # quadratic time, both to rescan and to concatenate the buffer.
++        # Now it takes a fraction of a second.
++        def check(prefix, chunk, suffix):
++            parser = html.parser.HTMLParser()
++            parser.feed(prefix)
++            for _ in range(200_000):
++                parser.feed(chunk)
++            parser.feed(suffix)
++            parser.close()
++        chunk = "a" * 64
++        check("<!--", chunk, "-->")       # comment
++        check("<?", chunk, ">")           # processing instruction
++        check("<!doctype ", chunk, ">")   # doctype
++        check("<![CDATA[", chunk, "]]>")  # CDATA section
++        check("<a href='", chunk, "'>")   # start tag
++        check("<script>", chunk, "</script>")  # RAWTEXT element
++
+ 
+ class AttributesTestCase(TestCaseBase):
+ 
+diff --git a/Misc/NEWS.d/next/Security/2026-07-04-17-00-00.gh-issue-153030.RovkP6.rst b/Misc/NEWS.d/next/Security/2026-07-04-17-00-00.gh-issue-153030.RovkP6.rst
+new file mode 100644
+index 00000000000..d1d60593f4b
+--- /dev/null
++++ b/Misc/NEWS.d/next/Security/2026-07-04-17-00-00.gh-issue-153030.RovkP6.rst
+@@ -0,0 +1,3 @@
++Fixed quadratic complexity in incremental parsing of long unterminated
++constructs (such as tags or comments) in :class:`html.parser.HTMLParser`,
++which could be exploited for a denial of service.
+-- 
+2.47.3
+
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index fabbdac384..9a47a1f306 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -16,6 +16,18 @@ PYTHON3_CPE_ID_PRODUCT = python
 # 0011-3.14-gh-151558-Fix-symlink-escape-via-tarfile-hardli.patch
 PYTHON3_IGNORE_CVES += CVE-2026-11940
 
+# 0012-3.14-gh-143927-Normalize-all-line-endings-CR-CRLF-an.patch
+PYTHON3_IGNORE_CVES += CVE-2026-0864
+
+# 0013-3.14-gh-151981-Make-tarfile._Stream.seek-break-at-EO.patch
+PYTHON3_IGNORE_CVES += CVE-2026-11972
+
+# 0014-3.14-gh-151987-Pass-filter_function-to-TarFile._extr.patch
+PYTHON3_IGNORE_CVES += CVE-2026-4360
+
+# 0015-3.14-gh-153030-Fix-quadratic-complexity-in-increment.patch
+PYTHON3_IGNORE_CVES += CVE-2026-15308
+
 # This host Python is installed in $(HOST_DIR), as it is needed when
 # cross-compiling third-party Python modules.
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
