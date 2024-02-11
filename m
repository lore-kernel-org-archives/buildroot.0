Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62674C4829B
	for <buildroot@archiver.kernel.org>; Sun, 11 Feb 2024 21:36:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2096C84201;
	Sun, 11 Feb 2024 21:36:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M-p5LDvBO3SE; Sun, 11 Feb 2024 21:36:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D95E4840C5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D95E4840C5;
	Sun, 11 Feb 2024 21:36:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1A4171BF2EF
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 21:36:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 072A6418FF
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 21:36:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aEuEmmV9E7te for <buildroot@lists.busybox.net>;
 Sun, 11 Feb 2024 21:36:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 10B35418FD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 10B35418FD
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 21:36:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F06BA877A4; Sun, 11 Feb 2024 21:36:16 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 11 Feb 2024 22:34:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b1662a165c6d9762c4e77743ea930dcfa3ffd4cb
X-Git-Newrev: ad8608df6b95737eb9a93e7335ab714fee45ae1c
X-Patchwork-Hint: ignore
Message-Id: <20240211213616.F06BA877A4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/{mesa3d,
 mesa3d-headers}: bump version to 24.0.0
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
Content-Type: multipart/mixed; boundary="===============8813548545481740139=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8813548545481740139==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=ad8608df6b95737eb9a93e7335ab714fee45ae1c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Release notes:
https://lists.freedesktop.org/archives/mesa-announce/2024-February/000747.html
https://cgit.freedesktop.org/mesa/mesa/tree/docs/relnotes/24.0.0.rst?h=24.0

Removed patch which is included in this release.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mesa3d-headers/mesa3d-headers.mk           |  2 +-
 ...e_file_description-fix-unknown-linux-3.5-.patch | 68 ----------------------
 package/mesa3d/mesa3d.hash                         |  6 +-
 package/mesa3d/mesa3d.mk                           |  2 +-
 4 files changed, 5 insertions(+), 73 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index b9b328b268..1d006dbc91 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 23.3.5
+MESA3D_HEADERS_VERSION = 24.0.0
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://archive.mesa3d.org
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/0005-util-os_same_file_description-fix-unknown-linux-3.5-.patch b/package/mesa3d/0005-util-os_same_file_description-fix-unknown-linux-3.5-.patch
deleted file mode 100644
index c011580f6b..0000000000
--- a/package/mesa3d/0005-util-os_same_file_description-fix-unknown-linux-3.5-.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-From b60974fac8a2f4c85cbb2ca788fc4ec3e81998f9 Mon Sep 17 00:00:00 2001
-From: Thomas Devoogdt <thomas.devoogdt@barco.com>
-Date: Tue, 17 Aug 2021 11:54:49 +0200
-Subject: [PATCH] util: os_same_file_description: fix unknown linux < 3.5
- syscall SYS_kcmp
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-https://man7.org/linux/man-pages/man2/kcmp.2.html
-
-The kcmp() system call first appeared in Linux 3.5.
-
-But was probably also not supported by all major platforms
-at that time. So fallback to the check that is done for windows.
-
-Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
-Acked-by: Yonggang Luo <luoyonggang@gmail.com>
-Acked-by: Michel Dänzer <mdaenzer@redhat.com>
-Upstream: https://gitlab.freedesktop.org/mesa/mesa/-/commit/3ef514982441ce496aa127611edd26b9867f4b95
-Signed-off-by: Thomas Devoogdt <thomas@devoogdt.com>
----
- src/util/os_file.c | 18 ++++++------------
- 1 file changed, 6 insertions(+), 12 deletions(-)
-
-diff --git a/src/util/os_file.c b/src/util/os_file.c
-index 5fb30f2d908..464425a9b87 100644
---- a/src/util/os_file.c
-+++ b/src/util/os_file.c
-@@ -202,29 +202,23 @@ os_read_file(const char *filename, size_t *size)
- /* copied from <linux/kcmp.h> */
- #define KCMP_FILE 0
- 
-+#endif
-+
- int
- os_same_file_description(int fd1, int fd2)
- {
-+#ifdef SYS_kcmp
-    pid_t pid = getpid();
-+#endif
- 
-    /* Same file descriptor trivially implies same file description */
-    if (fd1 == fd2)
-       return 0;
- 
-+#ifdef SYS_kcmp
-    return syscall(SYS_kcmp, pid, pid, KCMP_FILE, fd1, fd2);
--}
--
- #else
--
--int
--os_same_file_description(int fd1, int fd2)
--{
--   /* Same file descriptor trivially implies same file description */
--   if (fd1 == fd2)
--      return 0;
--
-    /* Otherwise we can't tell */
-    return -1;
--}
--
- #endif
-+}
--- 
-2.34.1
-
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 7e49119c41..49b42e2132 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,5 +1,5 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2024-February/000748.html
-sha256  69ccb1278641ff5bad71ca0f866188aeb1a92aadc4dbb9d35f50aebec5b8b50f  mesa-23.3.5.tar.xz
-sha512  1ad29f524caee0000ef51abe58d29d9687de5fbc5168f7e677bb4e69c5e9a94918d5fbf6e10c6757fe7ce6d47bab109e452f0fa2e26aad2e6f8bfb744383b5ea  mesa-23.3.5.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2024-February/000747.html
+sha256  dc7e8c077bc5884df95478263b34bdebb7e88e600689cb56fb07be2b8c304c36  mesa-24.0.0.tar.xz
+sha512  9dfdea7cebb37b9c020335e24194b39b399f48b5af6eec30c3455108276ac4e29e7b06df942cb2abc7afa667784968c0c43d19b9afe30ef03021b9cb6a789f15  mesa-24.0.0.tar.xz
 # License
 sha256  a00275a53178e2645fb65be99a785c110513446a5071ff2c698ed260ad917d75  docs/license.rst
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index d622d513f0..8e3cd7245d 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 23.3.5
+MESA3D_VERSION = 24.0.0
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://archive.mesa3d.org
 MESA3D_LICENSE = MIT, SGI, Khronos

--===============8813548545481740139==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8813548545481740139==--
