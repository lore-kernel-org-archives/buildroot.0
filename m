Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A907C433FE
	for <buildroot@archiver.kernel.org>; Sun, 27 Feb 2022 10:01:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 18D6A60D76;
	Sun, 27 Feb 2022 10:01:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6Xjbmnl-v_05; Sun, 27 Feb 2022 10:01:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 32DB660D67;
	Sun, 27 Feb 2022 10:01:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4532C1BF329
 for <buildroot@lists.busybox.net>; Sun, 27 Feb 2022 10:01:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2D6CF60D67
 for <buildroot@lists.busybox.net>; Sun, 27 Feb 2022 10:01:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i_KtEiA6ClxH for <buildroot@lists.busybox.net>;
 Sun, 27 Feb 2022 10:01:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 250ED60D66
 for <buildroot@buildroot.org>; Sun, 27 Feb 2022 10:01:24 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 n25-20020a05600c3b9900b00380f41e51e6so4306405wms.2
 for <buildroot@buildroot.org>; Sun, 27 Feb 2022 02:01:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1lYVtexflR8b8EZuq6cW/+nobYYTdMtSyXhlbCsmojM=;
 b=GIf19fHERggLEJlYDz8lxZpkb2e4qn5ESPRB17N6ilF4pKN3yqOM4uhiFAJni9OBhB
 DVKBnyaa/gCRLGYPIz8r0R5ljZJcrJtlth48EdWuz2lPu6GvjyPudlvbo6SzkMU9/Tpa
 7sJeLdPZ5SDKGDb4oi+hetKP6/bg57F8HnKKXL22x6Q7O7u5LX7Gi2ZiM/VLoPQ5bV6V
 zpkBH5gWVZZZESjyXvD2IQGtr6eXUx0gI+3PI8dZpBERi/I5u15X1m7RErZTHCHzcXa2
 4OpXbTGMyc6hSlKIQeRU2QlbcrH+S8KJB9kTZSOyzUKnCNp9WkzSSODF7yFKyQWjdbhT
 ZRJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1lYVtexflR8b8EZuq6cW/+nobYYTdMtSyXhlbCsmojM=;
 b=pitti8Q86GahwjagDuMaIT12QSWLWAVdlqj6oSDG2Qir1rR04RBgXKxMIiLP6grphR
 0rHH2Y7Lbf8Mm4yCKq1OKETYB5tRXhsjMT8DdDURy1BsmJFSw/zx0TPsx2td1YAOXFTi
 4HVphjgXM/YXdvLPJRNy4rF2OYxvGu/Fj1wMV904Kpsp1px5ctaEC3zi0MySQ2tcZSxX
 pxWgPo9C21aKW5uStLc0ldCPtr+jynM30QgqUp6npzWyy0mkrlAalVoXku0c1EgryqIc
 IiR5s2qD0ZnAXCRuA2DdJRrC5PRrkME1hx3fFoTw95QVadwjBBVUglwzkbQQ+E00T+P5
 ghsw==
X-Gm-Message-State: AOAM530KkgWZxFAS9/LGThq6aVu/Q1y0O+/Cl4s/U9eZp7ZkBAX0KzLw
 RrzifLxLeoquxeTKO/tTo8rk5nb9aMY=
X-Google-Smtp-Source: ABdhPJxlleTNtoja42y0Q6bsiPft3YgPht3EcBHeCWnouhdsmYAl/aEclq9TguKz4Kb6jm/Be2eu6A==
X-Received: by 2002:a05:600c:3ac5:b0:381:4f1b:2e6d with SMTP id
 d5-20020a05600c3ac500b003814f1b2e6dmr3731348wms.40.1645956082120; 
 Sun, 27 Feb 2022 02:01:22 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 k35-20020a05600c1ca300b003815a59c065sm1235817wms.36.2022.02.27.02.01.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Feb 2022 02:01:21 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 27 Feb 2022 11:01:04 +0100
Message-Id: <20220227100104.3694504-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH/next 1/1] package/libsecret: bump to version
 0.20.5
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

- Switch to meson-package
- Add bash-completion and tpm2-tss optional dependencies

https://gitlab.gnome.org/GNOME/libsecret/-/tags/0.20.5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libsecret/libsecret.hash |  4 ++--
 package/libsecret/libsecret.mk   | 36 +++++++++++++++++++++-----------
 2 files changed, 26 insertions(+), 14 deletions(-)

