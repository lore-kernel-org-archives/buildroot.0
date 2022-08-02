Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3426C00140
	for <buildroot@archiver.kernel.org>; Tue,  2 Aug 2022 08:53:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4116C4050C;
	Tue,  2 Aug 2022 08:53:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4116C4050C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vHiV4B9TeZOY; Tue,  2 Aug 2022 08:53:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CB11F404F5;
	Tue,  2 Aug 2022 08:53:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CB11F404F5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D32ED1BF37E
 for <buildroot@lists.busybox.net>; Tue,  2 Aug 2022 08:52:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AE5CF404F5
 for <buildroot@lists.busybox.net>; Tue,  2 Aug 2022 08:52:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AE5CF404F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wB_Yr1VOvuGx for <buildroot@lists.busybox.net>;
 Tue,  2 Aug 2022 08:52:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5989F404F1
 for <buildroot@buildroot.org>; Tue,  2 Aug 2022 08:52:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5989F404F1
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id D9EC886C71; Tue,  2 Aug 2022 08:38:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 2 Aug 2022 10:49:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b05b6bb9faab4e611e65227a4c4e9800b1556590
X-Git-Newrev: cc6e9231c8fa5b4eb5b45bba3ff9745da3e09ef7
X-Patchwork-Hint: ignore
Message-Id: <20220802083855.D9EC886C71@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openvmtools: bump version to 11.3.5
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=cc6e9231c8fa5b4eb5b45bba3ff9745da3e09ef7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Rebase patches as necessary and bump version to 11.3.5. This allows
to build openvmtools for aarch64.

Both patches 0009-Set-permissions-on-rules-file.patch and
0010-Change-DEVPATH-to-devpath.patch are removed as they are upstream
as of commit 86d3256f2acccc066648e6b25e16b46930338406 (in release
11.0.5).

Signed-off-by: Stefan Agner <stefan@agner.ch>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...to-vm_poll-h-to-fix-build-failure-on-musl.patch | 81 +++++++++++++---------
 ...re-to-test-for-feature-instead-of-platfor.patch |  1 +
 .../0009-Set-permissions-on-rules-file.patch       | 23 ------
 .../0010-Change-DEVPATH-to-devpath.patch           | 25 -------
 package/openvmtools/Config.in                      |  1 +
 package/openvmtools/openvmtools.hash               |  2 +-
 package/openvmtools/openvmtools.mk                 |  4 +-
 7 files changed, 53 insertions(+), 84 deletions(-)

diff --git a/package/openvmtools/0003-Rename-poll-h-into-vm_poll-h-to-fix-build-failure-on-musl.patch b/package/openvmtools/0003-Rename-poll-h-into-vm_poll-h-to-fix-build-failure-on-musl.patch
index e9495ce43f..b4e94d870d 100644
--- a/package/openvmtools/0003-Rename-poll-h-into-vm_poll-h-to-fix-build-failure-on-musl.patch
+++ b/package/openvmtools/0003-Rename-poll-h-into-vm_poll-h-to-fix-build-failure-on-musl.patch
@@ -1,4 +1,5 @@
-From 9d13e32e362ad3ce5169f49b7f0fe1d9380e558c Mon Sep 17 00:00:00 2001
+From 1dfab46d367d11e9132506ee0f7d3eb2ceff5f3c Mon Sep 17 00:00:00 2001
+Message-Id: <1dfab46d367d11e9132506ee0f7d3eb2ceff5f3c.1652913832.git.stefan@agner.ch>
 From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 Date: Mon, 30 Sep 2019 13:32:35 +0200
 Subject: [PATCH] Rename poll.h into vm_poll.h to fix build failure on musl
@@ -38,19 +39,19 @@ Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
  lib/asyncsocket/asyncsocket.c |   4 +-
  lib/hgfsServer/hgfsServer.c   |   2 +-
  lib/include/asyncsocket.h     |   2 +-
- lib/include/poll.h            | 330 --------------------
+ lib/include/poll.h            | 337 --------------------
  lib/include/pollImpl.h        |   2 +-
- lib/include/vm_poll.h         | 330 ++++++++++++++++++++
+ lib/include/vm_poll.h         | 337 ++++++++++++++++++++
  lib/rpcIn/rpcin.c             |   2 +-
