Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56213C433EF
	for <buildroot@archiver.kernel.org>; Wed, 23 Mar 2022 21:49:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 07F5840162;
	Wed, 23 Mar 2022 21:49:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QD_OMePdpAWd; Wed, 23 Mar 2022 21:49:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 91E924019D;
	Wed, 23 Mar 2022 21:49:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B4CFA1BF489
 for <buildroot@lists.busybox.net>; Wed, 23 Mar 2022 21:48:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AFB7860AC3
 for <buildroot@lists.busybox.net>; Wed, 23 Mar 2022 21:48:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2vvhyx5oMdN0 for <buildroot@lists.busybox.net>;
 Wed, 23 Mar 2022 21:48:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B799060ABD
 for <buildroot@buildroot.org>; Wed, 23 Mar 2022 21:48:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id CFEC085A7A; Wed, 23 Mar 2022 21:39:01 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 23 Mar 2022 22:42:56 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 9d5fd132f098026f36c64b0b0c52ab49c6519bd4
X-Git-Newrev: bd7058a0c1802a969f8d5d32d949d382b19749b6
X-Patchwork-Hint: ignore
Message-Id: <20220323213901.CFEC085A7A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/libiec61850: bump
 to version 1.5.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=bd7058a0c1802a969f8d5d32d949d382b19749b6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Remove all upstream patches
Remove IGNORE_CVES for CVE-2020-15158

Build tested:
https://gitlab.com/kubu93/buildroot/-/pipelines/309037705

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit a42e0e4600be785fa750c6b481c41a76d041df03)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-use-poll.h-instead-of-sys-poll.h.patch    | 33 ----------------------
 ...port_linux-Add-missing-include-sys-time.h.patch | 32 ---------------------
 ...eap-buffer-overflow-when-handling-message.patch | 27 ------------------
 package/libiec61850/libiec61850.hash               |  2 +-
 package/libiec61850/libiec61850.mk                 |  5 +---
 5 files changed, 2 insertions(+), 97 deletions(-)

