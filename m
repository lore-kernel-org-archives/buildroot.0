Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1224BC43334
	for <buildroot@archiver.kernel.org>; Sat,  4 Jun 2022 11:55:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8DF3841B58;
	Sat,  4 Jun 2022 11:55:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4B6MiMsoHwKv; Sat,  4 Jun 2022 11:55:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EA6C241B3F;
	Sat,  4 Jun 2022 11:55:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DDD7B1BF5AA
 for <buildroot@lists.busybox.net>; Sat,  4 Jun 2022 11:55:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CCF7A61181
 for <buildroot@lists.busybox.net>; Sat,  4 Jun 2022 11:55:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0NyAIGYfYbUJ for <buildroot@lists.busybox.net>;
 Sat,  4 Jun 2022 11:55:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0D37860E70
 for <buildroot@buildroot.org>; Sat,  4 Jun 2022 11:55:37 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id bg6so666031ejb.0
 for <buildroot@buildroot.org>; Sat, 04 Jun 2022 04:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Fkbrxq6CRtzCK/zgS7r90ITUBExzmxjNtokOcgLzNuI=;
 b=iPjdKxnEVc3nQW0Kh71JMPLSlFHvrpRzpjRTa2O9A99bNREvbNEjnQ0O7krvcOx+cf
 BC64NHH3YWm3su4CcP3QVIoWxtAGyX6wxJ/KQuFxTMkOXaqlbCUBfZgHNllPm3y+UUvk
 YpcS8vki6JmnecjXzQxUN6Mc/FXmsLiUicKN72kTS5ollMwdZWjzkk5DF03DqFqrBqn5
 0lslz4lJvommGpnZTh+GbEChzargnfg4xryaCogXMauQAmpVL2HTVs1yQp27zxpNcfjS
 gacn7NnZWRhEFp+zihPdntqW+7iaHaZilKAxrR1bfUn7djBvD8gIfNsu0RQjt4z3YUlQ
 s3xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Fkbrxq6CRtzCK/zgS7r90ITUBExzmxjNtokOcgLzNuI=;
 b=PnGh2hWpLy9KFky+S06WOuMOHVuYRtk/VKLSN2LUk8qOQjjNJuXQ5RfR7zIohEyyhP
 ncQd9MoDPl2lojX98P+Gm0YkJrSrpHn51EM51vdtG701EMih+vCriOFX/3bHaLr8EMXU
 k9CVtpfIR7JK0sBkfP4arDp/epLmiJSUbA/h+xrd5WXx21WqxIHMXBkv5v104bewAYD9
 yozYrD6plzxYlDpM4ED/dKunWCk3h4rvzI9zs+E//ZKJN58tsbtc1agTXPc/xC0nUVWY
 K47Snh+zPWW/kHlnzF4ugMqp1CbLFz4dsOOFRDiFx+0TmW7Wvaxb/ER3tRAWdzvzJBgO
 ZGrA==
X-Gm-Message-State: AOAM531VLVD6MdvnrPkT3fhhWJBfuRz3vpoKacbOwJTf6MilAcMn2JVn
 vDJ3cjwayVnWdIT9+fi6urt7WfEZbHc=
X-Google-Smtp-Source: ABdhPJytK6UEO3h4Sl+asfwwqPCQBImW2W5DAUJD2OKNI3ZcR2EBPKX2fyDuHEVH8CSXtgRkoE4iTg==
X-Received: by 2002:a17:906:58d2:b0:6fd:daa7:3a6e with SMTP id
 e18-20020a17090658d200b006fddaa73a6emr12792041ejs.0.1654343735784; 
 Sat, 04 Jun 2022 04:55:35 -0700 (PDT)
Received: from t450s.fritz.box (ip4d15a215.dynamic.kabel-deutschland.de.
 [77.21.162.21]) by smtp.gmail.com with ESMTPSA id
 d10-20020a1709063cea00b006f3ef214e5bsm3891829ejh.193.2022.06.04.04.55.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Jun 2022 04:55:35 -0700 (PDT)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Jun 2022 13:55:00 +0200
Message-Id: <20220604115458.7914-2-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220604115458.7914-1-heiko.thiery@gmail.com>
References: <20220604115458.7914-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/rauc: add option to enable/disable
 streaming support
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
Cc: Heiko Thiery <heiko.thiery@gmail.com>, Andrey Yurovsky <yurovsky@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RAUC 1.7 introduces streaming update support. Make this configurable and add
required dependency to libnl.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 package/rauc/Config.in | 13 +++++++++++++
 package/rauc/rauc.mk   |  7 +++++++
 2 files changed, 20 insertions(+)

diff --git a/package/rauc/Config.in b/package/rauc/Config.in
index 1170e50845..fe029c73ca 100644
--- a/package/rauc/Config.in
+++ b/package/rauc/Config.in
@@ -40,6 +40,19 @@ config BR2_PACKAGE_RAUC_NETWORK
 	  This option enables support for updating firmware over
 	  the network using libcurl.
 
+comment "rauc streaming support needs network support"
+	depends on !BR2_PACKAGE_RAUC_NETWORK
+
+if BR2_PACKAGE_RAUC_NETWORK
+
+config BR2_PACKAGE_RAUC_STREAMING
+	bool "streaming update support"
+	select BR2_PACKAGE_LIBNL
+	help
+	  This option enables support for streaming update mode.
+
+endif
+
 config BR2_PACKAGE_RAUC_JSON
 	bool "JSON output support"
 	select BR2_PACKAGE_JSON_GLIB
diff --git a/package/rauc/rauc.mk b/package/rauc/rauc.mk
index 90b2317d4b..8bfb0b79ba 100644
--- a/package/rauc/rauc.mk
+++ b/package/rauc/rauc.mk
@@ -52,6 +52,13 @@ else
 RAUC_CONF_OPTS += --disable-json
 endif
 
+ifeq ($(BR2_PACKAGE_RAUC_STREAMING),y)
+RAUC_CONF_OPTS += --enable-streaming
+RAUC_DEPENDENCIES += libnl
+else
+RAUC_CONF_OPTS += --disable-streaming
+endif
+
 HOST_RAUC_DEPENDENCIES = \
 	host-pkgconf \
 	host-openssl \
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
