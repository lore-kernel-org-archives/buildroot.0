Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59272C433EF
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 21:46:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E0DA5402A9;
	Fri,  7 Jan 2022 21:46:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lnSkRReyWpIJ; Fri,  7 Jan 2022 21:46:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 101A7402B9;
	Fri,  7 Jan 2022 21:46:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 470421BF35A
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 21:46:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3BE70813D1
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 21:46:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qx722QeFQ6Pe for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 21:46:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 01757813B8
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 21:46:04 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id a5so9528724wrh.5
 for <buildroot@buildroot.org>; Fri, 07 Jan 2022 13:46:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PYZE8+MZ6/8tz05eamPDadDlS4ba2slEBAryVa7IIqY=;
 b=DKe9UtdHOWX9QVnphRRXh53wXD1ZUbDx8DnYqYmtxIecNAkzkQGM6vNGV830cFtJ8B
 yXPVtxp/OwxpPwhghV6yebYQfbfKd6ETcL6Ltt9lIN0qrDnFBvtvTspR9TAEBQH/ppBb
 tP3HMMffOTQXV1qhXrO7iPLhYiB/LnOZYZZSsDv/8vA79UH6Aa83DySrhJhIUqpAh94m
 9hWSH1be1+lqLXEjfZVasVJF5EmbXO7BzKlYPbxdZ/eb0MeoWSDJjUqUuzwu0dw/E+qq
 8Ed0Uk7pEgHB6tL0B4zbPCxHpJ6s+DhJLGLmuRlnhUyA9IVnrqaNOSCcSOVhG8Ibhgcl
 X9XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PYZE8+MZ6/8tz05eamPDadDlS4ba2slEBAryVa7IIqY=;
 b=8LwJIBYUoQkgVWxgJt/yP9rD8BoWzday6muERt7Y/TDHEYwBTztipo30JF39CIgVqb
 MUblbEZGKDKu1+3k+FT7zrhGi2P0l3mT5A3rnV667D/G/AykAMh745GoU3OPlDOKQ62B
 E5CiqNJ73ziH6vJGhMiSgIcEVocrnEb5HhZ8M4ZiCqpt77Ve/8fjGG0tB1ddCNIbvx9z
 pF4o1XhVK64K5quQK+YSQWMBtYsYO9XkaS0+m6D+7qR1hxvVYqYmvwrHUP2ZF3fvPtoE
 uU7xchAyqpdREWzR2eno7pT5TI1lawSNWd1nxGVZBmM8fdzCPInE0poO1hGQjG8Xtkg5
 wq/w==
X-Gm-Message-State: AOAM531mw+O0PDNO1IXxqldzx4cqe4oZBAy0HeFW9OQieHI/XBO7hgmr
 9rnWBrr5gO69tyUFrK0yI2TwFdKmiz7FDw==
X-Google-Smtp-Source: ABdhPJyWSGLvsu/C3jg7sRx2rWd4amOeA3xbVM+BeMOTzjEeEB38qZaR303+msS5q/Zq2R5IZvT+lQ==
X-Received: by 2002:a05:6000:22a:: with SMTP id
 l10mr55115985wrz.39.1641591962714; 
 Fri, 07 Jan 2022 13:46:02 -0800 (PST)
