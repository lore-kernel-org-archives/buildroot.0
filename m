Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EF45C433EF
	for <buildroot@archiver.kernel.org>; Mon,  9 May 2022 06:08:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B14660F2A;
	Mon,  9 May 2022 06:08:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YCE5q73-tJy0; Mon,  9 May 2022 06:08:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4452660F26;
	Mon,  9 May 2022 06:08:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5EEB51BF284
 for <buildroot@lists.busybox.net>; Mon,  9 May 2022 06:07:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4E7AB8174C
 for <buildroot@lists.busybox.net>; Mon,  9 May 2022 06:07:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e-4Yf18aamcc for <buildroot@lists.busybox.net>;
 Mon,  9 May 2022 06:07:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3FA408174A
 for <buildroot@buildroot.org>; Mon,  9 May 2022 06:07:28 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id b18so21970240lfv.9
 for <buildroot@buildroot.org>; Sun, 08 May 2022 23:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MNL7f0JF2F3a4FlAMF2s1z8pB1o19fRJgTPXUiFdMk8=;
 b=XathL5Pd4AiCnmVYBZolWo++yXTllABIzeJLUYd39zbCvxzTztMqYDHYfP0OaY68j9
 7qMc6mAQ/Chs4FJ/kF4PAeGP9ks3kkzszJjaOYBASXlvSeYeOGchkVNs4nXLPEYVihXu
 pzO6yZDH3DhE6c4V3BSMM46hvMfXH7S/Uvt6uLnYVTYfdW35a36CXvuMFiUoxIG+QzFq
 KmLDMiU3S3d1j8eR3DX5qBxRgRaFWhkibiV0YSI9vVV+HqG6mgIjtJ0MjCCRInLdcPvN
 KtYXDj/CriQORqFoRdCeYoooc0K1VLcUUDWhsWk+M2VRcB9XbHFwhFF3shBxNE8MWj6L
 HQTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MNL7f0JF2F3a4FlAMF2s1z8pB1o19fRJgTPXUiFdMk8=;
 b=wMzwaNvvwpk+7sCAubGKQpYlQzoArFEMA+eNJGiwzg48zQiVcP9kXM9VQNJ17gXk3j
 KLnHTVSPZqEFDReDE38sk30Tmz/upxfWp/QmiN0PoTGg3JlDBZGoMVMMQrQ9ZLDw16l8
 fIKDZ0DowY3yLz7V9Z6qNlf9R4nBM7g0aMaLmoQZknkYdMcDAji74VXJiAe5TwSKLdtm
 jz+K4iNm+DvfqSC9Qt54ZRjcFNCnw1/NhHVvsWuBQACbs7A/CeNLpyyzti5oTpIFvCXF
 gc+jyeVM9zGfzSZmNFO+pZYqNbgvVuUR6xEV2ghTgxULcUIpTrcLmp25Dg7G2KYz/IA6
 S7ng==
X-Gm-Message-State: AOAM531Pm5L/tKrGwdkvmPCWyVkodLpdhT4IMfMsOHhbjlkTzTzY1Q5L
 OSc7DsfCtdy7fVQyrQMxJryfFRv+xxSsrw==
X-Google-Smtp-Source: ABdhPJwYjA/JhP9cp8V02wtKeu9DntP7mlS2b3tYVON45TZxt8nh9qJ0JRk/aU5mkgEGfvho+UTGMw==
X-Received: by 2002:a05:6512:169a:b0:44a:fea7:50a5 with SMTP id
 bu26-20020a056512169a00b0044afea750a5mr11669810lfb.498.1652076445778; 
 Sun, 08 May 2022 23:07:25 -0700 (PDT)
Received: from localhost.localdomain ([5.188.167.245])
 by smtp.googlemail.com with ESMTPSA id
 q19-20020a0565123a9300b0047255d211b6sm1824707lfu.229.2022.05.08.23.07.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 May 2022 23:07:25 -0700 (PDT)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  9 May 2022 09:07:21 +0300
Message-Id: <20220509060721.2726047-4-geomatsi@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220509060721.2726047-1-geomatsi@gmail.com>
References: <20220509060721.2726047-1-geomatsi@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/3] package/rtl8189fs: fix big-endian builds
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix rtl8189fs builds for big-endian platforms. For this purpose remove
default little-endian configuration option from rtl8189fs Makefile.
Configure proper endianness using USER_EXTRA_CFLAGS instead.

Fixes:
- http://autobuild.buildroot.net/results/51e95561103e40ae94f38b9bb944bdfcd4ab50ed/
- http://autobuild.buildroot.net/results/8ac7921926ab48aeb95dc4ea20f3c9970094c71d/
- http://autobuild.buildroot.net/results/7f0bdd03c41bcc9e567fe722ed271e5dcf210f44/

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 ...1-Makefile-remove-default-endianness.patch | 30 +++++++++++++++++++
 package/rtl8189fs/rtl8189fs.mk                |  3 +-
 2 files changed, 32 insertions(+), 1 deletion(-)
 create mode 100644 package/rtl8189fs/0001-Makefile-remove-default-endianness.patch

diff --git a/package/rtl8189fs/0001-Makefile-remove-default-endianness.patch b/package/rtl8189fs/0001-Makefile-remove-default-endianness.patch
new file mode 100644
index 0000000000..47e42415eb
--- /dev/null
+++ b/package/rtl8189fs/0001-Makefile-remove-default-endianness.patch
@@ -0,0 +1,30 @@
+From 480d9da302885d9e8b3d1f9c68def569e3c8a8c0 Mon Sep 17 00:00:00 2001
+From: Sergey Matyukevich <geomatsi@gmail.com>
+Date: Mon, 9 May 2022 00:17:21 +0300
+Subject: [PATCH] Makefile: remove default endianness
+
+There is no way to remove configuration options from EXTRA_CFLAGS
+without editing Makefile. So default LE configuration can not be
+conveniently replaced by BE. Remove default endianness from the
+Makefile to enable its configuration via USER_EXTRA_CFLAGS.
+
+Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
+---
+ Makefile | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index dfca305..fde4e6b 100644
+--- a/Makefile
++++ b/Makefile
+@@ -22,7 +22,6 @@ endif
+ 
+ EXTRA_CFLAGS += -I$(src)/include
+ 
+-EXTRA_CFLAGS += -DCONFIG_LITTLE_ENDIAN
+ EXTRA_CFLAGS += -DCONFIG_IOCTL_CFG80211 -DRTW_USE_CFG80211_STA_EVENT
+ 
+ EXTRA_LDFLAGS += --strip-debug
+-- 
+2.35.1
+
diff --git a/package/rtl8189fs/rtl8189fs.mk b/package/rtl8189fs/rtl8189fs.mk
index 6031a3072c..1c398919ba 100644
--- a/package/rtl8189fs/rtl8189fs.mk
+++ b/package/rtl8189fs/rtl8189fs.mk
@@ -11,7 +11,8 @@ RTL8189FS_LICENSE = GPL-2.0
 RTL8189FS_MODULE_MAKE_OPTS = \
 	CONFIG_RTL8189FS=m \
 	KVER=$(LINUX_VERSION_PROBED) \
-	KSRC=$(LINUX_DIR)
+	KSRC=$(LINUX_DIR) \
+	USER_EXTRA_CFLAGS="-DCONFIG_$(call qstrip,$(BR2_ENDIAN))_ENDIAN"
 
 define RTL8189FS_LINUX_CONFIG_FIXUPS
 	$(call KCONFIG_ENABLE_OPT,CONFIG_WIRELESS)
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
