Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CF47CD98F8
	for <buildroot@archiver.kernel.org>; Thu, 18 Jun 2026 20:50:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 76C786164F;
	Thu, 18 Jun 2026 20:50:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9etgmyU0sBSf; Thu, 18 Jun 2026 20:50:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D56F46164D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781815801;
	bh=bexAroGLvZhl3o46SY0I5tB6VDvTywU+mVk1pSLPiFw=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=K5sKl2EjfYJf4hHc03oznpwR/wDYPMyZdW1NTeS9Y3mYDcB4zPvLzsXvAWivSvZLW
	 tkbrqzXJpHJSVx0mWk5urm+cD8qLQ1uKBGPIjjt9QK+8l8ozL5DwNCi69//6i/TAGc
	 OVw3ydAuxI/r6y8r4tAuzEFguw2oTQPLqgmkICxDoiEUhLI51iHyEBj4itBTMdZdt3
	 RU/WhVYvTMan0u7EVeJ+JKiBe6OqwDxCHvUpspTyjDad8iFeL2kzMtRxgCBS4ZbUPO
	 InXaZMR00ajdTvEfgJLO7fYZgFKtq9/ZaXAz2bDesR92kX7OH4YvLOolKK5UxgKClR
	 TjM3L2oSfKEYA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D56F46164D;
	Thu, 18 Jun 2026 20:50:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 41581367
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 20:49:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 338A841535
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 20:49:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H_d2RqJHbCEx for <buildroot@buildroot.org>;
 Thu, 18 Jun 2026 20:49:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1AB4940E1B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1AB4940E1B
 for <buildroot@buildroot.org>; Thu, 18 Jun 2026 20:49:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D16A8814A3; Thu, 18 Jun 2026 20:49:33 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 18 Jun 2026 21:34:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 67449130e9fdd71a38ca26539dddfa8c882b1977
X-Git-Newrev: 40ce6355c9ff046a1821857c4e2ccccacfc24a4b
X-Patchwork-Hint: ignore
Message-Id: <20260618204933.D16A8814A3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/util-linux: security bump to 2.41.5
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/40ce6355c9ff046a1821857c4e2ccccacfc24a4b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Security fixes:

 CVE-2026-53613 - mount(8) TOCTOU race on target path.
   The SUID mount does not pin the mount target directory, allowing a
   race between path resolution and the actual mount syscall.  A local
   attacker can swap an ancestor directory component between these
   steps to redirect a mount to an arbitrary location.
   Reported-by: Xinyao Hu

 CVE-2026-53612 - mount(8) TOCTOU race on post-mount owner/mode change.
   The X-mount.owner, X-mount.group, and X-mount.mode options use
   path-based lchown()/chmod() after mounting.  An attacker can swap
   the target between mount and the ownership/mode change to gain
   control of arbitrary files.
   Reported-by: Xinyao Hu

 CVE-2026-53614 - mount(8) SUID bypass via LIBMOUNT_FORCE_MOUNT2.
   The environment variable LIBMOUNT_FORCE_MOUNT2 is not filtered
   via safe_getenv() in SUID context.  A local attacker can force
   the legacy mount(2) code path, which uses a two-step bind+remount
   or propagation sequence with a window where security flags (nosuid,
   noexec, ...) are not yet applied.
   Reported-by: Xinyao Hu

Full release notes: https://www.kernel.org/pub/linux/utils/util-linux/v2.41/v2.41.5-ReleaseNotes

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/util-linux/util-linux.hash | 2 +-
 package/util-linux/util-linux.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/util-linux/util-linux.hash b/package/util-linux/util-linux.hash
index 5a5656212c..b6393d6ec0 100644
--- a/package/util-linux/util-linux.hash
+++ b/package/util-linux/util-linux.hash
@@ -1,5 +1,5 @@
 # From https://mirrors.edge.kernel.org/pub/linux/utils/util-linux/v2.41/sha256sums.asc
-sha256  a8c213cc06048862602a42b2d299b340001f6d05c4407b549f3e03521df83688  util-linux-2.41.4.tar.xz
+sha256  f586e35d320ff537aab3ffeca37e9ecd482ccbe013590db4429a414d8aa6a728  util-linux-2.41.5.tar.xz
 # License files, locally calculated
 sha256  4c2db318192bda62f3f8fcf71488bb5e602ae4385eba281d711b46cc13a40bb3  README.licensing
 sha256  527f738966ca396cd5a68c1509390de2a780c6b614d9ee57f7544a6161938ed1  Documentation/licenses/COPYING.BSD-2-Clause
diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index fcce9a7dc8..20bdcc5c3f 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -8,7 +8,7 @@
 # util-linux-libs/util-linux-libs.mk needs to be updated accordingly as well.
 
 UTIL_LINUX_VERSION_MAJOR = 2.41
-UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).4
+UTIL_LINUX_VERSION = $(UTIL_LINUX_VERSION_MAJOR).5
 UTIL_LINUX_SOURCE = util-linux-$(UTIL_LINUX_VERSION).tar.xz
 UTIL_LINUX_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/util-linux/v$(UTIL_LINUX_VERSION_MAJOR)
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
