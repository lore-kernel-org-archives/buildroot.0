Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B817C4332F
	for <buildroot@archiver.kernel.org>; Wed, 14 Dec 2022 21:52:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C90AB41691;
	Wed, 14 Dec 2022 21:52:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C90AB41691
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IDmNpiJhH0Qv; Wed, 14 Dec 2022 21:52:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E8B241695;
	Wed, 14 Dec 2022 21:52:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E8B241695
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0E2D21BF3D2
 for <buildroot@lists.busybox.net>; Wed, 14 Dec 2022 21:52:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DDAE440B78
 for <buildroot@lists.busybox.net>; Wed, 14 Dec 2022 21:52:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DDAE440B78
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KkLfjF15yOMX for <buildroot@lists.busybox.net>;
 Wed, 14 Dec 2022 21:52:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0BEF84013F
Received: from smtpcmd12131.aruba.it (smtpcmd12131.aruba.it [62.149.156.131])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0BEF84013F
 for <buildroot@buildroot.org>; Wed, 14 Dec 2022 21:52:34 +0000 (UTC)
Received: from localhost.localdomain ([146.241.66.6])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 5Zg1pYRuSJLs75Zg1plDa5; Wed, 14 Dec 2022 22:52:33 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed, 14 Dec 2022 22:52:32 +0100
Message-Id: <20221214215232.596291-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfCBVnqyQ+wMjS2p6NmSAMuKhrEprP1+DHYx0BsJ867g6RSnAH7985Rp6srRJS5xbRC1/kZwhatUHiVl/NjvzVE8pOQ/geZl80698IWf08kEGm7C2NQ2q
 6Ag1g3ZASOZyxcVeFiXlWB8y/FHOF1NDru/tohaU9QuQ94PzH8xPkEDN8QtC7rY47bdYK86snr1RclIAtbUCQkgYTmDraSNPJ6BBdxpF8QE8l88n23HUYwCC
 b7wLiiWgxMkKBHcJIb5d2HZgP8tVogaNB90sYpx1netk1sI0slY8zBQxDjLel3/OSGzlMIHPjt14w9fu05TvsQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1671054753; bh=VW+NWVLKumeWdMfiuYJwu1tLxs366dtKPG59yEGq0Qw=;
 h=From:To:Subject:Date:MIME-Version;
 b=CwGtRrIPA+avGPswND933kmPofI6jb/mxJO2CJ555lYVzJxUFJVV0vPt8ouUPoRmh
 DTW9/2WyxU0Ux3gvZTXhGeTC5mbCASqmGnOoses3uiijVWkXSr6aAVm8aJYoGGoT/o
 C7AN/pA9ko3Dx+tLF6MAiHcZqNbLzdlDNuH3d3LA48EmyPc9dcqwwMJsrIvAu1tYe0
 toSqxOjiFx9xvFMTp36Edyk2CFXmM0sk7ecmClXVbzQEGt9OSAcDdeabsVGGbjE75N
 rnai83TNgtN3e59gEDKEeNideykMD9hB7N6x0jOhfeb0BFYGZ2ED/vAjUy6nhKDriT
 9rFER18NfyDGg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=CwGtRrIP
Subject: [Buildroot] [PATCH] package/rtl8189fs: bump to 2022-10-30 version
 to fix build failure with Linux up to 6.1
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

Drop local patch that has been upstreamed[0] and drop the endianness
handling too since from this commit[1] on it's handled by using Linux
macro __LITTLE_ENDIAN.

[0]: https://github.com/jwrdegoede/rtl8189ES_linux/commit/4a555ffb77a5947814b6c7f330968318e265c496
[1]: https://github.com/jwrdegoede/rtl8189ES_linux/commit/b3da33576da5359d85c7cfe82716c9a08a592aff

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 ...TRA_CFLAGS-USER_EXTRA_CFLAGS-at-the-.patch | 40 -------------------
 package/rtl8189fs/rtl8189fs.hash              |  2 +-
 package/rtl8189fs/rtl8189fs.mk                | 10 +----
 3 files changed, 3 insertions(+), 49 deletions(-)
 delete mode 100644 package/rtl8189fs/0001-Makefile-move-EXTRA_CFLAGS-USER_EXTRA_CFLAGS-at-the-.patch

