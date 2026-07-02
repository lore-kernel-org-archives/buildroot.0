Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F8C4C43602
	for <buildroot@archiver.kernel.org>; Fri,  3 Jul 2026 14:28:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1445640EF6;
	Fri,  3 Jul 2026 14:28:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0m3AkqnavIQF; Fri,  3 Jul 2026 14:28:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0EF5940FC6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783088911;
	bh=6+4UYVsnqeURecDkdBeW4u6lGGOer/YvplHKd503l4c=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HLFFm8n9ScdazaxwNzTLmOm+RZ67T73p25qUEJhwoy2md1Jy8paoT4ECRv4Ku84lE
	 zbCGLwpbpxz3W763hS4HcruRAXViMaLL1z3iAdZS/Z+sk88u0Cx24mK2sHNB/Ii3mk
	 o/HXNJzW6UlR/iNqqZQu9cUPS6lpFZ00uGQZnIdoej6zFfIza3H5dAb7UBMDAwnzS+
	 NPmGbZF84GZl+2ngPwcyQlNn4I0By+T9oL3v0qNu9x6UQaouD6gX4mvgZJMeJn/buo
	 ITbKLpQ//wwkPtPC6J3qBSGeGeKe7pzlMICdJQ9TVGMs2kkTCeD86x2s4tjcvP2KKK
	 RyJUcnMua63XQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0EF5940FC6;
	Fri,  3 Jul 2026 14:28:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A69747E
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:28:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E46BD411A0
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:28:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6BaGqXPKIQBt for <buildroot@buildroot.org>;
 Fri,  3 Jul 2026 14:28:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C9AD40EA8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1C9AD40EA8
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:28:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ADDEA883A3; Fri,  3 Jul 2026 14:27:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 2 Jul 2026 21:28:22 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: a2d659937bb3823c3fb928a1bc805f0de676bfc0
X-Git-Newrev: 6001e920feff54635b047117b6501eb14fabf309
X-Patchwork-Hint: ignore
Message-Id: <20260703142757.ADDEA883A3@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/python3: add
 upstream security patch for CVE-2026-11940
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6001e920feff54635b047117b6501eb14fabf309
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

https://seclists.org/oss-sec/2026/q2/1006
https://www.cve.org/CVERecord?id=CVE-2026-11940
https://github.com/python/cpython/pull/151559

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
(cherry picked from commit 1a0164ac812d2c3ffe720115ae6c1cfd87d7c87b)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...558-Fix-symlink-escape-via-tarfile-hardli.patch | 83 ++++++++++++++++++++++
 package/python3/python3.mk                         |  3 +
 2 files changed, 86 insertions(+)

diff --git a/package/python3/0011-3.14-gh-151558-Fix-symlink-escape-via-tarfile-hardli.patch b/package/python3/0011-3.14-gh-151558-Fix-symlink-escape-via-tarfile-hardli.patch
new file mode 100644
index 0000000000..d3454a7a6b
--- /dev/null
+++ b/package/python3/0011-3.14-gh-151558-Fix-symlink-escape-via-tarfile-hardli.patch
@@ -0,0 +1,83 @@
+From 79c06bd5c6afa3c440d50faf7ee1b147c8832b4c Mon Sep 17 00:00:00 2001
+From: "Miss Islington (bot)"
+ <31488909+miss-islington@users.noreply.github.com>
+Date: Tue, 23 Jun 2026 15:58:47 +0200
+Subject: [PATCH] [3.14] gh-151558: Fix symlink escape via `tarfile`
+ hardlink-extraction fallback (GH-151559)
+
+(cherry picked from commit 27dd970bf6b17ebca7c8ed486a40ab043ed7af8f)
+
+Co-authored-by: Stan Ulbrych <stan@python.org>
+
+Upstream: https://github.com/python/cpython/commit/79c06bd5c6afa3c440d50faf7ee1b147c8832b4c
+CVE: CVE-2026-11940
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ Lib/tarfile.py                                |  3 +++
+ Lib/test/test_tarfile.py                      | 24 +++++++++++++++++++
+ ...-06-10-13-08-19.gh-issue-151558.mL74i2.rst |  3 +++
+ 3 files changed, 30 insertions(+)
+ create mode 100644 Misc/NEWS.d/next/Security/2026-06-10-13-08-19.gh-issue-151558.mL74i2.rst
+
+diff --git a/Lib/tarfile.py b/Lib/tarfile.py
+index 39b1cd6514c..399f906efdf 100644
+--- a/Lib/tarfile.py
++++ b/Lib/tarfile.py
+@@ -2784,6 +2784,9 @@ def makelink_with_filter(self, tarinfo, targetpath,
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
+index 8503024a690..045377d620c 100644
+--- a/Lib/test/test_tarfile.py
++++ b/Lib/test/test_tarfile.py
+@@ -4344,6 +4344,30 @@ def test_sneaky_hardlink_fallback(self):
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
+index 00000000000..74459d5680e
+--- /dev/null
++++ b/Misc/NEWS.d/next/Security/2026-06-10-13-08-19.gh-issue-151558.mL74i2.rst
+@@ -0,0 +1,3 @@
++Fixed an vulnerability in the :mod:`tarfile` ``data`` and ``tar`` extraction
++filters where crafted archives could create a symlink pointing outside the
++destination directory. This was a bypass of :cve:`2025-4330`.
+-- 
+2.47.3
+
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index ff9afbb5a9..fabbdac384 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -13,6 +13,9 @@ PYTHON3_LICENSE_FILES = LICENSE
 PYTHON3_CPE_ID_VENDOR = python
 PYTHON3_CPE_ID_PRODUCT = python
 
+# 0011-3.14-gh-151558-Fix-symlink-escape-via-tarfile-hardli.patch
+PYTHON3_IGNORE_CVES += CVE-2026-11940
+
 # This host Python is installed in $(HOST_DIR), as it is needed when
 # cross-compiling third-party Python modules.
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
