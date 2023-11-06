Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 843DDC4332F
	for <buildroot@archiver.kernel.org>; Mon,  6 Nov 2023 19:40:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1CF70612A0;
	Mon,  6 Nov 2023 19:40:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1CF70612A0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bt6YX79ItRgD; Mon,  6 Nov 2023 19:40:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 20C9761240;
	Mon,  6 Nov 2023 19:40:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 20C9761240
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 989E31BF951
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 19:40:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7D5BA4159B
 for <buildroot@lists.busybox.net>; Mon,  6 Nov 2023 19:40:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7D5BA4159B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mc-BMAmgwhbK for <buildroot@lists.busybox.net>;
 Mon,  6 Nov 2023 19:40:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 48BE84159F
 for <buildroot@buildroot.org>; Mon,  6 Nov 2023 19:40:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 48BE84159F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2844586971; Mon,  6 Nov 2023 19:40:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 6 Nov 2023 20:38:43 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ee389788af8e454251cbdb24d03710b3e1d83abc
X-Git-Newrev: 2edabebbb417414d429161e0123fb7730bdc0489
X-Patchwork-Hint: ignore
Message-Id: <20231106194025.2844586971@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/wavemon: bump to version 0.9.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=2edabebbb417414d429161e0123fb7730bdc0489
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch (already in version)

https://github.com/uoaerg/wavemon/releases/tag/v0.9.5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                |  1 -
 .../0001-iw_if.h-don-t-include-linux-if.h.patch    | 41 ----------------------
 package/wavemon/wavemon.hash                       |  2 +-
 package/wavemon/wavemon.mk                         |  2 +-
 4 files changed, 2 insertions(+), 44 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index ecf4ae9a85..7113382e21 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1458,7 +1458,6 @@ package/wampcc/0001-Add-RISC-V-endian-detection.patch Upstream
 package/wampcc/0002-include-wampcc-platform.h-fix-build-with-musl-1.2.0.patch Upstream
 package/wampcc/0003-Broken-build-on-Windows.patch Upstream
 package/watchdogd/S01watchdogd Indent NotExecutable
-package/wavemon/0001-iw_if.h-don-t-include-linux-if.h.patch Upstream
 package/webrtc-audio-processing/0001-Proper-detection-of-cxxabi.h-and-execinfo.h.patch Upstream
 package/wget/0001-lib-getrandom.c-fix-build-with-uclibc-1.0.35.patch Upstream
 package/wilc-driver/0001-cfg80211.c-fix-missing-prandom_u32-with-Linux-6.1.0.patch Upstream
diff --git a/package/wavemon/0001-iw_if.h-don-t-include-linux-if.h.patch b/package/wavemon/0001-iw_if.h-don-t-include-linux-if.h.patch
deleted file mode 100644
index 95f54e4b7f..0000000000
--- a/package/wavemon/0001-iw_if.h-don-t-include-linux-if.h.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From 4ac1482bb40376e47805c3737dfed60abb1dd3b4 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Wed, 22 Dec 2021 00:39:35 +0100
-Subject: [PATCH] iw_if.h: don't include linux/if.h (#109)
-
-Don't include linux/if.h to avoid the following build failure:
-
-In file included from iw_if.h:31:0,
-                 from conf.c:19:
-/home/buildroot/autobuild/instance-3/output-1/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/linux/if.h: At top level:
-/home/buildroot/autobuild/instance-3/output-1/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/linux/if.h:143:8: error: redefinition of 'struct ifmap'
- struct ifmap {
-        ^
-In file included from iw_if.h:26:0,
-                 from conf.c:19:
-/home/buildroot/autobuild/instance-3/output-1/host/arm-buildroot-linux-gnueabi/sysroot/usr/include/net/if.h:111:8: note: originally defined here
- struct ifmap
-        ^
-
-Fixes:
- - http://autobuild.buildroot.org/results/a6ee162cf04b70b144b54e1ca4b7b2421071c50c
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://github.com/uoaerg/wavemon/commit/4ac1482bb40376e47805c3737dfed60abb1dd3b4]
----
- iw_if.h | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/iw_if.h b/iw_if.h
-index 9e7fa89..6607e0b 100644
---- a/iw_if.h
-+++ b/iw_if.h
-@@ -28,7 +28,6 @@
- #include <net/ethernet.h>
- #include <sys/types.h>
- #include <sys/socket.h>
--#include <linux/if.h>
- 
- /* Definitions from linux/ieee80211.h (not necessarily part of distro headers) */
- #define WLAN_CAPABILITY_ESS		(1<<0)
diff --git a/package/wavemon/wavemon.hash b/package/wavemon/wavemon.hash
index 7c685f6500..342f2f7d91 100644
--- a/package/wavemon/wavemon.hash
+++ b/package/wavemon/wavemon.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  e7e4167292136ca7ff12ddeb880904c10f33e97620ea6aa5f7838e859fdb40ed  wavemon-0.9.4.tar.gz
+sha256  f84c55a40b470f2b98908d20cd0b38ffef6f587daed23b50281c9592df3331c6  wavemon-0.9.5.tar.gz
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  LICENSE
diff --git a/package/wavemon/wavemon.mk b/package/wavemon/wavemon.mk
index 50e3fd275e..74917e8392 100644
--- a/package/wavemon/wavemon.mk
+++ b/package/wavemon/wavemon.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WAVEMON_VERSION = 0.9.4
+WAVEMON_VERSION = 0.9.5
 WAVEMON_SITE = $(call github,uoaerg,wavemon,v$(WAVEMON_VERSION))
 WAVEMON_LICENSE = GPL-3.0+
 WAVEMON_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
