Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E6C3C433EF
	for <buildroot@archiver.kernel.org>; Sat,  1 Jan 2022 18:27:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA0E860C20;
	Sat,  1 Jan 2022 18:27:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XhTV0VuXSFM6; Sat,  1 Jan 2022 18:27:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 059D760C12;
	Sat,  1 Jan 2022 18:27:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C0C811BF2F1
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 18:27:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9EFD340132
 for <buildroot@lists.busybox.net>; Sat,  1 Jan 2022 18:27:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Hev7E8zdomJY for <buildroot@lists.busybox.net>;
 Sat,  1 Jan 2022 18:27:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 393BD400E5
 for <buildroot@buildroot.org>; Sat,  1 Jan 2022 18:27:01 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id t26so61568874wrb.4
 for <buildroot@buildroot.org>; Sat, 01 Jan 2022 10:27:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+/VtmQw/kaB6yHnr2M2MxIK5dsaWsIsMNSzoJrIubos=;
 b=d/784uRICGRkC8Ly9P2HstqYhd8AawNtoYnKovjd9rkfGV96L2ljzwDos/dXiL3Qwl
 SJBYbTD+81UbzrA03+D7qwQ22C/77T2gzwOaEKfsUfYlsc9j+OEd18B6iLVRDFvPzehE
 kZgzepf905LrUs9gCS9lJ2he/JpsCwtZ2HRNZsWWwIWR2kwoz+/iogjl2TkPEYiWZWrZ
 Ru+MulF9Cd6jEQuBdkYD6Lt02xL+GaN9mht9+blgCyxwpy2l5orNz+KnGgUrUtmFJq68
 Av+F7wIoranWWnQyyTt/CGncDSREKtBeWob1F8gVVUqo7RiWHPN5sqHyWNkpre/TstGY
 SNig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+/VtmQw/kaB6yHnr2M2MxIK5dsaWsIsMNSzoJrIubos=;
 b=acnHvbgp7ebGQGJ6HNz308zDDml7r/GLENIBaC7Lt9NUxjjROqDaIakZ73Nmcnlg9L
 SEUOitQ8z2eUiyFPAQFi8yOQ1fGvOTxOHFUG+yLlOTwzLr63fkQmvR+TyUe27ElFjFjv
 z9hZqZbenStyx2cWyZ5A63DmotTbTrqpXWk46Jk2gjRKcBGycnn7zitv0OqDKNd3VOoN
 RNSGqpOmF8iOSYjUK9WJ1KBFVvqTJvRn3GCplnvfcSbNCL3Ac85hs3yXpWRh16aLmmVz
 xc8UbdleNub2XdUCqdAr0j66hfwn3J//i/sd8ZxvegypfB5BPy3nOV2aIGoqckI5ppsA
 K0eA==
X-Gm-Message-State: AOAM530Ez4WNYqS+P50LZtLRLWVUQTiPIsB00/30Clhe2vorXDPjznjB
 zo4oGJZ0e9TSJcXom1U0LoqwA1SBnr8=
X-Google-Smtp-Source: ABdhPJzRA//Getd1HdUAodN4UAVHW+6zUB9HCleX3e46MVF349fQ5JMF9JW9BIOCPv5Kh+Uh0VRceQ==
X-Received: by 2002:a05:6000:a:: with SMTP id
 h10mr34450672wrx.253.1641061619170; 
 Sat, 01 Jan 2022 10:26:59 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id p18sm9714514wms.16.2022.01.01.10.26.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Jan 2022 10:26:58 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  1 Jan 2022 19:25:57 +0100
Message-Id: <20220101182557.1915942-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/mdadm: bump to version 4.2
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

- Drop first patch and use install-bin target added by
  https://git.kernel.org/pub/scm/utils/mdadm/mdadm.git/commit/?id=b4a5ad4958cb3ad87c3c5fa993e7572c38596d09
- Drop second patch (already in version)
- Handle libudev optional dependency through CXFLAGS instead of
  overriding CFLAGS as wanted by upstream:
  https://git.kernel.org/pub/scm/utils/mdadm/mdadm.git/commit/?id=af3396dadfcd3b13480d021b8d3645c6d2420f79
- Update indentation in hash file (two spaces)

https://www.spinics.net/lists/raid/msg69218.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...-install-targets-for-mdadm-and-mdmon.patch | 32 -----------------
 ...-include-sysmacros.h-unconditionally.patch | 35 -------------------
 package/mdadm/mdadm.hash                      |  4 +--
 package/mdadm/mdadm.mk                        | 21 +++++++----
 4 files changed, 17 insertions(+), 75 deletions(-)
 delete mode 100644 package/mdadm/0001-add-install-targets-for-mdadm-and-mdmon.patch
 delete mode 100644 package/mdadm/0002-mdadm.h-include-sysmacros.h-unconditionally.patch

