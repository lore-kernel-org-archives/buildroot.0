Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27C6FC44500
	for <buildroot@archiver.kernel.org>; Fri,  3 Jul 2026 14:27:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC0044116E;
	Fri,  3 Jul 2026 14:27:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sDoaqiQzRHDT; Fri,  3 Jul 2026 14:26:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5CBC441165
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783088818;
	bh=TkuV7ozkKHVWJNQwYHXO1LMdeUbln+M+qSmMfFcPKW0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=k9Mkm3lVHeP9pP+ytFmkK+Lj96UxIh51Ht0UZwQ1iowjrRXfDYUTx6RbPH6pZaZg6
	 xf087bSyTyDlIUoyThBmUwtk3fqEdAjMjKnGA8gLYxMaweApoS6WikJWNy29EYnqrB
	 Db/HQ5199QLYLstDqKaAS/1pRT7m9SyzwSBxct+dYF4aNfySW/3ZiStspI1IcgFnKK
	 Va26AXzHSDHyXMSmxFvbe8FBN/hUdjaCU+ZNygpYgXbd81QFXp0fwDaTAp+v/NN33S
	 zXz6ltzpOHWgKgR8MMkTphPL2WW4YcJ/g+SLgAsVhnDMtO8/8Cg3JCLe5fFoDJx7zL
	 Vh4/lPBzwfmQQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5CBC441165;
	Fri,  3 Jul 2026 14:26:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C7ED079E5
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:26:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C57CC60648
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:26:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t6mvO6qpGqey for <buildroot@buildroot.org>;
 Fri,  3 Jul 2026 14:26:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7316A60A55
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7316A60A55
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:26:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 05F77883A2; Fri,  3 Jul 2026 14:26:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 2 Jul 2026 21:29:09 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 18b68d8442f2ed3050599b3dc616e0dd8a4dabf6
X-Git-Newrev: 30b10fd08fca6e4b8311386570d683cb28cea4b7
X-Patchwork-Hint: ignore
Message-Id: <20260703142615.05F77883A2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/python3: add
 patch for CVE-2026-11940
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
Content-Type: multipart/mixed; boundary="===============1721289635693658709=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1721289635693658709==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/30b10fd08fca6e4b8311386570d683cb28cea4b7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

This fixes the following vulnerability:
- CVE-2026-11940:
    tarfile.extractall() with the 'data' or 'tar'  filter could be
    bypassed by a crafted archive where a hardlink  references a symlink
    stored at a deeper name than the hardlink itself.   The extraction
    fallback validated the symlink at it's archived location  but
    recreated it at the hardlink's shallower path, letting a relative
    target the filter judged contained escape the destination directory. 
    This allowed a malicious tar archive to create a symlink pointing
    outside the destination, enabling out-of-destination file reads or
    writes. This was an incomplete fix of CVE-2025-4330.
    https://www.cve.org/CVERecord?id=CVE-2026-11940

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
(cherry picked from commit 1a0164ac812d2c3ffe720115ae6c1cfd87d7c87b)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...-via-tarfile-hardlink-extraction-fallback.patch | 77 ++++++++++++++++++++++
 package/python3/python3.mk                         |  2 +
 2 files changed, 79 insertions(+)

