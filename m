Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE3D6C433EF
	for <buildroot@archiver.kernel.org>; Thu, 20 Jan 2022 21:19:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5D9984032A;
	Thu, 20 Jan 2022 21:19:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5WTdf_PrUtGk; Thu, 20 Jan 2022 21:19:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 367734032B;
	Thu, 20 Jan 2022 21:19:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CFCDF1BF2B5
 for <buildroot@lists.busybox.net>; Thu, 20 Jan 2022 21:19:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CC46C607B5
 for <buildroot@lists.busybox.net>; Thu, 20 Jan 2022 21:19:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 742CJt0tYbOJ for <buildroot@lists.busybox.net>;
 Thu, 20 Jan 2022 21:19:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9C9836066D
 for <buildroot@buildroot.org>; Thu, 20 Jan 2022 21:19:46 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id r10so3185243edt.1
 for <buildroot@buildroot.org>; Thu, 20 Jan 2022 13:19:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mJZP47RzNYvwUF9HlG/6/RPkNCvEaR5jQOlNmHEvshI=;
 b=Nu1IbumfAbm+47NocntP3UZZoQXh0Q16AZcztHpugPCl/gTqVufpSaoGU1FVhdAoXr
 /+FnCdQWruYsgtRrUyuTbMpsKSm3cb4DCd+SEub7elIXqoDB5JLqxJBeTC3EyWx7GFuS
 XgnfknTuXDujlITMTmiDgRPFVygdIdg4HK38I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mJZP47RzNYvwUF9HlG/6/RPkNCvEaR5jQOlNmHEvshI=;
 b=hpe1QnnTdQBv1+13ygDnG5sJyxzjqC+GRvhgqcLpE71bg87UHD0A3Tk90sHR5rguCA
 ONOzQWgeJ0yqhn9joBHPvkSkJwoD7CJz7EaSEX1DHJEXGcpBW3WYHwbRJ4IISYqw5k2Z
 Bs4mdHB9+CCZ+G0akc9dWzysZDaBQw1SJRyeoDwdoHBwvTNScb/2p3jms2+ryyo17FBY
 IlZ5tHFvX5o1su/FX/n/IKgaGrrJVdQZbf8Vh3jNjwBI7o5vybdOJEeAFmd5SkUUUOCf
 BIZs0yzi3cIDG2OcRgpbesormtmv0XVhCtVHmBOh8xy8RWyapib45z60QmtyimAt8ZE0
 8/3g==
X-Gm-Message-State: AOAM5322sZinGN2kQY1KSxeyyeHrVCs1YrcYow/Sqz8LR4Eybu1SToVj
 PGF60Th5LacBbZ2b87w0CH4exy9N5Q6jayM23WE=
X-Google-Smtp-Source: ABdhPJz0O6kqXa2aV/OSBnjUGKtVrAteMcoVqrtyn+xgvIw5kNNzfJers4gfmWyQhB7u6g558gC2pw==
X-Received: by 2002:a17:907:6e0b:: with SMTP id
 sd11mr723867ejc.132.1642713584633; 
 Thu, 20 Jan 2022 13:19:44 -0800 (PST)
Received: from localhost.localdomain (host185036130019.static.fidoka.tech.
 [185.36.130.19])
 by smtp.gmail.com with ESMTPSA id d17sm1771020ede.88.2022.01.20.13.19.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 13:19:44 -0800 (PST)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 20 Jan 2022 22:19:41 +0100
Message-Id: <20220120211941.1033249-1-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/htpdate: bump to version 1.3.3
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

Update project to its new location and move to use the package provided
init scripts.

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/htpdate/S43htpdate      | 51 ---------------------------------
 package/htpdate/htpdate.hash    |  2 +-
 package/htpdate/htpdate.mk      |  6 ++--
 package/htpdate/htpdate.service | 13 ---------
 4 files changed, 4 insertions(+), 68 deletions(-)
 delete mode 100644 package/htpdate/S43htpdate
 delete mode 100644 package/htpdate/htpdate.service

