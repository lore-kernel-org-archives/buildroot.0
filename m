Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6368AC54FC6
	for <buildroot@archiver.kernel.org>; Sun,  1 Sep 2024 11:56:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2C3DB6066F;
	Sun,  1 Sep 2024 11:56:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7nfKXuc3vqWW; Sun,  1 Sep 2024 11:56:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF44E60765
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF44E60765;
	Sun,  1 Sep 2024 11:56:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 616621BF5A5
 for <buildroot@lists.busybox.net>; Sun,  1 Sep 2024 11:56:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4E5EC400EC
 for <buildroot@lists.busybox.net>; Sun,  1 Sep 2024 11:56:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h7grFkBHHqYH for <buildroot@lists.busybox.net>;
 Sun,  1 Sep 2024 11:56:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 18F35400C4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 18F35400C4
 for <buildroot@buildroot.org>; Sun,  1 Sep 2024 11:56:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0F334868D8; Sun,  1 Sep 2024 11:56:39 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 1 Sep 2024 13:56:23 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: 88f005a95cc8e54e228936cdf18fe7f86968ea93
X-Git-Newrev: 7a9446201951d4991347c9f53238ebec26d58cb5
X-Patchwork-Hint: ignore
Message-Id: <20240901115639.0F334868D8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] package/gdb: move GDB
 14.x patches to the right folder
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

commit: https://git.buildroot.net/buildroot/commit/?id=7a9446201951d4991347c9f53238ebec26d58cb5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