- 7 files changed, 336 insertions(+), 336 deletions(-)
- delete mode 100644 open-vm-tools/lib/include/poll.h
- create mode 100644 open-vm-tools/lib/include/vm_poll.h
+ 7 files changed, 343 insertions(+), 343 deletions(-)
+ delete mode 100644 lib/include/poll.h
+ create mode 100644 lib/include/vm_poll.h
 
-diff --git a/lib/asyncsocket/asyncsocket.c b/lib/asyncsocket/asyncsocket.c
-index 102638cc..01181a95 100644
+diff --git a/lib/asyncsocket/asyncsocket.c b/open-vm-tools/lib/asyncsocket/asyncsocket.c
+index 05147d2e..16949567 100644
 --- a/lib/asyncsocket/asyncsocket.c
 +++ b/lib/asyncsocket/asyncsocket.c
-@@ -69,8 +69,8 @@
+@@ -70,8 +70,8 @@
  #else
  #include <stddef.h>
  #include <ctype.h>
@@ -60,7 +61,7 @@ index 102638cc..01181a95 100644
  #include <sys/socket.h>
  #include <sys/un.h>
  #include <netdb.h>
-@@ -86,7 +86,7 @@
+@@ -87,7 +87,7 @@
  #include "random.h"
  #include "asyncsocket.h"
  #include "asyncSocketBase.h"
@@ -69,24 +70,24 @@ index 102638cc..01181a95 100644
  #include "log.h"
  #include "err.h"
  #include "hostinfo.h"
-diff --git a/lib/hgfsServer/hgfsServer.c b/lib/hgfsServer/hgfsServer.c
-index 46224551..fc691286 100644
+diff --git a/lib/hgfsServer/hgfsServer.c b/open-vm-tools/lib/hgfsServer/hgfsServer.c
+index 98f5b3f0..b436f0c7 100644
 --- a/lib/hgfsServer/hgfsServer.c
 +++ b/lib/hgfsServer/hgfsServer.c
-@@ -48,7 +48,7 @@
- #include "hgfsServerOplock.h"
+@@ -51,7 +51,7 @@
  #include "hgfsDirNotify.h"
+ #include "hgfsThreadpool.h"
  #include "userlock.h"
 -#include "poll.h"
 +#include "vm_poll.h"
  #include "mutexRankLib.h"
  #include "vm_basic_asm.h"
  #include "unicodeOperations.h"
-diff --git a/lib/include/asyncsocket.h b/lib/include/asyncsocket.h
-index 95a5e464..a4b4e5aa 100644
+diff --git a/lib/include/asyncsocket.h b/open-vm-tools/lib/include/asyncsocket.h
+index 47b5b873..b8b0149e 100644
 --- a/lib/include/asyncsocket.h
 +++ b/lib/include/asyncsocket.h
-@@ -164,7 +164,7 @@ typedef struct AsyncSocket AsyncSocket;
+@@ -171,7 +171,7 @@ typedef struct AsyncSocket AsyncSocket;
   * Or the client can specify its favorite poll class and locking behavior.
   * Use of IVmdbPoll is only supported for regular sockets and for Attach.
   */
