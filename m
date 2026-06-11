Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3221DCD8CA8
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 11:23:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 088B16106E;
	Fri, 12 Jun 2026 11:23:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uoNobqEU4V2a; Fri, 12 Jun 2026 11:23:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B5F3960AFD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781263383;
	bh=mYBOrPOWi8zcapo6uaT5hoYlD4dbiCqZICO65hn89o8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=N2ffUULV+9bcY5JKokzhEhBGLATqvPx+u7cwvMlssIY7tlM91cHoeFzugUaBonFh9
	 6JveLylI6vibErPxdxNYmyYPz3AswfAy6Vg63SLgVSPGRQZhC8yLKLzlDKfjEPGssY
	 2pmgjYCKKyfhy7o+AueDMu/A/KucpCUzE5mwebMekzVu9cAYfQzVqTLDiV4g0YDWCS
	 KuoWcI5aXn8++xYB/NtGMD0dky55bW1DRbB1CWnpFRUpfzH31UjX542QxKQv59jV51
	 6chzPjKnfnmose2m6p6lFYeYpkxBj9NY4hkb/cKVvTnEDMUEAqrQzklxFGc3UJ9dZg
	 hjwe9vqbf0e6Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B5F3960AFD;
	Fri, 12 Jun 2026 11:23:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 47B5CF4
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:22:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2E972403B2
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:22:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WAt-TQxxQ9pD for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 11:22:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2816240655
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2816240655
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:22:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E8CE2880DE; Fri, 12 Jun 2026 11:22:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Jun 2026 11:46:35 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 9e387ea498fdacfdc98430c0a1406b0690f5adc3
X-Git-Newrev: fce79a74f14810c4bbc33125c12a6ef2ba81470e
X-Patchwork-Hint: ignore
Message-Id: <20260612112214.E8CE2880DE@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/python3: add
 patch for CVE-2026-7774
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/fce79a74f14810c4bbc33125c12a6ef2ba81470e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

This fixes the following vulnerability:

- CVE-2026-7774:
    tarfile.data_filter could be bypassed using crafted link entries,
    including symlinks with empty or directory-like names, to redirect
    later archive members outside the intended extraction directory. This
    allowed a malicious tar archive to cause tarfile.extractall() to write
    files outside the destination directory, subject to the permissions of
    the extracting process.
    https://www.cve.org/CVERecord?id=CVE-2026-7774

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...tarfile-data_filter-validate-written-link.patch | 178 +++++++++++++++++++++
 package/python3/python3.mk                         |   2 +
 2 files changed, 180 insertions(+)

