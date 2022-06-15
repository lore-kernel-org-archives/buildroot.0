Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81689C433EF
	for <buildroot@archiver.kernel.org>; Wed, 15 Jun 2022 16:18:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3364B40ABC;
	Wed, 15 Jun 2022 16:18:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RGQCHqydmSGy; Wed, 15 Jun 2022 16:18:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 61A4640AF4;
	Wed, 15 Jun 2022 16:18:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4CE3D1BF4DB
 for <buildroot@lists.busybox.net>; Wed, 15 Jun 2022 16:18:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4A64982DD9
 for <buildroot@lists.busybox.net>; Wed, 15 Jun 2022 16:18:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RLiiOn0DN6Bt for <buildroot@lists.busybox.net>;
 Wed, 15 Jun 2022 16:18:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8B93982E19
 for <buildroot@busybox.net>; Wed, 15 Jun 2022 16:18:08 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id z9so6585124wmf.3
 for <buildroot@busybox.net>; Wed, 15 Jun 2022 09:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=n3qkDfzvEHdmN2ohM40VrWARxKa8sBwq+U7m17Ela18=;
 b=gS2XtfgwHWpwyyQ5dFeAotQH9Cj72LajFYvFxHPs6sMG4xCYKxpIYdCe6fWPKOd+zS
 IpKe2azn5p93+mR9q8rqO9oxwaRt6K2khrX/0G4TKv28nLFf/7VzN1Gd0m7rFBDFvQFY
 S9Qur8T0SCA+mf0d4QedN+oShM5YV8226g2rosgPnWUv5KHZfxbhKTQGMgesFzzp1x9h
 HpydWP5/3O5bvuCDOsYh3dYuPPE5t2R5AqwW+PoG1uWuTk+Lzrnw1cPEjNb2f4dFDuo+
 NuQIUsGYoDk2YNcmwNI7i9qBy1eiq4d6iwqjPNbjGUnA7hLAbgUL4Cv8Rhg2rjoxiJ9O
 2YfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=n3qkDfzvEHdmN2ohM40VrWARxKa8sBwq+U7m17Ela18=;
 b=U0F6tCQ7DrzduLQXAjqhHSlR01JVdCfMBNAe7CPE9lzhBeziJn107VBAhuwV970hKm
 ruQRRP5Rwq4uXZcgXK1K8wVAOgXZrSwtL5SD9IJ5gnVOeXNEM0kKjuhKivzQP2682jRD
 S9WzQlJIJJmqjGD/4Io+YuRaFmTnTO4MBzRbHYs7YBK2XvhEfLOSMbCau+Xh0j9gcj1J
 wAfyR8aFGOypKviUP8xn8CDw1F9ykf1NsP75cG7O3BdS93fSYe/811grK+gDi86+GjAY
 lt2hAGdbhEOKoO22ZxBtwH7mv8JaKRzu/hXZwLhHDQxwsqCfNlrpSVqm/M39TheeIXrT
 /lLQ==
X-Gm-Message-State: AOAM530rUQkcoFjJfexOTDd/meG8K+kNhPxwdSolynDEURP9OGLFWpo5
 ep4xgXavcxNzEH7KStS+KhfuUdWgCvK74Q==
X-Google-Smtp-Source: ABdhPJztGY5vd30ev/l4hwVqexOKdt0Ja7dXKanatS4L8Pv1R75RygfMIMN4gaY72AjhxS1k5I/UeA==
X-Received: by 2002:a05:600c:3d07:b0:39c:80a8:db07 with SMTP id
 bh7-20020a05600c3d0700b0039c80a8db07mr10688775wmb.168.1655309886797; 
 Wed, 15 Jun 2022 09:18:06 -0700 (PDT)
Received: from vm22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 g13-20020adffc8d000000b002102f2fac37sm17723325wrr.51.2022.06.15.09.18.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jun 2022 09:18:06 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 15 Jun 2022 18:17:51 +0200
Message-Id: <20220615161753.2580142-3-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220615161753.2580142-1-francois.perrad@gadz.org>
References: <20220615161753.2580142-1-francois.perrad@gadz.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/5] package/open62541: more PubSub options
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/open62541/Config.in    | 14 ++++++++++++++
 package/open62541/open62541.mk | 12 ++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/package/open62541/Config.in b/package/open62541/Config.in
index 6045a5954..3f5eb78d5 100644
--- a/package/open62541/Config.in
+++ b/package/open62541/Config.in
@@ -78,6 +78,20 @@ config BR2_PACKAGE_OPEN62541_PUBSUB_INFORMATIONMODEL
 	  Enable the information model representation of the PubSub
 	  configuration.
 
+if BR2_PACKAGE_OPEN62541_PUBSUB_INFORMATIONMODEL
+
+config BR2_PACKAGE_OPEN62541_PUBSUB_INFORMATIONMODEL_METHODS
+	bool "publish/subscribe information model methods"
+	help
+	  Enable PubSub informationmodel methods
+
+endif
+
+config BR2_PACKAGE_OPEN62541_PUBSUB_ETH_UADP
+	bool "publish/subscribe UADP"
+	help
+	  Enable publish/subscribe UADP over Ethernet
+
 endif # BR2_PACKAGE_OPEN62541_PUBSUB
 
 endif
diff --git a/package/open62541/open62541.mk b/package/open62541/open62541.mk
index 00e7236c0..9757aa18c 100644
--- a/package/open62541/open62541.mk
+++ b/package/open62541/open62541.mk
@@ -67,6 +67,18 @@ else
 OPEN62541_CONF_OPTS += -DUA_ENABLE_PUBSUB_INFORMATIONMODEL=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_OPEN62541_PUBSUB_INFORMATIONMODEL_METHODS),y)
+OPEN62541_CONF_OPTS += -DUA_ENABLE_PUBSUB_INFORMATIONMODEL_METHODS=ON
+else
+OPEN62541_CONF_OPTS += -DUA_ENABLE_PUBSUB_INFORMATIONMODEL_METHODS=OFF
+endif
+
+ifeq ($(BR2_PACKAGE_OPEN62541_PUBSUB_ETH_UADP),y)
+OPEN62541_CONF_OPTS += -DUA_ENABLE_PUBSUB_ETH_UADP=ON
+else
+OPEN62541_CONF_OPTS += -DUA_ENABLE_PUBSUB_ETH_UADP=OFF
+endif
+
 # Remove unneeded files
 define OPEN62541_REMOVE_UNNEEDED_FILES
 	$(RM) -r $(TARGET_DIR)/usr/share/open62541
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