diff --git a/package/rtl8189fs/0001-Makefile-move-EXTRA_CFLAGS-USER_EXTRA_CFLAGS-at-the-.patch b/package/rtl8189fs/0001-Makefile-move-EXTRA_CFLAGS-USER_EXTRA_CFLAGS-at-the-.patch
deleted file mode 100644
index dc4deff9f1..0000000000
--- a/package/rtl8189fs/0001-Makefile-move-EXTRA_CFLAGS-USER_EXTRA_CFLAGS-at-the-.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 4a555ffb77a5947814b6c7f330968318e265c496 Mon Sep 17 00:00:00 2001
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
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
-[Upstream status: https://github.com/jwrdegoede/rtl8189ES_linux/pull/83]
----
- Makefile | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index 8fcb7bd..e4664e9 100644
---- a/Makefile
-+++ b/Makefile
-@@ -1,4 +1,3 @@
--EXTRA_CFLAGS += $(USER_EXTRA_CFLAGS)
- EXTRA_CFLAGS += -O1
- #EXTRA_CFLAGS += -O3
- #EXTRA_CFLAGS += -Wall
-@@ -2239,6 +2238,8 @@ ifneq ($(USER_MODULE_NAME),)
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
index 1ab41db553..4f117cfd14 100644
--- a/package/rtl8189fs/rtl8189fs.hash
+++ b/package/rtl8189fs/rtl8189fs.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  7cc80cb85ed6e7f7d5480e6094c377d3dbcd18a57b58cfba43a7e42ea59fc8d3  rtl8189fs-c93cfd712a3acd2ecdeda19a66d269c20f8803f1.tar.gz
+sha256  96347dbfedd95a217fb89b7b295fe417b711dbad3db896ef0c2fa733c6d150fd  rtl8189fs-e58bd86c9d9408c648b1246a0dd76b16856ec172.tar.gz
diff --git a/package/rtl8189fs/rtl8189fs.mk b/package/rtl8189fs/rtl8189fs.mk
index 8b7618fcc8..15a5329a45 100644
--- a/package/rtl8189fs/rtl8189fs.mk
+++ b/package/rtl8189fs/rtl8189fs.mk
@@ -4,20 +4,14 @@
 #
 ################################################################################
 
-RTL8189FS_VERSION = c93cfd712a3acd2ecdeda19a66d269c20f8803f1
+RTL8189FS_VERSION = e58bd86c9d9408c648b1246a0dd76b16856ec172
 RTL8189FS_SITE = $(call github,jwrdegoede,rtl8189ES_linux,$(RTL8189FS_VERSION))
 RTL8189FS_LICENSE = GPL-2.0
 
-# Undefine the hardcoded CONFIG_LITTLE_ENDIAN
-RTL8189FS_USER_EXTRA_CLAGS = -UCONFIG_LITTLE_ENDIAN
-# Set endianness
-RTL8189FS_USER_EXTRA_CLAGS += -DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN
-
 RTL8189FS_MODULE_MAKE_OPTS = \
 	CONFIG_RTL8189FS=m \
 	KVER=$(LINUX_VERSION_PROBED) \
-	KSRC=$(LINUX_DIR) \
-	USER_EXTRA_CFLAGS="$(RTL8189FS_USER_EXTRA_CLAGS)"
+	KSRC=$(LINUX_DIR)
 
 define RTL8189FS_LINUX_CONFIG_FIXUPS
 	$(call KCONFIG_ENABLE_OPT,CONFIG_WIRELESS)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
