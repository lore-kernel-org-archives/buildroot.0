Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C1D3C54EBE
	for <buildroot@archiver.kernel.org>; Sat, 14 Jan 2023 00:24:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 22BEF41963;
	Sat, 14 Jan 2023 00:24:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 22BEF41963
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8DmeuSWhvfCv; Sat, 14 Jan 2023 00:24:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1A2ED4157B;
	Sat, 14 Jan 2023 00:24:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1A2ED4157B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 202991BF3C3
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 00:24:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EF8AA60AAC
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 00:24:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF8AA60AAC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nCa8mTaUzAfn for <buildroot@lists.busybox.net>;
 Sat, 14 Jan 2023 00:24:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7CA0D60A87
Received: from smtpcmd0757.aruba.it (smtpcmd0757.aruba.it [62.149.156.57])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7CA0D60A87
 for <buildroot@buildroot.org>; Sat, 14 Jan 2023 00:24:37 +0000 (UTC)
Received: from localhost.localdomain ([88.149.186.89])
 by Aruba Outgoing Smtp  with ESMTPSA
 id GULapK2buvRk8GULapQhOJ; Sat, 14 Jan 2023 01:24:35 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sat, 14 Jan 2023 01:24:33 +0100
Message-Id: <20230114002433.1388538-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfJYf96bMUswYwJYpzv5kKkzlRZPH8L5yDfuVB0Mg5uIBEarLp4voxF3xlyu0LHOuhChcR45Q73j9pdtKQDeCxCnB4HjM2iC0sXJ1h/b6ZPop/Wj5CpJ/
 s1rJLaekN2K5RAJFDLPlv1THQbro2LIqA+MgDD6e1TD/oSHUdP7vKdUgXz5qs7F8hsg1+yKeDb2YWRnr90lxg51PPTAfRVur/livSFlmFW57Q9E9luwPTVRk
 xNBG0Td6KlQllIoNf7tJQLktJNNfw2B/rpYVjxmneQXbtyguhBeyOcv94Fj3TUNeD+iU6yf7FZxQhV+miRveAA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1673655875; bh=6m28wn+FfzVvUyYoSV3z7/EKPz6ZXRgKvnoetq2ZSxE=;
 h=From:To:Subject:Date:MIME-Version;
 b=hBiO04/MlFvcydF+B9HknklYZ3RuRVnpqgYpVJy6v3Nw7tmXkqmptQTNKCaoqYi6y
 pxoJeucHptytBPy6T8MM1KFSElc7TJSrybpNeu1Kkam9CXH4V6XNMEFpzWYqqXOb0p
 GPa85T9cNKc4mfibE8/kbKxgK1swsnhvKa/SXckd7KF42XQsjBGAnRon45lrNwpXlW
 Nt2HylaxL/SNP4Piog1bSLjhh5KJsiv4I9b1K6ENelIesHDIv4IXTG+85iSYx53Byr
 Y0wTTLwVhoZJil2GKWa+q+rsbhF4ML8TqYS+AL2x55iSQeogkgZrzVwq0NWO6z7Vpw
 Sm4XRNIhuQRww==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=hBiO04/M
Subject: [Buildroot] [PATCH] package/rtl8821cu: fix build failure due to
 missing Linux options
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

After fixing build failure due to missing Linux CONFIG_CFG80211 an error
of conflicting Big and Little endianness came out. So let's fix it by
disabling the default CONFIG_PLATFORM that is not CONFIG_PLATFORM_GENERIC
but CONFIG_PLATFORM_AUTODETECT.

Fixes:
http://autobuild.buildroot.net/results/aea/aea6bc1e4f89bd1010dfdc9caa54c37edb567d5f/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/rtl8821cu/rtl8821cu.mk | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/package/rtl8821cu/rtl8821cu.mk b/package/rtl8821cu/rtl8821cu.mk
index 18222e0014..501d849aca 100644
--- a/package/rtl8821cu/rtl8821cu.mk
+++ b/package/rtl8821cu/rtl8821cu.mk
@@ -9,6 +9,14 @@ RTL8821CU_SITE = $(call github,morrownr,8821cu-20210118,$(RTL8821CU_VERSION))
 RTL8821CU_LICENSE = GPL-2.0
 RTL8821CU_LICENSE_FILES = LICENSE
 
+define RTL8821CU_LINUX_CONFIG_FIXUPS
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NET)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_WIRELESS)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_CFG80211)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_USB_SUPPORT)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_USB)
+endef
+
 RTL8821CU_USER_EXTRA_CFLAGS = \
 	-DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN \
 	-DCONFIG_IOCTL_CFG80211 \
@@ -16,7 +24,7 @@ RTL8821CU_USER_EXTRA_CFLAGS = \
 	-Wno-error
 
 RTL8821CU_MODULE_MAKE_OPTS = \
-	CONFIG_PLATFORM_GENERIC=n \
+	CONFIG_PLATFORM_AUTODETECT=n \
 	CONFIG_RTL8821CU=m \
 	KVER=$(LINUX_VERSION_PROBED) \
 	USER_EXTRA_CFLAGS="$(RTL8821CU_USER_EXTRA_CFLAGS)"
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
