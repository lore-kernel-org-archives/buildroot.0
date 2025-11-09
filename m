Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4D6ACD13D2
	for <buildroot@archiver.kernel.org>; Sun,  9 Nov 2025 21:44:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C0CC80AEB;
	Sun,  9 Nov 2025 21:44:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1pyGN1tSgduL; Sun,  9 Nov 2025 21:44:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 68FE880A4F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 68FE880A4F;
	Sun,  9 Nov 2025 21:44:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2EC9A25D
 for <buildroot@buildroot.org>; Sun,  9 Nov 2025 21:44:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 132086087E
 for <buildroot@buildroot.org>; Sun,  9 Nov 2025 21:44:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 357W5VTd-Xhz for <buildroot@buildroot.org>;
 Sun,  9 Nov 2025 21:44:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E97366087D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E97366087D
 for <buildroot@buildroot.org>; Sun,  9 Nov 2025 21:44:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E3A9584273; Sun,  9 Nov 2025 21:44:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 9 Nov 2025 21:58:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 304a2231cbdffac7be5fd8a90a92801e43181fcd
X-Git-Newrev: 4d65abce7ef56a7e457326a211f7a3ea4d9e3fe6
X-Patchwork-Hint: ignore
Message-Id: <20251109214426.E3A9584273@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cryptodev-linux: bump to version
 1.14
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5040614827712839802=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5040614827712839802==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=4d65abce7ef56a7e457326a211f7a3ea4d9e3fe6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The removed patches has been merged upstream.

Release notes:
https://github.com/cryptodev-linux/cryptodev-linux/blob/master/NEWS

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../0001-zero-copy-Fix-build-for-Linux-6-4.patch   | 37 ------------------
 ...yptodev_verbosity-Fix-build-for-Linux-6-4.patch | 44 ----------------------
 .../0003-Fix-build-for-Linux-6-7-rc1.patch         | 38 -------------------
 package/cryptodev-linux/cryptodev-linux.hash       |  2 +-
 package/cryptodev-linux/cryptodev-linux.mk         |  2 +-
 5 files changed, 2 insertions(+), 121 deletions(-)

