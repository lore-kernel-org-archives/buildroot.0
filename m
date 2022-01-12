Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3397FC433F5
	for <buildroot@archiver.kernel.org>; Wed, 12 Jan 2022 20:33:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C4F6F4154E;
	Wed, 12 Jan 2022 20:33:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wW7ZlhR6C8MY; Wed, 12 Jan 2022 20:33:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F86D409F3;
	Wed, 12 Jan 2022 20:33:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C972C1BF578
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 20:33:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B91E6409F3
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 20:33:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XDwTGv8E4Epd for <buildroot@lists.busybox.net>;
 Wed, 12 Jan 2022 20:32:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 57301409E7
 for <buildroot@buildroot.org>; Wed, 12 Jan 2022 20:32:59 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id l25so6292022wrb.13
 for <buildroot@buildroot.org>; Wed, 12 Jan 2022 12:32:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=j+hZywzBHIgyU/kt+PA+WS0EeDSYtJTe+S4BpLN9L28=;
 b=e8hzt9jSwjVPWbn9sHteShsIB8/136trbEly3fQFdlLWZ/xRXD1H69LZOqW8Dsnz8V
 +oC99AkKUYXT0KL+SZJTdb8BtFT+JAYTwi6oIWOVLChrz0sUHtrqoU8DW2kfnkiCXz29
 9lE9VTJDPGHaEziQKlxklQu7vpU8h+LXmPOSja40D9UoPG5RyByMvRrrxr8NWNKVv008
 OklLMUvyYeOVu3CnbWecusuW09iJCuSpWCgOIZeo6eCFVgHI5+gP3bw6fw8CJSohJfue
 spxexR7iOBdPrnTMHvB5V7ltcJa1JbAOprFJWKKPcA+M7GmlAhuNsdFNCHyea8hALgkF
 YX5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=j+hZywzBHIgyU/kt+PA+WS0EeDSYtJTe+S4BpLN9L28=;
 b=wMookAdg/fAS/K3UT/nLjHpgLx7Ae32UcfV5dNOOjsWROlIIMIhwL8SUDi6qcbbHNI
 FWMXyiDvmHhgsqDAyLTZNz7ZRe0HxWYX3+fxOq9Y4vXjBL52SqV1hP5jEBXZEkWYkWAT
 utUaKIp7DzgkVb8MRXcJSjrFL9TwEFT6iQ6Zmoa+iAWhMYdeoVl3WdSsz8mufw6AQoa6
 nCBmvHVlcVvcCkC/O4ZFMsVIoi/8wCHW2dorg9ewNujAiu4LwcN2Yc0S9ZrXkelxCuqL
 +DfBUiRO3sOn+R+lsx/aJScDAxqgyorP0bSJLg/H4pcBQJ66b2Hiib9wnH9uEwqw8Lo4
 kn4g==
X-Gm-Message-State: AOAM530hHCQmApdJQGgR3Ge2/7mABof1r82m0MzijIKJXDCTQhTOci37
 Q2R2AhmIkuwfzCy/KvVbi/AKtpHQMMw=
X-Google-Smtp-Source: ABdhPJzFL/OY8p3HlIMImwie1aUaHPS/s3BJ2TGiJomNPdcRWOuV149bYOdxtvv+4Y2Mq4oqMYuJCg==
X-Received: by 2002:a5d:588f:: with SMTP id n15mr1242828wrf.159.1642019577440; 
 Wed, 12 Jan 2022 12:32:57 -0800 (PST)
Received: from kali.home (lfbn-ren-1-358-126.w2-10.abo.wanadoo.fr.
 [2.10.19.126])
 by smtp.gmail.com with ESMTPSA id m9sm684751wrw.94.2022.01.12.12.32.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 12:32:57 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 12 Jan 2022 21:31:17 +0100
Message-Id: <20220112203117.3133159-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/avahi: add hidden libavahi-client
 option
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Paul Cercueil <paul@crapouillou.net>,
 James Hilliard <james.hilliard1@gmail.com>, Simon Dawson <spdawson@gmail.com>,
 Olivier Schonken <olivier.schonken@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This hidden option will simplify packages depending on libavahi-client

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/avahi/Config.in                  | 6 ++++++
 package/cups-filters/cups-filters.mk     | 3 +--
 package/libiio/libiio.mk                 | 3 +--
 package/libostree/libostree.mk           | 6 +-----
 package/pipewire/pipewire.mk             | 3 +--
 package/shairport-sync/shairport-sync.mk | 6 +-----
 package/vlc/vlc.mk                       | 3 +--
 7 files changed, 12 insertions(+), 18 deletions(-)

diff --git a/package/avahi/Config.in b/package/avahi/Config.in
index 95b01bfe92..67722d04a2 100644
--- a/package/avahi/Config.in
+++ b/package/avahi/Config.in
@@ -34,6 +34,12 @@ config BR2_PACKAGE_AVAHI_DAEMON
 	  The daemon registers local IP addresses and services using
 	  mDNS/DNS-SD.
 
+config BR2_PACKAGE_AVAHI_LIBAVAHI_CLIENT
+	bool
+	default y
+	depends on BR2_PACKAGE_AVAHI_DAEMON
+	depends on BR2_PACKAGE_DBUS
+
 config BR2_PACKAGE_AVAHI_LIBDNSSD_COMPATIBILITY
 	bool "libdns_sd compatibility (Bonjour)"
 	depends on BR2_PACKAGE_AVAHI_DAEMON
