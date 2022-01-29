Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBDF8C433F5
	for <buildroot@archiver.kernel.org>; Sat, 29 Jan 2022 22:47:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A0F7C40892;
	Sat, 29 Jan 2022 22:47:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W1R7Yk3f178B; Sat, 29 Jan 2022 22:47:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E74D440890;
	Sat, 29 Jan 2022 22:47:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1F3BC1BF357
 for <buildroot@lists.busybox.net>; Sat, 29 Jan 2022 22:47:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1C3AF60AE0
 for <buildroot@lists.busybox.net>; Sat, 29 Jan 2022 22:47:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mCshjoqiE6Pn for <buildroot@lists.busybox.net>;
 Sat, 29 Jan 2022 22:47:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 23E9660A78
 for <buildroot@buildroot.org>; Sat, 29 Jan 2022 22:47:01 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id v13so17901016wrv.10
 for <buildroot@buildroot.org>; Sat, 29 Jan 2022 14:47:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sHagepcWNnGQwZm2aB7s7u6Vy+DZxmKm3YGAiMWk07g=;
 b=eV4d3RkZVls4u7DN65+F6olMQRdjl3f+t6CgkGbP2PXuqo92E/XhpdSzXvXKbS0DmS
 CcqAM5H3zprVG3bhJFzUFo6czsH+YzwHyqILpOPjk5S81QaW5OEV+jc5TnDxTIYmvOJX
 oY5Im8fnFDlS85H5g2Ys9f+yMtGmsi9bc8OO/nGvMJqtw+kynuJ6YV1y38ZnZb/HvEu5
 oHrA4E/K1kvh3ubHCoO+orEZj9TkNrXoMqwrneZrQP6JVyqEaN+5gp/fTuyOQzc4lQmm
 g7ibQ7SnRrhN9wODKBQHZm7KrrZHxkpklMHqtSaoxgbumTPaV5bsZ4wKLn5iLRghNias
 UZjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sHagepcWNnGQwZm2aB7s7u6Vy+DZxmKm3YGAiMWk07g=;
 b=GAvk4Lr8o2PzDxTxLoNI8/HSGoC3Aq82SCwG0RFedv5wBU6gW9SsIdIMTN8k9IEfta
 1EhTt/a1T7Q/wjm+2BMC9OpLkQYtP4Gv+r9q9Fh6FA0S+2WheIZbS8VYc6N6RYp6h/fl
 YaJdmjkVqe4w1kAbItaCQUs1xeNivBIzTxAsb+MjFdnJvil1QBvT4LypeTxcuN+8enBA
 7xAyxWjFIJAIAIenSnJVYDgX/G1Si/P+rgRLV3zTuuOFHhAylp0lG+eeuMxp703u3gXQ
 /SjaaPZ2+PE/3gADuYOmLm37NcTW1mk5nSIV7YPfD7xoyGhlKKlVqKDA+LkDGoeLSI5O
 gekw==
X-Gm-Message-State: AOAM533F08RDpz9YTqu3gJ7Qv3IsLsYcPj312jlT20E+vEMk+fvjnOxP
 BTe0H1s3AWrN5iGaQNTuvBuDKYeTnIc=
X-Google-Smtp-Source: ABdhPJwbsc81WhjgjKzY94puwzJ0ifoVIa0lpto8RcMNYn4RWkBzetlaFFZb6kfd07GUVnhztN5TZw==
X-Received: by 2002:a05:6000:101:: with SMTP id
 o1mr11890912wrx.487.1643496419448; 
 Sat, 29 Jan 2022 14:46:59 -0800 (PST)
Received: from atlas.home
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id l24sm5101278wme.17.2022.01.29.14.46.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Jan 2022 14:46:58 -0800 (PST)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 29 Jan 2022 23:46:50 +0100
Message-Id: <20220129224651.1282263-4-romain.naour@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220129224651.1282263-1-romain.naour@gmail.com>
References: <20220129224651.1282263-1-romain.naour@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 4/5] package/efl: handle input option
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Commit 2d7a3e48c574c05346b66f79cdb75ecdfa7f074e forgot to manage input
option on target which was added (and enabled by default) by
https://git.enlightenment.org/core/efl.git/commit/?id=0c2cf7e1bf7ca547655d25aaea30d081101b42be
resulting in the following build failure when eeze is disabled:

../output-1/build/efl-1.26.0/src/lib/elput/meson.build:1:0: ERROR: Unknown variable "eeze".

Fixes:
 - http://autobuild.buildroot.org/results/4a840c54bad9748b5748738378a0352d02de1f7e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[Romain: use BR2_PACKAGE_EFL_LIBINPUT for BR2_PACKAGE_EFL_DRM]
Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
v2: rework BR2_PACKAGE_EFL_DRM
---
 package/efl/Config.in | 19 +++++++++++++++----
 package/efl/efl.mk    |  7 +++++++
 2 files changed, 22 insertions(+), 4 deletions(-)

diff --git a/package/efl/Config.in b/package/efl/Config.in
index 21845ba306..bc89f2609b 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -85,6 +85,19 @@ config BR2_PACKAGE_EFL_LIBFRIBIDI
 	  so you may also trigger code paths with bugs that are never
 	  normally used.
 
+config BR2_PACKAGE_EFL_LIBINPUT
+	bool "Enable libinput support (recommended)"
+	default y
+	depends on BR2_PACKAGE_HAS_UDEV # libinput
+	select BR2_PACKAGE_EFL_EEZE
+	select BR2_PACKAGE_LIBINPUT
+	select BR2_PACKAGE_LIBXKBCOMMON
+	help
+	  Libinput is used to support gesture recognition.
+
+comment "libinput needs udev /dev management (eeze)"
+	depends on !BR2_PACKAGE_HAS_UDEV
+
 config BR2_PACKAGE_EFL_LIBSNDFILE
 	bool "Enable libsndfile support (recommended)"
 	default y
@@ -216,13 +229,11 @@ endchoice # OpenGL support
 
 config BR2_PACKAGE_EFL_DRM
 	bool "Evas DRM Engine"
-	depends on BR2_PACKAGE_HAS_UDEV (eeze)
+	depends on BR2_PACKAGE_HAS_UDEV # elput, eeze
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm
 	depends on BR2_PACKAGE_MESA3D_OPENGL_EGL # require libgbm from mesa3d
-	select BR2_PACKAGE_EFL_EEZE
+	select BR2_PACKAGE_EFL_LIBINPUT
 	select BR2_PACKAGE_LIBDRM
-	select BR2_PACKAGE_LIBINPUT # For elput
-	select BR2_PACKAGE_LIBXKBCOMMON
 	help
 	  This option enable building support for the Evas DRM Engine.
 
diff --git a/package/efl/efl.mk b/package/efl/efl.mk
index 43a2dc4fcb..021afa8204 100644
--- a/package/efl/efl.mk
+++ b/package/efl/efl.mk
@@ -67,6 +67,13 @@ else
 EFL_CONF_OPTS += -Deeze=false
 endif
 
+ifeq ($(BR2_PACKAGE_EFL_LIBINPUT),y)
+EFL_DEPENDENCIES += libinput libxkbcommon
+EFL_CONF_OPTS += -Dinput=true
+else
+EFL_CONF_OPTS += -Dinput=false
+endif
+
 ifeq ($(BR2_PACKAGE_EFL_UTIL_LINUX_LIBMOUNT),y)
 EFL_DEPENDENCIES += util-linux
 EFL_CONF_OPTS += -Dlibmount=true
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
