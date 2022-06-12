Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 254E6C433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Jun 2022 22:07:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C0BA417E2;
	Sun, 12 Jun 2022 22:07:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QeoyBdGa3Gl8; Sun, 12 Jun 2022 22:07:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3970D417D2;
	Sun, 12 Jun 2022 22:07:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 581CC1BF2A2
 for <buildroot@lists.busybox.net>; Sun, 12 Jun 2022 22:07:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 41C9B417D2
 for <buildroot@lists.busybox.net>; Sun, 12 Jun 2022 22:07:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8gqCgzxYNhkc for <buildroot@lists.busybox.net>;
 Sun, 12 Jun 2022 22:07:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 52960417A7
 for <buildroot@buildroot.org>; Sun, 12 Jun 2022 22:07:37 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id o10so4976863edi.1
 for <buildroot@buildroot.org>; Sun, 12 Jun 2022 15:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bdqQpCwqwaRB7xl8qPyWjtoiqlGLrvX6+7ThnMmGIyA=;
 b=Lx6EHciMJO5aksbZn5DSv0nd++xtUAOYlNsE4znT7jdthtzVPCsAGLC2PzotCuapDc
 fgt58pkLTp//fjvEvjLJLlX68oK05gix3C9v2MQCcfFQq+2vZLeYCsk5OmIZ4N1prjEP
 AEjTkbYnZQ1RLIgWQhwh1b7h/LR2cLFIWW5/w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bdqQpCwqwaRB7xl8qPyWjtoiqlGLrvX6+7ThnMmGIyA=;
 b=OMR0OXUYNEBD2VH/Zm8mkjExrAecs6BGuJVDP7zRNBEfRILG+Z8gRhfa7FuFeUDy/f
 TPhvPB11u8bb14dRNZKwaYLE9Kd78LTmcfNTjEYKVM03BkU7rwsvtuC+r8nZ4x4BPUzw
 yKnrnA+mlK6TigHssSNrkyzBMbXT/BJgHKxeAdW39yGZOvfwkemCpFlpSknizZPT2V/V
 jFO/ZeqRTUBwDMYhvBiPeGppxDwgJUbXp5X0vDhNJXNCw4RL22kHp+Hk5mGY+zoTmauI
 Vp5CH1MIOuCi1LH6ldG4CVX4QnURHlLKym9VBoZGcKDHeQAKaAclhVCluT3Vil6t335h
 vTlw==
X-Gm-Message-State: AOAM530sIyXuhD+YoBbzxumcO528pJfAxJcJODDgCEoEa1/FjqOl9GfN
 ACn2dQTAJNyYBsJYTgzI0ik0gFHyEvRB/g==
X-Google-Smtp-Source: ABdhPJzT/C0VHgM2Phcy+oHQwbIaETVpvDOdP84tg1ho+gsNw4qHF0N3+9SPykF4ezs38kX54w0FxQ==
X-Received: by 2002:a05:6402:1692:b0:42d:e291:67f3 with SMTP id
 a18-20020a056402169200b0042de29167f3mr61108411edv.392.1655071655419; 
 Sun, 12 Jun 2022 15:07:35 -0700 (PDT)
Received: from angelo-ThinkPad-X270.. ([37.162.241.219])
 by smtp.gmail.com with ESMTPSA id
 a20-20020a1709063e9400b006feb002a620sm2955914ejj.1.2022.06.12.15.07.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Jun 2022 15:07:34 -0700 (PDT)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 13 Jun 2022 00:07:27 +0200
Message-Id: <20220612220729.1231925-1-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v4 1/3] package/wpa_supplicant: fixing "Invalid
 configuration line"
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
Cc: Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Default configuration file is wrong for the default compiling options.

Fixes:

Successfully initialized wpa_supplicant
Line 1: unknown global field 'ctrl_interface=/var/run/wpa_supplicant'.
Line 1: Invalid configuration line
'ctrl_interface=/var/run/wpa_supplicant'.
Failed to read or parse configuration '/etc/wpa_supplicant.conf'.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
v1 -> v4:
* Enabling the ctrl_interface option when the config option is enabled

 package/wpa_supplicant/wpa_supplicant.conf | 2 +-
 package/wpa_supplicant/wpa_supplicant.mk   | 7 +++++++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/wpa_supplicant/wpa_supplicant.conf b/package/wpa_supplicant/wpa_supplicant.conf
index 1994a6c739..20e9f7f842 100644
--- a/package/wpa_supplicant/wpa_supplicant.conf
+++ b/package/wpa_supplicant/wpa_supplicant.conf
@@ -1,4 +1,4 @@
-ctrl_interface=/var/run/wpa_supplicant
+#ctrl_interface=/var/run/wpa_supplicant
 ap_scan=1
 
 network={
diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index c4cfe03371..14f6a6e271 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -184,6 +184,12 @@ WPA_SUPPLICANT_DEPENDENCIES += readline
 WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_READLINE
 endif
 
+ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_CTRL_IFACE),y)
+define WPA_SUPPLICANT_ENABLE_CTRL_IFACE
+	sed -i '/ctrl_interface/s/^#//g' $(TARGET_DIR)/etc/wpa_supplicant.conf
+endef
+endif
+
 ifeq ($(BR2_PACKAGE_WPA_SUPPLICANT_WPA_CLIENT_SO),y)
 WPA_SUPPLICANT_CONFIG_ENABLE += CONFIG_BUILD_WPA_CLIENT_SO
 define WPA_SUPPLICANT_INSTALL_WPA_CLIENT_SO
@@ -259,6 +265,7 @@ define WPA_SUPPLICANT_INSTALL_TARGET_CMDS
 	$(WPA_SUPPLICANT_INSTALL_PASSPHRASE)
 	$(WPA_SUPPLICANT_INSTALL_DBUS)
 	$(WPA_SUPPLICANT_INSTALL_WPA_CLIENT_SO)
+	$(WPA_SUPPLICANT_ENABLE_CTRL_IFACE)
 endef
 
 define WPA_SUPPLICANT_INSTALL_INIT_SYSTEMD
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