diff --git a/package/cups-filters/cups-filters.mk b/package/cups-filters/cups-filters.mk
index 63b85f0b8b..c8f2dd0aae 100644
--- a/package/cups-filters/cups-filters.mk
+++ b/package/cups-filters/cups-filters.mk
@@ -45,8 +45,7 @@ else
 CUPS_FILTERS_CONF_OPTS += --disable-dbus
 endif
 
-# avahi support requires avahi-client, which needs avahi-daemon and dbus
-ifeq ($(BR2_PACKAGE_AVAHI_DAEMON)$(BR2_PACKAGE_DBUS),yy)
+ifeq ($(BR2_PACKAGE_AVAHI_LIBAVAHI_CLIENT),y)
 CUPS_FILTERS_DEPENDENCIES += avahi
 CUPS_FILTERS_CONF_OPTS += --enable-avahi
 else
diff --git a/package/libiio/libiio.mk b/package/libiio/libiio.mk
index 38b2f83e6e..a4fe0d4541 100644
--- a/package/libiio/libiio.mk
+++ b/package/libiio/libiio.mk
@@ -65,8 +65,7 @@ else
 LIBIIO_CONF_OPTS += -DWITH_AIO=OFF
 endif
 
-# Avahi support in libiio requires avahi-client, which needs avahi-daemon and dbus
-ifeq ($(BR2_PACKAGE_AVAHI_DAEMON)$(BR2_PACKAGE_DBUS),yy)
+ifeq ($(BR2_PACKAGE_AVAHI_LIBAVAHI_CLIENT),y)
 LIBIIO_DEPENDENCIES += avahi
 LIBIIO_CONF_OPTS += -DHAVE_DNS_SD=ON
 else
diff --git a/package/libostree/libostree.mk b/package/libostree/libostree.mk
index 22cb83d039..9cbf2848c9 100644
--- a/package/libostree/libostree.mk
+++ b/package/libostree/libostree.mk
@@ -37,11 +37,7 @@ else
 LIBOSTREE_CONF_OPTS += --without-openssl
 endif
 
-# Avahi support needs libavahi-client, which is built by avahi if avahi-daemon
-# and dbus is selected. Since there is no BR2_PACKAGE_LIBAVAHI_CLIENT config
-# option yet, use the avahi-daemon and dbus config symbols to check for
-# libavahi-client.
-ifeq ($(BR2_PACKAGE_AVAHI_DAEMON)$(BR2_PACKAGE_DBUS),yy)
+ifeq ($(BR2_PACKAGE_AVAHI_LIBAVAHI_CLIENT),y)
 LIBOSTREE_CONF_OPTS += --with-avahi
 LIBOSTREE_DEPENDENCIES += avahi
 else
diff --git a/package/pipewire/pipewire.mk b/package/pipewire/pipewire.mk
index 604d08f90d..b05ce2bcc2 100644
--- a/package/pipewire/pipewire.mk
+++ b/package/pipewire/pipewire.mk
@@ -83,8 +83,7 @@ else
 PIPEWIRE_CONF_OPTS += -Dalsa=disabled -Dpipewire-alsa=disabled
 endif
 
-# avahi support needs avahi-client, which needs avahi-daemon and dbus
-ifeq ($(BR2_PACKAGE_AVAHI)$(BR2_PACKAGE_AVAHI_DAEMON)$(BR2_PACKAGE_DBUS),yyy)
+ifeq ($(BR2_PACKAGE_AVAHI_LIBAVAHI_CLIENT),y)
 PIPEWIRE_CONF_OPTS += -Davahi=enabled
 PIPEWIRE_DEPENDENCIES += avahi
 else
diff --git a/package/shairport-sync/shairport-sync.mk b/package/shairport-sync/shairport-sync.mk
index cf49f2b2ed..487e0c05e5 100644
--- a/package/shairport-sync/shairport-sync.mk
+++ b/package/shairport-sync/shairport-sync.mk
@@ -22,11 +22,7 @@ SHAIRPORT_SYNC_CONF_OPTS = --with-alsa \
 SHAIRPORT_SYNC_CONF_ENV += LIBS="$(SHAIRPORT_SYNC_CONF_LIBS)"
 
 # Avahi or tinysvcmdns (shaiport-sync bundles its own version of tinysvcmdns).
-# Avahi support needs libavahi-client, which is built by avahi if avahi-daemon
-# and dbus is selected. Since there is no BR2_PACKAGE_LIBAVAHI_CLIENT config
-# option yet, use the avahi-daemon and dbus congig symbols to check for
-# libavahi-client.
-ifeq ($(BR2_PACKAGE_AVAHI_DAEMON)$(BR2_PACKAGE_DBUS),yy)
+ifeq ($(BR2_PACKAGE_AVAHI_LIBAVAHI_CLIENT),y)
 SHAIRPORT_SYNC_DEPENDENCIES += avahi
 SHAIRPORT_SYNC_CONF_OPTS += --with-avahi --without-tinysvcmdns
 else
diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index fe338fcbe8..b793e0efe0 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -117,8 +117,7 @@ else
 VLC_CONF_OPTS += --disable-alsa
 endif
 
-# avahi support needs avahi-client, which needs avahi-daemon and dbus
-ifeq ($(BR2_PACKAGE_AVAHI)$(BR2_PACKAGE_AVAHI_DAEMON)$(BR2_PACKAGE_DBUS),yyy)
+ifeq ($(BR2_PACKAGE_AVAHI_LIBAVAHI_CLIENT),y)
 VLC_CONF_OPTS += --enable-avahi
 VLC_DEPENDENCIES += avahi
 else
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