diff --git a/package/cryptodev-linux/0001-zero-copy-Fix-build-for-Linux-6-4.patch b/package/cryptodev-linux/0001-zero-copy-Fix-build-for-Linux-6-4.patch
deleted file mode 100644
index 4bea55311c..0000000000
--- a/package/cryptodev-linux/0001-zero-copy-Fix-build-for-Linux-6-4.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 592017c3a910a3905b1925aee88c4674e9a596b7 Mon Sep 17 00:00:00 2001
-From: Gaurav Jain <gaurav.jain@nxp.com>
-Date: Tue, 30 May 2023 17:09:42 +0530
-Subject: [PATCH] zero copy: Fix build for Linux 6.4
-
-get_user_pages_remote api prototype is changed in kernel.
-struct vm_area_struct **vmas argument is removed.
-Migrate to the new API.
-
-Signed-off-by: Gaurav Jain <gaurav.jain@nxp.com>
-
-Upstream: https://github.com/cryptodev-linux/cryptodev-linux/commit/592017c3a910a3905b1925aee88c4674e9a596b7
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- zc.c | 6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/zc.c b/zc.c
-index fdf7da17..6637945a 100644
---- a/zc.c
-+++ b/zc.c
-@@ -80,10 +80,14 @@ int __get_userbuf(uint8_t __user *addr, uint32_t len, int write,
- 	ret = get_user_pages_remote(task, mm,
- 			(unsigned long)addr, pgcount, write ? FOLL_WRITE : 0,
- 			pg, NULL, NULL);
--#else
-+#elif (LINUX_VERSION_CODE < KERNEL_VERSION(6, 4, 0))
- 	ret = get_user_pages_remote(mm,
- 			(unsigned long)addr, pgcount, write ? FOLL_WRITE : 0,
- 			pg, NULL, NULL);
-+#else
-+	ret = get_user_pages_remote(mm,
-+			(unsigned long)addr, pgcount, write ? FOLL_WRITE : 0,
-+			pg, NULL);
- #endif
- #if (LINUX_VERSION_CODE < KERNEL_VERSION(5, 8, 0))
- 	up_read(&mm->mmap_sem);
diff --git a/package/cryptodev-linux/0002-cryptodev_verbosity-Fix-build-for-Linux-6-4.patch b/package/cryptodev-linux/0002-cryptodev_verbosity-Fix-build-for-Linux-6-4.patch
deleted file mode 100644
index e6022c686f..0000000000
--- a/package/cryptodev-linux/0002-cryptodev_verbosity-Fix-build-for-Linux-6-4.patch
+++ /dev/null
@@ -1,44 +0,0 @@
-From 99ae2a39ddc3f89c66d9f09783b591c0f2dbf2e9 Mon Sep 17 00:00:00 2001
-From: Gaurav Jain <gaurav.jain@nxp.com>
-Date: Wed, 28 Jun 2023 12:44:32 +0530
-Subject: [PATCH] cryptodev_verbosity: Fix build for Linux 6.4
-
-register_sysctl_table api is removed in kernel.
-migrate to the new api register_sysctl.
-
-child is also removed in linux 6.4 ctl_table struct.
-
-Signed-off-by: Gaurav Jain <gaurav.jain@nxp.com>
-
-Upstream: https://github.com/cryptodev-linux/cryptodev-linux/commit/99ae2a39ddc3f89c66d9f09783b591c0f2dbf2e9
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- ioctl.c | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/ioctl.c b/ioctl.c
-index 8f241b86..4262bbd5 100644
---- a/ioctl.c
-+++ b/ioctl.c
-@@ -1246,7 +1246,9 @@ static struct ctl_table verbosity_ctl_root[] = {
- 	{
- 		.procname       = "ioctl",
- 		.mode           = 0555,
-+#if (LINUX_VERSION_CODE < KERNEL_VERSION(6, 4, 0))
- 		.child          = verbosity_ctl_dir,
-+#endif
- 	},
- 	{},
- };
-@@ -1267,7 +1269,11 @@ static int __init init_cryptodev(void)
- 		return rc;
- 	}
- 
-+#if (LINUX_VERSION_CODE < KERNEL_VERSION(6, 4, 0))
- 	verbosity_sysctl_header = register_sysctl_table(verbosity_ctl_root);
-+#else
-+	verbosity_sysctl_header = register_sysctl(verbosity_ctl_root->procname, verbosity_ctl_dir);
-+#endif
- 
- 	pr_info(PFX "driver %s loaded.\n", VERSION);
- 
diff --git a/package/cryptodev-linux/0003-Fix-build-for-Linux-6-7-rc1.patch b/package/cryptodev-linux/0003-Fix-build-for-Linux-6-7-rc1.patch
deleted file mode 100644
index 4fdccaf6e0..0000000000
--- a/package/cryptodev-linux/0003-Fix-build-for-Linux-6-7-rc1.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 5e7121e45ff283d30097da381fd7e97c4bb61364 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Joan=20Bruguera=20Mic=C3=B3?= <joanbrugueram@gmail.com>
-Date: Sun, 10 Dec 2023 13:57:55 +0000
-Subject: [PATCH] Fix build for Linux 6.7-rc1
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-Since Linux 6.7-rc1, no ahash algorithms set a nonzero alignmask,
-and therefore `crypto_ahash_alignmask` has been removed.
-
-See also: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=0f8660c82b79af595b056f6b9f4f227edeb88574
-          https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=c626910f3f1bbce6ad18bc613d895d2a089ed95e
-
-Signed-off-by: Joan Bruguera Micó <joanbrugueram@gmail.com>
-
-Upstream: https://github.com/cryptodev-linux/cryptodev-linux/commit/5e7121e45ff283d30097da381fd7e97c4bb61364
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- cryptlib.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/cryptlib.c b/cryptlib.c
-index 4d739e5..0e59d4c 100644
---- a/cryptlib.c
-+++ b/cryptlib.c
-@@ -381,7 +381,11 @@ int cryptodev_hash_init(struct hash_data *hdata, const char *alg_name,
- 	}
- 
- 	hdata->digestsize = crypto_ahash_digestsize(hdata->async.s);
-+#if (LINUX_VERSION_CODE < KERNEL_VERSION(6, 7, 0))
- 	hdata->alignmask = crypto_ahash_alignmask(hdata->async.s);
-+#else
-+	hdata->alignmask = 0;
-+#endif
- 
- 	init_completion(&hdata->async.result.completion);
- 
diff --git a/package/cryptodev-linux/cryptodev-linux.hash b/package/cryptodev-linux/cryptodev-linux.hash
index 300aa3bcd4..66263f493d 100644
--- a/package/cryptodev-linux/cryptodev-linux.hash
+++ b/package/cryptodev-linux/cryptodev-linux.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  33b7915c46eb39a37110e88c681423c0dd0df25d784b6e1475ac3196367f0db5  cryptodev-linux-1.13.tar.gz
+sha256  67223d5bee4749028e78e87372cee3bca79d9a20f7b6cb915aa080c59d2a2d98  cryptodev-linux-1.14.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/cryptodev-linux/cryptodev-linux.mk b/package/cryptodev-linux/cryptodev-linux.mk
index 550a248a27..0010ad40e0 100644
--- a/package/cryptodev-linux/cryptodev-linux.mk
+++ b/package/cryptodev-linux/cryptodev-linux.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CRYPTODEV_LINUX_VERSION = 1.13
+CRYPTODEV_LINUX_VERSION = 1.14
 CRYPTODEV_LINUX_SITE = $(call github,cryptodev-linux,cryptodev-linux,cryptodev-linux-$(CRYPTODEV_LINUX_VERSION))
 CRYPTODEV_LINUX_INSTALL_STAGING = YES
 CRYPTODEV_LINUX_LICENSE = GPL-2.0+

--===============5040614827712839802==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5040614827712839802==--
