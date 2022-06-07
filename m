Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFCF4C433EF
	for <buildroot@archiver.kernel.org>; Tue,  7 Jun 2022 15:17:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F63D83F82;
	Tue,  7 Jun 2022 15:17:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lvNOSo_5rU9E; Tue,  7 Jun 2022 15:17:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9828583F21;
	Tue,  7 Jun 2022 15:17:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 41D811BF39F
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 15:17:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3F6ED416AF
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 15:17:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZcVeS2GSuOJg for <buildroot@lists.busybox.net>;
 Tue,  7 Jun 2022 15:17:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2EC9A415E5
 for <buildroot@buildroot.org>; Tue,  7 Jun 2022 15:17:29 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id x5so18361082edi.2
 for <buildroot@buildroot.org>; Tue, 07 Jun 2022 08:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GFN+CH/LKuiEBdw8AQyBRNMIvtbr2TQR93S7GrKHiz0=;
 b=pNBV5jvs8W0qE2tZB0EtQWFGrVqkAjBQvF3BfWmKqQxIFevHTK440Q+XbgG53Ijp1S
 NkP6Z49AXKKqhCBGJeEK50xAsD7FagguMAxGUAckWc1wy3lda32w1nlP7v1vLq94SEnN
 XPZReMC8cHuBNupVMbKlHoqrwKVBody9cVplQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GFN+CH/LKuiEBdw8AQyBRNMIvtbr2TQR93S7GrKHiz0=;
 b=lKycGuga19GUuycRNXCI/dO5lfu7qIV7ts7Nmz681r7AsBPbK1/sk03dp8MuFv1+JE
 ZGbZ68ibGCkH5jfxidH47SPcXNBsTu8Gf2w29yG1otBHwFyWVSwup+41Y6JegmXnw/at
 FwrgoOL9mg46hdMEEUab5SJHFayCjnouV3Pg8c/eL+Qi5Od6NIGqbcR5vImxAMiT2JZP
 FRzsl3s1DrEGnpNmejhCNHXXnH8cVtinwSeLCKU25gJ+qlUiLcZLjybsyCli+GqbvXpq
 r+gnHbb2U/ho2cBq1e6Kv81t5PZxi4K63Tmtgu5pTFsPiHlU38GFn51+PW2H/XhN+ehK
 3myA==
X-Gm-Message-State: AOAM53310vYpbeJ8G7Z1P98CzsHPjxAqV7uxHnnuGJLtSFHgESsxcYcE
 d/lXGm5yzdVaJJ4mR6DJTYfKZpnzFbkTMQ==
X-Google-Smtp-Source: ABdhPJwGxHjfhXPXhSo6CjtKPpxm/v4HkLOWhyshpQiTe4UlfXBvVC/HTZZgQ0vPHDA0ptoLFCWQQg==
X-Received: by 2002:a05:6402:4145:b0:42d:842a:f916 with SMTP id
 x5-20020a056402414500b0042d842af916mr33673089eda.357.1654615047342; 
 Tue, 07 Jun 2022 08:17:27 -0700 (PDT)
Received: from angeloc.pdxnet.pdxeng.ch (host085115199111.static.fidoka.tech.
 [85.115.199.111]) by smtp.gmail.com with ESMTPSA id
 ay25-20020a056402203900b0042cf43e1937sm10588291edb.75.2022.06.07.08.17.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 08:17:26 -0700 (PDT)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue,  7 Jun 2022 17:17:18 +0200
Message-Id: <20220607151719.2305134-3-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220607151719.2305134-1-angelo@amarulasolutions.com>
References: <20220607151719.2305134-1-angelo@amarulasolutions.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 2/3] package/wpa_supplicant: adding ifupdown
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

 package/wpa_supplicant/ifupdown.sh       | 48 ++++++++++++++++++++++++
 package/wpa_supplicant/wpa_supplicant.mk | 10 +++++
 2 files changed, 58 insertions(+)
 create mode 100755 package/wpa_supplicant/ifupdown.sh

diff --git a/package/wpa_supplicant/ifupdown.sh b/package/wpa_supplicant/ifupdown.sh
new file mode 100755
index 0000000000..7321c7602f
--- /dev/null
+++ b/package/wpa_supplicant/ifupdown.sh
@@ -0,0 +1,48 @@
+#!/bin/sh
+
+# This file is executed by ifupdown in pre-up, post-up, pre-down and
+# post-down phases of network interface configuration.
+
+WPA_SUP_BIN="/usr/sbin/wpa_supplicant"
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
+	[ -z "$IF_WPA_CONF" ] && exit 0
+
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
