Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B519C25B78
	for <buildroot@archiver.kernel.org>; Mon, 13 May 2024 22:04:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0F128415B6;
	Mon, 13 May 2024 22:04:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8AS-jzjmLfal; Mon, 13 May 2024 22:04:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B8C39415BB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B8C39415BB;
	Mon, 13 May 2024 22:04:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2134E1BF2C0
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 22:03:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EC46D415A9
 for <buildroot@lists.busybox.net>; Mon, 13 May 2024 22:03:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 51fW3E295jmT for <buildroot@lists.busybox.net>;
 Mon, 13 May 2024 22:03:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22f; helo=mail-lj1-x22f.google.com;
 envelope-from=roykollensvendsen@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5DC184159D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5DC184159D
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5DC184159D
 for <buildroot@buildroot.org>; Mon, 13 May 2024 22:03:56 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2e3b1b6e9d1so60173341fa.2
 for <buildroot@buildroot.org>; Mon, 13 May 2024 15:03:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715637834; x=1716242634;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZtLdtmFSTcpznGBsTX1jvi1u+pxhGFyRGPkLCzGBFBI=;
 b=XfSW6ynwOsSjbB2USx8VpN7ePmtMp1uUu5EqLJjyZk9p7rZ9n6b4SGtY0s2OpT+jHv
 msSHzUMLQFSoz5O0jdxflk/eqmxHjTD0ATyYUkvoF83A3WeVyNvNlJssyWky0AMySL26
 tVA2pBkKBShmYV9H8ao84tdAwLTTjRncGVXGdgmfzVrNMUtG/Mu8Z5/IPRji2KPhCwdJ
 pTqacnkLukrT224/9JfliQSAgh13XDwixdV3o5NZ5PkJs8eAH+I2sfZMdBaI1exWCJAk
 V3FC1psi4hKk6SODpbfPy2cXMHzGIkYhNwom97/E+EOxFZU4m0N9BYsGSfyqNB7Z+m3c
 MXvg==
X-Gm-Message-State: AOJu0YwWOLgysNGqooQwQrqNWjBmnM9Vk8UUoJI2MPVC8B5vSOsGlgYH
 Uew3wdgVT8hx11aqsKUCOSli3vKpKiNd/ihi6wJkgqAYD3R76duORRpMDfK+
X-Google-Smtp-Source: AGHT+IEEYYd2QGGnVEvVOB4G0j6sAIAbl7FYPHJrxzNFE0KpyPqCTfQmdQuwb3TBU9MXZJHraYUNpA==
X-Received: by 2002:a2e:9ed5:0:b0:2e0:e129:7011 with SMTP id
 38308e7fff4ca-2e51ff4d5ecmr62501661fa.16.1715637833553; 
 Mon, 13 May 2024 15:03:53 -0700 (PDT)
Received: from precision7530-arch-roy.lan
 ([2a01:799:1a22:4401:9825:b52b:4cba:665e])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2e4d0ce3488sm15548401fa.52.2024.05.13.15.03.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 May 2024 15:03:52 -0700 (PDT)
From: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 14 May 2024 00:03:08 +0200
Message-ID: <20240513220328.1085629-3-roykollensvendsen@gmail.com>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240513220328.1085629-1-roykollensvendsen@gmail.com>
References: <1934329>
 <20240513220328.1085629-1-roykollensvendsen@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715637834; x=1716242634; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZtLdtmFSTcpznGBsTX1jvi1u+pxhGFyRGPkLCzGBFBI=;
 b=GjDpCUJTDQ7b8A0kvbG7pvWvoyRp7Tpvj5moV0B8X0npdtQ3VUjpaJSbVPAADNS9M8
 tpYwFmOoYCIwPg6NoUdzdbXi0gABmLntp5RT0M6NxbTBEFSkKmDs2QrqBeP3qC0jGjd4
 /qKW6iAmftmm82JqTomQxP/N5FgGScjy/7dF4GN4v/oNneZZpSbcHqH6Z4Dwn7tTrteZ
 pYP4w5AxdTIv0fxUdSCz7e0kSucTMHMU9jMxe5SWfhqard/wB12TQ29ji6vvN8gQyEdE
 bTr/tWvMjvJqeOP9+6EOAGVQipNQ+tYu/BGoZU9rCkF+4lNP34L+qk+NgoUO+caqv/sr
 TNfQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=GjDpCUJT
Subject: [Buildroot] [PATCH v4 03/14] package/qt6/qt6base: add blind option
 to enable Network support on host
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

Qt Network is a required dependency of Qt Tools. Therefor we need a way
to enable the Qt Network module when building for host.

Signed-off-by: Roy Kollen Svendsen <roykollensvendsen@gmail.com>
---
 package/qt6/qt6base/Config.in.host | 5 +++++
 package/qt6/qt6base/qt6base.mk     | 7 ++++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/package/qt6/qt6base/Config.in.host b/package/qt6/qt6base/Config.in.host
index 326c06278e..286da0ff03 100644
--- a/package/qt6/qt6base/Config.in.host
+++ b/package/qt6/qt6base/Config.in.host
@@ -2,3 +2,8 @@
 # Qt Shader Baker(qsb)).
 config BR2_PACKAGE_HOST_QT6BASE_GUI
 	bool
+
+# Select this if you need host qt6 tools that require the Qt::Network module
+# (e.g. Qt Tools).
+config BR2_PACKAGE_HOST_QT6BASE_NETWORK
+	bool
diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/qt6base.mk
index 36ec05b394..684bb86bc9 100644
--- a/package/qt6/qt6base/qt6base.mk
+++ b/package/qt6/qt6base/qt6base.mk
@@ -88,7 +88,6 @@ HOST_QT6BASE_CONF_OPTS = \
 	-DFEATURE_xml=ON \
 	-DFEATURE_sql=OFF \
 	-DFEATURE_testlib=OFF \
-	-DFEATURE_network=OFF \
 	-DFEATURE_dbus=OFF \
 	-DFEATURE_icu=OFF \
 	-DFEATURE_glib=OFF \
@@ -103,6 +102,12 @@ else
 HOST_QT6BASE_CONF_OPTS += -DFEATURE_gui=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_HOST_QT6BASE_NETWORK),y)
+HOST_QT6BASE_CONF_OPTS += -DFEATURE_network=ON
+else
+HOST_QT6BASE_CONF_OPTS += -DFEATURE_network=OFF
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
