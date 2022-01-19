Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFB1AC433EF
	for <buildroot@archiver.kernel.org>; Wed, 19 Jan 2022 21:46:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4BFB682977;
	Wed, 19 Jan 2022 21:46:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d_Mby1uACc5V; Wed, 19 Jan 2022 21:46:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A0A081C44;
	Wed, 19 Jan 2022 21:45:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 976C01BF3FC
 for <buildroot@lists.busybox.net>; Wed, 19 Jan 2022 21:45:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7C05B81C44
 for <buildroot@lists.busybox.net>; Wed, 19 Jan 2022 21:45:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tLMrZY1n9NE6 for <buildroot@lists.busybox.net>;
 Wed, 19 Jan 2022 21:45:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9CA3F816F5
 for <buildroot@buildroot.org>; Wed, 19 Jan 2022 21:45:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id BF8788351F; Wed, 19 Jan 2022 21:39:19 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 19 Jan 2022 22:45:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f6297befe176a2f33b8c598139f73d7e0b9f91c9
X-Git-Newrev: 6775e3e47689088589e0a2448b4033a1bd2853e5
X-Patchwork-Hint: ignore
Message-Id: <20220119213919.BF8788351F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/strace: bump version to 5.16
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

commit: https://git.buildroot.net/buildroot/commit/?id=6775e3e47689088589e0a2448b4033a1bd2853e5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- update license file hash for COPYING (copyright year update)

Changelog (from [1]):

  Noteworthy changes in strace 5.16 (2022-01-10)
  ==============================================

  * Improvements
    * Implemented --secontext=mismatch option to find mismatches in SELinux
      contexts.
    * Implemented decoding of futex_waitv syscall introduced in Linux 5.16.
    * Implemented decoding of BPF_LINK_GET_NEXT_ID and BPF_LINK_GET_FD_BY_ID bpf
      syscall commands.
    * Enhanced decoding of BPF_MAP_CREATE, BPF_PROG_TEST_RUN, and BPF_PROG_LOAD
      bpf syscall commands.
    * Enhanced decoding of BTRFS_IOC_FS_INFO ioctl command.
    * Updated lists of AUDIT_*, BPF_*, BTRFS_*, DEVCONF_*, FAN_*, ETH_P_*,
      IPV4_DEVCONF_*, KVM_*, NDA_*, SO_*, and V4L2_* constants.
    * Updated lists of ioctl commands from Linux 5.16.

  * Bug fixes
    * Fixed build for older Android.

[1] https://strace.io/files/5.16/

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/strace/strace.hash | 6 +++---
 package/strace/strace.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/strace/strace.hash b/package/strace/strace.hash
index ff89447bfd..30c90e8e39 100644
--- a/package/strace/strace.hash
+++ b/package/strace/strace.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking signature with RSA key 0xA8041FA839E16E36
-# https://strace.io/files/5.15/strace-5.15.tar.xz.asc
-sha256  ebcac22f297335294dc654425cbc3ce013343bece6da2699e3aec86aee8d72dc  strace-5.15.tar.xz
-sha256  f847d5ef26ad1151ca63bb88536b23a4cac5040c67917f3d5ee7ea1316e2b736  COPYING
+# https://strace.io/files/5.16/strace-5.16.tar.xz.asc
+sha256  dc7db230ff3e57c249830ba94acab2b862da1fcaac55417e9b85041a833ca285  strace-5.16.tar.xz
+sha256  d92f973d08c8466993efff1e500453add0c038c20b4d2cbce3297938a296aea9  COPYING
 sha256  7c379436436a562834aa7d2f5dcae1f80a25230fa74201046ca1fba4367d39aa  LGPL-2.1-or-later
diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index 4b70531aa7..c8c3590f6e 100644
--- a/package/strace/strace.mk
+++ b/package/strace/strace.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STRACE_VERSION = 5.15
+STRACE_VERSION = 5.16
 STRACE_SOURCE = strace-$(STRACE_VERSION).tar.xz
 STRACE_SITE = https://strace.io/files/$(STRACE_VERSION)
 STRACE_LICENSE = LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
