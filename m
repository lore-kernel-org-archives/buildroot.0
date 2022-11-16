Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91B94C4332F
	for <buildroot@archiver.kernel.org>; Wed, 16 Nov 2022 15:22:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F12C460FA6;
	Wed, 16 Nov 2022 15:22:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F12C460FA6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fdlpcqdqZX6R; Wed, 16 Nov 2022 15:22:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2400C60F9D;
	Wed, 16 Nov 2022 15:22:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2400C60F9D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AF8271BF5DC
 for <buildroot@lists.busybox.net>; Wed, 16 Nov 2022 15:22:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 89364415CD
 for <buildroot@lists.busybox.net>; Wed, 16 Nov 2022 15:22:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 89364415CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lWUwkhFX4mM6 for <buildroot@lists.busybox.net>;
 Wed, 16 Nov 2022 15:22:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ECC6A415BF
Received: from smtpcmd0987.aruba.it (smtpcmd0987.aruba.it [62.149.156.87])
 by smtp4.osuosl.org (Postfix) with ESMTP id ECC6A415BF
 for <buildroot@buildroot.org>; Wed, 16 Nov 2022 15:22:39 +0000 (UTC)
Received: from localhost.localdomain ([146.241.88.137])
 by Aruba Outgoing Smtp  with ESMTPSA
 id vKFJoiJdbtoIqvKFJoYesq; Wed, 16 Nov 2022 16:22:37 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed, 16 Nov 2022 16:22:36 +0100
Message-Id: <20221116152236.805035-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfJZS+bWsaZyrIOUfs6VJ1y8xlicsV/3EUoiqQ4ROw08nN50AhsbMGHzt/Aya1BbwYtARb4LJXsXIK5YeIz975c4RO//ByYDNkqJdyVxt81PQzpe4NCPF
 pfvjBBlVzKwDf92Dh5N2oq7+npAJdbWZTIZQOqLsjPujpi239Vc8I0ni3CY69DSWsFvAwryNoOGKQqBEerFIppk5uTLPkE5qfHdZ6B0NkvmUv2fj8cstCx9L
 Nd5SG4ZwNGyDTFC88cbRJl1OydHK/oaaQGIOvk80PhULawJQ7K2aB30OpFygxKEirhLXAYxqlIg55EFb9wJxZfbbV5RjRPAP6NYER1JRghk=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1668612157; bh=GRTM33glyaPpqraCLdZyDIxElxWdJZhC2xWl/oCTL+k=;
 h=From:To:Subject:Date:MIME-Version;
 b=d6uy+Ry+yHTxXAkWV0g65K6lIgRMFz9LXC6XDwfaxZzIM54NbLqsqLOgqRyv9SPyV
 Lb8U07bb99xqOz6g5RyloN3In05opmMUGaBMBTE2b35oDvd2Vwfp9KJqHo2tENjQya
 dp9You1Db/LYEXDUpiLnn7ZzinV4g0ER4+K9EIPe8mc5ZchZTlGLE+2h7EZdVtaWWX
 rVFE3lgxvWyue0h2TzygJt7RnWSvS70IvphKaXFPI4oai2LXDeq6qlc4SjsIyr2QyE
 rhUhSdvmOiNWvUTyKJIx3zD8T0aW73KN4Y202veVi58WvMAcNb0ysJ2z7MBcN7ciy/
 GR1qmAiNsFPqQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=d6uy+Ry+
Subject: [Buildroot] [PATCH] package/rtl8723ds: fix build failure due to
 endianness and Linux version 6.0
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
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add local patch pending upstream[0] to override CFLAGS to set endianness
according to BR2_ENDIAN. Let's also bump version to latest to support up to
Linux 6.1.

[0]: https://github.com/lwfinger/rtl8723ds/pull/29

Fixes:
http://autobuild.buildroot.net/results/2646ec0512f867e20c25c1d0a6417826218942d6/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 ...TRA_CFLAGS-USER_EXTRA_CFLAGS-at-the-.patch | 39 +++++++++++++++++++
 package/rtl8723ds/rtl8723ds.hash              |  2 +-
 package/rtl8723ds/rtl8723ds.mk                | 10 ++++-
 3 files changed, 48 insertions(+), 3 deletions(-)
 create mode 100644 package/rtl8723ds/0001-Makefile-move-EXTRA_CFLAGS-USER_EXTRA_CFLAGS-at-the-.patch

