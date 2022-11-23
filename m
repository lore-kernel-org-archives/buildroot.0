Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43818C4332F
	for <buildroot@archiver.kernel.org>; Wed, 23 Nov 2022 09:54:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F016661199;
	Wed, 23 Nov 2022 09:54:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F016661199
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cH1CSg15ANhJ; Wed, 23 Nov 2022 09:54:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 224AB61194;
	Wed, 23 Nov 2022 09:54:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 224AB61194
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D19E31BF853
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 09:54:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7864F40BC7
 for <buildroot@lists.busybox.net>; Wed, 23 Nov 2022 09:53:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7864F40BC7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cb-bKMYxb8py for <buildroot@lists.busybox.net>;
 Wed, 23 Nov 2022 09:53:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A9A7740BB9
 for <buildroot@buildroot.org>; Wed, 23 Nov 2022 09:53:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A9A7740BB9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 973FB842E2; Wed, 23 Nov 2022 09:53:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 23 Nov 2022 10:51:46 +0100
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: 6bd61d13c28c4f0973659f07b20cb7ecd3487d58
X-Git-Newrev: d25bad9b3004a4da00e84a6eadbbd1d7f040becd
X-Patchwork-Hint: ignore
Message-Id: <20221123095358.973FB842E2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] package/systemd: security
 bump to version v250.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=d25bad9b3004a4da00e84a6eadbbd1d7f040becd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

Fixes the following security issue:

- CVE-2022-3821: An off-by-one Error issue was discovered in Systemd in
  format_timespan() function of time-util.c.  An attacker could supply
  specific values for time and accuracy that leads to buffer overrun in
  format_timespan(), leading to a Denial of Service.
  https://github.com/systemd/systemd/issues/23928

Drop now upstream 0001-missing-syscall-define-MOVE_MOUNT_T_EMPTY_PATH-if-mi.patch

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit e24033f76ad339b1a66fb5b259b8e28f076de97e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...call-define-MOVE_MOUNT_T_EMPTY_PATH-if-mi.patch | 33 ----------------------
 package/systemd/systemd.hash                       |  2 +-
 package/systemd/systemd.mk                         |  2 +-
 3 files changed, 2 insertions(+), 35 deletions(-)

diff --git a/package/systemd/0001-missing-syscall-define-MOVE_MOUNT_T_EMPTY_PATH-if-mi.patch b/package/systemd/0001-missing-syscall-define-MOVE_MOUNT_T_EMPTY_PATH-if-mi.patch
deleted file mode 100644
index 0934886acb..0000000000
--- a/package/systemd/0001-missing-syscall-define-MOVE_MOUNT_T_EMPTY_PATH-if-mi.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 16c132a6a0389e0eaea70c4ad95dbfd1637ec5ba Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@smile.fr>
-Date: Fri, 7 Jan 2022 22:25:23 +0100
-Subject: [PATCH] missing-syscall: define MOVE_MOUNT_T_EMPTY_PATH if missing
-
-MOVE_MOUNT_T_EMPTY_PATH has been added to systemd 250 by [1]
-but it's defined in kernel headers since version 5.2.
-
-[1] c7bf079bbc19e3b409acc0c7acc3e14749211fe2
-
-Signed-off-by: Romain Naour <romain.naour@smile.fr>
----
- src/basic/missing_syscall.h | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/src/basic/missing_syscall.h b/src/basic/missing_syscall.h
-index 8267b1a90c..793d111c55 100644
---- a/src/basic/missing_syscall.h
-+++ b/src/basic/missing_syscall.h
-@@ -569,6 +569,10 @@ static inline int missing_open_tree(
- #define MOVE_MOUNT_F_EMPTY_PATH 0x00000004 /* Empty from path permitted */
- #endif
- 
-+#ifndef MOVE_MOUNT_T_EMPTY_PATH
-+#define MOVE_MOUNT_T_EMPTY_PATH 0x00000040 /* Empty to path permitted */
-+#endif
-+
- static inline int missing_move_mount(
-                 int from_dfd,
-                 const char *from_pathname,
--- 
-2.31.1
-
diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
index 3572b25965..3b98566f32 100644
--- a/package/systemd/systemd.hash
+++ b/package/systemd/systemd.hash
@@ -1,5 +1,5 @@
 # sha256 locally computed
-sha256  d2bda9d225da11dc9ff48b48e59fc36798d3e66902ed400a9f78fa370c596864  systemd-250.4.tar.gz
+sha256  638a2fc78828765fc97bc73f428205b6dc1d359149b6c6bfe4d2a649cba2cca8  systemd-250.8.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE.GPL2
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE.LGPL2.1
 sha256  e5a8645ad94aab24e312dd0c6be2aa54236eb9374480b1b14ea5c61598874fd5  LICENSES/BSD-2-Clause.txt
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 1d7452de19..316fef2185 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -19,7 +19,7 @@
 # - Diff sysusers.d with the previous version
 # - Diff factory/etc/nsswitch.conf with the previous version
 #   (details are often sprinkled around in README and manpages)
-SYSTEMD_VERSION = 250.4
+SYSTEMD_VERSION = 250.8
 SYSTEMD_SITE = $(call github,systemd,systemd-stable,v$(SYSTEMD_VERSION))
 SYSTEMD_LICENSE = \
 	LGPL-2.1+, \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
