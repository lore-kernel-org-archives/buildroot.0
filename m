Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A970C433EF
	for <buildroot@archiver.kernel.org>; Fri, 28 Jan 2022 10:59:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3380940463;
	Fri, 28 Jan 2022 10:59:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qJZmzsxGdLTn; Fri, 28 Jan 2022 10:59:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 17A53403F9;
	Fri, 28 Jan 2022 10:59:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 81FCD1BF275
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 10:59:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6EAC6403F9
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 10:59:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KZwIYx2pJUoq for <buildroot@lists.busybox.net>;
 Fri, 28 Jan 2022 10:59:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 55EDA40167
 for <buildroot@buildroot.org>; Fri, 28 Jan 2022 10:59:50 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id u18so9022051edt.6
 for <buildroot@buildroot.org>; Fri, 28 Jan 2022 02:59:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=53K3o6eBXWCrJJvrjMHeRX4XapdYwPu73vDjrYjfbok=;
 b=g3sGsSVbCDYd3zqPSWl8tybn6CnYq8Lv4A6QY4ArmDA7H70lmdb9CyS3bowgCQh/Mu
 Wj610eV8Q7OCuKADj3G4P5Lig9sU/VuzataM00cgxicgZRGLxW/25GarRgn1t4vkI3X1
 cQlwfB99mVnpq2uqKHt2P28Xa7zOIMZhle2xRm1wD4NXZUXY5aZv289s4LEMQVx8+bQi
 kKAh5T/9yEZ3kLiAZ4OupKIZVmd/iCfO3b8mmITS2urFicGgtJTBTA4UY59E19vbx3ko
 4JQXXEH51w7SLvKImEUoOTMQHYYCopmfTsFpSxFDBuatfBFyKZbnalUp2oh+opcHMZ+9
 2Qvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=53K3o6eBXWCrJJvrjMHeRX4XapdYwPu73vDjrYjfbok=;
 b=BbeonqLZVgX3/7h5QxVI145Q/LPL08P1BNndjcAUSW9COqXW+3tKr9fJsvgGB0a0A3
 HRRW8ydENFoq/E1z9+1tt1roZfqy6aoUbIfHnMrPzI5tTQrX8LScbTmBXdf7Cm/rAgBR
 C45mbmLcfP7nFOq6++gS3FKXYueM2NWJRE6FxfmA+33aRqxTwXx5Uu5ccoWHrUt4oU/l
 qgqnxjOF7wWG3Gb/n6gzu57awNwD8f19xyMWmdXxmmR4gLFLb+wi7jcETwh3Mt/vHDUo
 bqasiA0yb4RclU14PX7P7cB9st4XYTPAXMlTR5KBarke0zwaM/Yqazqb706OvaKHey1i
 633w==
X-Gm-Message-State: AOAM532AheTD4OL0QG0VMQUZ3a/on3+nO+ayeeZCZK8wZRjqNXzXQVjP
 xBB3k/Zg5BhN86mJyxpCn19n57lO0CWbCluC
X-Google-Smtp-Source: ABdhPJys/r7Gqkd62woPV1cH/CoxA8MtLViltn69L6nvAwRKhXN9cE1QVYlC72ck1tXDrhGX7fEmCA==
X-Received: by 2002:aa7:c647:: with SMTP id z7mr7691804edr.55.1643367588131;
 Fri, 28 Jan 2022 02:59:48 -0800 (PST)
Received: from thomas-Latitude-5590.barco.com ([87.66.230.131])
 by smtp.googlemail.com with ESMTPSA id v14sm9873576ejy.77.2022.01.28.02.59.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 02:59:47 -0800 (PST)