diff --git a/package/python3/0014-tarfile-data_filter-validate-written-link.patch b/package/python3/0014-tarfile-data_filter-validate-written-link.patch
new file mode 100644
index 0000000000..b6337e9cbd
--- /dev/null
+++ b/package/python3/0014-tarfile-data_filter-validate-written-link.patch
@@ -0,0 +1,178 @@
+From 6df9892a802c124c4223e17c4a05ea7054166ac7 Mon Sep 17 00:00:00 2001
+From: Petr Viktorin <encukou@gmail.com>
+Date: Fri, 8 May 2026 14:16:06 +0200
+Subject: [PATCH] [3.12] gh-149486: tarfile.data_filter: validate written
+ link target (GH-149487)
+
+The data filter rewrote linknames with normpath() but ran the
+containment check against the un-normalised value, and computed a
+symlink's directory before stripping trailing slashes.  Both let a
+crafted archive create links pointing outside the destination.  Also
+reject link members that resolve to the destination directory itself,
+which could otherwise replace it with a symlink and redirect all
+subsequent members.
+
+(Patch by Greg; Petr's just reviewing & merging.)
+(cherry picked from commit 578411982c16f753f4893532510099ef665117da)
+
+Co-authored-by: Petr Viktorin <encukou@gmail.com>
+Co-authored-by: Gregory P. Smith <greg@krypto.org>
+
+Upstream: https://github.com/python/cpython/pull/149556
+CVE: CVE-2026-7774
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ Lib/tarfile.py                                | 16 ++--
+ Lib/test/test_tarfile.py                      | 87 ++++++++++++++++++-
+ ...-05-03-21-00-00.gh-issue-149486.tarflt.rst |  5 ++
+ 3 files changed, 99 insertions(+), 9 deletions(-)
+ create mode 100644 Misc/NEWS.d/next/Security/2026-05-03-21-00-00.gh-issue-149486.tarflt.rst
+
+diff --git a/Lib/tarfile.py b/Lib/tarfile.py
+index 59d3f6e5cce1650..fcb1040f2aefe29 100755
+--- a/Lib/tarfile.py
++++ b/Lib/tarfile.py
+@@ -816,16 +816,22 @@ def _get_filtered_attrs(member, dest_path, for_data=True):
+         if member.islnk() or member.issym():
+             if os.path.isabs(member.linkname):
+                 raise AbsoluteLinkError(member)
++            # A link member that resolves to the destination directory itself
++            # would replace it with a (sym)link, redirecting the destination
++            # for all subsequent members.
++            if target_path == dest_path:
++                raise OutsideDestinationError(member, target_path)
+             normalized = os.path.normpath(member.linkname)
+             if normalized != member.linkname:
+                 new_attrs['linkname'] = normalized
+             if member.issym():
+-                target_path = os.path.join(dest_path,
+-                                           os.path.dirname(name),
+-                                           member.linkname)
++                # The symlink is created at `name` with trailing separators
++                # stripped, so its target is relative to the directory
++                # containing that path.
++                link_dir = os.path.dirname(name.rstrip('/' + os.sep))
++                target_path = os.path.join(dest_path, link_dir, normalized)
+             else:
+-                target_path = os.path.join(dest_path,
+-                                           member.linkname)
++                target_path = os.path.join(dest_path, normalized)
+             target_path = os.path.realpath(target_path,
+                                            strict=os.path.ALLOW_MISSING)
+             if os.path.commonpath([target_path, dest_path]) != dest_path:
+diff --git a/Lib/test/test_tarfile.py b/Lib/test/test_tarfile.py
+index 759fa03ead70b04..fefae4b64c6182c 100644
+--- a/Lib/test/test_tarfile.py
++++ b/Lib/test/test_tarfile.py
+@@ -3701,10 +3701,19 @@ def test_parent_symlink(self):
+                     + "which is outside the destination")
+ 
+             with self.check_context(arc.open(), 'data'):
+-                self.expect_exception(
+-                    tarfile.LinkOutsideDestinationError,
+-                    """'parent' would link to ['"].*outerdir['"], """
+-                    + "which is outside the destination")
++                if self.dotdot_resolves_early:
++                    # 'current/../..' normalises to '..', which is rejected.
++                    self.expect_exception(
++                        tarfile.LinkOutsideDestinationError,
++                        """'parent' would link to ['"].*outerdir['"], """
++                        + "which is outside the destination")
++                else:
++                    # 'current/..' normalises to '.'; the rewritten link is
++                    # created and 'parent/evil' lands harmlessly inside the
++                    # destination.
++                    self.expect_file('current', symlink_to='.')
++                    self.expect_file('parent', symlink_to='.')
++                    self.expect_file('evil')
+ 
+         else:
+             # No symlink support. The symlinks are ignored.
+@@ -3978,6 +3987,76 @@ def test_sly_relative2(self):
+                     + """['"].*moo['"], which is outside the """
+                     + "destination")
+ 
++    @symlink_test
++    @os_helper.skip_unless_symlink
++    def test_normpath_realpath_mismatch(self):
++        # The link-target check must validate the value that will actually
++        # be written to disk (the normalised linkname), not the original.
++        # Here 'a' is a symlink to a deep nonexistent path, so realpath()
++        # of 'a/../../...' stays inside the destination while normpath()
++        # collapses 'a/..' lexically and escapes.
++        depth = len(self.destdir.parts) + 5
++        deep = '/'.join(f'p{i}' for i in range(depth))
++        sneaky = 'a/' + '../' * depth + 'flag'
++        for kind in 'symlink_to', 'hardlink_to':
++            with self.subTest(kind):
++                with ArchiveMaker() as arc:
++                    arc.add('a', symlink_to=deep)
++                    arc.add('escape', **{kind: sneaky})
++                with self.check_context(arc.open(), 'data'):
++                    self.expect_exception(
++                        tarfile.LinkOutsideDestinationError)
++
++    @symlink_test
++    @os_helper.skip_unless_symlink
++    def test_symlink_trailing_slash(self):
++        # A trailing slash on a symlink member's name must not cause the
++        # link target to be resolved relative to the wrong directory.
++        with ArchiveMaker() as arc:
++            t = tarfile.TarInfo('x/')
++            t.type = tarfile.SYMTYPE
++            t.linkname = '..'
++            arc.tar_w.addfile(t)
++            arc.add('x/escaped', content='hi')
++
++        with self.check_context(arc.open(), 'data'):
++            self.expect_exception(tarfile.LinkOutsideDestinationError)
++
++    @symlink_test
++    @os_helper.skip_unless_symlink
++    def test_link_at_destination(self):
++        # A link member whose name resolves to the destination directory
++        # itself must be rejected: otherwise the destination is replaced
++        # by a symlink and later members can be redirected through it.
++        for name in '', '.', './':
++            with ArchiveMaker() as arc:
++                t = tarfile.TarInfo(name)
++                t.type = tarfile.SYMTYPE
++                t.linkname = '.'
++                arc.tar_w.addfile(t)
++
++            with self.check_context(arc.open(), 'data'):
++                self.expect_exception(tarfile.OutsideDestinationError)
++
++    @symlink_test
++    @os_helper.skip_unless_symlink
++    def test_empty_name_symlink_chain(self):
++        # Regression test for a chain of empty-named symlinks that
++        # incrementally redirects the destination outwards.
++        with ArchiveMaker() as arc:
++            for name, target in [('', ''), ('a/', '..'),
++                                 ('', 'dummy'), ('', 'a'),
++                                 ('b/', '..'),
++                                 ('', 'dummy'), ('', 'a/b')]:
++                t = tarfile.TarInfo(name)
++                t.type = tarfile.SYMTYPE
++                t.linkname = target
++                arc.tar_w.addfile(t)
++            arc.add('escaped', content='hi')
++
++        with self.check_context(arc.open(), 'data'):
++            self.expect_exception(tarfile.FilterError)
++
+     @symlink_test
+     def test_deep_symlink(self):
+         # Test that symlinks and hardlinks inside a directory
+diff --git a/Misc/NEWS.d/next/Security/2026-05-03-21-00-00.gh-issue-149486.tarflt.rst b/Misc/NEWS.d/next/Security/2026-05-03-21-00-00.gh-issue-149486.tarflt.rst
+new file mode 100644
+index 000000000000000..7c69edb683cf80a
+--- /dev/null
++++ b/Misc/NEWS.d/next/Security/2026-05-03-21-00-00.gh-issue-149486.tarflt.rst
+@@ -0,0 +1,5 @@
++:func:`tarfile.data_filter` now validates link targets using the same
++normalised value that is written to disk, strips trailing separators from
++the member name when resolving a symlink's directory, and rejects link
++members that would replace the destination directory itself. This closes
++several path-traversal bypasses of the ``data`` extraction filter.
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 0881625ea3..96be4bd651 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -15,6 +15,8 @@ PYTHON3_CPE_ID_PRODUCT = python
 
 # 0013-Fix-O-n-2-canonical-ordering-in-unicodedata-normalize.patch
 PYTHON3_IGNORE_CVES += CVE-2026-3276
+# 0014-tarfile-data_filter-validate-written-link.patch
+PYTHON3_IGNORE_CVES += CVE-2026-7774
 
 # This host Python is installed in $(HOST_DIR), as it is needed when
 # cross-compiling third-party Python modules.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
