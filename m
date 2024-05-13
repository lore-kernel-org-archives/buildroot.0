Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB81DC25B78
	for <buildroot@archiver.kernel.org>; Mon, 13 May 2024 22:04:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5FEC340B19;
	Mon, 13 May 2024 22:04:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CetpU-o579LL; Mon, 13 May 2024 22:04:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 28949415B0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 28949415B0;
	Mon, 13 May 2024 22:04:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7872E1BF2C0
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 22:03:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 646AF81264
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 22:03:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8HwS4uUUrrc8 for <buildroot@lists.busybox.net>;
 Mon, 13 May 2024 22:03:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::232; helo=mail-lj1-x232.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 501BE80F73
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 501BE80F73
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 501BE80F73
 for <buildroot@buildroot.org>; Mon, 13 May 2024 22:03:54 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2e0a34b2899so75599751fa.3
 for <buildroot@buildroot.org>; Mon, 13 May 2024 15:03:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715637832; x=1716242632;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q7HlFM96imoWqLn7ogz4CP7CS74Ze91J2sJaR1PTZ2Q=;
 b=XogaKkjKbcFm8ixBa0yuGOzQ9vhcdJyPV+Hrb8nG0Vzuiqlg+YeJDKkCaN6rftVn8e
 /z+qwfLv+0NklBoob7mFj6zZJ9EIxGMbanqWR1uPpnjD4Hv0ztY1uYdaLfX+ShDrDLG9
 +8JNv7C1WlX+DukO91PY6pbgLxG8I7FjxQGbuqH82xFJIoXnPeQ7DvsplRYx7xQPDjor
 UzwJ5y299boBitjM7vbjPBtnQIR3TOHRcmQkBNxOQH+mVsGlANsjxnqQ46Naosw/Ppol
 rTHFagbboHiReDsEapl2VlEq4ACVifxOLarKwPq1OU9g+gS0FbwdmhJCnv1BU90dkggV
 OOhA==
X-Gm-Message-State: AOJu0Yygniyv2W85yO0Rd88qIRLPcZk+GXp8Co/UDqVP63n1/7UrdH0M
 IkSC4/7k4rKOd0xsixZTEkxiQFqaLOmMqH5jLGqjezCSAu2afkDYu5IxGfRR
X-Google-Smtp-Source: AGHT+IEaSP0E2rgaKwwGdJqpinamP4E8ExDwzRdj1eMbfJf4kkvDpHAi4IObWO/CC0vWdqIiI6oYWw==
X-Received: by 2002:a2e:81c3:0:b0:2e1:ae29:f28a with SMTP id
 38308e7fff4ca-2e5203b41d4mr97844311fa.34.1715637831762; 
 Mon, 13 May 2024 15:03:51 -0700 (PDT)
Received: from precision7530-arch-roy.lan
 ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2e4d0ce3488sm15548401fa.52.2024.05.13.15.03.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 May 2024 15:03:51 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 14 May 2024 00:03:07 +0200
Message-ID: <20240513220328.1085629-2-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240513220328.1085629-1-roykollensvendsen@gmail.com>
References: <1934329>
 <20240513220328.1085629-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715637832; x=1716242632; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q7HlFM96imoWqLn7ogz4CP7CS74Ze91J2sJaR1PTZ2Q=;
 b=j/UxzIdT9PZx/Blh27LrQ90Nv9nU2jdxgohz3OumMv47ZwhxTGTwBrCLuBKE/OijaS
 rNcVKV13mePeQehdkGEmi9oyYmD8byrrSZt9LbvcDAxuOpvhFnqxdRTyZwnYkBkJoVce
 yqb+tJOJHng6tRRj/+iOuKFD2Ue7G5kP3dshkPXPV/Drbt1nyWcmZCp6r0Kdi2r75ufV
 PE4lW5GNkkSblXqO3V0xjApmPOIrODN+ZwgNC7YIDadbRr/6trqfzxyqeFu7AaRtGViQ
 4QILP4kWyerfao246pm8tpFmPCgUm3SJ1aatK5KsoqWoV3MB80tC48cwmF4sWsg8dfSp
 GSFA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=j/UxzIdT
