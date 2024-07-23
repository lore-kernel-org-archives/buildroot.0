Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3680C3DA63
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 15:01:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9378C404D5;
	Tue, 23 Jul 2024 15:01:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lYJaZtiwrLIp; Tue, 23 Jul 2024 15:00:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3646F40577
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3646F40577;
	Tue, 23 Jul 2024 15:00:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 688AD1BF969
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 15:00:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 55E66402F5
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 15:00:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K1bSlgRSgBPc for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 15:00:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F0F8E40015
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id F0F8E40015
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 15:00:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D5762873A7; Tue, 23 Jul 2024 15:00:48 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 23 Jul 2024 16:51:56 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 51f827e9303e23ba9b72cd7171576d4d67cd9712
X-Git-Newrev: f466b9305fe520b226f9b6bedef360f2d1cd7050
X-Patchwork-Hint: ignore
Message-Id: <20240723150048.D5762873A7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/exim: update
 patches to be applied with fuzz 0
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

commit: https://git.buildroot.net/buildroot/commit/?id=f466b9305fe520b226f9b6bedef360f2d1cd7050
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Commit 8f88a644ed "support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0" reduced the fuzz factor.

Due to this change, exim fails to build with output:

    Applying 0004-exim_lock-fix-lstat-related-build-errors.patch using patch:
    patching file src/exim_lock.c
    Hunk #1 FAILED at 13.
    Hunk #2 succeeded at 27 (offset 1 line).
    1 out of 2 hunks FAILED -- saving rejects to file src/exim_lock.c.rej

This commit rebases the package patches on the current package version
when needed.

Fixes:
http://autobuild.buildroot.net/results/ff27d5ebd7f24ac8cb236b83c67c2c75255e51c6/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Reviewed-by: Yann E. MORIN <yann.morin@orange.com>
Tested-by: Yann E. MORIN <yann.morin@orange.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 20973140c14d528d91ecea12ebac6428d78d3340)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/exim/0001-Build-buildconfig-for-the-host.patch            | 4 +++-
 .../exim/0002-Don-t-make-backup-copies-of-installed-files.patch   | 4 +++-
 .../exim/0003-Skip-version-check-and-symlink-installation.patch   | 8 ++++----
 package/exim/0004-exim_lock-fix-lstat-related-build-errors.patch  | 8 +++++---
 package/exim/0005-sieve-fix-build-errors.patch                    | 4 +++-
 5 files changed, 18 insertions(+), 10 deletions(-)

diff --git a/package/exim/0001-Build-buildconfig-for-the-host.patch b/package/exim/0001-Build-buildconfig-for-the-host.patch
index 87eb527974..e9da80765a 100644
--- a/package/exim/0001-Build-buildconfig-for-the-host.patch
+++ b/package/exim/0001-Build-buildconfig-for-the-host.patch
@@ -2,6 +2,8 @@ buildconfig is meant to be executed on the host, so it has to be compiled
 using $(HOSTCC), not $(CC).
 
 Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
+[Bernd: rebased for version 4.97.1]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  OS/Makefile-Base |    4 ++--
  1 files changed, 2 insertions(+), 2 deletions(-)
@@ -10,7 +12,7 @@ diff --git a/OS/Makefile-Base b/OS/Makefile-Base
 index 29a6ad3..420ba60 100644
 --- a/OS/Makefile-Base
 +++ b/OS/Makefile-Base
-@@ -114,8 +114,8 @@ allexim: config.h $(EXIM_MONITOR) exicyclog exinext exiwhat \
+@@ -258,8 +258,8 @@ allexim: config.h $(EXIM_MONITOR) exicyclog exinext exiwhat \
  
  # Targets for special-purpose configuration header builders
  buildconfig: buildconfig.c
diff --git a/package/exim/0002-Don-t-make-backup-copies-of-installed-files.patch b/package/exim/0002-Don-t-make-backup-copies-of-installed-files.patch
index 0cdaa744bc..3c115f8d02 100644
--- a/package/exim/0002-Don-t-make-backup-copies-of-installed-files.patch
+++ b/package/exim/0002-Don-t-make-backup-copies-of-installed-files.patch
@@ -5,6 +5,8 @@ This leads to useless duplicated files on the target, so disable this
 piece of code.
 
 Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
+[Bernd: rebased for version 4.97.1]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  scripts/exim_install |   18 +++++++++---------
  1 files changed, 9 insertions(+), 9 deletions(-)
@@ -13,7 +15,7 @@ diff --git a/scripts/exim_install b/scripts/exim_install
 index 616ab3c..e68e7d5 100755
 --- a/scripts/exim_install
 +++ b/scripts/exim_install