From: Thomas Devoogdt <thomas.devoogdt@gmail.com>
X-Google-Original-From: Thomas Devoogdt <thomas.devoogdt@barco.com>
To: buildroot@buildroot.org
Date: Fri, 28 Jan 2022 11:59:16 +0100
Message-Id: <20220128105917.30421-1-thomas.devoogdt@barco.com>
X-Mailer: git-send-email 2.17.1
Subject: [Buildroot] [PATCH 1/2] package/libglib2: bump version to 2.69.1
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
Cc: Adrian Perez de Castro <aperez@igalia.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The internal_pcre option was dropped in:
https://gitlab.gnome.org/GNOME/glib/-/commit/9fbd7f3dc1f029b64b6991a540402b2bfa98de5c

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
---
 package/libglib2/0002-remove-cpp-requirement.patch | 2 +-
 package/libglib2/libglib2.hash                     | 4 ++--
 package/libglib2/libglib2.mk                       | 6 ++----
 3 files changed, 5 insertions(+), 7 deletions(-)

diff --git a/package/libglib2/0002-remove-cpp-requirement.patch b/package/libglib2/0002-remove-cpp-requirement.patch
index c402cbafa5..ce73d54f16 100644
--- a/package/libglib2/0002-remove-cpp-requirement.patch
+++ b/package/libglib2/0002-remove-cpp-requirement.patch
@@ -35,7 +35,7 @@ index 4bbf4c2..ac59f4e 100644
 @@ -1,4 +1,4 @@
 -project('glib', 'c', 'cpp',
 +project('glib', 'c',
-   version : '2.68.4',
+   version : '2.69.1',
    # NOTE: We keep this pinned at 0.49 because that's what Debian 10 ships
    meson_version : '>= 0.49.2',
 @@ -10,7 +10,6 @@ project('glib', 'c', 'cpp',
diff --git a/package/libglib2/libglib2.hash b/package/libglib2/libglib2.hash
index d421e025ff..0363b6e081 100644
--- a/package/libglib2/libglib2.hash
+++ b/package/libglib2/libglib2.hash
@@ -1,4 +1,4 @@
-# https://download.gnome.org/sources/glib/2.68/glib-2.68.4.sha256sum
-sha256  62fd061d08a75492617e625a73e2c05e259f831acbb8e1f8b9c81f23f7993a3b  glib-2.68.4.tar.xz
+# https://download.gnome.org/sources/glib/2.69/glib-2.69.1.sha256sum
+sha256  f92f34057a091fc8638d91f10cece842cb8618e9a1090b0ddb19cc15a21bf39c  glib-2.69.1.tar.xz
 # License files, locally calculated
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libglib2/libglib2.mk b/package/libglib2/libglib2.mk
index af73aeb3bf..46bbba18ad 100644
--- a/package/libglib2/libglib2.mk
+++ b/package/libglib2/libglib2.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBGLIB2_VERSION_MAJOR = 2.68
-LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).4
+LIBGLIB2_VERSION_MAJOR = 2.69
+LIBGLIB2_VERSION = $(LIBGLIB2_VERSION_MAJOR).1
 LIBGLIB2_SOURCE = glib-$(LIBGLIB2_VERSION).tar.xz
 LIBGLIB2_SITE = http://ftp.gnome.org/pub/gnome/sources/glib/$(LIBGLIB2_VERSION_MAJOR)
 LIBGLIB2_LICENSE = LGPL-2.1+
@@ -30,7 +30,6 @@ HOST_LIBGLIB2_CONF_OPTS = \
 	-Dselinux=disabled \
 	-Dsystemtap=false \
 	-Dxattr=false \
-	-Dinternal_pcre=false \
 	-Dtests=false \
 	-Doss_fuzz=disabled
 
@@ -52,7 +51,6 @@ HOST_LIBGLIB2_DEPENDENCIES = \
 # bogus installation path once combined with $(DESTDIR).
 LIBGLIB2_CONF_OPTS = \
 	-Dglib_debug=disabled \
-	-Dinternal_pcre=false \
 	-Dlibelf=disabled \
 	-Dgio_module_dir=/usr/lib/gio/modules \
 	-Dtests=false \
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
