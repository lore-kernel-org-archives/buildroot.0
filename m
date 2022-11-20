Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EECB2C4332F
	for <buildroot@archiver.kernel.org>; Sun, 20 Nov 2022 16:26:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4A58181BA8;
	Sun, 20 Nov 2022 16:26:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A58181BA8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZXZXnFD4Lx5A; Sun, 20 Nov 2022 16:26:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 62F0481B60;
	Sun, 20 Nov 2022 16:26:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 62F0481B60
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 659231BF404
 for <buildroot@lists.busybox.net>; Sun, 20 Nov 2022 16:26:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 40727403C8
 for <buildroot@lists.busybox.net>; Sun, 20 Nov 2022 16:26:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 40727403C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6JrENUmtq3IH for <buildroot@lists.busybox.net>;
 Sun, 20 Nov 2022 16:26:41 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 95448400F2
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 95448400F2
 for <buildroot@buildroot.org>; Sun, 20 Nov 2022 16:26:40 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7028720002;
 Sun, 20 Nov 2022 16:26:32 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1own9M-00EQ14-19; Sun, 20 Nov 2022 17:26:32 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 20 Nov 2022 17:26:22 +0100
Message-Id: <20221120162622.3436538-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/systemd: security bump to version v250.8
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
Cc: Norbert Lange <nolange79@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, Sen Hastings <sen@phobosdpl.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes the following security issue:

- CVE-2022-3821: An off-by-one Error issue was discovered in Systemd in
  format_timespan() function of time-util.c.  An attacker could supply
  specific values for time and accuracy that leads to buffer overrun in
  format_timespan(), leading to a Denial of Service.
  https://github.com/systemd/systemd/issues/23928

Drop now upstream 0001-missing-syscall-define-MOVE_MOUNT_T_EMPTY_PATH-if-mi.patch

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
./support/testing/run-tests -k -o output-systemd tests.init.test_systemd
15:35:09 TestInitSystemSystemdRwNetworkd          Starting
15:35:09 TestInitSystemSystemdRwNetworkd          Building
15:43:20 TestInitSystemSystemdRwNetworkd          Building done
Downloading to /var/lib/downloads/tmpw7by1nt7
Renaming from /var/lib/downloads/tmpw7by1nt7 to /var/lib/downloads/kernel-vexpress-5.10.7
Downloading to /var/lib/downloads/tmpxhcetjfv
Renaming from /var/lib/downloads/tmpxhcetjfv to /var/lib/downloads/vexpress-v2p-ca9-5.10.7.dtb
15:43:43 TestInitSystemSystemdRwNetworkd          Cleaning up
.15:43:43 TestInitSystemSystemdRwIfupdownDbusbrokerDbus Starting
15:43:43 TestInitSystemSystemdRwIfupdownDbusbrokerDbus Building
15:52:10 TestInitSystemSystemdRwIfupdownDbusbrokerDbus Building done
15:52:34 TestInitSystemSystemdRwIfupdownDbusbrokerDbus Cleaning up
.15:52:34 TestInitSystemSystemdRwIfupdownDbusbroker Starting
15:52:35 TestInitSystemSystemdRwIfupdownDbusbroker Building
16:00:40 TestInitSystemSystemdRwIfupdownDbusbroker Building done
16:01:04 TestInitSystemSystemdRwIfupdownDbusbroker Cleaning up
.16:01:04 TestInitSystemSystemdRwIfupdown          Starting
16:01:05 TestInitSystemSystemdRwIfupdown          Building
16:09:19 TestInitSystemSystemdRwIfupdown          Building done
16:09:43 TestInitSystemSystemdRwIfupdown          Cleaning up
.16:09:43 TestInitSystemSystemdRwFull              Starting
16:09:43 TestInitSystemSystemdRwFull              Building
16:21:53 TestInitSystemSystemdRwFull              Building done
16:22:21 TestInitSystemSystemdRwFull              Cleaning up
.16:22:21 TestInitSystemSystemdRoNetworkd          Starting
16:22:22 TestInitSystemSystemdRoNetworkd          Building
16:30:55 TestInitSystemSystemdRoNetworkd          Building done
16:31:18 TestInitSystemSystemdRoNetworkd          Cleaning up
.16:31:18 TestInitSystemSystemdRoIfupdownDbusbrokerDbus Starting
16:31:19 TestInitSystemSystemdRoIfupdownDbusbrokerDbus Building
16:39:50 TestInitSystemSystemdRoIfupdownDbusbrokerDbus Building done
16:40:13 TestInitSystemSystemdRoIfupdownDbusbrokerDbus Cleaning up
.16:40:13 TestInitSystemSystemdRoIfupdownDbusbroker Starting
16:40:14 TestInitSystemSystemdRoIfupdownDbusbroker Building
16:48:58 TestInitSystemSystemdRoIfupdownDbusbroker Building done
16:49:22 TestInitSystemSystemdRoIfupdownDbusbroker Cleaning up
.16:49:22 TestInitSystemSystemdRoIfupdown          Starting
16:49:23 TestInitSystemSystemdRoIfupdown          Building
16:58:00 TestInitSystemSystemdRoIfupdown          Building done
16:58:24 TestInitSystemSystemdRoIfupdown          Cleaning up
.16:58:24 TestInitSystemSystemdRoFull              Starting
16:58:25 TestInitSystemSystemdRoFull              Building
17:13:14 TestInitSystemSystemdRoFull              Building done
17:13:40 TestInitSystemSystemdRoFull              Cleaning up
.
----------------------------------------------------------------------
Ran 10 tests in 5911.589s

OK

 ...define-MOVE_MOUNT_T_EMPTY_PATH-if-mi.patch | 33 -------------------
 package/systemd/systemd.hash                  |  2 +-
 package/systemd/systemd.mk                    |  2 +-
 3 files changed, 2 insertions(+), 35 deletions(-)
 delete mode 100644 package/systemd/0001-missing-syscall-define-MOVE_MOUNT_T_EMPTY_PATH-if-mi.patch

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
index b42f6a502b..30a75b7a40 100644
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
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