diff --git a/package/mdadm/0001-add-install-targets-for-mdadm-and-mdmon.patch b/package/mdadm/0001-add-install-targets-for-mdadm-and-mdmon.patch
deleted file mode 100644
index 15df7557e7..0000000000
--- a/package/mdadm/0001-add-install-targets-for-mdadm-and-mdmon.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-From a1a9243671b1e23123f57e879890325154b8e00d Mon Sep 17 00:00:00 2001
-From: Christophe Vu-Brugier <cvubrugier@lacie.com>
-Date: Wed, 6 Mar 2013 16:03:14 +0100
-Subject: [PATCH] Add install targets for mdadm and mdmon
-
-
-Signed-off-by: Christophe Vu-Brugier <cvubrugier@lacie.com>
----
- Makefile |    6 +++++-
- 1 file changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index 315455b..27d8eeb 100644
---- a/Makefile
-+++ b/Makefile
-@@ -231,8 +231,12 @@ $(MON_OBJS) : $(INCL) mdmon.h
- sha1.o : sha1.c sha1.h md5.h
- 	$(CC) $(CFLAGS) -DHAVE_STDINT_H -o sha1.o -c sha1.c
- 
--install : mdadm mdmon install-man install-udev
-+install : install-mdadm install-mdmon install-man install-udev
-+
-+install-mdadm :
- 	$(INSTALL) -D $(STRIP) -m 755 mdadm $(DESTDIR)$(BINDIR)/mdadm
-+
-+install-mdmon :
- 	$(INSTALL) -D $(STRIP) -m 755 mdmon $(DESTDIR)$(BINDIR)/mdmon
- 
- install-static : mdadm.static install-man
--- 
-1.7.10.4
-
diff --git a/package/mdadm/0002-mdadm.h-include-sysmacros.h-unconditionally.patch b/package/mdadm/0002-mdadm.h-include-sysmacros.h-unconditionally.patch
deleted file mode 100644
index c8944c8475..0000000000
--- a/package/mdadm/0002-mdadm.h-include-sysmacros.h-unconditionally.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 6c781ad75d92c6f65832810c44afcba1b2dffc41 Mon Sep 17 00:00:00 2001
-From: Baruch Siach <baruch@tkos.co.il>
-Date: Tue, 6 Aug 2019 16:01:15 +0300
-Subject: [PATCH] mdadm.h: include sysmacros.h unconditionally
-
-musl libc now also requires sys/sysmacros.h for the major/minor macros.
-All supported libc implementations carry sys/sysmacros.h, including
-diet-libc, klibc, and uclibc-ng.
-
-Cc: Hauke Mehrtens <hauke@hauke-m.de>
-Signed-off-by: Baruch Siach <baruch@tkos.co.il>
----
-Upstream status: https://marc.info/?l=linux-raid&m=156509677018508
-
- mdadm.h | 2 --
- 1 file changed, 2 deletions(-)
-
-diff --git a/mdadm.h b/mdadm.h
-index c36d7fdb10f6..d61a9ca82dc1 100644
---- a/mdadm.h
-+++ b/mdadm.h
-@@ -45,10 +45,8 @@ extern __off64_t lseek64 __P ((int __fd, __off64_t __offset, int __whence));
- #include	<errno.h>
- #include	<string.h>
- #include	<syslog.h>
--#ifdef __GLIBC__
- /* Newer glibc requires sys/sysmacros.h directly for makedev() */
- #include	<sys/sysmacros.h>
--#endif
- #ifdef __dietlibc__
- #include	<strings.h>
- /* dietlibc has deprecated random and srandom!! */
--- 
-2.20.1
-
diff --git a/package/mdadm/mdadm.hash b/package/mdadm/mdadm.hash
index b15cb4e031..b9631a2aaa 100644
--- a/package/mdadm/mdadm.hash
+++ b/package/mdadm/mdadm.hash
@@ -1,4 +1,4 @@
 # From https://www.kernel.org/pub/linux/utils/raid/mdadm/sha256sums.asc
-sha256 ab7688842908d3583a704d491956f31324c3a5fc9f6a04653cb75d19f1934f4a  mdadm-4.1.tar.xz
+sha256  461c215670864bb74a4d1a3620684aa2b2f8296dffa06743f26dda5557acf01d  mdadm-4.2.tar.xz
 # Locally calculated
-sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/mdadm/mdadm.mk b/package/mdadm/mdadm.mk
index 171782712f..6ee0bb60c9 100644
--- a/package/mdadm/mdadm.mk
+++ b/package/mdadm/mdadm.mk
@@ -4,14 +4,19 @@
 #
 ################################################################################
 
-MDADM_VERSION = 4.1
+MDADM_VERSION = 4.2
 MDADM_SOURCE = mdadm-$(MDADM_VERSION).tar.xz
 MDADM_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/raid/mdadm
 MDADM_LICENSE = GPL-2.0+
 MDADM_LICENSE_FILES = COPYING
 
-MDADM_BUILD_OPTS = $(TARGET_CONFIGURE_OPTS) \
-	CFLAGS="$(TARGET_CFLAGS) -DNO_COROSYNC -DNO_DLM" \
+MDADM_CXFLAGS = $(TARGET_CFLAGS)
+
+MDADM_BUILD_OPTS = \
+	CC=$(TARGET_CC) \
+	COROSYNC=-DNO_COROSYNC \
+	DLM=-DNO_DLM \
+	CXFLAGS="$(MDADM_CXFLAGS)" \
 	CPPFLAGS="$(TARGET_CPPFLAGS) -DBINDIR=\\\"/sbin\\\"" \
 	CHECK_RUN_DIR=0
 
@@ -19,14 +24,18 @@ ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),)
 MDADM_BUILD_OPTS += USE_PTHREADS=
 endif
 
+ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
+MDADM_DEPENDENCIES += udev
+else
+MDADM_CXFLAGS += -DNO_LIBUDEV
+endif
+
 define MDADM_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) $(MDADM_BUILD_OPTS) mdadm mdmon
 endef
 
 define MDADM_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
-		DESTDIR=$(TARGET_DIR) \
-		install-mdadm install-mdmon
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) install-bin
 endef
 
 $(eval $(generic-package))
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
