Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84F39C433F5
	for <buildroot@archiver.kernel.org>; Sat, 19 Mar 2022 19:35:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 40B57607B5;
	Sat, 19 Mar 2022 19:35:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6MJ3ducn5T-J; Sat, 19 Mar 2022 19:35:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4DC05605C9;
	Sat, 19 Mar 2022 19:35:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A2FCA1BF255
 for <buildroot@lists.busybox.net>; Sat, 19 Mar 2022 19:35:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8FD7F60746
 for <buildroot@lists.busybox.net>; Sat, 19 Mar 2022 19:35:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7bkVCRUXw0eo for <buildroot@lists.busybox.net>;
 Sat, 19 Mar 2022 19:35:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7CA5C605A2
 for <buildroot@buildroot.org>; Sat, 19 Mar 2022 19:35:37 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 p184-20020a1c29c1000000b0037f76d8b484so6405329wmp.5
 for <buildroot@buildroot.org>; Sat, 19 Mar 2022 12:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Gm38y10vyz3XGCMC6VMNzF8TaRIyNhMkXgrNE7mfCoM=;
 b=lwF1OY0trYinguQRIwKR0YcJzVQtkS8GdOjooI8kVGFez8tehuM+ZECiI31AmDr4XH
 dzHXazAlf2a8M1b4OvwtO39nuy++kTjF3+YVOYNFewG8o6RkYNm65u4LH9Vv+0XrVmtt
 h1KN5jxIOFWM5rSHm9z/K6G9yVmz8kiBD9cwaSej9QpxtMNeAtAw9vXvhYSTh6Ip3uJ8
 cmZkj/WNVdYrQevqpb7OKnRxJOLDIIp1A3GbwmevABzf1pcM898A8dx3Ch2042YeZeXY
 KXFnAKD6GiSRhonUtEqcZZRwwOqFYa4Jqimhnoxgtp2QaZBk22gyOaWr/kwBKtJW4aMI
 ktHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Gm38y10vyz3XGCMC6VMNzF8TaRIyNhMkXgrNE7mfCoM=;
 b=ap2BaTUM1b3UBmDxVeQbIAkiAz4moCOy9bZpXdsGrjcCvIYicIZeFoVHdkhF8u5Js0
 rX4hqtW5+jpnS4mMOoRrz1wnvTv8zuxuHa49ejc/6yhX/n4viqsGVhzzC2nVzmH2iG8p
 oLuS6Gl1PffLPmcGsP72lvj5vdEW357cKH/hoCjaxzv3aKHz3J5jMPedcr7JLox+8AJr
 LdIGjC/ZcxP4S8T35jRxZjBPsaPFVxlYZ2vlvEV8bCLh2yf2YUR1DElWwCtiVBES25zh
 m//vZyM1/pycGD7bO9wLTDdbajGC7ASe+WoPKTC2xni0U2u6IuHIaVxYclaDzuqvuS87
 L6kQ==
X-Gm-Message-State: AOAM532+Qfgi+gQQXDu9uInZhP98AD/+UoB1ON9omCqXgl4FV17eB0ya
 ezLtQF+0V6ubm5LI+36zoz+06H0VWh8=
X-Google-Smtp-Source: ABdhPJzau0vqYQ+UYjBfJMheGn5ryLLhxLST2t4mg1VofoLveUKj7qsZBXMca55c2XQZ90YJEAZN8g==
X-Received: by 2002:a05:600c:1c02:b0:389:cf43:eafa with SMTP id
 j2-20020a05600c1c0200b00389cf43eafamr13069381wms.203.1647718535417; 
 Sat, 19 Mar 2022 12:35:35 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 u8-20020a5d4348000000b00203dbfa4ff2sm9165655wrr.34.2022.03.19.12.35.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Mar 2022 12:35:34 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 19 Mar 2022 20:34:22 +0100
Message-Id: <20220319193422.1148509-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/usbguard: bump to version 1.1.1
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
Cc: Kamel Bouhara <kamel.bouhara@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- This bump fixes unauthorized access via D-Bus (CVE-2019-25058):
  https://github.com/advisories/GHSA-p5wh-m4gj-x2mr
  but dbus is disabled on buildroot
- musl is supported since
  https://github.com/USBGuard/usbguard/commit/b04e8deacac4f3f4a82a10b219c2d555e1b2aa24
- C++17 is now mandatory:
  https://github.com/USBGuard/usbguard/commit/8c86264986685bf646c65228abce2432e08e3c4c
- Update hash of license file (use license file from gnu.org:
  https://github.com/USBGuard/usbguard/commit/3292511ab164ce0bdf6d58f0369ce3993dded9ad)

https://github.com/USBGuard/usbguard/blob/usbguard-1.1.1/CHANGELOG.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/usbguard/Config.in     | 8 +++-----
 package/usbguard/usbguard.hash | 6 ++++--
 package/usbguard/usbguard.mk   | 2 +-
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/usbguard/Config.in b/package/usbguard/Config.in
index e97d0e729c..4c3dc7f2c2 100644
--- a/package/usbguard/Config.in
+++ b/package/usbguard/Config.in
@@ -3,9 +3,8 @@ config BR2_PACKAGE_USBGUARD
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS # protobuf
 	depends on BR2_INSTALL_LIBSTDCPP # protobuf
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libqb, protobuf
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # protobuf
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
 	depends on !BR2_STATIC_LIBS # libqb, protobuf
-	depends on !BR2_TOOLCHAIN_USES_MUSL
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::future
 	select BR2_PACKAGE_PROTOBUF
 	select BR2_PACKAGE_LIBQB
@@ -19,10 +18,9 @@ config BR2_PACKAGE_USBGUARD
 
 	  https://usbguard.github.io/
 
-comment "usbguard needs a glibc or uClibc toolchain w/ C++, threads, dynamic library, gcc >= 4.8"
+comment "usbguard needs a toolchain w/ C++, threads, dynamic library, gcc >= 7"
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
-		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 \
-		|| BR2_TOOLCHAIN_USES_MUSL
+		|| BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_7
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
 
 comment "usbguard needs a toolchain not affected by GCC bug 64735"
diff --git a/package/usbguard/usbguard.hash b/package/usbguard/usbguard.hash
index fd77acc75a..a69240b3f9 100644
--- a/package/usbguard/usbguard.hash
+++ b/package/usbguard/usbguard.hash
@@ -1,3 +1,5 @@
+# From https://github.com/USBGuard/usbguard/releases/download/usbguard-1.1.1/usbguard-1.1.1.tar.gz.sum
+sha256  460ebfb4ffc5609739a202a3a1d9fda1c30de033b634845b8baa136352bfb432  usbguard-1.1.1.tar.gz
+
 # Locally calculated
-sha256  5617986cd5dd1a2d311041648a1977d836cf4e33a4121d7f82599f21496abc42  usbguard-1.0.0.tar.gz
-sha256  a45d0bb572ed792ed34627a72621834b3ba92aab6e2cc4e04301dee7a728d753  LICENSE
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  LICENSE
diff --git a/package/usbguard/usbguard.mk b/package/usbguard/usbguard.mk
index 54a4031056..614b7d655d 100644
--- a/package/usbguard/usbguard.mk
+++ b/package/usbguard/usbguard.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-USBGUARD_VERSION = 1.0.0
+USBGUARD_VERSION = 1.1.1
 USBGUARD_SITE = https://github.com/USBGuard/usbguard/releases/download/usbguard-$(USBGUARD_VERSION)
 USBGUARD_LICENSE = GPL-2.0+
 USBGUARD_LICENSE_FILES = LICENSE
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
