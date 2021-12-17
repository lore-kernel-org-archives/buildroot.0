Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDFE3C433EF
	for <buildroot@archiver.kernel.org>; Fri, 17 Dec 2021 19:10:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 93CE140C28;
	Fri, 17 Dec 2021 19:10:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wO48R5IFr5DF; Fri, 17 Dec 2021 19:10:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 60BD140579;
	Fri, 17 Dec 2021 19:10:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CEE181BF35E
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 19:10:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BD47784D51
 for <buildroot@lists.busybox.net>; Fri, 17 Dec 2021 19:10:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NT3TnpW81xZ0 for <buildroot@lists.busybox.net>;
 Fri, 17 Dec 2021 19:10:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C75C784D20
 for <buildroot@buildroot.org>; Fri, 17 Dec 2021 19:10:04 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 y83-20020a1c7d56000000b003456dfe7c5cso3800307wmc.1
 for <buildroot@buildroot.org>; Fri, 17 Dec 2021 11:10:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=geCtml+kMKgtkAAvfCpR21bNRmrrJdLvisBHkg904WE=;
 b=p2HDZCcxzRBUicwiXL1HI4GPcyHk5AIBAunAxZljcOrqiuHYS+IEKTVDv7qsTW1Egt
 ShndXQethXbINAofXn7vnnBqHIOiIcIc+XFxY07vSFrOiY1jnvKG3NJIYtbNz/9TK2dT
 ypykTmk9+EOmDNXZNLkgcVc2CZnHzg/NSCVclCVHAaJvHqxXvKf40GaTBhrVrorBal8e
 tpw0ccdBji1u1bcEj40i49J2xTieHRNXPKLhxkqlO+mHBpIwI/kB28ZRUdeHq8GHEMMN
 5gKFjfrSiunaJSFURdkYTrOsTDM6ekM43G/tm6VGxDJ4Zzv1MgHrjO5JsKuMDm+Q7pa8
 yFYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=geCtml+kMKgtkAAvfCpR21bNRmrrJdLvisBHkg904WE=;
 b=HFfVzGpEVpD0+pTauGZSziGKB/LFc6cBy7zIUAD6gQu93cZw1XscE14yV38rRu1F1O
 WxOSyAT+b4vt4KUoemVZa/SfUdsLLPAlu7GCKyQ383MhmvEP5PDlldKL9znaWws+mz02
 gFUwkmYJ1z0JVA63X5tkeGd23/jQEjTdq+FqNLMZ7MSv6xwQMZ2AxN4ETOO97NpYx/Qq
 Ibm4qd4bYw2vkqOTa33HNTNUfmyEltgGJIRfo27BkQKY8s0zPMzVZaMGMSUc+AHb9g+4
 RYbzlOMUzGc3+r6igS1V1tapw0K6vobo+FKIjjYuf8hP3JG7xHFD2XwZOIB/cXYpDAGq
 AiDw==
X-Gm-Message-State: AOAM530tH7U8mqF//XNPxPbhFSLEMlYAE8tg55S4OIXj7CXSsrjaGbEX
 7Zbaj0bxfGCkZUHdBU6pIUxV7nOnZKbbOA==
X-Google-Smtp-Source: ABdhPJx7g5AesPHzM0as1z9sX6uzZ5o0FIQDNhViYnBU7ID5v+/X1cztRkyGWeRkbZE579L8GYNC3g==
X-Received: by 2002:a05:600c:600c:: with SMTP id
 az12mr3846451wmb.86.1639768202779; 
 Fri, 17 Dec 2021 11:10:02 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id z22sm2860101wmi.26.2021.12.17.11.10.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Dec 2021 11:10:02 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 17 Dec 2021 20:08:52 +0100
Message-Id: <20211217190853.18713-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211217190853.18713-1-fontaine.fabrice@gmail.com>
References: <20211217190853.18713-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/3] package/gupnp-dlna: bump to version 0.12.0
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- GStreamer 0.10 back-end has been dropped with
  https://gitlab.gnome.org/GNOME/gupnp-dlna/-/commit/af50a8ac988c3929cec1afc6f85458d98ce80485