Received: from P-NTS-Evian.home
 (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
 by smtp.gmail.com with ESMTPSA id b17sm5629370wrq.91.2022.01.07.13.46.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 13:46:02 -0800 (PST)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Fri,  7 Jan 2022 22:46:00 +0100
Message-Id: <20220107214600.54727-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/systemd: bump to version 250.1
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
Cc: Romain Naour <romain.naour@smile.fr>, Norbert Lange <nolange79@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Remove upstream patch

Fixes a build issue with toolchains using kernel headers < 5.6,
when the openat2(2) syscall is not available [2].

Add a new patch to fix homework-mount with linux-headers < 5.2.

[1] https://github.com/systemd/systemd-stable/commit/cd88d010e862d26ce816eb3bd6735a80999ac41e
[2] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=fddb5d430ad9fa91b49b1d34d0202ffe2fa0e179

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: Norbert Lange <nolange79@gmail.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...define-MOVE_MOUNT_T_EMPTY_PATH-if-mi.patch | 33 ++++++++
 ...ll-define-all-MOUNT_ATTR_-if-missing.patch | 84 -------------------
 package/systemd/systemd.hash                  |  2 +-
 package/systemd/systemd.mk                    |  2 +-
 4 files changed, 35 insertions(+), 86 deletions(-)
 create mode 100644 package/systemd/0001-missing-syscall-define-MOVE_MOUNT_T_EMPTY_PATH-if-mi.patch
 delete mode 100644 package/systemd/0001-missing-syscall-define-all-MOUNT_ATTR_-if-missing.patch

diff --git a/package/systemd/0001-missing-syscall-define-MOVE_MOUNT_T_EMPTY_PATH-if-mi.patch b/package/systemd/0001-missing-syscall-define-MOVE_MOUNT_T_EMPTY_PATH-if-mi.patch
new file mode 100644
index 0000000000..0934886acb
--- /dev/null
+++ b/package/systemd/0001-missing-syscall-define-MOVE_MOUNT_T_EMPTY_PATH-if-mi.patch
@@ -0,0 +1,33 @@
+From 16c132a6a0389e0eaea70c4ad95dbfd1637ec5ba Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@smile.fr>
+Date: Fri, 7 Jan 2022 22:25:23 +0100
+Subject: [PATCH] missing-syscall: define MOVE_MOUNT_T_EMPTY_PATH if missing
+
+MOVE_MOUNT_T_EMPTY_PATH has been added to systemd 250 by [1]
+but it's defined in kernel headers since version 5.2.
+
+[1] c7bf079bbc19e3b409acc0c7acc3e14749211fe2
+
+Signed-off-by: Romain Naour <romain.naour@smile.fr>
+---
+ src/basic/missing_syscall.h | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/basic/missing_syscall.h b/src/basic/missing_syscall.h
+index 8267b1a90c..793d111c55 100644
+--- a/src/basic/missing_syscall.h
++++ b/src/basic/missing_syscall.h
+@@ -569,6 +569,10 @@ static inline int missing_open_tree(
+ #define MOVE_MOUNT_F_EMPTY_PATH 0x00000004 /* Empty from path permitted */
+ #endif
+ 
++#ifndef MOVE_MOUNT_T_EMPTY_PATH
++#define MOVE_MOUNT_T_EMPTY_PATH 0x00000040 /* Empty to path permitted */
++#endif
++
+ static inline int missing_move_mount(
+                 int from_dfd,
+                 const char *from_pathname,
+-- 
+2.31.1
+
diff --git a/package/systemd/0001-missing-syscall-define-all-MOUNT_ATTR_-if-missing.patch b/package/systemd/0001-missing-syscall-define-all-MOUNT_ATTR_-if-missing.patch
deleted file mode 100644
index d0c4f6eaa0..0000000000
--- a/package/systemd/0001-missing-syscall-define-all-MOUNT_ATTR_-if-missing.patch
+++ /dev/null
@@ -1,84 +0,0 @@
-From 0764e3a327573e7bda2f0e1a914f28482ab00574 Mon Sep 17 00:00:00 2001
-From: Yu Watanabe <watanabe.yu+github@gmail.com>
-Date: Fri, 24 Dec 2021 09:15:51 +0900
-Subject: [PATCH] missing-syscall: define all MOUNT_ATTR_* if missing
-
-Fixes #21876.
-
-Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
-[james.hilliard1@gmail.com: backport from upstream commit
-0764e3a327573e7bda2f0e1a914f28482ab00574]
----
- src/basic/missing_syscall.h | 48 ++++++++++++++++++++++++++++++++-----
- 1 file changed, 42 insertions(+), 6 deletions(-)
-
-diff --git a/src/basic/missing_syscall.h b/src/basic/missing_syscall.h
-index 3da30e6f0e..0b0cc3cec2 100644
---- a/src/basic/missing_syscall.h
-+++ b/src/basic/missing_syscall.h
-@@ -462,20 +462,56 @@ struct mount_attr {
- struct mount_attr;
- #endif
- 
-+#ifndef MOUNT_ATTR_RDONLY
-+#define MOUNT_ATTR_RDONLY       0x00000001 /* Mount read-only */
-+#endif
-+
-+#ifndef MOUNT_ATTR_NOSUID
-+#define MOUNT_ATTR_NOSUID       0x00000002 /* Ignore suid and sgid bits */
-+#endif
-+
-+#ifndef MOUNT_ATTR_NODEV
-+#define MOUNT_ATTR_NODEV        0x00000004 /* Disallow access to device special files */
-+#endif
-+
-+#ifndef MOUNT_ATTR_NOEXEC
-+#define MOUNT_ATTR_NOEXEC       0x00000008 /* Disallow program execution */
-+#endif
-+
-+#ifndef MOUNT_ATTR__ATIME
-+#define MOUNT_ATTR__ATIME       0x00000070 /* Setting on how atime should be updated */
-+#endif
-+
-+#ifndef MOUNT_ATTR_RELATIME
-+#define MOUNT_ATTR_RELATIME     0x00000000 /* - Update atime relative to mtime/ctime. */
-+#endif
-+
-+#ifndef MOUNT_ATTR_NOATIME
-+#define MOUNT_ATTR_NOATIME      0x00000010 /* - Do not update access times. */
-+#endif
-+
-+#ifndef MOUNT_ATTR_STRICTATIME
-+#define MOUNT_ATTR_STRICTATIME  0x00000020 /* - Always perform atime updates */
-+#endif
-+
-+#ifndef MOUNT_ATTR_NODIRATIME
-+#define MOUNT_ATTR_NODIRATIME   0x00000080 /* Do not update directory access times */
-+#endif
-+
- #ifndef MOUNT_ATTR_IDMAP
--#define MOUNT_ATTR_IDMAP 0x00100000
-+#define MOUNT_ATTR_IDMAP        0x00100000 /* Idmap mount to @userns_fd in struct mount_attr. */
- #endif
- 
- #ifndef MOUNT_ATTR_NOSYMFOLLOW
--#define MOUNT_ATTR_NOSYMFOLLOW 0x00200000
-+#define MOUNT_ATTR_NOSYMFOLLOW  0x00200000 /* Do not follow symlinks */
- #endif
- 
--#ifndef AT_RECURSIVE
--#define AT_RECURSIVE 0x8000
-+#ifndef MOUNT_ATTR_SIZE_VER0
-+#define MOUNT_ATTR_SIZE_VER0    32 /* sizeof first published struct */
- #endif
- 
--#ifndef MOUNT_ATTR_SIZE_VER0
--#define MOUNT_ATTR_SIZE_VER0 32
-+#ifndef AT_RECURSIVE
-+#define AT_RECURSIVE 0x8000
- #endif
- 
- static inline int missing_mount_setattr(
--- 
-2.25.1
-
diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
index cc33cd4c52..f89b2ce17d 100644
--- a/package/systemd/systemd.hash
+++ b/package/systemd/systemd.hash
@@ -1,5 +1,5 @@
 # sha256 locally computed
-sha256  41317fb443f7555de427aea69fda36c74661e77b58203cd6587eb8e1f612f46b  systemd-250.tar.gz
+sha256  ccfdd97679972cd3d9fb15bc3c647a3ee3351a434e20e1e3eec2851caa1b4849  systemd-250.1.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE.GPL2
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE.LGPL2.1
 sha256  e5a8645ad94aab24e312dd0c6be2aa54236eb9374480b1b14ea5c61598874fd5  LICENSES/BSD-2-Clause.txt
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index 0b52cc47d1..404943c45c 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SYSTEMD_VERSION = 250
+SYSTEMD_VERSION = 250.1
 SYSTEMD_SITE = $(call github,systemd,systemd-stable,v$(SYSTEMD_VERSION))
 SYSTEMD_LICENSE = \
 	LGPL-2.1+, \
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
