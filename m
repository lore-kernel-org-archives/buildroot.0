Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16920C433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 22:45:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 99E4E40509;
	Sat,  8 Jan 2022 22:45:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AqQEljPDiOPY; Sat,  8 Jan 2022 22:45:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E912240319;
	Sat,  8 Jan 2022 22:45:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0004B1BF3D2
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 22:44:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E2A8A8148D
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 22:44:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ddQ7Lxpvl_-4 for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 22:44:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 02DDC8148A
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 22:44:50 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 n19-20020a7bc5d3000000b003466ef16375so7508709wmk.1
 for <buildroot@buildroot.org>; Sat, 08 Jan 2022 14:44:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uzogou2VB0HW8X5Zk0IWwgYcUtiRwFGZRW/qnVVhq7w=;
 b=fJAAkU4jiQso81pXKurUWYubr6Vz3kkZ6C0YXzd4a1vH20cT6f7DbMSN60OX2B+QxS
 49YU9p+j0rHns/tB5zU19/s2ttwbs26W6uaYy+qmp33g2unNQh8u/LkZvU21hy6d1x6V
 RynABIlfeBj+i6/o/67Y4LJHYo+jH3Z/uljSo/nn3P7ZzfAta0i9hb2JgebyD4XlhIGi
 QignIW6yDcT66DrDIYioMS1R+WdlNcrF/H9JUR/6iK4z1DH9bpP8ezWzEA2S8Z+DTt+l
 RF0Z7UG8JC0bVW+EwgFxBYFKNyWy7I6LtF7I23yit9pig58QNZIr4KHpX/rpQxtBrX3P
 UIiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uzogou2VB0HW8X5Zk0IWwgYcUtiRwFGZRW/qnVVhq7w=;
 b=C76ciBUxKJI/P9gGbQIXmy8Xu2+bg0ibF8BtHwaXQ+9ck59SdGudGbPU8axraj/U4R
 FVQ7JjOU2Tr6FhWl5kTXitD10sRjwJQwkdIl+JeyBDRfoEaA9AzeBUSYmxbk6tzhnmm0
 DYNZqio5yPLySFsayJYKLtmG3cFQX/f2S+NIFDFiKBkbM4RkZ38oG+1y1wTgT+4GR2um
 uXIY78+7VQubg6Q3gPv9ZKE5jJIaiEk6+e7OWhIHnprIQTGK6JKjAU+ZrrT3WE2LFzNt
 bi45gYdXzrfYhJAh0dbgpout1TbXXKcSC2Mh34eDEQVe7y6ZiCZ+exTxWVEWi37XDk0I
 1S5Q==
X-Gm-Message-State: AOAM533dFsDMAv2Va+wDJeeqZiKfYmig5kwybNCCm+gEcPQK8eBhbl1i
 uPJE4l4uTJ0ddwIKQ9CWXWYnEMptcts=
X-Google-Smtp-Source: ABdhPJw6UiOavkwdH6OiIxL5rfyH6QNPLSdifITT/TVGr/Zi5zfEJckXcRTpJcATLeVwok5TRCS1Dw==
X-Received: by 2002:a1c:1d48:: with SMTP id d69mr4940559wmd.167.1641681889067; 
 Sat, 08 Jan 2022 14:44:49 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id m5sm2660183wml.14.2022.01.08.14.44.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Jan 2022 14:44:48 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  8 Jan 2022 23:43:37 +0100
Message-Id: <20220108224337.3702128-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220108224337.3702128-1-fontaine.fabrice@gmail.com>
References: <20220108224337.3702128-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/domoticz: depends on minizip-zlib
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
Cc: Fabrice Fontaine <fabrice.fontaine@orange.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Depends on minizip-zlib and so drop git submodules

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/domoticz/Config.in     | 4 ++++
 package/domoticz/domoticz.hash | 2 +-
 package/domoticz/domoticz.mk   | 8 ++++----
 3 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/package/domoticz/Config.in b/package/domoticz/Config.in
index 4324d13cee..fa7fd546fa 100644
--- a/package/domoticz/Config.in
+++ b/package/domoticz/Config.in
@@ -10,6 +10,7 @@ config BR2_PACKAGE_DOMOTICZ
 	depends on BR2_PACKAGE_LUA_5_3
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-thread
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # exception_ptr
+	depends on BR2_PACKAGE_MINIZIP_ZLIB
 	select BR2_PACKAGE_BOOST
 	select BR2_PACKAGE_BOOST_ATOMIC
 	select BR2_PACKAGE_BOOST_DATE_TIME
@@ -43,3 +44,6 @@ comment "domoticz needs lua 5.3 and a toolchain w/ C++, gcc >= 6, NPTL, wchar, d
 
 comment "domoticz needs exception_ptr"
 	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
+
+comment "domoticz needs minizip-zlib"
+	depends on !BR2_PACKAGE_MINIZIP_ZLIB
diff --git a/package/domoticz/domoticz.hash b/package/domoticz/domoticz.hash
index dcd5bead1e..2c6c837e64 100644
--- a/package/domoticz/domoticz.hash
+++ b/package/domoticz/domoticz.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  d8e99e0f96873aa105b57f73656ef7a14c89e0acf2649b2d4ef1167b14bab4b2  domoticz-2021.1-br1.tar.gz
+sha256  c4dc3455edae8bf00d2e950002f70d5b90ac577b1559ef7ada6870d970069fbb  domoticz-2021.1.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  License.txt
diff --git a/package/domoticz/domoticz.mk b/package/domoticz/domoticz.mk
index f142791830..0d1088d395 100644
--- a/package/domoticz/domoticz.mk
+++ b/package/domoticz/domoticz.mk
@@ -5,9 +5,7 @@
 ################################################################################
 
 DOMOTICZ_VERSION = 2021.1
-DOMOTICZ_SITE = https://github.com/domoticz/domoticz
-DOMOTICZ_SITE_METHOD = git
-DOMOTICZ_GIT_SUBMODULES = YES
+DOMOTICZ_SITE = $(call github,domoticz,domoticz,$(DOMOTICZ_VERSION))
 DOMOTICZ_LICENSE = GPL-3.0
 DOMOTICZ_LICENSE_FILES = License.txt
 DOMOTICZ_CPE_ID_VENDOR = domoticz
@@ -19,6 +17,7 @@ DOMOTICZ_DEPENDENCIES = \
 	jsoncpp \
 	libcurl \
 	lua \
+	minizip \
 	mosquitto \
 	openssl \
 	sqlite \
@@ -34,10 +33,11 @@ DOMOTICZ_CONF_OPTS += \
 	-DUSE_OPENSSL_STATIC=OFF
 
 # Do not use any built-in libraries which are enabled by default for
-# jsoncpp, fmt, sqlite and mqtt
+# jsoncpp, fmt, minizip, sqlite and mqtt
 DOMOTICZ_CONF_OPTS += \
 	-DUSE_BUILTIN_JSONCPP=OFF \
 	-DUSE_BUILTIN_LIBFMT=OFF \
+	-DUSE_BUILTIN_MINIZIP=OFF \
 	-DUSE_BUILTIN_SQLITE=OFF \
 	-DUSE_BUILTIN_MQTT=OFF
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
