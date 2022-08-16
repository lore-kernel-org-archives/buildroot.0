Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4E62C2BB41
	for <buildroot@archiver.kernel.org>; Tue, 16 Aug 2022 09:39:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 78FA981CFE;
	Tue, 16 Aug 2022 09:39:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 78FA981CFE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id me4DJOhAv1Oj; Tue, 16 Aug 2022 09:39:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6CDF5813F8;
	Tue, 16 Aug 2022 09:39:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6CDF5813F8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9CAD01BF2A2
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 09:38:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 71D4340358
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 09:38:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 71D4340358
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3y11kcd6tsGT for <buildroot@lists.busybox.net>;
 Tue, 16 Aug 2022 09:38:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4128E40335
 for <buildroot@buildroot.org>; Tue, 16 Aug 2022 09:38:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4128E40335
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id E7CE1877CD; Tue, 16 Aug 2022 09:24:08 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 16 Aug 2022 11:34:24 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 62eed1d06a4b7a4f8af3da8831e36bb766a96d4c
X-Git-Newrev: 0ec971b0d92e0d7b8d66f1732b7710e3fb6922df
X-Patchwork-Hint: ignore
Message-Id: <20220816092408.E7CE1877CD@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x]
 package/x11r7/xserver_xorg-server: bump version to 21.1.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=0ec971b0d92e0d7b8d66f1732b7710e3fb6922df
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Release notes:
https://lists.x.org/archives/xorg-announce/2022-January/003127.html

Removed patch which was applied upstream:
https://gitlab.freedesktop.org/xorg/xserver/-/commit/9c66d910cae107cbcda02a8502ac5324a6eca052

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit e3245e3eba03f9ec64597afbebdeb90dd3064b26)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...tion-error-when-built-without-logind-plat.patch | 90 ----------------------
 .../xserver_xorg-server/xserver_xorg-server.hash   |  6 +-
 .../xserver_xorg-server/xserver_xorg-server.mk     |  2 +-
 3 files changed, 4 insertions(+), 94 deletions(-)