diff --git a/package/libiec61850/0001-use-poll.h-instead-of-sys-poll.h.patch b/package/libiec61850/0001-use-poll.h-instead-of-sys-poll.h.patch
deleted file mode 100644
index a04473d218..0000000000
--- a/package/libiec61850/0001-use-poll.h-instead-of-sys-poll.h.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 4cad505fc98240eb66eaabfae61a9694f8158dda Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@smile.fr>
-Date: Tue, 7 Apr 2020 20:58:37 +0200
-Subject: [PATCH] use <poll.h> instead of <sys/poll.h>
-
-The manpage of poll(2) states that the prototype of poll is defined
-in <poll.h>. Use that header file instead of <sys/poll.h> to allow
-compilation against musl-libc.
-
-Upstream status: Pending
-https://github.com/mz-automation/libiec61850/pull/228
-
-Signed-off-by: Romain Naour <romain.naour@smile.fr>
----
- hal/ethernet/linux/ethernet_linux.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/hal/ethernet/linux/ethernet_linux.c b/hal/ethernet/linux/ethernet_linux.c
-index c3ab2e2..9aa5c28 100644
---- a/hal/ethernet/linux/ethernet_linux.c
-+++ b/hal/ethernet/linux/ethernet_linux.c
-@@ -23,7 +23,7 @@
- 
- #include <sys/socket.h>
- #include <sys/ioctl.h>
--#include <sys/poll.h>
-+#include <poll.h>
- #include <linux/if_packet.h>
- #include <linux/if_ether.h>
- #include <linux/if_arp.h>
--- 
-2.21.1
-
diff --git a/package/libiec61850/0002-serial_port_linux-Add-missing-include-sys-time.h.patch b/package/libiec61850/0002-serial_port_linux-Add-missing-include-sys-time.h.patch
deleted file mode 100644
index e1b8ca15b3..0000000000
--- a/package/libiec61850/0002-serial_port_linux-Add-missing-include-sys-time.h.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From 661405eb6066b67dfe51d5ff9635e29f86bdd238 Mon Sep 17 00:00:00 2001
-From: Romain Naour <romain.naour@smile.fr>
-Date: Tue, 7 Apr 2020 21:02:54 +0200
-Subject: [PATCH] serial_port_linux: Add missing include sys/time.h
-
-POSIX says `struct timeval` is defined if <sys/time.h> is included.
-
-Adding this header allow to build against musl-libc.
-
-Upstream status: Pending
-https://github.com/mz-automation/libiec61850/pull/228
-
-Signed-off-by: Romain Naour <romain.naour@smile.fr>
----
- hal/serial/linux/serial_port_linux.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/hal/serial/linux/serial_port_linux.c b/hal/serial/linux/serial_port_linux.c
-index e6308c0..15e5794 100644
---- a/hal/serial/linux/serial_port_linux.c
-+++ b/hal/serial/linux/serial_port_linux.c
-@@ -29,6 +29,7 @@
- #include <termios.h>
- #include <fcntl.h>
- #include <unistd.h>
-+#include <sys/time.h>
- 
- #include "hal_serial.h"
- #include "hal_time.h"
--- 
-2.21.1
-
diff --git a/package/libiec61850/0003-COTP-fixed-possible-heap-buffer-overflow-when-handling-message.patch b/package/libiec61850/0003-COTP-fixed-possible-heap-buffer-overflow-when-handling-message.patch
deleted file mode 100644
index 88048555b7..0000000000
--- a/package/libiec61850/0003-COTP-fixed-possible-heap-buffer-overflow-when-handling-message.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 033ab5b6488250c8c3b838f25a7cbc3e099230bb Mon Sep 17 00:00:00 2001
-From: Michael Zillgith <michael.zillgith@mz-automation.de>
-Date: Wed, 12 Aug 2020 07:25:37 +0200
-Subject: [PATCH] - COTP: fixed possible heap buffer overflow when handling
- message with invalid (zero) value in length field (#250)
-
-[Retrieved from:
-https://github.com/mz-automation/libiec61850/commit/033ab5b6488250c8c3b838f25a7cbc3e099230bb]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/mms/iso_cotp/cotp.c | 3 +++
- 1 file changed, 3 insertions(+)
-
-diff --git a/src/mms/iso_cotp/cotp.c b/src/mms/iso_cotp/cotp.c
-index cbb34b36..8c37d262 100644
---- a/src/mms/iso_cotp/cotp.c
-+++ b/src/mms/iso_cotp/cotp.c
-@@ -720,6 +720,9 @@ CotpConnection_readToTpktBuffer(CotpConnection* self)
-             goto exit_waiting;
-     }
- 
-+    if (self->packetSize <= bufPos)
-+        goto exit_error;
-+
-     readBytes = readFromSocket(self, buffer + bufPos, self->packetSize - bufPos);
- 
-     if (readBytes < 0)
diff --git a/package/libiec61850/libiec61850.hash b/package/libiec61850/libiec61850.hash
index 5739a5d8c9..3a024be7c6 100644
--- a/package/libiec61850/libiec61850.hash
+++ b/package/libiec61850/libiec61850.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  d0630cd5b7ac67a2d286b0ad574ff1c9074c96be33b9d5a300cd69e89429abbe  libiec61850-1.4.2.1.tar.gz
+sha256  7b832c195ae9f42faa1ccfe1b82b9ff187103155ce45aaca08881be98459d164  libiec61850-1.5.0.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/libiec61850/libiec61850.mk b/package/libiec61850/libiec61850.mk
index 4f82451eb8..6da782ad39 100644
--- a/package/libiec61850/libiec61850.mk
+++ b/package/libiec61850/libiec61850.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBIEC61850_VERSION = 1.4.2.1
+LIBIEC61850_VERSION = 1.5.0
 LIBIEC61850_SITE = $(call github,mz-automation,libiec61850,v$(LIBIEC61850_VERSION))
 LIBIEC61850_INSTALL_STAGING = YES
 LIBIEC61850_LICENSE = GPL-3.0+
@@ -12,7 +12,4 @@ LIBIEC61850_LICENSE_FILES = COPYING
 LIBIEC61850_CPE_ID_VENDOR = mz-automation
 LIBIEC61850_CONF_OPTS = -DBUILD_PYTHON_BINDINGS=OFF
 
-# 0003-COTP-fixed-possible-heap-buffer-overflow-when-handling-message.patch
-LIBIEC61850_IGNORE_CVES += CVE-2020-15158
-
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
