Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A40FC46CD3
	for <buildroot@archiver.kernel.org>; Mon, 18 Dec 2023 18:32:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 14F1961125;
	Mon, 18 Dec 2023 18:32:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 14F1961125
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3ej7oQQ5z873; Mon, 18 Dec 2023 18:32:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4BE9260F33;
	Mon, 18 Dec 2023 18:32:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4BE9260F33
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6E1011BF20B
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 18:32:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4667C60F33
 for <buildroot@lists.busybox.net>; Mon, 18 Dec 2023 18:32:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4667C60F33
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LNR3KyPh_1wz for <buildroot@lists.busybox.net>;
 Mon, 18 Dec 2023 18:32:45 +0000 (UTC)
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 193C760F2B
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 18:32:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 193C760F2B
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-55359dc0290so2434828a12.1
 for <buildroot@buildroot.org>; Mon, 18 Dec 2023 10:32:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702924363; x=1703529163;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ox4YuqmH0Om1FSiipUvBah+JCLXUuoRl5dd0D1Z9S54=;
 b=Feih1pjDbVTWVCCpa7JYEdCczBXpkwcQdz/GEn+sCCGOP+rmR8wZuOOx+Z+yt2wOlM
 MH0T6ze0bhGkgyIn33h11qhNDNlGMuHOoktr3RSKsgNI66vBcZ8+nqCUkvEwqBnuXwS0
 Ml/khAs6+Y3IcpFe58Ku7rdmHNNkVUQjbXk5cDSJfP5YEf0OLiW30IVhKFiMyqZg0yuU
 gwUi8ilyD8evqlRYW2k34xWub/Wv8ofwqjgPjBbK3tlsVdJ6fyhfaOnl4AhRM0hNv+68
 GsyyxhW1zJLyXTmR6NILJxSdig0HfMLOT4NwoYKmGmBVz+DGcQIIV4VNuKbv8P6m8L5R
 b39w==
X-Gm-Message-State: AOJu0YygKHSehcY38cfxL4F0FVSX4RfsAO1y7OZq044pN8yhGqvlekD8
 egBCuXskpDYGoNtBR1nqBuDtXcsRoq/GeQ==
X-Google-Smtp-Source: AGHT+IG9rafto5ka/f9EFH38tLiWK6+hBGN+7XfM1g066sNUBNctRvTZaJJxWKextU+thgvUeZsrbw==
X-Received: by 2002:a05:6402:60b:b0:553:3042:195b with SMTP id
 n11-20020a056402060b00b005533042195bmr3002661edv.4.1702924362834; 
 Mon, 18 Dec 2023 10:32:42 -0800 (PST)
Received: from localhost.localdomain (balticom-135-235.balticom.lv.
 [83.99.135.235]) by smtp.gmail.com with ESMTPSA id
 cq12-20020a056402220c00b0055335e89ed8sm1753813edb.30.2023.12.18.10.32.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Dec 2023 10:32:42 -0800 (PST)
From: Davis Mosenkovs <davikovs@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 18 Dec 2023 20:32:30 +0200
Message-ID: <20231218183230.1899-1-davikovs@gmail.com>
X-Mailer: git-send-email 2.43.0.windows.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702924363; x=1703529163; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ox4YuqmH0Om1FSiipUvBah+JCLXUuoRl5dd0D1Z9S54=;
 b=GIysx2REM2kdkgTCLbips4seaxL89ORvETALXdZM6R9WFHVy5TbxmQb8JeJ7xi81Rb
 gwrC4pvLNtspH/CF/ezklitbK5s6XI4OzeMZtLXt4N789eystdebrccy1YDEQekBv0XR
 IUoj8u/3n/cO8EMHW8AqTc8tepPP592yffROpV12iSciBb8GWy8+LX7ldSLVXTGkB3bv
 n3LU6XvGksGB9lVfPhTybrZOzcRFg76aq17yUN9So/ah3+TXnWCbJwLWydtdYWknh0Uh
 AdjWa0XAi3IvyEeiLkMUb+MOXzrIu5AZ0R9XID/GbAMI50SQ5EtpqXXlyse9A8g/hux3
 gooA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=GIysx2RE
Subject: [Buildroot] [PATCH 1/1] package/{bluez5_utils,
 bluez5_utils-headers}: bump to version 5.71
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
Cc: Davis Mosenkovs <davikovs@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
https://git.kernel.org/pub/scm/bluetooth/bluez.git/tree/ChangeLog

Removed patch which is included in this release.
---
 .../bluez5_utils-headers.mk                   |  2 +-
 .../0001-configure-Check-ell-path.patch       | 35 -------------------
 package/bluez5_utils/bluez5_utils.hash        |  2 +-
 package/bluez5_utils/bluez5_utils.mk          |  4 +--
 4 files changed, 3 insertions(+), 40 deletions(-)
 delete mode 100644 package/bluez5_utils/0001-configure-Check-ell-path.patch

