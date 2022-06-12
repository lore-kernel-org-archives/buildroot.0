Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AD64C43334
	for <buildroot@archiver.kernel.org>; Sun, 12 Jun 2022 22:08:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1354260F13;
	Sun, 12 Jun 2022 22:08:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id COjPyunjfDf0; Sun, 12 Jun 2022 22:08:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 135C960E5D;
	Sun, 12 Jun 2022 22:08:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 01CE01BF2A2
 for <buildroot@lists.busybox.net>; Sun, 12 Jun 2022 22:07:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E4BB960D78
 for <buildroot@lists.busybox.net>; Sun, 12 Jun 2022 22:07:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AYwf2mEz5QYV for <buildroot@lists.busybox.net>;
 Sun, 12 Jun 2022 22:07:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CCEF360AC9
 for <buildroot@buildroot.org>; Sun, 12 Jun 2022 22:07:38 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id n10so7777433ejk.5
 for <buildroot@buildroot.org>; Sun, 12 Jun 2022 15:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZJP8kdr0gnc3LdRYm4CiN5qRWasEUN4PYC0j5eQEt1U=;
 b=NZmONjvRbEy2eVr7SiNCH9KlRCxm3Rx7xm0/pYNl9qfuy7fVtGCC0y6XlOJRGw39nA
 a+pdNgeWl4KKitiMDbU6mB8/k0eNFFIBdRgBdJnuFWv+zS9u9Y/P24hwWSnVOKkMahRB
 8XreCaeDEdSiq05NV7lX9GSv3LibVLo1O6TRk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZJP8kdr0gnc3LdRYm4CiN5qRWasEUN4PYC0j5eQEt1U=;
 b=jXPZQ/SdZiXibsWqzF8fBlYiu4/Sxy8+MChOkWP4pG6RsSayOwpOTbHGGVNVxGtfH1
 inuJq8jLCySiQdoP1VziGFqn5eHkkLP3QhMjXgnYO905Z5JNro1kegueEDqNQkcOhfaL
 opj6BKS5bFD7Xqp8FszFWKZrEZxcAj7U19au9ov4Q7mF8Q+2C18rblIADU8QWbGiYvKs
 BUKUw2ceXpTDrlOQ5Y5X42oZvKcqlIrgD0ytFpGs+OdQGJLxhcDQv4es6mlUItja1Q8U
 h1czcQ9tZ28XFgAMC1ksyzJgAWgyjYdDQQCibu3P3F91G6r6/6AHIXPl3eh1wOeOGiCe
 bZKg==
X-Gm-Message-State: AOAM531V8xh6Z73H+ejrwAStC8NMQRxdASikGs8T6B9lBODVbTLOQwzS
 8PsvVIOSUUporoWgwsSqR/BBqDhbeY9ruw==
X-Google-Smtp-Source: ABdhPJzHaInRBIb/3UtNJbidmhUwf7TFzCFpaC3xrPRSLYX/kG3YGde4FssE4QLG0swocKa4M0alQw==
X-Received: by 2002:a17:906:1ca:b0:715:73f3:b50f with SMTP id
 10-20020a17090601ca00b0071573f3b50fmr6784621ejj.374.1655071657035; 
 Sun, 12 Jun 2022 15:07:37 -0700 (PDT)
Received: from angelo-ThinkPad-X270.. ([37.162.241.219])
 by smtp.gmail.com with ESMTPSA id
 a20-20020a1709063e9400b006feb002a620sm2955914ejj.1.2022.06.12.15.07.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Jun 2022 15:07:36 -0700 (PDT)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 13 Jun 2022 00:07:28 +0200
Message-Id: <20220612220729.1231925-2-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220612220729.1231925-1-angelo@amarulasolutions.com>
References: <20220612220729.1231925-1-angelo@amarulasolutions.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v4 2/3] package/wpa_supplicant: adding ifupdown
 support
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

Actually, configuring a wifi interface as per "interfaces" man:

auto wlan0
iface wlan0 inet dhcp
wpa-conf /etc/wpa_supplicant.conf