Commit bfefed17a9e5a421b3217685003d3b22c99de4ab ("package/gdb: bump
14.x series from 14.1 to 14.2"), which upgraded the GDB 14.x series
from 14.1 to 14.2 forgot to rename the directory containing the
patches, causing them to no longer be applied.

The patches still apply properly with no change, so renaming the
directory is sufficient.

  http://autobuild.buildroot.net/results/b8c6af95b244272220c63847e7cc929c9c58eee4/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 076f345accb811add37c96705ea1602a8a3b06a1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore                                    | 18 +++++++++---------
 ...ace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch |  0
 ...ce-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch |  0
 .../gdb/{14.1 => 14.2}/0003-use-asm-sgidefs.h.patch    |  0
 .../0004-gdbserver-fix-build-for-m68k.patch            |  0
 ...0005-nat-fork-inferior-include-linux-ptrace.h.patch |  0
 ...0006-Fix-getrandom-compile-for-uclibc-v1.0.35.patch |  0
 .../{14.1 => 14.2}/0007-fix-musl-build-on-riscv.patch  |  0
 .../0008-gdbserver-Makefile.in-fix-NLS-build.patch     |  0
 .../0009-gdb-Fix-native-build-on-xtensa.patch          |  0
 10 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 07cc5a5c11..47da52c4eb 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -662,15 +662,15 @@ package/gdb/13.2/0006-Fix-getrandom-compile-for-uclibc-v1.0.35.patch lib_patch.U
 package/gdb/13.2/0007-fix-musl-build-on-riscv.patch lib_patch.Upstream
 package/gdb/13.2/0008-gdbserver-Makefile.in-fix-NLS-build.patch lib_patch.Upstream
 package/gdb/13.2/0009-gdb-Fix-native-build-on-xtensa.patch lib_patch.Upstream
-package/gdb/14.1/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch lib_patch.Upstream
-package/gdb/14.1/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch lib_patch.Upstream
-package/gdb/14.1/0003-use-asm-sgidefs.h.patch lib_patch.Upstream
-package/gdb/14.1/0004-gdbserver-fix-build-for-m68k.patch lib_patch.Upstream
-package/gdb/14.1/0005-nat-fork-inferior-include-linux-ptrace.h.patch lib_patch.Upstream
-package/gdb/14.1/0006-Fix-getrandom-compile-for-uclibc-v1.0.35.patch lib_patch.Upstream
-package/gdb/14.1/0007-fix-musl-build-on-riscv.patch lib_patch.Upstream
-package/gdb/14.1/0008-gdbserver-Makefile.in-fix-NLS-build.patch lib_patch.Upstream
-package/gdb/14.1/0009-gdb-Fix-native-build-on-xtensa.patch lib_patch.Upstream
+package/gdb/14.2/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch lib_patch.Upstream
+package/gdb/14.2/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch lib_patch.Upstream
+package/gdb/14.2/0003-use-asm-sgidefs.h.patch lib_patch.Upstream
+package/gdb/14.2/0004-gdbserver-fix-build-for-m68k.patch lib_patch.Upstream
+package/gdb/14.2/0005-nat-fork-inferior-include-linux-ptrace.h.patch lib_patch.Upstream
+package/gdb/14.2/0006-Fix-getrandom-compile-for-uclibc-v1.0.35.patch lib_patch.Upstream
+package/gdb/14.2/0007-fix-musl-build-on-riscv.patch lib_patch.Upstream
+package/gdb/14.2/0008-gdbserver-Makefile.in-fix-NLS-build.patch lib_patch.Upstream
+package/gdb/14.2/0009-gdb-Fix-native-build-on-xtensa.patch lib_patch.Upstream
 package/gengetopt/0001-configure.ac-add-disable-doc-option.patch lib_patch.Upstream
 package/genpart/0001-fix-return-code.patch lib_patch.Upstream
 package/genromfs/0001-build-system.patch lib_patch.Sob lib_patch.Upstream
diff --git a/package/gdb/14.1/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch b/package/gdb/14.2/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
similarity index 100%
rename from package/gdb/14.1/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
rename to package/gdb/14.2/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch
diff --git a/package/gdb/14.1/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch b/package/gdb/14.2/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch
similarity index 100%
rename from package/gdb/14.1/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch
rename to package/gdb/14.2/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch
diff --git a/package/gdb/14.1/0003-use-asm-sgidefs.h.patch b/package/gdb/14.2/0003-use-asm-sgidefs.h.patch
similarity index 100%
rename from package/gdb/14.1/0003-use-asm-sgidefs.h.patch
rename to package/gdb/14.2/0003-use-asm-sgidefs.h.patch
diff --git a/package/gdb/14.1/0004-gdbserver-fix-build-for-m68k.patch b/package/gdb/14.2/0004-gdbserver-fix-build-for-m68k.patch
similarity index 100%
rename from package/gdb/14.1/0004-gdbserver-fix-build-for-m68k.patch
rename to package/gdb/14.2/0004-gdbserver-fix-build-for-m68k.patch
diff --git a/package/gdb/14.1/0005-nat-fork-inferior-include-linux-ptrace.h.patch b/package/gdb/14.2/0005-nat-fork-inferior-include-linux-ptrace.h.patch
similarity index 100%
rename from package/gdb/14.1/0005-nat-fork-inferior-include-linux-ptrace.h.patch
rename to package/gdb/14.2/0005-nat-fork-inferior-include-linux-ptrace.h.patch
diff --git a/package/gdb/14.1/0006-Fix-getrandom-compile-for-uclibc-v1.0.35.patch b/package/gdb/14.2/0006-Fix-getrandom-compile-for-uclibc-v1.0.35.patch
similarity index 100%
rename from package/gdb/14.1/0006-Fix-getrandom-compile-for-uclibc-v1.0.35.patch
rename to package/gdb/14.2/0006-Fix-getrandom-compile-for-uclibc-v1.0.35.patch
diff --git a/package/gdb/14.1/0007-fix-musl-build-on-riscv.patch b/package/gdb/14.2/0007-fix-musl-build-on-riscv.patch
similarity index 100%
rename from package/gdb/14.1/0007-fix-musl-build-on-riscv.patch
rename to package/gdb/14.2/0007-fix-musl-build-on-riscv.patch
diff --git a/package/gdb/14.1/0008-gdbserver-Makefile.in-fix-NLS-build.patch b/package/gdb/14.2/0008-gdbserver-Makefile.in-fix-NLS-build.patch
similarity index 100%
rename from package/gdb/14.1/0008-gdbserver-Makefile.in-fix-NLS-build.patch
rename to package/gdb/14.2/0008-gdbserver-Makefile.in-fix-NLS-build.patch
diff --git a/package/gdb/14.1/0009-gdb-Fix-native-build-on-xtensa.patch b/package/gdb/14.2/0009-gdb-Fix-native-build-on-xtensa.patch
similarity index 100%
rename from package/gdb/14.1/0009-gdb-Fix-native-build-on-xtensa.patch
rename to package/gdb/14.2/0009-gdb-Fix-native-build-on-xtensa.patch
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
