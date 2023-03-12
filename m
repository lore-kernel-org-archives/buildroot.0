Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A759CC6FD19
	for <buildroot@archiver.kernel.org>; Sun, 12 Mar 2023 22:00:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 572F441CA1;
	Sun, 12 Mar 2023 22:00:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 572F441CA1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nhcHH1wQnjZ3; Sun, 12 Mar 2023 22:00:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E09F41C9D;
	Sun, 12 Mar 2023 22:00:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E09F41C9D
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9C0AD1BF863
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 21:46:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9F2B060BC9
 for <buildroot@lists.busybox.net>; Sun, 12 Mar 2023 21:46:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F2B060BC9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PG8xdsXZmdnp for <buildroot@lists.busybox.net>;
 Sun, 12 Mar 2023 21:46:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 69F6360E1A
 for <buildroot@buildroot.org>; Sun, 12 Mar 2023 21:46:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 69F6360E1A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5391F87006; Sun, 12 Mar 2023 21:46:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 12 Mar 2023 10:59:03 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6a8e1e220fb283d57f07d68e96312a5215afd517
X-Git-Newrev: 9ce280ba180f8668bfcd92175842a3c2d9567223
X-Patchwork-Hint: ignore
Message-Id: <20230312214624.5391F87006@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcamera-apps: bump to version
 1.1.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=9ce280ba180f8668bfcd92175842a3c2d9567223
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...ore-pass-VIDIOC_QUERYCAP-as-unsigned-long.patch | 35 ----------------------
 package/libcamera-apps/libcamera-apps.hash         |  2 +-
 package/libcamera-apps/libcamera-apps.mk           |  2 +-
 3 files changed, 2 insertions(+), 37 deletions(-)

diff --git a/package/libcamera-apps/0001-core-pass-VIDIOC_QUERYCAP-as-unsigned-long.patch b/package/libcamera-apps/0001-core-pass-VIDIOC_QUERYCAP-as-unsigned-long.patch
deleted file mode 100644
index fbd1d2d4ba..0000000000
--- a/package/libcamera-apps/0001-core-pass-VIDIOC_QUERYCAP-as-unsigned-long.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From a65682a97e19f96b86aeceb3ca3befb1687e3861 Mon Sep 17 00:00:00 2001
-From: Marcus Folkesson <marcus.folkesson@gmail.com>
-Date: Tue, 31 Jan 2023 09:14:15 +0100
-Subject: [PATCH] core: pass VIDIOC_QUERYCAP as unsigned long
-
-VIDIOC_QUARYCAP is an unsigned long and should be passed as one.
-
-Get rid of the following error:
-core/libcamera_app.cpp:33:22: error: overflow in conversion from 'long unsigned int' to 'int' changes value from '2154321408' to '-2140645888' [-Werror=overflow]
-   33 |  int ret = ioctl(fd, VIDIOC_QUERYCAP, &caps);
-
-Upstream: https://github.com/raspberrypi/libcamera-apps/commit/a65682a97e19f96b86aeceb3ca3befb1687e3861
-Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
----
- core/libcamera_app.cpp | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/core/libcamera_app.cpp b/core/libcamera_app.cpp
-index 04696fb..8cb6563 100644
---- a/core/libcamera_app.cpp
-+++ b/core/libcamera_app.cpp
-@@ -30,7 +30,9 @@ static void check_camera_stack()
- 		return;
- 
- 	v4l2_capability caps;
--	int ret = ioctl(fd, VIDIOC_QUERYCAP, &caps);
-+	unsigned long request = VIDIOC_QUERYCAP;
-+
-+	int ret = ioctl(fd, request, &caps);
- 	close(fd);
- 
- 	if (ret < 0 || strcmp((char *)caps.driver, "bm2835 mmal"))
--- 
-2.38.1
-
diff --git a/package/libcamera-apps/libcamera-apps.hash b/package/libcamera-apps/libcamera-apps.hash
index fbb3150cb5..20a06aa8fe 100644
--- a/package/libcamera-apps/libcamera-apps.hash
+++ b/package/libcamera-apps/libcamera-apps.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  c05e29e02da05fa92739941295d96dcb93324805f7b348ad182e7e29e7e0c520  libcamera-apps-1.1.1.tar.gz
+sha256  a19f3960b97ec1c0d42df8af972868ff0d4c48be6096e7ac02dbaaa4c7c75636  libcamera-apps-1.1.2.tar.gz
 sha256  36dfed86bdef661a0a14ec1a1cc84c771d5a06b6f9b92e9ebb610ba711bd528a  license.txt
diff --git a/package/libcamera-apps/libcamera-apps.mk b/package/libcamera-apps/libcamera-apps.mk
index 290ee9a026..ba45ab21ca 100644
--- a/package/libcamera-apps/libcamera-apps.mk
+++ b/package/libcamera-apps/libcamera-apps.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBCAMERA_APPS_VERSION = 1.1.1
+LIBCAMERA_APPS_VERSION = 1.1.2
 LIBCAMERA_APPS_SITE = $(call github,raspberrypi,libcamera-apps,v$(LIBCAMERA_APPS_VERSION))
 LIBCAMERA_APPS_LICENSE = BSD-2-Clause
 LIBCAMERA_APPS_LICENSE_FILES = license.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
