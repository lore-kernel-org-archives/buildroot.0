Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8DFCC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:10:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E37760D07
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:10:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8E37760D07
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A6FC83AD8;
	Tue,  3 Aug 2021 23:10:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lQSiRQWQnt2Q; Tue,  3 Aug 2021 23:10:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 90E2283AB5;
	Tue,  3 Aug 2021 23:10:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5DAEB1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:13:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 580624066F
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ryKADxtAtWIV for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C8A9F40644
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 2804486016; Tue,  3 Aug 2021 21:09:52 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 14 Jun 2021 22:21:09 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: c82446b03e8d590a772d0357655ff43518b052ae
X-Git-Newrev: a42e0e4600be785fa750c6b481c41a76d041df03
X-Patchwork-Hint: ignore
Message-Id: <20210803210952.2804486016@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libiec61850: bump to
 version 1.5.0
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=a42e0e4600be785fa750c6b481c41a76d041df03
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Remove all upstream patches
Remove IGNORE_CVES for CVE-2020-15158

Build tested:
https://gitlab.com/kubu93/buildroot/-/pipelines/309037705

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
