Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CA44C433F5
	for <buildroot@archiver.kernel.org>; Sat, 11 Dec 2021 21:39:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B57F141FCB;
	Sat, 11 Dec 2021 21:39:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8jPOi9jeP-sS; Sat, 11 Dec 2021 21:39:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 085AB41FC6;
	Sat, 11 Dec 2021 21:39:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 119F11BF3A0
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 21:39:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 00BC441FC6
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 21:39:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AQylLg8XgOKb for <buildroot@lists.busybox.net>;
 Sat, 11 Dec 2021 21:39:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 69DC341FC5
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 21:39:19 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id c4so20752172wrd.9
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 13:39:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UKkAJWCsQ/JLz6FwhFK14RmHlYnx6tIne2quzt4u19o=;
 b=TWc2p1dp7Q1VAB4nmfjzMWUTgvuYNMgEt1idao+2OilMi2cfnHWYuFnBptL2+oqLTb
 1f76Q5SXJfwPDVNXigXkMGGSOlQ0BYGoOEPV0+enZSDws+lPhsQkc7HeSKJkFSDSrpr6
 fKjSwRRb2iIQfZT3u2ByRAYl777QQPHrVu3q+x+pXkcFvrl5iKe0JljRLnM9u2O0P5kM
 bGdHS4oF2nKbM8o6WBNoww+RzpjXg1c6fu0vASyes2y4VM8gIT+vy5S+R7vm4pj58ARR
 1iNd3mM7KPKvrMtBCTj3m5zbLfp6H7Yr8s4VWfLDA/nwg2Z0QEMVUpkxspQw6r+74Mvs
 JSqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UKkAJWCsQ/JLz6FwhFK14RmHlYnx6tIne2quzt4u19o=;
 b=VhPh+zeHgoi3Zh2mz/xXqvecAgfRJhx1CPWbOdIarHqPE0dmvMwL8TNlSWpsXoafmX
 ylGZIjGSbPw7ANjSZ6O72C+ZIPJ9CFRO4qhANIy0Oac+YG0FGpfz40fu6fZr9ahCF280
 47yhZAS/a7bwNCxTUzRRGhjF5gFkf4jyQ4UwysDViKhFpjJ1AYBlL8zbJkdEq8EBr4T1
 3ZCWR3b2j7DUbBEM80/2kI5R+FZ7cz2670ktOu7FNGwUe57UUaG4pdAb25V8wOPVszGW
 g6mGX3EjWD3unCNn9WlbVcwIscKrtDep8fOEAGX/Q4dsrIrdKsnkQFfgHZ4w+mzik1jp
 rnmQ==
X-Gm-Message-State: AOAM530KgVGHRRe6ccNp4v3klnZXU63l3boVJwydfCjqs0RwRgKs53r8
 Pqa6T7WAo5wXdg3TQdJ1G5ENhhwwU/IoQA==
X-Google-Smtp-Source: ABdhPJw1GLdV3Ew9k+wHVdeP3C+vi7rmKPpW0oKoWsIBUrV2FJZDtyVaGtfeMuLCHsL5vQLz1tryCg==
X-Received: by 2002:a5d:64c8:: with SMTP id f8mr1214769wri.435.1639258757471; 
 Sat, 11 Dec 2021 13:39:17 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id q123sm2397776wma.30.2021.12.11.13.39.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Dec 2021 13:39:17 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 11 Dec 2021 22:39:04 +0100
Message-Id: <20211211213904.562446-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/chrony: bump to version 4.1
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop patch (already in version)

https://git.tuxfamily.org/chrony/chrony.git/tree/NEWS?id=4.1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...-fix-build-with-older-kernel-headers.patch | 33 -------------------
 package/chrony/chrony.hash                    |  4 +--
 package/chrony/chrony.mk                      |  2 +-
 3 files changed, 3 insertions(+), 36 deletions(-)
 delete mode 100644 package/chrony/0001-sys_linux-fix-build-with-older-kernel-headers.patch

diff --git a/package/chrony/0001-sys_linux-fix-build-with-older-kernel-headers.patch b/package/chrony/0001-sys_linux-fix-build-with-older-kernel-headers.patch
deleted file mode 100644
index 892664f494..0000000000
--- a/package/chrony/0001-sys_linux-fix-build-with-older-kernel-headers.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 5dab78341bd515692f1b9ff8716a911c3ebf9ee1 Mon Sep 17 00:00:00 2001
-Message-Id: <5dab78341bd515692f1b9ff8716a911c3ebf9ee1.1611839550.git.baruch@tkos.co.il>
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Thu, 28 Jan 2021 15:02:40 +0200
-Subject: [PATCH] sys_linux: fix build with older kernel headers
-
-The renameat2 system call was introduced in kernel version 3.15. Fix
-build against older headers.
-
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: commit a2372b0c3abfc85d11c1684c0fb6370cc329e5c4
-
- sys_linux.c | 2 ++
- 1 file changed, 2 insertions(+)
-
-diff --git a/sys_linux.c b/sys_linux.c
-index 0b24445e173d..202da845edac 100644
---- a/sys_linux.c
-+++ b/sys_linux.c
-@@ -547,7 +547,9 @@ SYS_Linux_EnableSystemCallFilter(int level, SYS_ProcessContext context)
-     SCMP_SYS(readlinkat),
-     SCMP_SYS(rename),
-     SCMP_SYS(renameat),
-+#ifdef __NR_renameat2
-     SCMP_SYS(renameat2),
-+#endif
-     SCMP_SYS(stat),
-     SCMP_SYS(stat64),
-     SCMP_SYS(statfs),
--- 
-2.29.2
-
diff --git a/package/chrony/chrony.hash b/package/chrony/chrony.hash
index 87e0cf8ea0..f8dd1438bc 100644
--- a/package/chrony/chrony.hash
+++ b/package/chrony/chrony.hash
@@ -1,4 +1,4 @@
-# From https://listengine.tuxfamily.org/chrony.tuxfamily.org/chrony-announce/2020/10/msg00000.html
-sha256  be27ea14c55e7a4434b2fa51d53018c7051c42fa6a3198c9aa6a1658bae0c625  chrony-4.0.tar.gz
+# From https://listengine.tuxfamily.org/chrony.tuxfamily.org/chrony-announce/2021/05/msg00000.html
+sha256  ed76f2d3f9347ac6221a91ad4bd553dd0565ac188cd7490d0801d08f7171164c  chrony-4.1.tar.gz
 # Locally calculated
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/chrony/chrony.mk b/package/chrony/chrony.mk
index dc162a6c40..5a34f70e1e 100644
--- a/package/chrony/chrony.mk
+++ b/package/chrony/chrony.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CHRONY_VERSION = 4.0
+CHRONY_VERSION = 4.1
 CHRONY_SITE = http://download.tuxfamily.org/chrony
 CHRONY_LICENSE = GPL-2.0
 CHRONY_LICENSE_FILES = COPYING
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