doesn't work on buildroot because the line wpa-conf is ignored due to
the lack of a proper ifupdown script to handle the wpa_supplicant
initialization.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
Reviewed-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
---
v1 -> v2:
* Simplify script to the minimum to have the service started (Thomas,
  Nicolas)
v2 -> v3:
* Move IF_WPA_CONF check early (Nicolas)

 package/wpa_supplicant/ifupdown.sh       | 49 ++++++++++++++++++++++++
 package/wpa_supplicant/wpa_supplicant.mk |  9 +++++
 2 files changed, 58 insertions(+)
 create mode 100755 package/wpa_supplicant/ifupdown.sh

diff --git a/package/wpa_supplicant/ifupdown.sh b/package/wpa_supplicant/ifupdown.sh
new file mode 100755
index 0000000000..569344b683
--- /dev/null
+++ b/package/wpa_supplicant/ifupdown.sh
@@ -0,0 +1,49 @@
+#!/bin/sh
+
+# This file is executed by ifupdown in pre-up, post-up, pre-down and
+# post-down phases of network interface configuration.
+
+WPA_SUP_BIN="/usr/sbin/wpa_supplicant"
+
+# run this script only for interfaces which have wpa-conf option
+[ -z "$IF_WPA_CONF" ] && exit 0
+
+# Allow wpa_supplicant interface to be specified via wpa-iface
+# useful for starting wpa_supplicant on one interface of a bridge
+if [ -n "$IF_WPA_IFACE" ]; then
+	WPA_IFACE="$IF_WPA_IFACE"
+else
+	WPA_IFACE="$IFACE"
+fi
+
+WPA_SUP_PIDFILE="/run/wpa_supplicant.${WPA_IFACE}.pid"
+
+do_start () {
+	if [ ! -s "$IF_WPA_CONF" ]; then
+		echo "cannot read contents of $IF_WPA_CONF"
+		exit 1
+	fi
+	WPA_SUP_CONF="-c $IF_WPA_CONF"
+}
+
+case "$MODE" in
+	start)
+		do_start
+		case "$PHASE" in
+			post-up)
+				start-stop-daemon -S -q -x ${WPA_SUP_BIN} \
+				-- -B -i ${WPA_IFACE} ${WPA_SUP_CONF} -P ${WPA_SUP_PIDFILE}
+				;;
+		esac
+		;;
+
+	stop)
+		case "$PHASE" in
+			pre-down)
+				start-stop-daemon -K -p ${WPA_SUP_PIDFILE}
+				;;
+		esac
+		;;
+esac
+
+exit 0
diff --git a/package/wpa_supplicant/wpa_supplicant.mk b/package/wpa_supplicant/wpa_supplicant.mk
index 14f6a6e271..afcd6502e3 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -256,6 +256,14 @@ define WPA_SUPPLICANT_INSTALL_STAGING_CMDS
 	$(WPA_SUPPLICANT_INSTALL_STAGING_WPA_CLIENT_SO)
 endef
 
+ifeq ($(BR2_PACKAGE_IFUPDOWN_SCRIPTS),y)
+define WPA_SUPPLICANT_INSTALL_IFUP_SCRIPTS
+	$(INSTALL) -m 0755 -D package/wpa_supplicant/ifupdown.sh \
+		$(TARGET_DIR)/etc/network/if-up.d/wpasupplicant
+	ln -sf ../if-up.d/wpasupplicant $(TARGET_DIR)/etc/network/if-down.d/wpasupplicant
+endef
+endif
+
 define WPA_SUPPLICANT_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0755 -D $(@D)/$(WPA_SUPPLICANT_SUBDIR)/wpa_supplicant \
 		$(TARGET_DIR)/usr/sbin/wpa_supplicant
@@ -265,6 +273,7 @@ define WPA_SUPPLICANT_INSTALL_TARGET_CMDS
 	$(WPA_SUPPLICANT_INSTALL_PASSPHRASE)
 	$(WPA_SUPPLICANT_INSTALL_DBUS)
 	$(WPA_SUPPLICANT_INSTALL_WPA_CLIENT_SO)
+	$(WPA_SUPPLICANT_INSTALL_IFUP_SCRIPTS)
 	$(WPA_SUPPLICANT_ENABLE_CTRL_IFACE)
 endef
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
