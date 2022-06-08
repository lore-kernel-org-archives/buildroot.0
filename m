Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63254C43334
	for <buildroot@archiver.kernel.org>; Wed,  8 Jun 2022 12:01:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 125F284291;
	Wed,  8 Jun 2022 12:01:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wM5AXh3FL5xy; Wed,  8 Jun 2022 12:01:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A9E18428A;
	Wed,  8 Jun 2022 12:01:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7A0BC1BF574
 for <buildroot@lists.busybox.net>; Wed,  8 Jun 2022 12:00:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 67BFC60C1E
 for <buildroot@lists.busybox.net>; Wed,  8 Jun 2022 12:00:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id goQtr9IE0zI2 for <buildroot@lists.busybox.net>;
 Wed,  8 Jun 2022 12:00:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5A82960C2D
 for <buildroot@buildroot.org>; Wed,  8 Jun 2022 12:00:43 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id v25so26762275eda.6
 for <buildroot@buildroot.org>; Wed, 08 Jun 2022 05:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=j6NBf9LptvDn3NzAI9wuDqwKs+yhP3Nxktwux9m+/Uw=;
 b=ZDt+SJjeLnRkwpROIQB+Y4cliDJLzsnZiCSV+wpcL3HfKSTyWI07jMvEj/u+Vw561y
 6jWK+lTFgMFiMnSxqCAcGs/LP8YeMo7oPEnKnP4SPGM84cpTP7mfT2zngjsLOlV4Q3SA
 HbiqKAHMtas4pWkb1vhfzE8dKg9OwTAZTgbW8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j6NBf9LptvDn3NzAI9wuDqwKs+yhP3Nxktwux9m+/Uw=;
 b=OmLmEvS4PFHYUH8QyqVKzyW0mzefQ+lP5LBM5sbZG3do5ZE1bO9MToXhDOh9F6dCDw
 KphffnS6Qg0DAVrUhI2IQWOX50BCoiYIkLsIOkhwKM+SjYY9amw+PwYGuoNK3HNVJagr
 7FRxYwOjRTAbSaijxvk/LIQ11iJjNymQiCfSm3lUfi1fkL9nXjameg5RaBovC+PlTcxr
 2F8PXWWQ56cI8N0FkfQNV2opku5tW2znz04SYinp/W5yGP/5d11j7Hw6cl59lFCZpKmV
 sLiuzSVP5CdP5UGOeXtsC0ysSCO6LvOJNiT67UY4dMRbFtiyDLtH1LRFpZV2ptnY0ETP
 0zmA==
X-Gm-Message-State: AOAM530l9CbyvD5LXYIAiGzqZnYjWcMC0vVrcG/RxOI6C9vgfUr/jILU
 Nd6MqlFvu+mOmpvlslHXa7JzNijhyRWNhg==
X-Google-Smtp-Source: ABdhPJxMx1ssykFirx4QkxXIKeU0HmqadlIjYFBrd5iTVOp9502jViL2ftx+1dvJj563LxZJeV5Qyg==
X-Received: by 2002:a05:6402:d:b0:431:98fe:c5fd with SMTP id
 d13-20020a056402000d00b0043198fec5fdmr6728008edu.170.1654689641542; 
 Wed, 08 Jun 2022 05:00:41 -0700 (PDT)
Received: from angeloc.pdxnet.pdxeng.ch (host085115199111.static.fidoka.tech.
 [85.115.199.111]) by smtp.gmail.com with ESMTPSA id
 my16-20020a1709065a5000b006fecf74395bsm9068289ejc.8.2022.06.08.05.00.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 05:00:41 -0700 (PDT)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed,  8 Jun 2022 14:00:27 +0200
Message-Id: <20220608120028.2768210-2-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220608120028.2768210-1-angelo@amarulasolutions.com>
References: <20220608120028.2768210-1-angelo@amarulasolutions.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 2/3] package/wpa_supplicant: adding ifupdown
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
Cc: jagan@amarulasolutions.com,
 Angelo Compagnucci <angelo@amarulasolutions.com>
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
index c4cfe03371..af97f36eda 100644
--- a/package/wpa_supplicant/wpa_supplicant.mk
+++ b/package/wpa_supplicant/wpa_supplicant.mk
@@ -250,6 +250,14 @@ define WPA_SUPPLICANT_INSTALL_STAGING_CMDS
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
@@ -259,6 +267,7 @@ define WPA_SUPPLICANT_INSTALL_TARGET_CMDS
 	$(WPA_SUPPLICANT_INSTALL_PASSPHRASE)
 	$(WPA_SUPPLICANT_INSTALL_DBUS)
 	$(WPA_SUPPLICANT_INSTALL_WPA_CLIENT_SO)
+	$(WPA_SUPPLICANT_INSTALL_IFUP_SCRIPTS)
 endef
 
 define WPA_SUPPLICANT_INSTALL_INIT_SYSTEMD
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