diff --git a/package/python3/0017-Fix-symlink-escape-via-tarfile-hardlink-extraction-fallback.patch b/package/python3/0017-Fix-symlink-escape-via-tarfile-hardlink-extraction-fallback.patch
new file mode 100644
index 0000000000..d5ec1626bf
--- /dev/null
+++ b/package/python3/0017-Fix-symlink-escape-via-tarfile-hardlink-extraction-fallback.patch
@@ -0,0 +1,77 @@
+From d0ba16dce6df2f68e8968699d5c247eddeef9960 Mon Sep 17 00:00:00 2001
+From: Stan Ulbrych <stan@python.org>
+Date: Tue, 23 Jun 2026 14:31:38 +0100
+Subject: [PATCH] gh-151558: Fix symlink escape via `tarfile`
+ hardlink-extraction fallback (GH-151559) (cherry picked from commit
+ 27dd970bf6b17ebca7c8ed486a40ab043ed7af8f)
+
+Co-authored-by: Stan Ulbrych <stan@python.org>
+
+Upstream: https://github.com/python/cpython/pull/152000
+CVE: CVE-2026-11940
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ Lib/tarfile.py                                |  3 +++
+ Lib/test/test_tarfile.py                      | 24 +++++++++++++++++++
+ ...-06-10-13-08-19.gh-issue-151558.mL74i2.rst |  3 +++
+ 3 files changed, 30 insertions(+)
+ create mode 100644 Misc/NEWS.d/next/Security/2026-06-10-13-08-19.gh-issue-151558.mL74i2.rst
+
+diff --git a/Lib/tarfile.py b/Lib/tarfile.py
+index 461ec16dcd8592..73e9ece4153170 100755
+--- a/Lib/tarfile.py
++++ b/Lib/tarfile.py
+@@ -2677,6 +2677,9 @@ def makelink_with_filter(self, tarinfo, targetpath,
+                     "makelink_with_filter: if filter_function is not None, "
+                     + "extraction_root must also not be None")
+             try:
++                filter_function(
++                    unfiltered.replace(name=tarinfo.name, deep=False),
++                    extraction_root)
+                 filtered = filter_function(unfiltered, extraction_root)
+             except _FILTER_ERRORS as cause:
+                 raise LinkFallbackError(tarinfo, unfiltered.name) from cause
+diff --git a/Lib/test/test_tarfile.py b/Lib/test/test_tarfile.py
+index 9a4c5a301b30d0..902538d2262ceb 100644
+--- a/Lib/test/test_tarfile.py
++++ b/Lib/test/test_tarfile.py
+@@ -4182,6 +4182,30 @@ def test_sneaky_hardlink_fallback(self):
+                     self.expect_file("boom", symlink_to='../../link_here')
+                     self.expect_file("c", symlink_to='b')
+ 
++    @symlink_test
++    def test_sneaky_hardlink_fallback_deep(self):
++        # (CVE-2026-11940)
++        with ArchiveMaker() as arc:
++            arc.add("a/b/s", symlink_to=os.path.join("..", "escape"))
++            arc.add("s", hardlink_to=os.path.join("a", "b", "s"))
++
++        with self.check_context(arc.open(), 'data'):
++            e = self.expect_exception(
++                tarfile.LinkFallbackError,
++                "link 's' would be extracted as a copy of "
++                + "'a/b/s', which was rejected")
++            self.assertIsInstance(e.__cause__,
++                                  tarfile.LinkOutsideDestinationError)
++
++        for filter in 'tar', 'fully_trusted':
++            with self.subTest(filter), self.check_context(arc.open(), filter):
++                if not os_helper.can_symlink():
++                    self.expect_file("a/")
++                    self.expect_file("a/b/")
++                else:
++                    self.expect_file("a/b/s", symlink_to=os.path.join('..', 'escape'))
++                    self.expect_file("s", symlink_to=os.path.join('..', 'escape'))
++
+     @symlink_test
+     def test_exfiltration_via_symlink(self):
+         # (CVE-2025-4138)
+diff --git a/Misc/NEWS.d/next/Security/2026-06-10-13-08-19.gh-issue-151558.mL74i2.rst b/Misc/NEWS.d/next/Security/2026-06-10-13-08-19.gh-issue-151558.mL74i2.rst
+new file mode 100644
+index 00000000000000..74459d5680e21a
+--- /dev/null
++++ b/Misc/NEWS.d/next/Security/2026-06-10-13-08-19.gh-issue-151558.mL74i2.rst
+@@ -0,0 +1,3 @@
++Fixed an vulnerability in the :mod:`tarfile` ``data`` and ``tar`` extraction
++filters where crafted archives could create a symlink pointing outside the
++destination directory. This was a bypass of :cve:`2025-4330`.
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 1c181f0d33..4fd16b4204 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -21,6 +21,8 @@ PYTHON3_IGNORE_CVES += CVE-2026-7774
 PYTHON3_IGNORE_CVES += CVE-2026-8328
 # 0016-prevent-bz2-decompressor-reuse-after-errors.patch
 PYTHON3_IGNORE_CVES += CVE-2026-9669
+# 0017-Fix-symlink-escape-via-tarfile-hardlink-extraction-fallback.patch
+PYTHON3_IGNORE_CVES += CVE-2026-11940
 
 # This host Python is installed in $(HOST_DIR), as it is needed when
 # cross-compiling third-party Python modules.

--===============1721289635693658709==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1721289635693658709==--