Subject: [Buildroot] [PATCH v4 02/14] package/qt6/qt6base: add blind option
 to enable GUI support on host
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
Cc: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Zoltan Gyarmati <zgyarmati@zgyarmati.de>,
 Jesse Van Gavere <jesseevg@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Roy Kollen Svendsen <roy.kollen.svendsen@akersolutions.com>

The Qt6::Gui module is needed when building the 'Qt Shader Baker'
(qsb) host tool.

Qsb is needed for converting the Qt6 Vulkan GLSL source code to
platform specific shader languages which is then later copied to
target.

For more details take a look at:

https://doc.qt.io/qt-6/qtshadertools-overview.html

and

https://doc.qt.io/qt-6/qshaderbaker.html
Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
 package/Config.in.host             | 1 +
 package/qt6/Config.in.host         | 5 +++++
 package/qt6/qt6base/Config.in.host | 4 ++++
 package/qt6/qt6base/qt6base.mk     | 7 ++++++-
 4 files changed, 16 insertions(+), 1 deletion(-)
 create mode 100644 package/qt6/Config.in.host
 create mode 100644 package/qt6/qt6base/Config.in.host

diff --git a/package/Config.in.host b/package/Config.in.host
index 986b2854d0..cbf54f5752 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -95,6 +95,7 @@ menu "Host utilities"
 	source "package/python3/Config.in.host"
 	source "package/qemu/Config.in.host"
 	source "package/qoriq-rcw/Config.in.host"
+	source "package/qt6/Config.in.host"
 	source "package/raspberrypi-usbboot/Config.in.host"
 	source "package/rauc/Config.in.host"
 	source "package/riscv-isa-sim/Config.in.host"
diff --git a/package/qt6/Config.in.host b/package/qt6/Config.in.host
new file mode 100644
index 0000000000..dfe7865c57
--- /dev/null
+++ b/package/qt6/Config.in.host
@@ -0,0 +1,5 @@
+if BR2_PACKAGE_QT6
+
+source "package/qt6/qt6base/Config.in.host"
+
+endif
diff --git a/package/qt6/qt6base/Config.in.host b/package/qt6/qt6base/Config.in.host
new file mode 100644
index 0000000000..326c06278e
--- /dev/null
+++ b/package/qt6/qt6base/Config.in.host
@@ -0,0 +1,4 @@
+# Select this if you need host qt6 tools that require the Qt::Gui module (e.g.
+# Qt Shader Baker(qsb)).
+config BR2_PACKAGE_HOST_QT6BASE_GUI
+	bool
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index b8040e395b..36ec05b394 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -84,7 +84,6 @@ HOST_QT6BASE_DEPENDENCIES = \
 	host-pcre2 \
 	host-zlib
 HOST_QT6BASE_CONF_OPTS = \
-	-DFEATURE_gui=OFF \
 	-DFEATURE_concurrent=OFF \
 	-DFEATURE_xml=ON \
 	-DFEATURE_sql=OFF \
@@ -98,6 +97,12 @@ HOST_QT6BASE_CONF_OPTS = \
 	-DFEATURE_system_pcre2=ON \
 	-DFEATURE_system_zlib=ON
 
+ifeq ($(BR2_PACKAGE_HOST_QT6BASE_GUI),y)
+HOST_QT6BASE_CONF_OPTS += -DFEATURE_gui=ON
+else
+HOST_QT6BASE_CONF_OPTS += -DFEATURE_gui=OFF
+endif
+
 # Conditional blocks below are ordered by alphabetic ordering of the
 # BR2_PACKAGE_* option.
 
-- 
2.45.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
