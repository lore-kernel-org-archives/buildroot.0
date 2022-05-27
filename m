Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C333C433EF
	for <buildroot@archiver.kernel.org>; Fri, 27 May 2022 10:34:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 996DB42619;
	Fri, 27 May 2022 10:34:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nuAI8mx-PQsF; Fri, 27 May 2022 10:34:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5071F42605;
	Fri, 27 May 2022 10:34:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B642B1BF841
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 10:33:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AEE33424E1
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 10:33:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jU8Sm1C5kgy6 for <buildroot@lists.busybox.net>;
 Fri, 27 May 2022 10:33:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F09C8424B9
 for <buildroot@buildroot.org>; Fri, 27 May 2022 10:33:53 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id rq11so7942239ejc.4
 for <buildroot@buildroot.org>; Fri, 27 May 2022 03:33:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kG20JgmCbaK0uP4x9tsGFfOizsIrVAflMbHNjjfezSg=;
 b=QDNb5zV3kq6cdMXJlrZlKSbkTkqH6az9w9EuGMXC31sViOfYZ5keVBAYzcLW+NCDee
 tsTzitNpQOHuE0Hxdk24p0HxtMli3Jyu29XTrG9Z06qHHVEJmMEBVcMFVLSZE33jOHaA
 XSBddr/VkyuVkciLMP3e4vZTT8/qwMqlwYjr4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kG20JgmCbaK0uP4x9tsGFfOizsIrVAflMbHNjjfezSg=;
 b=TMDKL7oVl3dveSa/rfvDg9W1rGJEjK/GgJKyWVPgcCXYFKMnNnyTKO1CJKxWw7r0Cl
 mPOcqElZmw/jSG1H+P5iolk6Nr2qX6Qd8abs9yclHPnlKhLYVqkkJqtyWhDI0hCfG/N8
 uYJRNlNcEIwNfvBSTi39avY4NQFZEkSFO68CwNdzMuVCXWnhE0qHaW459GnhWVFQsYXS
 Q7SSS9sLq7kKSXYjZsruGYAqS3jqLZ2K4jSQwUOD9/11Cf0PzFmy3LH6SQrZZRegy48/
 1ymZ6qIT91CVwlL8bihdiqCK8SIPAUkZZc4NkUC9WmXrcJV794aIE4aOh5eiowuxxJ8q
 my6w==
X-Gm-Message-State: AOAM530M0Uo/K+6KBGD3B/9Y7Zcjaxfx8Z2zx7M8NctJemO24SNDLa/z
 /a+3jtqrqY53QO8vOpCTwven2zL5FFf+3Q==
X-Google-Smtp-Source: ABdhPJxnP7LI46/EnXXQCD+KRDAX+Nf/2OfiB6OifjAhQcquVoa+b+8sKcQZuIMUTxdP8aYZLf+/hg==
X-Received: by 2002:a17:907:8a05:b0:6ff:1060:3ed1 with SMTP id
 sc5-20020a1709078a0500b006ff10603ed1mr11521001ejc.341.1653647632004; 
 Fri, 27 May 2022 03:33:52 -0700 (PDT)
Received: from localhost.localdomain (host185251138155.static.fidoka.tech.
 [185.251.138.155]) by smtp.gmail.com with ESMTPSA id
 e8-20020a1709061e8800b006f3ef214e34sm1313306ejj.154.2022.05.27.03.33.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 03:33:51 -0700 (PDT)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Fri, 27 May 2022 12:33:33 +0200
Message-Id: <20220527103335.1968203-3-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220527103335.1968203-1-angelo@amarulasolutions.com>
References: <20220527103335.1968203-1-angelo@amarulasolutions.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/4] package/wpa_supplicant: adding ifupdown
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

The provided file is a simplified version based on the one available
on debian.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/wpa_supplicant/ifupdown.sh       | 71 ++++++++++++++++++++++++
 package/wpa_supplicant/wpa_supplicant.mk | 10 ++++
 2 files changed, 81 insertions(+)
 create mode 100755 package/wpa_supplicant/ifupdown.sh

diff --git a/package/wpa_supplicant/ifupdown.sh b/package/wpa_supplicant/ifupdown.sh
new file mode 100755
index 0000000000..8eecf73436
--- /dev/null
+++ b/package/wpa_supplicant/ifupdown.sh
@@ -0,0 +1,71 @@
+#!/bin/sh
+
+# This file is executed by ifupdown in pre-up, post-up, pre-down and
+# post-down phases of network interface configuration.
+
+WPA_SUP_BIN="/usr/sbin/wpa_supplicant"
+
+if [ -n "$IF_WPA_MAINT_DEBUG" ]; then
+	set -x
+fi
+
+# quit if we're called for the loopback
+if [ "$IFACE" = lo ]; then
+	exit 0
+fi
+
+# allow wpa_supplicant interface to be specified via wpa-iface
+# useful for starting wpa_supplicant on one interface of a bridge
+if [ -n "$IF_WPA_IFACE" ]; then
+	WPA_IFACE="$IF_WPA_IFACE"
+else
+	WPA_IFACE="$IFACE"
+fi
+
+WPA_SUP_PIDFILE="/run/wpa_supplicant.${WPA_IFACE}.pid"
+
+# quit if executables are not installed
+if [ ! -x "$WPA_SUP_BIN" ]; then
+	exit 0
+fi
+
+do_start () {
+	if [ -n "$IF_WPA_CONF" ] && [ "$IF_WPA_CONF" != "managed" ]; then
+		if [ ! -s "$IF_WPA_CONF" ]; then
+			echo "cannot read contents of $IF_WPA_CONF"
+			exit 1
+		fi
+		WPA_SUP_CONF_CTRL_DIR=$(sed -n -e 's/[[:space:]]*#.*//g' -e 's/[[:space:]]\+.*$//g' \
+			-e 's/^ctrl_interface=\(DIR=\)\?\(.*\)/\2/p' "$IF_WPA_CONF")
+		if [ -n "$WPA_SUP_CONF_CTRL_DIR" ]; then
+			WPA_SUP_CONF="-c $IF_WPA_CONF -C $WPA_SUP_CONF_CTRL_DIR"
+		else
+			WPA_SUP_CONF="-c $IF_WPA_CONF"
+		fi
+	else
+		# specify the default ctrl_interface
+		WPA_SUP_CONF="-C $WPA_CTRL_DIR"
+	fi
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
index c4cfe03371..d38bf572db 100644
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
@@ -259,8 +267,10 @@ define WPA_SUPPLICANT_INSTALL_TARGET_CMDS
 	$(WPA_SUPPLICANT_INSTALL_PASSPHRASE)
 	$(WPA_SUPPLICANT_INSTALL_DBUS)
 	$(WPA_SUPPLICANT_INSTALL_WPA_CLIENT_SO)
+	$(WPA_SUPPLICANT_INSTALL_IFUP_SCRIPTS)
 endef
 
+
 define WPA_SUPPLICANT_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -m 0644 -D $(@D)/$(WPA_SUPPLICANT_SUBDIR)/systemd/wpa_supplicant.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/wpa_supplicant.service
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