diff --git a/package/htpdate/S43htpdate b/package/htpdate/S43htpdate
deleted file mode 100644
index 75f9a995ff..0000000000
--- a/package/htpdate/S43htpdate
+++ /dev/null
@@ -1,51 +0,0 @@
-#!/bin/sh
-
-DAEMON="htpdate"
-PIDFILE="/var/run/$DAEMON.pid"
-
-HTPDATE_ARGS="-a -s -t https://google.com"
-test -r "/etc/default/$DAEMON" && . "/etc/default/$DAEMON"
-
-start() {
-	printf 'Starting %s: ' "$DAEMON"
-	# shellcheck disable=SC2086 # we need the word splitting
-	start-stop-daemon -S -q -x "/usr/bin/$DAEMON" \
-		-- -D -i "$PIDFILE" $HTPDATE_ARGS
-	status=$?
-	if [ "$status" -eq 0 ]; then
-		echo "OK"
-	else
-		echo "FAIL"
-	fi
-	return "$status"
-}
-
-stop() {
-	printf 'Stopping %s: ' "$DAEMON"
-	start-stop-daemon -K -q -p "$PIDFILE"
-	status=$?
-	if [ "$status" -eq 0 ]; then
-		rm -f "$PIDFILE"
-		echo "OK"
-	else
-		echo "FAIL"
-	fi
-	return "$status"
-}
-
-restart() {
-	stop
-	sleep 1
-	start
-}
-
-case "$1" in
-	start|stop|restart)
-		"$1";;
-	reload)
-		# Restart, since there is no true "reload" feature.
-		restart;;
-	*)
-		echo "Usage: $0 {start|stop|restart|reload}"
-		exit 1
-esac
diff --git a/package/htpdate/htpdate.hash b/package/htpdate/htpdate.hash
index c38e8784e1..ef27f8f94c 100644
--- a/package/htpdate/htpdate.hash
+++ b/package/htpdate/htpdate.hash
@@ -1,3 +1,3 @@
 # Locally calculated:
-sha256 f6fb63b18a0d836fda721ae5655ae0b87055db1b582e98c4700f64e1ba5e2d5a  htpdate-1.3.1.tar.gz
+sha256 74f34b013eba6f99369819fa4b3d48e9ab5e531ad04f6af59cc04e8777c76ed7  htpdate-1.3.3.tar.gz
 sha256 b1c8d41afde943cacedab52cbb44ef7ffb7026e738b9c891009e89559fe31c20  LICENSE
diff --git a/package/htpdate/htpdate.mk b/package/htpdate/htpdate.mk
index e9323f9106..3c4412b283 100644
--- a/package/htpdate/htpdate.mk
+++ b/package/htpdate/htpdate.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HTPDATE_VERSION = 1.3.1
+HTPDATE_VERSION = 1.3.3
 HTPDATE_SITE = $(call github,twekkel,htpdate,v$(HTPDATE_VERSION))
 HTPDATE_LICENSE = GPL-2.0+
 HTPDATE_LICENSE_FILES = LICENSE
@@ -23,12 +23,12 @@ define HTPDATE_INSTALL_TARGET_CMDS
 endef
 
 define HTPDATE_INSTALL_INIT_SYSV
-	$(INSTALL) -D -m 0755 package/htpdate/S43htpdate \
+	$(INSTALL) -D -m 0755 $(@D)/scripts/htpdate.init \
 		$(TARGET_DIR)/etc/init.d/S43htpdate
 endef
 
 define HTPDATE_INSTALL_INIT_SYSTEMD
-	$(INSTALL) -D -m 0644 package/htpdate/htpdate.service \
+	$(INSTALL) -D -m 0644 $(@D)/scripts/htpdate.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/htpdate.service
 endef
 
diff --git a/package/htpdate/htpdate.service b/package/htpdate/htpdate.service
deleted file mode 100644
index b7f1371b08..0000000000
--- a/package/htpdate/htpdate.service
+++ /dev/null
@@ -1,13 +0,0 @@
-[Unit]
-Description=htpdate daemon
-After=network.target
-
-[Service]
-Type=forking
-PIDFile=/run/htpdate.pid
-Environment=HTPDATE_ARGS="-a -s -t https://www.google.com"
-EnvironmentFile=-/etc/default/htpdate
-ExecStart=/usr/bin/htpdate -D -i /run/htpdate.pid $HTPDATE_ARGS
-
-[Install]
-WantedBy=multi-user.target
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