- Switch to meson-package (to avoid autoreconf as no configure is
  shipped anymore)
- Update indention in hash file (two spaces)

https://gitlab.gnome.org/GNOME/gupnp-dlna/-/blob/gupnp-dlna-0.12.0/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gupnp-dlna/gupnp-dlna.hash |  6 +++---
 package/gupnp-dlna/gupnp-dlna.mk   | 16 +++++++---------
 2 files changed, 10 insertions(+), 12 deletions(-)

diff --git a/package/gupnp-dlna/gupnp-dlna.hash b/package/gupnp-dlna/gupnp-dlna.hash
index 01c7489738..dd9f2e4e4f 100644
--- a/package/gupnp-dlna/gupnp-dlna.hash
+++ b/package/gupnp-dlna/gupnp-dlna.hash
@@ -1,5 +1,5 @@
-# Hash from: http://ftp.gnome.org/pub/gnome/sources/gupnp-dlna/0.10/gupnp-dlna-0.10.5.sha256sum:
-sha256	123e368227c11d5c17fc1aa76cbdaffa345355eb51d172cd39fc74a5b468ff6a	gupnp-dlna-0.10.5.tar.xz
+# Hash from: http://ftp.gnome.org/pub/gnome/sources/gupnp-dlna/0.12/gupnp-dlna-0.12.0.sha256sum:
+sha256  3d53b96f85bc5628d33e367ec9bf2adb38ef2b34d7ad0434a6ba0cf4ad9048e6  gupnp-dlna-0.12.0.tar.xz
 
 # Locally computed:
-sha256	dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551	COPYING
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/gupnp-dlna/gupnp-dlna.mk b/package/gupnp-dlna/gupnp-dlna.mk
index dd548e3e2d..4f75c9b527 100644
--- a/package/gupnp-dlna/gupnp-dlna.mk
+++ b/package/gupnp-dlna/gupnp-dlna.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-GUPNP_DLNA_VERSION_MAJOR = 0.10
-GUPNP_DLNA_VERSION = $(GUPNP_DLNA_VERSION_MAJOR).5
+GUPNP_DLNA_VERSION_MAJOR = 0.12
+GUPNP_DLNA_VERSION = $(GUPNP_DLNA_VERSION_MAJOR).0
 GUPNP_DLNA_SOURCE = gupnp-dlna-$(GUPNP_DLNA_VERSION).tar.xz
 GUPNP_DLNA_SITE = \
 	http://ftp.gnome.org/pub/gnome/sources/gupnp-dlna/$(GUPNP_DLNA_VERSION_MAJOR)
@@ -15,20 +15,18 @@ GUPNP_DLNA_LICENSE_FILES = COPYING
 GUPNP_DLNA_INSTALL_STAGING = YES
 GUPNP_DLNA_DEPENDENCIES = host-pkgconf libglib2 libxml2
 
-GUPNP_DLNA_CONF_OPTS = --disable-legacy-gstreamer-metadata-backend
-
 ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
-GUPNP_DLNA_CONF_OPTS += --enable-introspection
+GUPNP_DLNA_CONF_OPTS += -Dintrospection=true -Dvapi=true
 GUPNP_DLNA_DEPENDENCIES += host-vala gobject-introspection
 else
-GUPNP_DLNA_CONF_OPTS += --disable-introspection
+GUPNP_DLNA_CONF_OPTS += -Dintrospection=false -Dvapi=false
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE),y)
-GUPNP_DLNA_CONF_OPTS += --enable-gstreamer-metadata-backend
+GUPNP_DLNA_CONF_OPTS += -Dgstreamer_backend=enabled
 GUPNP_DLNA_DEPENDENCIES += gstreamer1 gst1-plugins-base
 else
-GUPNP_DLNA_CONF_OPTS += --disable-gstreamer-metadata-backend
+GUPNP_DLNA_CONF_OPTS += -Dgstreamer_backend=disabled
 endif
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
