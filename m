Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 659C4D2F32D
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:36:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 255C282C7D;
	Tue, 13 Jan 2026 19:36:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R49hq0sM28yn; Tue, 13 Jan 2026 19:36:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA9DF83578
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333011;
	bh=Gcp3K8e+Fdbo+hZF0Ag/2M1nJvoUWLImN7jCRO5h0qs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=THNMVpcWPKyLLSEM2EK1nit0Fp/jUeNydiXnT5Hgu7D4iEb3q4VsoKHwhlhA8GrPz
	 j/CthQUnpIRN6ejpA/NDAslN+EcvVGZYrSfGzyr3ZS98NgXxhhDsUwZyWPIlpQWAW5
	 gWm3Mjj+JIy9g0YwDlc40DFuyZCv7fpE+miPYiF5bfe+/uZxgcuugmJRT2vSNsqkae
	 lJuAoInXr6uj8Gt5J/e0XKhR/zVPZ7cAg80jsulMg9wQJTQwPfC/lY1wmXTIShnoYp
	 uT0GcUj9r2y2HMu8ck8+nlpo4lZ0OirhGHZA+5DKvPc0Zc61tDnR8scxmghtBFoMN6
	 CSEqlKDH43/+g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA9DF83578;
	Tue, 13 Jan 2026 19:36:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 073561C3
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 52AAD82C4D
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z0QvTGP_8ErT for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:36:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4FD2C82BBC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4FD2C82BBC
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4D007884BB; Tue, 13 Jan 2026 19:36:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Jan 2026 16:03:05 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: d23ec514a8da2a319537dca54b97a18cf0c7bc53
X-Git-Newrev: fe357abb84877b836f0fca129e83e55c14be2067
X-Patchwork-Hint: ignore
Message-Id: <20260113193617.4D007884BB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/patch: add CVE
 trailer in patches
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

commit: https://git.buildroot.net/buildroot/commit/?id=fe357abb84877b836f0fca129e83e55c14be2067
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Since Buildroot commit [1] the patches that fixes a security
vulnerability needs to reference the fixed vulnerability.

This patch adds the relevant information to the patches header as well
as the `Upstream` trailer.

[1] 1167d0ff3d docs/manual: mention CVE trailer

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 74b079d9e916062629148ba79374998762e1998a)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .checkpackageignore                                                 | 4 ----
 package/patch/0001-Fix-segfault-with-mangled-rename-patch.patch     | 4 ++--
 .../0003-Fix-arbitrary-command-execution-in-ed-style-patches-.patch | 4 ++--
 .../patch/0004-Invoke-ed-directly-instead-of-using-the-shell.patch  | 6 ++++--
 ...005-Don-t-follow-symlinks-unless--follow-symlinks-is-given.patch | 5 +++--
 5 files changed, 11 insertions(+), 12 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 55d54aa5be..abf8af59fd 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -865,11 +865,7 @@ package/opusfile/0001-Propagate-allocation-failure-from-ogg_sync_buffer.patch li
 package/owfs/S55owserver Shellcheck lib_sysv.Variables
 package/owfs/S60owfs Shellcheck lib_sysv.Variables
 package/owl-linux/0001-fix-for-linux-3.3.x.patch lib_patch.Upstream
-package/patch/0001-Fix-segfault-with-mangled-rename-patch.patch lib_patch.Upstream
 package/patch/0002-Allow-input-files-to-be-missing-for-ed-style-patches.patch lib_patch.Upstream
-package/patch/0003-Fix-arbitrary-command-execution-in-ed-style-patches-.patch lib_patch.Upstream
-package/patch/0004-Invoke-ed-directly-instead-of-using-the-shell.patch lib_patch.Upstream
-package/patch/0005-Don-t-follow-symlinks-unless--follow-symlinks-is-given.patch lib_patch.Upstream
 package/patchelf/0001-Add-option-to-make-the-rpath-relative-under-a-specif.patch lib_patch.Upstream
 package/paxtest/0001-genpaxtest-move-log-location.patch lib_patch.Upstream
 package/paxtest/0002-paxtest-page-alignment-ARM-and-NIOS2-arch.patch lib_patch.Upstream
