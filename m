Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5C50C46CD2
	for <buildroot@archiver.kernel.org>; Sat,  6 Jan 2024 18:18:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 60C1140382;
	Sat,  6 Jan 2024 18:18:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 60C1140382
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u1MsLjuLN2Mv; Sat,  6 Jan 2024 18:18:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3B188401B1;
	Sat,  6 Jan 2024 18:18:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3B188401B1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 34E471BF3B9
 for <buildroot@lists.busybox.net>; Sat,  6 Jan 2024 18:18:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0DD2160FE9
 for <buildroot@lists.busybox.net>; Sat,  6 Jan 2024 18:18:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0DD2160FE9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vZTiea3-E1Iy for <buildroot@lists.busybox.net>;
 Sat,  6 Jan 2024 18:18:02 +0000 (UTC)
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0342760F36
 for <buildroot@buildroot.org>; Sat,  6 Jan 2024 18:18:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0342760F36
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40d76923ec4so6433875e9.3
 for <buildroot@buildroot.org>; Sat, 06 Jan 2024 10:18:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704565079; x=1705169879;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jU143z2ETVCjt4Vom0im23pTBYr92+8OAis4ombE/Mw=;
 b=sedH30Yt7dLJ0xVY8MjnV9PFTzohkrZzIpx/nIgYM0twgN5SQwfEZ7dgL0v84iXUoi
 cVwci/eX3ReG/iD1SVQm2LHe2coZnutj/z9w1JZZmqAhBJ554fZ1TMCjBayoIJcHBtpp
 oyityHL+5SklTmMjYZ3Kg/FJFUyWhHlrtqJoWxHDYjflIvo2Aukt91OxBB1UggRRYqoT
 uDq0xq0FnC5szMiylC2poSPXDK9c/JQG91lv04VYraLqMQYZ+licf0E6VLjrfjsLmM3X
 fr0WG5if6TsdAXChkYMGNdpdY/tEobYVsiJu5TKL8CKfYOUbQw6V4Yaqkjdkcoj77PL5
 Sjiw==
X-Gm-Message-State: AOJu0YxaUWI+guzp0RLTJIzVNFgLjKF+jLB6+ANWFpa4+3aDanZEYQyh
 Y8ZXCEMpkQ+E77hAFguicyRZSQHJHl0=
X-Google-Smtp-Source: AGHT+IGVi1TtlyGHiUZVCmwbuTj3EOQvdJf27m3hnc99Y9HGfQ30+ld7XHW/nBHG4+v0A66v11BRwQ==
X-Received: by 2002:a05:600c:a0a:b0:40d:8ef2:7ae0 with SMTP id
 z10-20020a05600c0a0a00b0040d8ef27ae0mr626344wmp.98.1704565079043; 
 Sat, 06 Jan 2024 10:17:59 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 g11-20020a5d488b000000b00336c6b77584sm3816489wrq.91.2024.01.06.10.17.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Jan 2024 10:17:58 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  6 Jan 2024 19:17:54 +0100
Message-ID: <20240106181754.3159736-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704565079; x=1705169879; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jU143z2ETVCjt4Vom0im23pTBYr92+8OAis4ombE/Mw=;
 b=a52AJu8zJ203dlB/TQF4obtK9MkqhgFplVSKgB5XMV3lFvh5whjUldbHQu9Ta44BTv
 gJvgF8z8MbmpJqJxA09cFfDP9Z2h5MUsn1cwA/cHdOLmttNW7Of3RjKS6CqkG2bOVxcb
 k5ghSzy1riSt74tztQFwOfqchdw/RK3SuUnCGs/B9GwssJI7DHCX/8e764NrZjr5enTr
 rBIDsSs8tvjMMLkJjSBLCPnG/lZ6YV2NAXH0pjU9jEx1PiC+Avb32TQhBMzFTdFvdyi3
 YZFyRv+J/Rwjf8r1uxg0BMvXglZ+yexIsq3wcg46SSqPBwlYJzauGixnCAdiyVvZBM1N
 NDWQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=a52AJu8z
Subject: [Buildroot] [PATCH 1/1] package/json-glib: bump to version 1.8.0
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Handle new nls option added by
https://gitlab.gnome.org/GNOME/json-glib/-/commit/31998d84cb241a4c6343c97afc06ee24e60db032

https://download.gnome.org/sources/json-glib/1.8/json-glib-1.8.0.news

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/json-glib/json-glib.hash |  4 ++--
 package/json-glib/json-glib.mk   | 10 ++++++++--
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/package/json-glib/json-glib.hash b/package/json-glib/json-glib.hash
index 0c3cf7f7f7..b78d708391 100644
--- a/package/json-glib/json-glib.hash
+++ b/package/json-glib/json-glib.hash
@@ -1,5 +1,5 @@
-# From https://download.gnome.org/sources/json-glib/1.6/json-glib-1.6.6.sha256sum
-sha256  96ec98be7a91f6dde33636720e3da2ff6ecbb90e76ccaa49497f31a6855a490e  json-glib-1.6.6.tar.xz
+# From https://download.gnome.org/sources/json-glib/1.8/json-glib-1.8.0.sha256sum
+sha256  97ef5eb92ca811039ad50a65f06633f1aae64792789307be7170795d8b319454  json-glib-1.8.0.tar.xz
 
 # Hash for license file:
 sha256  a190dc9c8043755d90f8b0a75fa66b9e42d4af4c980bf5ddc633f0124db3cee7  COPYING
diff --git a/package/json-glib/json-glib.mk b/package/json-glib/json-glib.mk
index b7ff0bfd57..cd53f24cee 100644
--- a/package/json-glib/json-glib.mk
+++ b/package/json-glib/json-glib.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-JSON_GLIB_VERSION_MAJOR = 1.6
-JSON_GLIB_VERSION = $(JSON_GLIB_VERSION_MAJOR).6
+JSON_GLIB_VERSION_MAJOR = 1.8
+JSON_GLIB_VERSION = $(JSON_GLIB_VERSION_MAJOR).0
 JSON_GLIB_SITE = https://download.gnome.org/sources/json-glib/$(JSON_GLIB_VERSION_MAJOR)
 JSON_GLIB_SOURCE = json-glib-$(JSON_GLIB_VERSION).tar.xz
 JSON_GLIB_LICENSE = LGPL-2.1+
@@ -25,6 +25,12 @@ else
 JSON_GLIB_CONF_OPTS += -Dintrospection=disabled
 endif
 
+ifeq ($(BR2_SYSTEM_ENABLE_NLS),y)
+JSON_GLIB_CONF_OPTS += -Dnls=enabled
+else
+JSON_GLIB_CONF_OPTS += -Dnls=disabled
+endif
+
 JSON_GLIB_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)
 
 $(eval $(meson-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
