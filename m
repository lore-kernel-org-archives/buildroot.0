Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D74FC678D5
	for <buildroot@archiver.kernel.org>; Tue,  7 Feb 2023 14:30:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE58B417B9;
	Tue,  7 Feb 2023 14:30:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE58B417B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MQ5FT7Z5SHSi; Tue,  7 Feb 2023 14:30:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B55AE41583;
	Tue,  7 Feb 2023 14:30:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B55AE41583
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B4C481BF2CA
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 14:30:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9B87F81759
 for <buildroot@lists.busybox.net>; Tue,  7 Feb 2023 14:30:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B87F81759
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id twoVyrklqXeK for <buildroot@lists.busybox.net>;
 Tue,  7 Feb 2023 14:30:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B254081290
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B254081290
 for <buildroot@buildroot.org>; Tue,  7 Feb 2023 14:30:12 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 j32-20020a05600c1c2000b003dc4fd6e61dso13301722wms.5
 for <buildroot@buildroot.org>; Tue, 07 Feb 2023 06:30:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eoGRQrLarMqgyhb+VOuwAFZTGtdfN9VrCBMDy5byUYE=;
 b=0WaLp4ufLwDIJzyN1AQkTlJhdrk6zVesRUTRkO5UkKI6HLMm26AJP2HqJ3dakkZKd4
 Uzdkn7U8mluFYxHFW4Oe5esFTF9J+ozdUGHzOLaG8NHkEwKeKlrx7t3hGhchYH1l2EVr
 To5sHnRzFJAHKDTcdiOPtOlhBNiU59X21aL238Dn43aZ7N6IVnxS4rlb2/93H0mUx4au
 JtJlFEecmsSes74P1bq4V3wVqgoWMlOk7G9j+9+n2E/97X7UjcTUqFWfluNZu6uZgvnU
 3GMJ3MV11qfMLexe4HMLPUo2WE+/J6FuhSMn3fWexgPgJY51aFPA88MFg1guu9PDWTqb
 VAYQ==
X-Gm-Message-State: AO0yUKUnWnUNOaQLvUXwXYDmDYaXeBH9wc3ksCYdf5BT+nMt8fH9ekmh
 0tpVtCCFa+R55xaNmEArjqnIOWP1cFByFlkkoBo8ng==
X-Google-Smtp-Source: AK7set9OKgglxiypB1BdmD5yhzqPSk8k/tXx8sGJy2D6PJYkKTbEINvPWA4GFHGABRmeyQ+IPg5RsA==
X-Received: by 2002:a05:600c:4a9a:b0:3dc:f24:f2de with SMTP id
 b26-20020a05600c4a9a00b003dc0f24f2demr3222886wmp.12.1675780210617; 
 Tue, 07 Feb 2023 06:30:10 -0800 (PST)
Received: from angeloc.wifiguest.local (cpe1150018.bra.be.verixi.net.
 [85.119.216.19]) by smtp.gmail.com with ESMTPSA id
 l16-20020a1c7910000000b003dc1d668866sm18537074wme.10.2023.02.07.06.30.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 06:30:09 -0800 (PST)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  7 Feb 2023 15:29:55 +0100
Message-Id: <20230207143006.2681335-2-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230207143006.2681335-1-angelo@amarulasolutions.com>
References: <20230207143006.2681335-1-angelo@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eoGRQrLarMqgyhb+VOuwAFZTGtdfN9VrCBMDy5byUYE=;
 b=c3FPrcY0WczXM/uxvKpIc33ZY5/OvJU5pNJKzqG1evWGEZkF9iWOYZI3ooTJkMcGhG
 73n9e7OxnSW191JaBYuCNlpGQk67ttUJfchibg3ExBihMdnyZqcvRdQ+UCCfs6gc5Dxd
 GePhKu2dCloqai571pJhoF7oLodNc4Xz31ASc=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=c3FPrcY0
Subject: [Buildroot] [PATCH v5 01/12] package/qt6/qt6base: add support for
 gui module
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
Cc: jesseevg@gmail.com, Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Jesse Van Gavere <jesseevg@gmail.com>

Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>
Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/qt6/qt6base/Config.in  | 6 ++++++
 package/qt6/qt6base/qt6base.mk | 8 ++++++++
 2 files changed, 14 insertions(+)

diff --git a/package/qt6/qt6base/Config.in b/package/qt6/qt6base/Config.in
index e8357a675c..03e138b8e1 100644
--- a/package/qt6/qt6base/Config.in
+++ b/package/qt6/qt6base/Config.in
@@ -30,6 +30,12 @@ config BR2_PACKAGE_QT6BASE_DBUS
 	help
 	  This option enables the D-Bus module.
 
+config BR2_PACKAGE_QT6BASE_GUI
+	bool "gui module"
+	select BR2_PACKAGE_FREETYPE
+	help
+	  This option enables the Qt6Gui library.
+
 config BR2_PACKAGE_QT6BASE_NETWORK
 	bool "network module"
 	help
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 43ab642b6c..38479dc106 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -144,6 +144,14 @@ else
 QT6BASE_CONF_OPTS += -DFEATURE_glib=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_QT6BASE_GUI),y)
+QT6BASE_CONF_OPTS += -DFEATURE_gui=ON -DFEATURE_freetype=ON -DINPUT_opengl=no -DFEATURE_vulkan=OFF
+QT6BASE_DEPENDENCIES += freetype
+
+else
+QT6BASE_CONF_OPTS += -DFEATURE_gui=OFF
+endif
+
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 QT6BASE_CONF_OPTS += -DINPUT_openssl=yes
 QT6BASE_DEPENDENCIES += openssl
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