diff --git a/package/x11r7/xserver_xorg-server/0002-Fix-compilation-error-when-built-without-logind-plat.patch b/package/x11r7/xserver_xorg-server/0002-Fix-compilation-error-when-built-without-logind-plat.patch
deleted file mode 100644
index 164c0039bd..0000000000
--- a/package/x11r7/xserver_xorg-server/0002-Fix-compilation-error-when-built-without-logind-plat.patch
+++ /dev/null
@@ -1,90 +0,0 @@
-From 17b6ab4d8cecf55a3784dbefbef9bfcf84ee3b1b Mon Sep 17 00:00:00 2001
-From: Jocelyn Falempe <jfalempe@redhat.com>
-Date: Thu, 16 Dec 2021 15:46:43 +0100
-Subject: [PATCH] Fix compilation error when built without logind/platform bus
-
-This was introduced by commit 8eb1396d
-
-Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
-[Peter: from https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/827]
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- hw/xfree86/common/xf86Events.c               |  9 +--------
- hw/xfree86/os-support/linux/systemd-logind.c | 16 +++++++++++-----
- include/systemd-logind.h                     |  4 ++--
- 3 files changed, 14 insertions(+), 15 deletions(-)
-
-diff --git a/hw/xfree86/common/xf86Events.c b/hw/xfree86/common/xf86Events.c
-index 6076efa80..395bbc7b3 100644
---- a/hw/xfree86/common/xf86Events.c
-+++ b/hw/xfree86/common/xf86Events.c
-@@ -383,14 +383,7 @@ xf86VTLeave(void)
-         xf86GPUScreens[i]->LeaveVT(xf86GPUScreens[i]);
- 
-     if (systemd_logind_controls_session()) {
--        for (i = 0; i < xf86_num_platform_devices; i++) {
--            if (xf86_platform_devices[i].flags & XF86_PDEV_SERVER_FD) {
--                int major, minor;
--                major = xf86_platform_odev_attributes(i)->major;
--                minor = xf86_platform_odev_attributes(i)->minor;
--                systemd_logind_drop_master(major, minor);
--            }
--        }
-+        systemd_logind_drop_master();
-     }
- 
-     if (!xf86VTSwitchAway())
-diff --git a/hw/xfree86/os-support/linux/systemd-logind.c b/hw/xfree86/os-support/linux/systemd-logind.c
-index 35d5cc75b..f6a223a55 100644
---- a/hw/xfree86/os-support/linux/systemd-logind.c
-+++ b/hw/xfree86/os-support/linux/systemd-logind.c
-@@ -308,13 +308,19 @@ cleanup:
-  * and ensure the drm_drop_master is done before
-  * VT_RELDISP when switching VT
-  */
--void systemd_logind_drop_master(int _major, int _minor)
-+void systemd_logind_drop_master(void)
- {
--    struct systemd_logind_info *info = &logind_info;
--    dbus_int32_t major = _major;
--    dbus_int32_t minor = _minor;
-+    int i;
-+    for (i = 0; i < xf86_num_platform_devices; i++) {
-+        if (xf86_platform_devices[i].flags & XF86_PDEV_SERVER_FD) {
-+            dbus_int32_t major, minor;
-+            struct systemd_logind_info *info = &logind_info;
- 
--    systemd_logind_ack_pause(info, minor, major);
-+            major = xf86_platform_odev_attributes(i)->major;
-+            minor = xf86_platform_odev_attributes(i)->minor;
-+            systemd_logind_ack_pause(info, minor, major);
-+        }
-+    }
- }
- 
- static DBusHandlerResult
-diff --git a/include/systemd-logind.h b/include/systemd-logind.h
-index a8af2b96d..5c04d0130 100644
---- a/include/systemd-logind.h
-+++ b/include/systemd-logind.h
-@@ -33,7 +33,7 @@ int systemd_logind_take_fd(int major, int minor, const char *path, Bool *paus);
- void systemd_logind_release_fd(int major, int minor, int fd);
- int systemd_logind_controls_session(void);
- void systemd_logind_vtenter(void);
--void systemd_logind_drop_master(int major, int minor);
-+void systemd_logind_drop_master(void);
- #else
- #define systemd_logind_init()
- #define systemd_logind_fini()
-@@ -41,7 +41,7 @@ void systemd_logind_drop_master(int major, int minor);
- #define systemd_logind_release_fd(major, minor, fd) close(fd)
- #define systemd_logind_controls_session() 0
- #define systemd_logind_vtenter()
--#define systemd_logind_drop_master(major, minor)
-+#define systemd_logind_drop_master()
- #endif
- 
- #endif
--- 
-2.20.1
-
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
index 6008661db1..b5635b9afa 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.hash
@@ -1,6 +1,6 @@
-# From https://lists.x.org/archives/xorg-announce/2021-December/003125.html
-sha256  c20bf46a9fe8e74bf4e75430637e58d49a02d806609dc161462bceb1ef7e8db0  xorg-server-21.1.2.tar.xz
-sha512  6d7a0d29d5be09f80ed505c4d6ae964795127525a0ab73a4eab4f601788ab3627033143e5aeb4c2565c6683dd3402084d13acab5554606fbd519c4aec0a79def  xorg-server-21.1.2.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2022-January/003127.html
+sha256  61d6aad5b6b47a116b960bd7f0cba4ee7e6da95d6bb0b127bde75d7d1acdebe5  xorg-server-21.1.3.tar.xz
+sha512  cf5fed023eadda62ae732f8c4d427c272ebe005188341290f3d03147042c103b00cbb94d86a0256da815fb9b9a3da315c21a05ee0c926c1a2ff0c54ab0c0638b  xorg-server-21.1.3.tar.xz
 
 # Locally calculated
 sha256  4cc0447a22635c7b2f1a93fec4aa94f1970fadeb72a063de006b51cf4963a06f  COPYING
diff --git a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
index 0cadba92a3..0f1779dcab 100644
--- a/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
+++ b/package/x11r7/xserver_xorg-server/xserver_xorg-server.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XSERVER_XORG_SERVER_VERSION = 21.1.2
+XSERVER_XORG_SERVER_VERSION = 21.1.3
 XSERVER_XORG_SERVER_SOURCE = xorg-server-$(XSERVER_XORG_SERVER_VERSION).tar.xz
 XSERVER_XORG_SERVER_SITE = https://xorg.freedesktop.org/archive/individual/xserver
 XSERVER_XORG_SERVER_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