diff --git a/package/libsecret/libsecret.hash b/package/libsecret/libsecret.hash
index 792ec838e3..4eb3d9b95c 100644
--- a/package/libsecret/libsecret.hash
+++ b/package/libsecret/libsecret.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/libsecret/0.20/libsecret-0.20.4.sha256sum
-sha256  325a4c54db320c406711bf2b55e5cb5b6c29823426aa82596a907595abb39d28  libsecret-0.20.4.tar.xz
+# From https://download.gnome.org/sources/libsecret/0.20/libsecret-0.20.5.sha256sum
+sha256  3fb3ce340fcd7db54d87c893e69bfc2b1f6e4d4b279065ffe66dac9f0fd12b4d  libsecret-0.20.5.tar.xz
 
 # Hash for license file:
 sha256  a1a33180d02960ab1c5de36cf20b1a2f0fe9888d83826ad263da5db52f1b183b  COPYING
diff --git a/package/libsecret/libsecret.mk b/package/libsecret/libsecret.mk
index 4d14c231d7..82fe38ac1a 100644
--- a/package/libsecret/libsecret.mk
+++ b/package/libsecret/libsecret.mk
@@ -5,33 +5,45 @@
 ################################################################################
 
 LIBSECRET_VERSION_MAJOR = 0.20
-LIBSECRET_VERSION = $(LIBSECRET_VERSION_MAJOR).4
+LIBSECRET_VERSION = $(LIBSECRET_VERSION_MAJOR).5
 LIBSECRET_SITE = http://ftp.gnome.org/pub/GNOME/sources/libsecret/$(LIBSECRET_VERSION_MAJOR)
 LIBSECRET_SOURCE = libsecret-$(LIBSECRET_VERSION).tar.xz
 LIBSECRET_INSTALL_STAGING = YES
 LIBSECRET_DEPENDENCIES = libglib2 $(TARGET_NLS_DEPENDENCIES)
-LIBSECRET_CONF_ENV = LIBS=$(TARGET_NLS_LIBS)
+LIBSECRET_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
 LIBSECRET_CONF_OPTS = \
-	--disable-manpages \
-	--disable-strict \
-	--disable-coverage \
-	--enable-vala=no
+	-Dgtk_doc=false \
+	-Dmanpage=false \
+	-Dvapi=false
 LIBSECRET_LICENSE = LGPL-2.1+
 LIBSECRET_LICENSE_FILES = COPYING
 
+ifeq ($(BR2_PACKAGE_BASH_COMPLETION),y)
+LIBSECRET_CONF_OPTS += -Dbash_completion=enabled
+LIBSECRET_DEPENDENCIES += bash-completion
+else
+LIBSECRET_CONF_OPTS += -Dbash_completion=disabled
+endif
+
 ifeq ($(BR2_PACKAGE_GOBJECT_INTROSPECTION),y)
-LIBSECRET_CONF_OPTS += --enable-introspection=yes
+LIBSECRET_CONF_OPTS += -Dintrospection=true
 LIBSECRET_DEPENDENCIES += gobject-introspection
 else
-LIBSECRET_CONF_OPTS += --enable-introspection=no
+LIBSECRET_CONF_OPTS += -Dintrospection=false
 endif
 
 ifeq ($(BR2_PACKAGE_LIBGCRYPT),y)
 LIBSECRET_DEPENDENCIES += libgcrypt
-LIBSECRET_CONF_OPTS += --enable-gcrypt \
-	--with-libgcrypt-prefix=$(STAGING_DIR)/usr
+LIBSECRET_CONF_OPTS += -Dgcrypt=true
+else
+LIBSECRET_CONF_OPTS += -Dgcrypt=false
+endif
+
+ifeq ($(BR2_PACKAGE_TPM2_TSS),y)
+LIBSECRET_CONF_OPTS += -Dtpm2=true
+LIBSECRET_DEPENDENCIES += tpm2-tss
 else
-LIBSECRET_CONF_OPTS += --disable-gcrypt
+LIBSECRET_CONF_OPTS += -Dtpm2=false
 endif
 
-$(eval $(autotools-package))
+$(eval $(meson-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
