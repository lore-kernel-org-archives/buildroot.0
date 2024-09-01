Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B064CA101E
	for <buildroot@archiver.kernel.org>; Sun,  1 Sep 2024 09:06:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 855146079D;
	Sun,  1 Sep 2024 09:06:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vjF4YHB8rqMm; Sun,  1 Sep 2024 09:06:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 82F3460772
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 82F3460772;
	Sun,  1 Sep 2024 09:06:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 091071BF4E2
 for <buildroot@lists.busybox.net>; Sun,  1 Sep 2024 09:06:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 37E498126B
 for <buildroot@lists.busybox.net>; Sun,  1 Sep 2024 09:06:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 56AmWTyUnLrp for <buildroot@lists.busybox.net>;
 Sun,  1 Sep 2024 09:06:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 303008126A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 303008126A
 for <buildroot@buildroot.org>; Sun,  1 Sep 2024 09:06:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1F17E868D0; Sun,  1 Sep 2024 09:06:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 1 Sep 2024 11:01:37 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 3cd0c938b5643a73f17849880cddfc3755ae0284
X-Git-Newrev: 74d098ed1b54cab9ebc47b62f2b146d4863b861c
X-Patchwork-Hint: ignore
Message-Id: <20240901090600.1F17E868D0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/gdb: move GDB
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

commit: https://git.buildroot.net/buildroot/commit/?id=74d098ed1b54cab9ebc47b62f2b146d4863b861c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

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
index 2582cf706a..15ef1ace68 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -443,15 +443,15 @@ package/gdb/13.2/0006-Fix-getrandom-compile-for-uclibc-v1.0.35.patch Upstream
 package/gdb/13.2/0007-fix-musl-build-on-riscv.patch Upstream
 package/gdb/13.2/0008-gdbserver-Makefile.in-fix-NLS-build.patch Upstream
 package/gdb/13.2/0009-gdb-Fix-native-build-on-xtensa.patch Upstream
-package/gdb/14.1/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch Upstream
-package/gdb/14.1/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch Upstream
-package/gdb/14.1/0003-use-asm-sgidefs.h.patch Upstream
-package/gdb/14.1/0004-gdbserver-fix-build-for-m68k.patch Upstream
-package/gdb/14.1/0005-nat-fork-inferior-include-linux-ptrace.h.patch Upstream
-package/gdb/14.1/0006-Fix-getrandom-compile-for-uclibc-v1.0.35.patch Upstream
-package/gdb/14.1/0007-fix-musl-build-on-riscv.patch Upstream
-package/gdb/14.1/0008-gdbserver-Makefile.in-fix-NLS-build.patch Upstream
-package/gdb/14.1/0009-gdb-Fix-native-build-on-xtensa.patch Upstream
+package/gdb/14.2/0001-ppc-ptrace-Define-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch Upstream
+package/gdb/14.2/0002-sh-ptrace-Define-pt_-dsp-regs-uapi_pt_-dsp-regs-on-G.patch Upstream
+package/gdb/14.2/0003-use-asm-sgidefs.h.patch Upstream
+package/gdb/14.2/0004-gdbserver-fix-build-for-m68k.patch Upstream
+package/gdb/14.2/0005-nat-fork-inferior-include-linux-ptrace.h.patch Upstream
+package/gdb/14.2/0006-Fix-getrandom-compile-for-uclibc-v1.0.35.patch Upstream
+package/gdb/14.2/0007-fix-musl-build-on-riscv.patch Upstream
+package/gdb/14.2/0008-gdbserver-Makefile.in-fix-NLS-build.patch Upstream
+package/gdb/14.2/0009-gdb-Fix-native-build-on-xtensa.patch Upstream
 package/gengetopt/0001-configure.ac-add-disable-doc-option.patch Upstream
 package/genpart/0001-fix-return-code.patch Upstream
 package/genromfs/0001-build-system.patch Sob Upstream
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
