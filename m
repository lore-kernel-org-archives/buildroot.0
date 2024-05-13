Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33110C25B78
	for <buildroot@archiver.kernel.org>; Mon, 13 May 2024 22:04:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F19DC4168E;
	Mon, 13 May 2024 22:04:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TROBBT4GfqtF; Mon, 13 May 2024 22:04:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8682C41693
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8682C41693;
	Mon, 13 May 2024 22:04:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DBF261BF2C0
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 22:04:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C888A60600
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 22:04:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TLbvOJvhGTYk for <buildroot@lists.busybox.net>;
 Mon, 13 May 2024 22:04:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22d; helo=mail-lj1-x22d.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org F1671605D1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F1671605D1
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F1671605D1
 for <buildroot@buildroot.org>; Mon, 13 May 2024 22:03:59 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2e3b1b6e9d1so60173861fa.2
 for <buildroot@buildroot.org>; Mon, 13 May 2024 15:03:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715637837; x=1716242637;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1d5vvbjxlNjUxOgnNN+1JGOHBUbKaa7WwM7vyMElePo=;
 b=lDVfjVDu1NpufiCSBSGdy2Ga7ziDljRNO0C5KnNlpy/SZjZIrZuKM0Y/ALx5roHJUH
 c6ApTpNBq2QuJih4ULoLL00nmDEvcdczrAT9jX9IsmoXPH0eSq4I7U5BsQI4SAWW/TbI
 6EXmIftgDnKMnTRFTEwpnITveK4vjiiOdqo5FHDtS6m2AO77YVUdtFzRsrC+AZJeI6/y
 YH6Zc/ARwS6TBj7Wd/wwIqU3zwznHcpmXDF0EeJGUTnlEsF8lm01DYK6aqheb/Wb3qxl
 JVnlBgUzfvubACeVH6hrknb8q4XXlGFHIx6j9hudp7u88BrPY5gHUEpsvc0QP/W/Cnxm
 0Vmg==
X-Gm-Message-State: AOJu0YxHcleMacJ+KoqPJ4+KkEniARsBGlQckbl3NqD0ugy7AuAnvctt
 uxaBqwf268wLwKiXO//pvenxRJbpVFiNqTrCiFj8lT+j7jX/fM4hEJELOwR+
X-Google-Smtp-Source: AGHT+IF9GhVK5iCZeVMJ58iKNIO8VJbJYNcJJo+hTMn0VhmNe3zcbHpuLuVCWWVpHv1IgWPfGd3/UQ==
X-Received: by 2002:a2e:a58b:0:b0:2e2:891d:5f62 with SMTP id
 38308e7fff4ca-2e51ff6692amr78150681fa.29.1715637837502; 
 Mon, 13 May 2024 15:03:57 -0700 (PDT)
Received: from precision7530-arch-roy.lan
 ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2e4d0ce3488sm15548401fa.52.2024.05.13.15.03.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 May 2024 15:03:56 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 14 May 2024 00:03:10 +0200
Message-ID: <20240513220328.1085629-5-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240513220328.1085629-1-roykollensvendsen@gmail.com>
References: <1934329>
 <20240513220328.1085629-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715637837; x=1716242637; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1d5vvbjxlNjUxOgnNN+1JGOHBUbKaa7WwM7vyMElePo=;
 b=Y1toBDWAOZRE/QQHt9gGoYOMyeHiQ/tR1WnPDJ8jcrwYtqJYTUiGNsq/day7ZZjTjQ
 kx3pddtij63H8kLaxYeUxvbI1vlMNQ+QR4NfvBhqKnYR25AXLLXG/l1quuSxsI7rFt7g
 14LJ3rN1g1IJxUBZytQ0P1etP9pHlNFayxKuYuE2aRYFUXB+Cbvk+s2q6/S1KEKDycBU
 fm6Hs3jeAhk6E4V5xB67fS1hMeqjaqdybLzcuI2hj10DTHYqNqWsMK+biGiv4u9c88yl
 hWufcEhL++mXE+bkIrDcYfkxfYnyLZ/vdghsvODHwe//FpSdjjwHLK8L+2eazyw2Yjzy
 wE4Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Y1toBDWA
Subject: [Buildroot] [PATCH v4 05/14] package/qt6/qt6base: add blind option
 to enable Sql support on host
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
Cc: Zoltan Gyarmati <zgyarmati@zgyarmati.de>,
 Jesse Van Gavere <jesseevg@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
Changes v3 -> v4:
  - This patch was added in v4. Required by patch 12/14.

 package/qt6/qt6base/Config.in.host | 5 +++++
 package/qt6/qt6base/qt6base.mk     | 7 ++++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/package/qt6/qt6base/Config.in.host b/package/qt6/qt6base/Config.in.host
index 80bc13c7dc..46fb668817 100644
--- a/package/qt6/qt6base/Config.in.host
+++ b/package/qt6/qt6base/Config.in.host
@@ -12,3 +12,8 @@ config BR2_PACKAGE_HOST_QT6BASE_NETWORK
 # (e.g. qmltestrunner).
 config BR2_PACKAGE_HOST_QT6BASE_TEST
 	bool
+
+# Select this if you need host qt6 tools that require the Qt::Sql module
+# (e.g. qhelpgenerator).
+config BR2_PACKAGE_HOST_QT6BASE_SQL
+	bool
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index b19cce26f8..c927b06482 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -86,7 +86,6 @@ HOST_QT6BASE_DEPENDENCIES = \
 HOST_QT6BASE_CONF_OPTS = \
 	-DFEATURE_concurrent=OFF \
 	-DFEATURE_xml=ON \
-	-DFEATURE_sql=OFF \
 	-DFEATURE_dbus=OFF \
 	-DFEATURE_icu=OFF \
 	-DFEATURE_glib=OFF \
@@ -107,6 +106,12 @@ else
 HOST_QT6BASE_CONF_OPTS += -DFEATURE_network=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_HOST_QT6BASE_SQL),y)
+HOST_QT6BASE_CONF_OPTS += -DFEATURE_sql=ON
+else
+HOST_QT6BASE_CONF_OPTS += -DFEATURE_sql=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_HOST_QT6BASE_TEST),y)
 HOST_QT6BASE_CONF_OPTS += -DFEATURE_testlib=ON
 else
-- 
2.45.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