diff --git a/package/rtl8723ds/0001-Makefile-move-EXTRA_CFLAGS-USER_EXTRA_CFLAGS-at-the-.patch b/package/rtl8723ds/0001-Makefile-move-EXTRA_CFLAGS-USER_EXTRA_CFLAGS-at-the-.patch
new file mode 100644
index 0000000000..4495817358
--- /dev/null
+++ b/package/rtl8723ds/0001-Makefile-move-EXTRA_CFLAGS-USER_EXTRA_CFLAGS-at-the-.patch
@@ -0,0 +1,39 @@
+From 769a1943cb409f89f3c91208294a89b09bf47b86 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Wed, 16 Nov 2022 16:08:21 +0100
+Subject: [PATCH] Makefile: move 'EXTRA_CFLAGS += $(USER_EXTRA_CFLAGS)' at the
+ end of EXTRA_FLAGS assignment
+
+At the moment USER_EXTRA_CFLAGS can't override local Makfile EXTRA_CFLAGS
+since it's assigned at the beginning of the Makefile. For example it's not
+possible to undefine the hardcoded CONFIG_LITTLE_ENDIAN and this doesn't
+allow to build these modules for big endian architectures. So let's move
+the assignment of USER_EXTRA_CFLAGS to EXTRA_CFLAGS after the last
+EXTRA_CFLAGS assignment.
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ Makefile | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index aa57f85..3d91574 100644
+--- a/Makefile
++++ b/Makefile
+@@ -1,4 +1,3 @@
+-EXTRA_CFLAGS += $(USER_EXTRA_CFLAGS)
+ EXTRA_CFLAGS += -O1
+ #EXTRA_CFLAGS += -O3
+ #EXTRA_CFLAGS += -Wall
+@@ -1738,6 +1737,8 @@ ifneq ($(USER_MODULE_NAME),)
+ MODULE_NAME := $(USER_MODULE_NAME)
+ endif
+ 
++EXTRA_CFLAGS += $(USER_EXTRA_CFLAGS)
++
+ ifneq ($(KERNELRELEASE),)
+ 
+ rtk_core :=	core/rtw_cmd.o \
+-- 
+2.34.1
+
diff --git a/package/rtl8723ds/rtl8723ds.hash b/package/rtl8723ds/rtl8723ds.hash
index 440ce75ef4..cbc77e14c1 100644
--- a/package/rtl8723ds/rtl8723ds.hash
+++ b/package/rtl8723ds/rtl8723ds.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  cc5dcf9d17cefabfeba3e68671367c7d69091936e40f71dc5e1165c61195a9fb  rtl8723ds-76146e85847beb2427b1d4958fa275822f2b04ab.tar.gz
+sha256  691040a85d838f8d8d7da0f2ed460f1ea5f6734c40dc73770ba7e260b6cda9cc  rtl8723ds-5ab2d3f3858dc4c833013c47a79faa05b10198f6.tar.gz
diff --git a/package/rtl8723ds/rtl8723ds.mk b/package/rtl8723ds/rtl8723ds.mk
index 8598f906a9..0d96e6b03a 100644
--- a/package/rtl8723ds/rtl8723ds.mk
+++ b/package/rtl8723ds/rtl8723ds.mk
@@ -4,14 +4,20 @@
 #
 ################################################################################
 
-RTL8723DS_VERSION = 76146e85847beb2427b1d4958fa275822f2b04ab
+RTL8723DS_VERSION = 5ab2d3f3858dc4c833013c47a79faa05b10198f6
 RTL8723DS_SITE = $(call github,lwfinger,rtl8723ds,$(RTL8723DS_VERSION))
 RTL8723DS_LICENSE = GPL-2.0
 
+# Undefine the hardcoded CONFIG_LITTLE_ENDIAN
+RTL8723DS_USER_EXTRA_CLAGS = -UCONFIG_LITTLE_ENDIAN
+# Set endianness
+RTL8723DS_USER_EXTRA_CLAGS += -DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN
+
 RTL8723DS_MODULE_MAKE_OPTS = \
 	CONFIG_RTL8723DS=m \
 	KVER=$(LINUX_VERSION_PROBED) \
-	KSRC=$(LINUX_DIR)
+	KSRC=$(LINUX_DIR) \
+	USER_EXTRA_CFLAGS="$(RTL8723DS_USER_EXTRA_CLAGS)"
 
 define RTL8723DS_LINUX_CONFIG_FIXUPS
 	$(call KCONFIG_ENABLE_OPT,CONFIG_NET)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