-@@ -344,15 +344,15 @@ while [ $# -gt 0 ]; do
+@@ -348,15 +348,15 @@ while [ $# -gt 0 ]; do
  
    else
      if ../scripts/newer ${name} ${BIN_DIRECTORY}/${name}; then
diff --git a/package/exim/0003-Skip-version-check-and-symlink-installation.patch b/package/exim/0003-Skip-version-check-and-symlink-installation.patch
index a342d6ed34..55166f108b 100644
--- a/package/exim/0003-Skip-version-check-and-symlink-installation.patch
+++ b/package/exim/0003-Skip-version-check-and-symlink-installation.patch
@@ -9,8 +9,8 @@ Inspired by:
 http://patch-tracker.debian.org/patch/series/view/exim4/4.76-2/35_install.dpatch
 
 Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
-(rebased against exim 4.89)
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+[Bernd: rebased for version 4.89 & 4.97.1]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  scripts/exim_install |    7 +++++--
  1 files changed, 5 insertions(+), 2 deletions(-)
@@ -19,7 +19,7 @@ diff --git a/scripts/exim_install b/scripts/exim_install
 index e68e7d5..487a4e1 100755
 --- a/scripts/exim_install
 +++ b/scripts/exim_install
-@@ -58,6 +58,8 @@
+@@ -61,6 +61,8 @@
    shift
  done
  
@@ -28,7 +28,7 @@ index e68e7d5..487a4e1 100755
  # Get the values of BIN_DIRECTORY, CONFIGURE_FILE, INFO_DIRECTORY, NO_SYMLINK,
  # SYSTEM_ALIASES_FILE, and EXE from the global Makefile (in the build
  # directory). EXE is empty except in the Cygwin environment. In each case, keep
-@@ -217,9 +219,7 @@
+@@ -220,9 +223,7 @@
    # The exim binary is handled specially
  
    if [ $name = exim${EXE} ]; then
diff --git a/package/exim/0004-exim_lock-fix-lstat-related-build-errors.patch b/package/exim/0004-exim_lock-fix-lstat-related-build-errors.patch
index a0a279fc43..616ada5026 100644
--- a/package/exim/0004-exim_lock-fix-lstat-related-build-errors.patch
+++ b/package/exim/0004-exim_lock-fix-lstat-related-build-errors.patch
@@ -22,6 +22,8 @@ Fixes:
 
 Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
 Upstream-status: https://bugs.exim.org/show_bug.cgi?id=2523
+[Bernd: rebased for version 4.97.1]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  src/exim_lock.c | 3 +++
  1 file changed, 3 insertions(+)
@@ -30,8 +32,8 @@ diff --git a/src/exim_lock.c b/src/exim_lock.c
 index 068216816054..cb140aff6436 100644
 --- a/src/exim_lock.c
 +++ b/src/exim_lock.c
-@@ -13,6 +13,8 @@ Argument: the name of the lock file
- Copyright (c) The Exim Maintainers 2016
+@@ -14,6 +14,8 @@ Copyright (c) The Exim Maintainers 2016 - 2021
+ SPDX-License-Identifier: GPL-2.0-or-later
  */
 
 +#define _XOPEN_SOURCE
@@ -39,7 +41,7 @@ index 068216816054..cb140aff6436 100644
  #include "os.h"
 
  #include <stdio.h>
-@@ -26,6 +28,7 @@ Copyright (c) The Exim Maintainers 2016
+@@ -27,6 +29,7 @@ Copyright (c) The Exim Maintainers 2016
  #include <unistd.h>
  #include <utime.h>
  #include <sys/utsname.h>
diff --git a/package/exim/0005-sieve-fix-build-errors.patch b/package/exim/0005-sieve-fix-build-errors.patch
index f4b95d50bc..20323c17cd 100644
--- a/package/exim/0005-sieve-fix-build-errors.patch
+++ b/package/exim/0005-sieve-fix-build-errors.patch
@@ -21,6 +21,8 @@ buildsystem.
 
 Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
 Upstream-status: https://bugs.exim.org/show_bug.cgi?id=2523
+[Bernd: rebased for version 4.97.1]
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
  src/sieve.c | 2 ++
  1 file changed, 2 insertions(+)
@@ -29,7 +31,7 @@ diff --git a/src/sieve.c b/src/sieve.c
 index 5e8d1e6f4776..9632f2d43810 100644
 --- a/src/sieve.c
 +++ b/src/sieve.c
-@@ -12,6 +12,8 @@
+@@ -14,6 +14,8 @@
 
  /* Sieve mail filter. */
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