diff --git a/package/bluez5_utils-headers/bluez5_utils-headers.mk b/package/bluez5_utils-headers/bluez5_utils-headers.mk
index 0790dd7e0e..03c3ab9287 100644
--- a/package/bluez5_utils-headers/bluez5_utils-headers.mk
+++ b/package/bluez5_utils-headers/bluez5_utils-headers.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Keep the version and patches in sync with bluez5_utils
-BLUEZ5_UTILS_HEADERS_VERSION = 5.68
+BLUEZ5_UTILS_HEADERS_VERSION = 5.71
 BLUEZ5_UTILS_HEADERS_SOURCE = bluez-$(BLUEZ5_UTILS_VERSION).tar.xz
 BLUEZ5_UTILS_HEADERS_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
 BLUEZ5_UTILS_HEADERS_DL_SUBDIR = bluez5_utils
diff --git a/package/bluez5_utils/0001-configure-Check-ell-path.patch b/package/bluez5_utils/0001-configure-Check-ell-path.patch
deleted file mode 100644
index 3e5f7c6516..0000000000
--- a/package/bluez5_utils/0001-configure-Check-ell-path.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 124187ef9abed60a7c40f751153e9c4516cd1f91 Mon Sep 17 00:00:00 2001
-From: Rudi Heitbaum <rudi@heitbaum.com>
-Date: Sat, 1 Jul 2023 01:31:20 +0000
-Subject: [PATCH] configure: Check ell path
-
-Use of AC_CHECK_FILE prevents cross compilation.
-Instead use test to support cross compiling.
-
-Signed-off-by: Rudi Heitbaum <rudi@heitbaum.com>
-
-Upstream: https://github.com/bluez/bluez/pull/546
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- configure.ac | 7 ++++---
- 1 file changed, 4 insertions(+), 3 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index eff297960..bc7edfcd3 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -298,9 +298,10 @@ if (test "${enable_external_ell}" = "yes"); then
- 	AC_SUBST(ELL_LIBS)
- fi
- if (test "${enable_external_ell}" != "yes"); then
--	AC_CHECK_FILE(${srcdir}/ell/ell.h, dummy=yes,
--			AC_CHECK_FILE(${srcdir}/../ell/ell/ell.h, dummy=yes,
--				AC_MSG_ERROR(ELL source is required or use --enable-external-ell)))
-+	if (test ! -f ${srcdir}/ell/ell.h) &&
-+			(test ! -f ${srcdir}/../ell/ell/ell.h); then
-+				AC_MSG_ERROR(ELL source is required or use --enable-external-ell)
-+	fi
- fi
- AM_CONDITIONAL(EXTERNAL_ELL, test "${enable_external_ell}" = "yes" ||
- 				(test "${enable_btpclient}" != "yes" &&
diff --git a/package/bluez5_utils/bluez5_utils.hash b/package/bluez5_utils/bluez5_utils.hash
index 45952e60f1..7d0fa980bc 100644
--- a/package/bluez5_utils/bluez5_utils.hash
+++ b/package/bluez5_utils/bluez5_utils.hash
@@ -1,5 +1,5 @@
 # From https://www.kernel.org/pub/linux/bluetooth/sha256sums.asc:
-sha256  fc505e6445cb579a55cacee6821fe70d633921522043d322b696de0a175ff933  bluez-5.68.tar.xz
+sha256  b828d418c93ced1f55b616fb5482cf01537440bfb34fbda1a564f3ece94735d8  bluez-5.71.tar.xz
 # Locally computed
 sha256  b499eddebda05a8859e32b820a64577d91f1de2b52efa2a1575a2cb4000bc259  COPYING
 sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING.LIB
diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
index 82800c0430..5f8811d6bd 100644
--- a/package/bluez5_utils/bluez5_utils.mk
+++ b/package/bluez5_utils/bluez5_utils.mk
@@ -5,12 +5,10 @@
 ################################################################################
 
 # Keep the version and patches in sync with bluez5_utils-headers
-BLUEZ5_UTILS_VERSION = 5.68
+BLUEZ5_UTILS_VERSION = 5.71
 BLUEZ5_UTILS_SOURCE = bluez-$(BLUEZ5_UTILS_VERSION).tar.xz
 BLUEZ5_UTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/bluetooth
 BLUEZ5_UTILS_INSTALL_STAGING = YES
-# 0001-configure-Check-ell-path.patch
-BLUEZ5_UTILS_AUTORECONF = YES
 BLUEZ5_UTILS_LICENSE = GPL-2.0+, LGPL-2.1+
 BLUEZ5_UTILS_LICENSE_FILES = COPYING COPYING.LIB
 BLUEZ5_UTILS_CPE_ID_VENDOR = bluez
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
