Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33C1AC77B73
	for <buildroot@archiver.kernel.org>; Sat,  6 May 2023 16:17:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F54241F4C;
	Sat,  6 May 2023 16:17:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F54241F4C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uxS6ZXaDSs3e; Sat,  6 May 2023 16:17:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35B504177A;
	Sat,  6 May 2023 16:17:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35B504177A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 49C281BF36A
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 16:17:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 30A6C83EF3
 for <buildroot@lists.busybox.net>; Sat,  6 May 2023 16:17:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 30A6C83EF3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vjHZmq30QYjC for <buildroot@lists.busybox.net>;
 Sat,  6 May 2023 16:17:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 710F183EDC
 for <buildroot@buildroot.org>; Sat,  6 May 2023 16:17:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 710F183EDC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5E86485EC8; Sat,  6 May 2023 16:17:27 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 6 May 2023 18:15:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5d65570fac4d577bd3661ad892df80bc9601f4ae
X-Git-Newrev: e0ef6ddcf9231d367b3f4a0fb1c4cca40b3e6f2e
X-Patchwork-Hint: ignore
Message-Id: <20230506161727.5E86485EC8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] .checkpackageignore: regenerate list
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e0ef6ddcf9231d367b3f4a0fb1c4cca40b3e6f2e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Some patches were removed in recent version bumps:
  - 2d7cfd49ba  package/valgrind: bump version to 3.20.0
  - 4aef53575b  package/libgit2: bump version to 1.6.4
  - b0306d94b2  package/cpio: bump version to 2.14
  - f292d9b736  package/gocryptfs: bump version to 2.3.2

Update the ignore list accordingly.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .checkpackageignore | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index d1626326a8..9363e7f3bb 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -317,9 +317,6 @@ package/connman/0003-wispr-Update-portal-context-references.patch Upstream
 package/connman/S45connman Variables
 package/copas/0001-Do-not-load-coxpcall-for-LuaJIT.patch Upstream
 package/coremark-pro/coremark-pro.sh.in Shellcheck
-package/cpio/0001-Minor-fix.patch Upstream
-package/cpio/0002-Rewrite-dynamic-string-support.patch Upstream
-package/cpio/0003-Fix-previous-commit.patch Upstream
 package/cppdb/0001-mysql-library-suffix.patch Upstream
 package/cpulimit/0001-Fix-crash-and-compiler-warnings.patch Upstream
 package/cpulimit/0002-Remove-sys-sysctl.h-and-add-missing-libgen.h-include.patch Upstream
@@ -622,7 +619,6 @@ package/gob2/0001-dont-include-from-prefix.patch Upstream
 package/gobject-introspection/0001-disable-tests.patch Upstream
 package/gobject-introspection/0002-Add-rpath-links-to-ccompiler.patch Upstream
 package/gobject-introspection/0003-giscanner-ignore-error-return-codes-from-ldd-wrapper.patch Upstream
-package/gocryptfs/0001-go.mod-fix-jacobsa-crypto-build-on-riscv64.patch Upstream
 package/google-breakpad/gen-syms.sh Shellcheck
 package/gpm/0001-Added-musl-support-to-libgpm-and-the-daemon.patch Upstream
 package/gpm/0002-Install-unversioned-solibrary.patch Upstream
@@ -795,7 +791,6 @@ package/libfuse/0002-util-ulockmgr_server-c-conditionally-define-closefrom-fix-g
 package/libfuse3/0001-Fix-MS_LAZYTIME-not-defined-on-uclibc.patch Upstream
 package/libgcrypt/0001-configure.ac-add-an-option-to-disable-tests.patch Upstream
 package/libgdiplus/0001-Build-unit-tests-only-when-enable-unit-tests-is-pass.patch Upstream
-package/libgit2/0001-sysdir-Do-not-declare-win32-functions-on-non-win32-p.patch Upstream
 package/libglfw/0001-Wayland-Remove-extra-cmake-modules-dependency.patch Upstream
 package/libglfw/0002-src-CMakeLists.txt-allow-override-of-wayland-pkgdata.patch Upstream
 package/libgpgme/0001-Fix-build-without-threads.patch Upstream
@@ -1644,7 +1639,6 @@ package/vala/0001-dont-add-dirty-to-valac-version.patch Upstream
 package/vala/vala-wrapper Shellcheck
 package/valgrind/0001-workaround-SIGSEGV-on-PPC.patch Upstream
 package/valgrind/0002-Define-PTRACE_GETSIGINFO-on-PowerPC-when-not-availab.patch Upstream
-package/valgrind/0003-coregrind-fix-compilation-for-uclibc.patch Upstream
 package/vboot-utils/0001-Add-missing-definition-of-MTD_CHAR_MAJOR.patch Upstream
 package/vboot-utils/0002-Add-missing-header-include-for-ssize_t.patch Upstream
 package/vboot-utils/0003-Avoid-RSA-type-redefinition.patch Upstream
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
