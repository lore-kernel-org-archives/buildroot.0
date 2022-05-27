Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E21BC433EF
	for <buildroot@archiver.kernel.org>; Fri, 27 May 2022 20:45:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD4FD42A54;
	Fri, 27 May 2022 20:45:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5uLCcLYFO7LT; Fri, 27 May 2022 20:45:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6DDD042A51;
	Fri, 27 May 2022 20:45:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 831E41BF834
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 20:45:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7FB2B83EEB
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 20:45:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5tORoBaF4KYG for <buildroot@lists.busybox.net>;
 Fri, 27 May 2022 20:45:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4704783EC0
 for <buildroot@buildroot.org>; Fri, 27 May 2022 20:45:26 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 c9-20020a7bc009000000b0039750ec5774so3362017wmb.5
 for <buildroot@buildroot.org>; Fri, 27 May 2022 13:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7/9XFepddBoospHO7fsb5paVwg7Tw+7/0ijOc7W7zWE=;
 b=ZZCIH5xFQ0YjeAnrG4UJoR78FYgQWuBuextGG3cwqmMAWhhWb3XOOfTPVlPwjVx/M9
 Vx9l+ccIXh5r0/PSQT4skg4lB+GXsriuHfdJiHX9TVG+mZzUAfQqgZOCJDHeG+QHu1cM
 V5oZbkwRfWeUuJpHiVBmqe2yicbpk2aBzEeTanGy2sAMQxTOAvdNsDJmru146ApIpMq1
 ZfvqrPtXRsxRMxxzFo7mIF4/Fqtc0ghBstRSIeA2dO4B9IyVbYqQR35Qdf9iABkku7w5
 xTKC51WugmrsFR/Gedq6rxR2Sts1KCsE9zz14tonwqjE+Id0ug8tf7evyvQdIKOzdy3d
 WyTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=7/9XFepddBoospHO7fsb5paVwg7Tw+7/0ijOc7W7zWE=;
 b=Wzf3j4Usx7y+GtDHpu+8ZKOhQLijKMpyK+weoWOSJA8XXXgIJyl3KO7NPtSO/hZ7p9
 M0xumqlxzg5yrkIgAZUBf3SJbxz3Lo7NkKE9i1NKhc9gIRSNGtK46e4/rJz4hhAk9CWH
 ceNP9i6HqQLwUB44ltSstxJzRuZa39rVQ+j0ODkvfeV4QasART3um+0RQ70urCUnVinQ
 hEBHvB3RHOkm0GZr68fg6VQt32DxoIRWBXMgvRzS85wBnG0FMf9Nsiu5BMMT1kSCRwda
 olnqvJkrpeXVm9AMqaFg+yrbDuHXgNwKvHYoMpO4kvAZHOz2FP1aGru5XttobbmbuZkU
 uaDA==
X-Gm-Message-State: AOAM530/amtSfCicYpHwBQfF5RUCaN1SNTYh6jBltGKsOAMzJADHAdBt
 /ASz0+Vlhqvmwn+yrPd1Vo6RVIOjLi4=
X-Google-Smtp-Source: ABdhPJxsIrTrvHaco/p7jfUBs4tYBr7caXViYFJ/kP151hp88ppZ/4nW6ngiZ1s3dP3KveVdMtsa7A==
X-Received: by 2002:a05:600c:198f:b0:394:952d:9a72 with SMTP id
 t15-20020a05600c198f00b00394952d9a72mr8397009wmq.72.1653684324040; 
 Fri, 27 May 2022 13:45:24 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 n19-20020a05600c4f9300b00397342bcfb7sm3263209wmq.46.2022.05.27.13.45.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 13:45:23 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 27 May 2022 22:42:50 +0200
Message-Id: <20220527204250.1748549-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/pcsc-lite: needs gcc >= 4.9
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
Cc: Juha Rantanen <juha@codercoded.com>, Simon Dawson <spdawson@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

gcc >= 4.9 is needed since bump to version 1.9.6 in commit
b02f13cd54912f3dffd0e0863378050104430d77 and
https://github.com/LudovicRousseau/PCSC/commit/d56ed18dbebc4423506ce7f61d3e3bcf4bdc4cb0:

