Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B29BC47DAF
	for <buildroot@archiver.kernel.org>; Mon, 22 Jan 2024 15:03:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 900AE606BF;
	Mon, 22 Jan 2024 15:03:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 900AE606BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2iDgOvGSW3d1; Mon, 22 Jan 2024 15:03:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC2D160FBF;
	Mon, 22 Jan 2024 15:03:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC2D160FBF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 18C721BF30C
 for <buildroot@lists.busybox.net>; Mon, 22 Jan 2024 15:03:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E65E340882
 for <buildroot@lists.busybox.net>; Mon, 22 Jan 2024 15:03:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E65E340882
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Al_bFIIQxdTd for <buildroot@lists.busybox.net>;
 Mon, 22 Jan 2024 15:03:11 +0000 (UTC)
Received: from smtpdh16-2.aruba.it (smtpdh16-2.aruba.it [62.149.155.101])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1F6CA40513
 for <buildroot@buildroot.org>; Mon, 22 Jan 2024 15:03:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F6CA40513
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id RvpLrr9B2fJYdRvpMrPcfB; Mon, 22 Jan 2024 16:03:08 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Mon, 22 Jan 2024 16:03:06 +0100
Message-Id: <20240122150306.2518185-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfK6iJAInOWjArlTMaxojQM2Ao7ywHUJaozG9C//KFrIo62c2/J0hs5Rej5sUtY45JwoZORRFJWH/n175tj8ZQ71qFmk5tloOwL9EqgMTL2CSQPlU2Dky
 7qKeGecJokGOHGoNYP/EeYEH2vNC+derpQ+UZ0QcEy2qeLqijoJUeCmyu73I9/H5gpXXSHnaRwGw/5vUdQre3PiHqI54dV60OsYutqFg+zayKan+qaGn2E6t
 +2UHZPBfYEAHUKPD19eMO5cgnQ6Tc8goApSOuTt2E4bsp1FdO8CSJFC836+psv8RpZTzTBSlYQfKSYxPlp5zQQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1705935788; bh=zm/dn8hycYiiXV/krQp50TWQMuTVkN8P2B44eRaTN6o=;
 h=From:To:Subject:Date:MIME-Version;
 b=S0+BXNhm82VJv70albkivycaUumr44imLIN9qQlHCfn6Qwznmq15DpT3JwLappTD3
 5XBgdr1upn+IV45IgMeadTuDpT2oIOoG99cgPqLYT8DYtlkoJp7FSUe/k0bHFwpmxY
 LgVM94Y9fH6jq0AYN9o9+97sAC6953AYLk8dHkl8EGuGXaQzDdq4duMoiA9UAnpVTe
 wWEsSye9FwzLoxIZhkFqhsYYLvUnotC/OZcHdOmeNndTWaksh3M4S2fld6KrfN00Sd
 ETGNEzSdlGpz8BRm2qquq4jrqZsWEWhQp2YU5NOrJV9yurPkhJUMTIDpg8oW4BBjGH
 qPzrzRcBGT9Zw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=S0+BXNhm
Subject: [Buildroot] [PATCH v2] package/rtl8189fs: bump to version 2024-01-22
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

With this version we can build with Linux 6.8.
Let's also drop local patch that has been upstreamed.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
V1->V2:
* bump version to latest version where local patch has been upstreamed
---
 ...TRA_CFLAGS-USER_EXTRA_CFLAGS-at-the-.patch | 41 -------------------
 package/rtl8189fs/rtl8189fs.hash              |  2 +-
 package/rtl8189fs/rtl8189fs.mk                |  2 +-
 3 files changed, 2 insertions(+), 43 deletions(-)
 delete mode 100644 package/rtl8189fs/0001-Makefile-move-EXTRA_CFLAGS-USER_EXTRA_CFLAGS-at-the-.patch

diff --git a/package/rtl8189fs/0001-Makefile-move-EXTRA_CFLAGS-USER_EXTRA_CFLAGS-at-the-.patch b/package/rtl8189fs/0001-Makefile-move-EXTRA_CFLAGS-USER_EXTRA_CFLAGS-at-the-.patch
deleted file mode 100644
index f9e2d6845d..0000000000
--- a/package/rtl8189fs/0001-Makefile-move-EXTRA_CFLAGS-USER_EXTRA_CFLAGS-at-the-.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From f48d99fab8b79e573850067a3ff2d8c16aa95ce1 Mon Sep 17 00:00:00 2001
-From: Giulio Benetti <giulio.benetti@benettiengineering.com>
-Date: Wed, 28 Sep 2022 21:17:17 +0200
-Subject: [PATCH] Makefile: move 'EXTRA_CFLAGS += $(USER_EXTRA_CFLAGS)' at the
- end of EXTRA_FLAGS assignment
-
-At the moment USER_EXTRA_CFLAGS can't override local Makfile EXTRA_CFLAGS
-since it's assigned at the beginning of the Makefile. For example it's not
-possible to undefine the hardcoded CONFIG_LITTLE_ENDIAN and this doesn't
-allow to build these modules for big endian architectures. So let's move
-the assignment of USER_EXTRA_CFLAGS to EXTRA_CFLAGS after the last
-EXTRA_CFLAGS assignment.
-
-Upstream: https://github.com/jwrdegoede/rtl8189ES_linux/pull/101
-
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- Makefile | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index dfca305..6f91d0a 100644
---- a/Makefile
-+++ b/Makefile
-@@ -1,4 +1,3 @@
--EXTRA_CFLAGS += $(USER_EXTRA_CFLAGS)
- EXTRA_CFLAGS += -O1
- #EXTRA_CFLAGS += -O3
- #EXTRA_CFLAGS += -Wall
-@@ -2208,6 +2207,8 @@ ifneq ($(USER_MODULE_NAME),)
- MODULE_NAME := $(USER_MODULE_NAME)
- endif
- 
-+EXTRA_CFLAGS += $(USER_EXTRA_CFLAGS)
-+
- ifneq ($(KERNELRELEASE),)
- 
- ########### this part for *.mk ############################
--- 
-2.34.1
-
diff --git a/package/rtl8189fs/rtl8189fs.hash b/package/rtl8189fs/rtl8189fs.hash
index 377812fba8..e3d63ac4b0 100644
--- a/package/rtl8189fs/rtl8189fs.hash
+++ b/package/rtl8189fs/rtl8189fs.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  9ff7aa9ee8cd7a8f386531d3b009e7bcbce1ff71bb676c187c40e538755eb8b5  rtl8189fs-75a566a830037c7d1309c5a9fe411562772a1cf2.tar.gz
+sha256  c92e1d800258665835922c1e927708f7a0477a1cbb281dc98ba5d33d5e3271ee  rtl8189fs-5d523593f41c0b8d723c6aa86b217ee1d0965786.tar.gz
diff --git a/package/rtl8189fs/rtl8189fs.mk b/package/rtl8189fs/rtl8189fs.mk
index bd29469242..86a2ac734b 100644
--- a/package/rtl8189fs/rtl8189fs.mk
+++ b/package/rtl8189fs/rtl8189fs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8189FS_VERSION = 75a566a830037c7d1309c5a9fe411562772a1cf2
+RTL8189FS_VERSION = 5d523593f41c0b8d723c6aa86b217ee1d0965786
 RTL8189FS_SITE = $(call github,jwrdegoede,rtl8189ES_linux,$(RTL8189FS_VERSION))
 RTL8189FS_LICENSE = GPL-2.0
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