diff --git a/package/patch/0001-Fix-segfault-with-mangled-rename-patch.patch b/package/patch/0001-Fix-segfault-with-mangled-rename-patch.patch
index 19a67573c4..1b8d954025 100644
--- a/package/patch/0001-Fix-segfault-with-mangled-rename-patch.patch
+++ b/package/patch/0001-Fix-segfault-with-mangled-rename-patch.patch
@@ -7,10 +7,10 @@ http://savannah.gnu.org/bugs/?53132
 * src/pch.c (intuit_diff_type): Ensure that two filenames are specified
 for renames and copies (fix the existing check).
 
+CVE: CVE-2018-6951
+Upstream: https://cgit.git.savannah.gnu.org/cgit/patch.git/commit/?id=f290f48a621867084884bfff87f8093c15195e6a
 Signed-off-by: Baruch Siach <baruch@tkos.co.il>
 ---
-Patch status: upstream commit f290f48a6218
-
  src/pch.c | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)
 
diff --git a/package/patch/0003-Fix-arbitrary-command-execution-in-ed-style-patches-.patch b/package/patch/0003-Fix-arbitrary-command-execution-in-ed-style-patches-.patch
index b44bdd0fac..18497c153b 100644
--- a/package/patch/0003-Fix-arbitrary-command-execution-in-ed-style-patches-.patch
+++ b/package/patch/0003-Fix-arbitrary-command-execution-in-ed-style-patches-.patch
@@ -10,11 +10,11 @@ instead of rejecting them and carrying on.
 * tests/ed-style: New test case.
 * tests/Makefile.am (TESTS): Add test case.
 
+CVE: CVE-2018-1000156
+Upstream: https://cgit.git.savannah.gnu.org/cgit/patch.git/commit/?id=123eaff0d5d1aebe128295959435b9ca5909c26d
 [baruch: drop test hunks to avoid autoreconf]
 Signed-off-by: Baruch Siach <baruch@tkos.co.il>
 ---
-Upstream status: commit 123eaff0d5d1
-
  src/pch.c         | 91 ++++++++++++++++++++++++++++++++++++++++---------------
  tests/Makefile.am |  1 +
  tests/ed-style    | 41 +++++++++++++++++++++++++
diff --git a/package/patch/0004-Invoke-ed-directly-instead-of-using-the-shell.patch b/package/patch/0004-Invoke-ed-directly-instead-of-using-the-shell.patch
index ae64d58b93..7ede9300e4 100644
--- a/package/patch/0004-Invoke-ed-directly-instead-of-using-the-shell.patch
+++ b/package/patch/0004-Invoke-ed-directly-instead-of-using-the-shell.patch
@@ -5,8 +5,10 @@ Subject: Invoke ed directly instead of using the shell
 
 * src/pch.c (do_ed_script): Invoke ed directly instead of using a shell
 command to avoid quoting vulnerabilities.
-[Retrieved from:
-https://git.savannah.gnu.org/cgit/patch.git/commit/?id=3fcd042d26d70856e826a42b5f93dc4854d80bf0]
+
+CVE: CVE-2018-20969
+CVE: CVE-2019-13638
+Upstream: https://git.savannah.gnu.org/cgit/patch.git/commit/?id=3fcd042d26d70856e826a42b5f93dc4854d80bf0
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
  src/pch.c | 6 ++----
diff --git a/package/patch/0005-Don-t-follow-symlinks-unless--follow-symlinks-is-given.patch b/package/patch/0005-Don-t-follow-symlinks-unless--follow-symlinks-is-given.patch
index e07ae0c670..c0e63081e2 100644
--- a/package/patch/0005-Don-t-follow-symlinks-unless--follow-symlinks-is-given.patch
+++ b/package/patch/0005-Don-t-follow-symlinks-unless--follow-symlinks-is-given.patch
@@ -9,8 +9,9 @@ the O_NOFOLLOW flag to avoid following symlinks.  So far, we were only doing
 that consistently for input files.
 * src/util.c (create_backup): When creating empty backup files, (re)create them
 with O_CREAT | O_EXCL to avoid following symlinks in that case as well.
-[Retrieved from:
-https://git.savannah.gnu.org/cgit/patch.git/commit/?id=dce4683cbbe107a95f1f0d45fabc304acfb5d71a]
+
+CVE: CVE-2019-13636
+Upstream: https://git.savannah.gnu.org/cgit/patch.git/commit/?id=dce4683cbbe107a95f1f0d45fabc304acfb5d71a
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
  src/inp.c  | 12 ++++++++++--
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