In file included from winscard_clnt.c:123:0:
readerfactory.h:101:3: error: unknown type name '_Atomic'
   _Atomic DWORD dwEventStatus; /**< Recent event that must be sent */
   ^

Fixes:
 - http://autobuild.buildroot.org/results/189f030a2252f17abf8b819feec0003815c66e79

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/acsccid/Config.in    | 2 +-
 package/ccid/Config.in       | 2 +-
 package/libnfc/Config.in     | 6 ++++--
 package/pcsc-lite/Config.in  | 6 ++++--
 package/strongswan/Config.in | 4 ++++
 5 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/package/acsccid/Config.in b/package/acsccid/Config.in
index a926be6e16..2d644ea567 100644
--- a/package/acsccid/Config.in
+++ b/package/acsccid/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_ACSCCID
 	bool "acsccid"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # pcsc-lite, libusb
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb, pcsc-lite
 	depends on BR2_USE_MMU # pcsc-lite
 	depends on !BR2_STATIC_LIBS # pcsc-lite
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
diff --git a/package/ccid/Config.in b/package/ccid/Config.in
index aae5a7181c..c12733375b 100644
--- a/package/ccid/Config.in
+++ b/package/ccid/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_CCID
 	bool "ccid"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libusb, pcsc-lite
 	depends on BR2_USE_MMU # pcsc-lite
 	depends on !BR2_STATIC_LIBS # pcsc-lite
 	select BR2_PACKAGE_PCSC_LITE
diff --git a/package/libnfc/Config.in b/package/libnfc/Config.in
index ead61e4529..3686f570a9 100644
--- a/package/libnfc/Config.in
+++ b/package/libnfc/Config.in
@@ -13,13 +13,15 @@ config BR2_PACKAGE_LIBNFC_ACR122_PCSC
 	depends on BR2_TOOLCHAIN_HAS_THREADS # pcsc-lite
 	depends on BR2_USE_MMU # pcsc-lite
 	depends on !BR2_STATIC_LIBS # pcsc-lite
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pcsc-lite
 	select BR2_PACKAGE_PCSC_LITE
 	help
 	  support for acr112_pcsc driver
 
-comment "acr122_pcsc driver needs a toolchain w/ threads, dynamic library"
+comment "acr122_pcsc driver needs a toolchain w/ threads, dynamic library, gcc >= 4.9"
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 
 config BR2_PACKAGE_LIBNFC_ACR122_USB
 	bool "acr122_usb driver"
diff --git a/package/pcsc-lite/Config.in b/package/pcsc-lite/Config.in
index 1b4d0f7d18..f4ed5ba2f0 100644
--- a/package/pcsc-lite/Config.in
+++ b/package/pcsc-lite/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_PCSC_LITE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # _Atomic keyword
 	help
 	  Middleware to access smart card using SCard API (PC/SC).
 
@@ -33,6 +34,7 @@ config BR2_PACKAGE_PCSC_LITE_EMBEDDED
 
 endif
 
-comment "pcsc-lite needs a toolchain w/ threads, dynamic library"
+comment "pcsc-lite needs a toolchain w/ threads, dynamic library, gcc >= 4.9"
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
diff --git a/package/strongswan/Config.in b/package/strongswan/Config.in
index 430625a102..919ce1f5bc 100644
--- a/package/strongswan/Config.in
+++ b/package/strongswan/Config.in
@@ -108,9 +108,13 @@ config BR2_PACKAGE_STRONGSWAN_EAP_SIM_FILE
 config BR2_PACKAGE_STRONGSWAN_EAP_SIM_PCSC
 	bool "Enable EAP-SIM smart card backend"
 	depends on !BR2_STATIC_LIBS # pcsc-lite
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pcsc-lite
 	select BR2_PACKAGE_PCSC_LITE
 	select BR2_PACKAGE_STRONGSWAN_EAP_SIM
 
+comment "EAP-SIM smart backend needs a toolchain w/ dynamic library, gcc >= 4.9"
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+
 config BR2_PACKAGE_STRONGSWAN_EAP_AKA
 	bool "Enable EAP-AKA"
 	default y if BR2_PACKAGE_STRONGSWAN_EAP # legacy
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