@@ -95,14 +96,14 @@ index 95a5e464..a4b4e5aa 100644
  struct IVmdbPoll;
  typedef struct AsyncSocketPollParams {
     int flags;               /* Default 0, only POLL_FLAG_NO_BULL is valid */
-diff --git a/lib/include/poll.h b/lib/include/poll.h
+diff --git a/lib/include/poll.h b/open-vm-tools/lib/include/poll.h
 deleted file mode 100644
-index 6acd4f35..00000000
+index c90f5dcd..00000000
 --- a/lib/include/poll.h
 +++ /dev/null
-@@ -1,330 +0,0 @@
+@@ -1,337 +0,0 @@
 -/*********************************************************
-- * Copyright (C) 1998-2018 VMware, Inc. All rights reserved.
+- * Copyright (C) 1998-2020 VMware, Inc. All rights reserved.
 - *
 - * This program is free software; you can redistribute it and/or modify it
 - * under the terms of the GNU Lesser General Public License as published
@@ -152,7 +153,7 @@ index 6acd4f35..00000000
 -
 -#ifdef _WIN32
 -#define HZ 100
--#elif defined linux
+-#elif defined __linux__
 -#include <asm/param.h>
 -#elif __APPLE__
 -#include <TargetConditionals.h>
@@ -335,6 +336,12 @@ index 6acd4f35..00000000
 - *      implementations are distinct from the core poll code.
 - */
 -
+-
+-/* Socket pair created with non-blocking mode */
+-#define POLL_OPTIONS_SOCKET_PAIR_NONBLOCK_CONN  0x01
+-
+-typedef unsigned int SocketSpecialOpts;
+-
 -typedef struct PollOptions {
 -   Bool locked;           // Use internal MXUser for locking
 -   Bool allowFullQueue;   // Don't assert when device event queue is full.
@@ -342,6 +349,7 @@ index 6acd4f35..00000000
 -   PollerFireWrapper fireWrapperFn;  // optional; may be useful for stats
 -   void *fireWrapperData; // optional
 -   PollerErrorFn errorFn; // optional; called upon unrecoverable error
+-   SocketSpecialOpts pollSocketOpts;
 -} PollOptions;
 -
 -
@@ -354,7 +362,7 @@ index 6acd4f35..00000000
 -/*
 - * Functions
 - */
--int Poll_SocketPair(Bool vmci, Bool stream, int fds[2]);
+-int Poll_SocketPair(Bool vmci, Bool stream, int fds[2], SocketSpecialOpts opts);
 -void Poll_Loop(Bool loop, Bool *exit, PollClass c);
 -void Poll_LoopTimeout(Bool loop, Bool *exit, PollClass c, int timeout);
 -Bool Poll_LockingEnabled(void);
@@ -431,7 +439,7 @@ index 6acd4f35..00000000
 -#endif
 -
 -#endif // _POLL_H_
-diff --git a/lib/include/pollImpl.h b/lib/include/pollImpl.h
+diff --git a/lib/include/pollImpl.h b/open-vm-tools/lib/include/pollImpl.h
 index 46442e55..8bc66997 100644
 --- a/lib/include/pollImpl.h
 +++ b/lib/include/pollImpl.h
@@ -444,14 +452,14 @@ index 46442e55..8bc66997 100644
  #include "vm_basic_asm.h"
  
  #if defined(__cplusplus)
-diff --git a/lib/include/vm_poll.h b/lib/include/vm_poll.h
+diff --git a/lib/include/vm_poll.h b/open-vm-tools/lib/include/vm_poll.h
 new file mode 100644
-index 00000000..6acd4f35
+index 00000000..c90f5dcd
 --- /dev/null
 +++ b/lib/include/vm_poll.h
-@@ -0,0 +1,330 @@
+@@ -0,0 +1,337 @@
 +/*********************************************************
-+ * Copyright (C) 1998-2018 VMware, Inc. All rights reserved.
++ * Copyright (C) 1998-2020 VMware, Inc. All rights reserved.
 + *
 + * This program is free software; you can redistribute it and/or modify it
 + * under the terms of the GNU Lesser General Public License as published
@@ -501,7 +509,7 @@ index 00000000..6acd4f35
 +
 +#ifdef _WIN32
 +#define HZ 100
-+#elif defined linux
++#elif defined __linux__
 +#include <asm/param.h>
 +#elif __APPLE__
 +#include <TargetConditionals.h>
@@ -684,6 +692,12 @@ index 00000000..6acd4f35
 + *      implementations are distinct from the core poll code.
 + */
 +
++
++/* Socket pair created with non-blocking mode */
++#define POLL_OPTIONS_SOCKET_PAIR_NONBLOCK_CONN  0x01
++
++typedef unsigned int SocketSpecialOpts;
++
 +typedef struct PollOptions {
 +   Bool locked;           // Use internal MXUser for locking
 +   Bool allowFullQueue;   // Don't assert when device event queue is full.
@@ -691,6 +705,7 @@ index 00000000..6acd4f35
 +   PollerFireWrapper fireWrapperFn;  // optional; may be useful for stats
 +   void *fireWrapperData; // optional
 +   PollerErrorFn errorFn; // optional; called upon unrecoverable error
++   SocketSpecialOpts pollSocketOpts;
 +} PollOptions;
 +
 +
@@ -703,7 +718,7 @@ index 00000000..6acd4f35
 +/*
 + * Functions
 + */
-+int Poll_SocketPair(Bool vmci, Bool stream, int fds[2]);
++int Poll_SocketPair(Bool vmci, Bool stream, int fds[2], SocketSpecialOpts opts);
 +void Poll_Loop(Bool loop, Bool *exit, PollClass c);
 +void Poll_LoopTimeout(Bool loop, Bool *exit, PollClass c, int timeout);
 +Bool Poll_LockingEnabled(void);
@@ -780,8 +795,8 @@ index 00000000..6acd4f35
 +#endif
 +
 +#endif // _POLL_H_
-diff --git a/lib/rpcIn/rpcin.c b/lib/rpcIn/rpcin.c
-index 47a3380e..660382c6 100644
+diff --git a/lib/rpcIn/rpcin.c b/open-vm-tools/lib/rpcIn/rpcin.c
+index 8b1fe759..f22fcd40 100644
 --- a/lib/rpcIn/rpcin.c
 +++ b/lib/rpcIn/rpcin.c
 @@ -57,7 +57,7 @@
@@ -794,5 +809,5 @@ index 47a3380e..660382c6 100644
  #  include "vmci_defs.h"
  #include "dataMap.h"
 -- 
-2.23.0
+2.36.1
 
diff --git a/package/openvmtools/0007-Use-configure-to-test-for-feature-instead-of-platfor.patch b/package/openvmtools/0007-Use-configure-to-test-for-feature-instead-of-platfor.patch
index 0d3948aa10..abbc518362 100644
--- a/package/openvmtools/0007-Use-configure-to-test-for-feature-instead-of-platfor.patch
+++ b/package/openvmtools/0007-Use-configure-to-test-for-feature-instead-of-platfor.patch
@@ -125,6 +125,7 @@ Index: open-vm-tools/lib/nicInfo/nicInfoPosix.c
  #include <sys/socket.h>
  #include <sys/stat.h>
  #include <errno.h>
+ #include <limits.h>
 -#if defined(__FreeBSD__) || defined(__APPLE__)
 +#if HAVE_SYS_SYSCTL_H
  # include <sys/sysctl.h>
diff --git a/package/openvmtools/0009-Set-permissions-on-rules-file.patch b/package/openvmtools/0009-Set-permissions-on-rules-file.patch
deleted file mode 100644
index 6a37c1690d..0000000000
--- a/package/openvmtools/0009-Set-permissions-on-rules-file.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-From c3ef6a8285132871ad10f9300d8afff55d8d6de2 Mon Sep 17 00:00:00 2001
-From: puneetse <22071208+puneetse@users.noreply.github.com>
-Date: Wed, 16 Oct 2019 10:09:38 -0700
-Subject: [PATCH] Set permissions on rules file
-
-udevs rules should not be executable otherwise udev will log a warning in the journal
-
-Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
----
- udev/Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/udev/Makefile.am b/udev/Makefile.am
-index 68fbc3e27..8b9a4d716 100644
---- a/udev/Makefile.am
-+++ b/udev/Makefile.am
-@@ -17,5 +17,5 @@
- 
- install-data-local:
- 	$(INSTALL) -d $(DESTDIR)$(UDEVRULESDIR)
--	$(INSTALL) $(srcdir)/99-vmware-scsi-udev.rules $(DESTDIR)$(UDEVRULESDIR)
-+	$(INSTALL) -m 0644 $(srcdir)/99-vmware-scsi-udev.rules $(DESTDIR)$(UDEVRULESDIR)
- 
diff --git a/package/openvmtools/0010-Change-DEVPATH-to-devpath.patch b/package/openvmtools/0010-Change-DEVPATH-to-devpath.patch
deleted file mode 100644
index 5af694d8f2..0000000000
--- a/package/openvmtools/0010-Change-DEVPATH-to-devpath.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-From 22f5d198b3b2f7e4debed83948ba1baf70d4749a Mon Sep 17 00:00:00 2001
-From: puneetse <22071208+puneetse@users.noreply.github.com>
-Date: Wed, 16 Oct 2019 10:04:41 -0700
-Subject: [PATCH] Change $DEVPATH to $devpath
-
-$DEVPATH throws a warning by udev.
-
-Signed-off-by: Pascal de Bruijn <p.debruijn@unilogic.nl>
----
- udev/99-vmware-scsi-udev.rules | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/udev/99-vmware-scsi-udev.rules b/udev/99-vmware-scsi-udev.rules
-index 053b59706..a605d80ef 100644
---- a/udev/99-vmware-scsi-udev.rules
-+++ b/udev/99-vmware-scsi-udev.rules
-@@ -2,6 +2,6 @@
- #
- # This file is part of open-vm-tools
- 
--ACTION=="add", SUBSYSTEMS=="scsi", ATTRS{vendor}=="VMware*", ATTRS{model}=="Virtual disk*", ENV{DEVTYPE}=="disk", RUN+="/bin/sh -c 'echo 180 >/sys$DEVPATH/device/timeout'"
--ACTION=="add", SUBSYSTEMS=="scsi", ATTRS{vendor}=="VMware*", ATTRS{model}=="VMware Virtual S", ENV{DEVTYPE}=="disk", RUN+="/bin/sh -c 'echo 180 >/sys$DEVPATH/device/timeout'"
-+ACTION=="add", SUBSYSTEMS=="scsi", ATTRS{vendor}=="VMware*", ATTRS{model}=="Virtual disk*", ENV{DEVTYPE}=="disk", RUN+="/bin/sh -c 'echo 180 >/sys/$devpath/device/timeout'"
-+ACTION=="add", SUBSYSTEMS=="scsi", ATTRS{vendor}=="VMware*", ATTRS{model}=="VMware Virtual S", ENV{DEVTYPE}=="disk", RUN+="/bin/sh -c 'echo 180 >/sys/$devpath/device/timeout'"
- 
diff --git a/package/openvmtools/Config.in b/package/openvmtools/Config.in
index 88cccd08af..67855f50e0 100644
--- a/package/openvmtools/Config.in
+++ b/package/openvmtools/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_OPENVMTOOLS_ARCH_SUPPORTS
 	bool
 	default y if BR2_i386
 	default y if BR2_x86_64
+	default y if BR2_aarch64
 
 config BR2_PACKAGE_OPENVMTOOLS
 	bool "openvmtools"
diff --git a/package/openvmtools/openvmtools.hash b/package/openvmtools/openvmtools.hash
index bd81d1f05c..081538fbf3 100644
--- a/package/openvmtools/openvmtools.hash
+++ b/package/openvmtools/openvmtools.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  364cd0fdfa5a05e872d08609659e6231ec99788669f7ebba24bfb8c94168daef  open-vm-tools-10.3.5-10430147.tar.gz
+sha256  2053daf7b224ab7ae1a9cfcd6ae12494c646e2bf9aaca998225bd082a4a43fb7  open-vm-tools-11.3.5-18557794.tar.gz
 sha256  f734933bd7d49aef25aaf897ed7281ee822e8635056e69b895a7d2e668937fc5  COPYING
diff --git a/package/openvmtools/openvmtools.mk b/package/openvmtools/openvmtools.mk
index 4201c6daa0..59080c05aa 100644
--- a/package/openvmtools/openvmtools.mk
+++ b/package/openvmtools/openvmtools.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-OPENVMTOOLS_VERSION_MAJOR = 10.3.5
-OPENVMTOOLS_VERSION = $(OPENVMTOOLS_VERSION_MAJOR)-10430147
+OPENVMTOOLS_VERSION_MAJOR = 11.3.5
+OPENVMTOOLS_VERSION = $(OPENVMTOOLS_VERSION_MAJOR)-18557794
 OPENVMTOOLS_SITE = https://github.com/vmware/open-vm-tools/releases/download/stable-$(OPENVMTOOLS_VERSION_MAJOR)
 OPENVMTOOLS_SOURCE = open-vm-tools-$(OPENVMTOOLS_VERSION).tar.gz
 OPENVMTOOLS_LICENSE = LGPL-2.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
