Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5058C001B3
	for <buildroot@archiver.kernel.org>; Mon,  3 Jul 2023 19:52:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 809D581EB5;
	Mon,  3 Jul 2023 19:52:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 809D581EB5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A--i_mzgcK4w; Mon,  3 Jul 2023 19:52:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7E4CD81E89;
	Mon,  3 Jul 2023 19:52:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7E4CD81E89
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 298871BF951
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 19:52:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 02031409A3
 for <buildroot@lists.busybox.net>; Mon,  3 Jul 2023 19:52:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 02031409A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tik5WJYMg75N for <buildroot@lists.busybox.net>;
 Mon,  3 Jul 2023 19:52:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 58B234090D
 for <buildroot@buildroot.org>; Mon,  3 Jul 2023 19:52:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 58B234090D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 34702864FA; Mon,  3 Jul 2023 19:52:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 3 Jul 2023 21:52:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 409a5f98767d5bb117504597f83446cb134586d8
X-Git-Newrev: 2bde8c744cbe420f2e85af7a63782bb89ca6da06
X-Patchwork-Hint: ignore
Message-Id: <20230703195239.34702864FA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xvisor: bump to version 0.3.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=2bde8c744cbe420f2e85af7a63782bb89ca6da06
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For change log since version 0.3.1, see:
https://www.xhypervisor.org/index.php?page=news/20230101
or
https://github.com/xvisor/xvisor/blob/master/docs/releases/v0.3.2

This commit also drop the patch, as an equivalent fix, included in this
version, was made upstream in:
https://github.com/xvisor/xvisor/commit/eb1d1dd4658c2bab6c49abb7bc51c231dc5cc0bd

The file .checkpackageignore is also updated to reflect this patch
removal.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                |   1 -
 ...0001-psmouse-back.c-fix-build-with-gcc-11.patch | 115 ---------------------
 package/xvisor/xvisor.hash                         |   2 +-
 package/xvisor/xvisor.mk                           |   2 +-
 4 files changed, 2 insertions(+), 118 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 0f6bdd92fa..a48712460f 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1660,7 +1660,6 @@ package/xinetd/0004-configure-rlim_t.patch Upstream
 package/xinetd/0005-CVE-2013-4342-xinetd-ignores-user-and-group-directiv.patch Upstream
 package/xl2tp/xl2tpd TrailingSpace
 package/xml-security-c/0001-fix-build-with-libressl-3.5.0.patch Upstream
-package/xvisor/0001-psmouse-back.c-fix-build-with-gcc-11.patch Upstream
 package/xxhash/0001-fix-man-page-installation.patch Upstream
 package/xxhash/0002-Makefile-add-dedicated-install-targets.patch Upstream
 package/xxhash/0003-do-no-longer-depend-on-assert-h-for-XXH_STATIC_ASSERT.patch Upstream
diff --git a/package/xvisor/0001-psmouse-back.c-fix-build-with-gcc-11.patch b/package/xvisor/0001-psmouse-back.c-fix-build-with-gcc-11.patch
deleted file mode 100644
index 1c02f45c9d..0000000000
--- a/package/xvisor/0001-psmouse-back.c-fix-build-with-gcc-11.patch
+++ /dev/null
@@ -1,115 +0,0 @@
-From 0e07e82121697d99470a147eadad9a708889c4df Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Thu, 2 Sep 2021 18:13:03 +0200
-Subject: [PATCH] psmouse-back.c: fix build with gcc 11
-
-Fix the following build failures with gcc 11 by defining inline
-functions as static:
-
-/home/buildroot/autobuild/instance-3/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/11.1.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: /home/buildroot/autobuild/instance-3/output-1/build/xvisor-0.3.0/build/drivers/drivers.o: in function `psmouse_extensions':
-/home/buildroot/autobuild/instance-3/output-1/build/xvisor-0.3.0/drivers/input/mouse/psmouse-base.c:783: undefined reference to `lifebook_detect'
-/home/buildroot/autobuild/instance-3/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/11.1.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: /home/buildroot/autobuild/instance-3/output-1/build/xvisor-0.3.0/drivers/input/mouse/psmouse-base.c:783: undefined reference to `alps_detect'
-/home/buildroot/autobuild/instance-3/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/11.1.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: /home/buildroot/autobuild/instance-3/output-1/build/xvisor-0.3.0/drivers/input/mouse/psmouse-base.c:783: undefined reference to `ps2pp_init'
-/home/buildroot/autobuild/instance-3/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/11.1.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: /home/buildroot/autobuild/instance-3/output-1/build/xvisor-0.3.0/drivers/input/mouse/psmouse-base.c:783: undefined reference to `trackpoint_detect'
-/home/buildroot/autobuild/instance-3/output-1/host/lib/gcc/arm-buildroot-linux-gnueabihf/11.1.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: /home/buildroot/autobuild/instance-3/output-1/build/xvisor-0.3.0/drivers/input/mouse/psmouse-base.c:783: undefined reference to `fsp_detect'
-
-Fixes:
- - http://autobuild.buildroot.org/results/69062b9c80567d135edd48890165e69881cf7295
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/xvisor/xvisor/pull/139]
----
- drivers/input/mouse/alps.h       | 4 ++--
- drivers/input/mouse/lifebook.h   | 6 +++---
- drivers/input/mouse/logips2pp.h  | 2 +-
- drivers/input/mouse/sentelic.h   | 4 ++--
- drivers/input/mouse/trackpoint.h | 2 +-
- 5 files changed, 9 insertions(+), 9 deletions(-)
-
-diff --git a/drivers/input/mouse/alps.h b/drivers/input/mouse/alps.h
-index ae1ac354..acc1e89e 100644
---- a/drivers/input/mouse/alps.h
-+++ b/drivers/input/mouse/alps.h
-@@ -51,11 +51,11 @@ struct alps_data {
- int alps_detect(struct psmouse *psmouse, bool set_properties);
- int alps_init(struct psmouse *psmouse);
- #else
--inline int alps_detect(struct psmouse *psmouse, bool set_properties)
-+static inline int alps_detect(struct psmouse *psmouse, bool set_properties)
- {
- 	return -ENOSYS;
- }
--inline int alps_init(struct psmouse *psmouse)
-+static inline int alps_init(struct psmouse *psmouse)
- {
- 	return -ENOSYS;
- }
-diff --git a/drivers/input/mouse/lifebook.h b/drivers/input/mouse/lifebook.h
-index 4c4326c6..0baf02a7 100644
---- a/drivers/input/mouse/lifebook.h
-+++ b/drivers/input/mouse/lifebook.h
-@@ -16,14 +16,14 @@ void lifebook_module_init(void);
- int lifebook_detect(struct psmouse *psmouse, bool set_properties);
- int lifebook_init(struct psmouse *psmouse);
- #else
--inline void lifebook_module_init(void)
-+static inline void lifebook_module_init(void)
- {
- }
--inline int lifebook_detect(struct psmouse *psmouse, bool set_properties)
-+static inline int lifebook_detect(struct psmouse *psmouse, bool set_properties)
- {
- 	return -ENOSYS;
- }
--inline int lifebook_init(struct psmouse *psmouse)
-+static inline int lifebook_init(struct psmouse *psmouse)
- {
- 	return -ENOSYS;
- }
-diff --git a/drivers/input/mouse/logips2pp.h b/drivers/input/mouse/logips2pp.h
-index 0c186f02..439e9c58 100644
---- a/drivers/input/mouse/logips2pp.h
-+++ b/drivers/input/mouse/logips2pp.h
-@@ -14,7 +14,7 @@
- #ifdef CONFIG_MOUSE_PS2_LOGIPS2PP
- int ps2pp_init(struct psmouse *psmouse, bool set_properties);
- #else
--inline int ps2pp_init(struct psmouse *psmouse, bool set_properties)
-+static inline int ps2pp_init(struct psmouse *psmouse, bool set_properties)
- {
- 	return -ENOSYS;
- }
-diff --git a/drivers/input/mouse/sentelic.h b/drivers/input/mouse/sentelic.h
-index aa697ece..42df9e3b 100644
---- a/drivers/input/mouse/sentelic.h
-+++ b/drivers/input/mouse/sentelic.h
-@@ -123,11 +123,11 @@ struct fsp_data {
- extern int fsp_detect(struct psmouse *psmouse, bool set_properties);
- extern int fsp_init(struct psmouse *psmouse);
- #else
--inline int fsp_detect(struct psmouse *psmouse, bool set_properties)
-+static inline int fsp_detect(struct psmouse *psmouse, bool set_properties)
- {
- 	return -ENOSYS;
- }
--inline int fsp_init(struct psmouse *psmouse)
-+static inline int fsp_init(struct psmouse *psmouse)
- {
- 	return -ENOSYS;
- }
-diff --git a/drivers/input/mouse/trackpoint.h b/drivers/input/mouse/trackpoint.h
-index e558a709..f14e59c0 100644
---- a/drivers/input/mouse/trackpoint.h
-+++ b/drivers/input/mouse/trackpoint.h
-@@ -145,7 +145,7 @@ struct trackpoint_data
- #ifdef CONFIG_MOUSE_PS2_TRACKPOINT
- int trackpoint_detect(struct psmouse *psmouse, bool set_properties);
- #else
--inline int trackpoint_detect(struct psmouse *psmouse, bool set_properties)
-+static inline int trackpoint_detect(struct psmouse *psmouse, bool set_properties)
- {
- 	return -ENOSYS;
- }
--- 
-2.32.0
-
diff --git a/package/xvisor/xvisor.hash b/package/xvisor/xvisor.hash
index 45b6fec49c..4676db9e8c 100644
--- a/package/xvisor/xvisor.hash
+++ b/package/xvisor/xvisor.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  b1bb2ca09340e87a2f465c65196892cdd0f59b798794ae69e35d1f883cf9ba49  xvisor-0.3.1.tar.xz
+sha256  fbced0f74b75758d4859d329b86c213bd24662168179ebfb2b02b987a1070215  xvisor-0.3.2.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/xvisor/xvisor.mk b/package/xvisor/xvisor.mk
index d7bb288ea8..eba37be9b7 100644
--- a/package/xvisor/xvisor.mk
+++ b/package/xvisor/xvisor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XVISOR_VERSION = 0.3.1
+XVISOR_VERSION = 0.3.2
 XVISOR_SOURCE = xvisor-$(XVISOR_VERSION).tar.xz
 XVISOR_SITE = http://www.xhypervisor.org/tarball
 XVISOR_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
