Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA945C433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Dec 2021 19:22:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5146060EBD;
	Sun, 12 Dec 2021 19:22:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k79P_38qEE7O; Sun, 12 Dec 2021 19:22:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9068960EAE;
	Sun, 12 Dec 2021 19:22:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C4D071BF300
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 19:22:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B9F5D85A16
 for <buildroot@lists.busybox.net>; Sun, 12 Dec 2021 19:22:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eOE_RBHQHbAJ for <buildroot@lists.busybox.net>;
 Sun, 12 Dec 2021 19:22:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 72C6885921
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 19:22:51 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id o13so23655569wrs.12
 for <buildroot@buildroot.org>; Sun, 12 Dec 2021 11:22:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CqXhj3q91bjz1mSBtu3TGEky6bWICkWpQVHNfwGYcTo=;
 b=Ejz9A+TETrVTV+u/M0I6mO24QCw1zX7R0RkzYAk9fahESQyIrrDXlFiObwqWiTSOVv
 OFL4hotrWhOc7fmu1LVsBEpRUHuhXIGBB7oc4q7/Hmk+KLmFrfD48kf0+S+uTILkDo+L
 O1Lb40JnEVem4znu9chnSioOWI1ugK4uXEfcMFTt1X2G9IG5k2HvYxBH6Prlah3u/6g3
 RKCGmN2oCGw1dOrbQJKpez3GxGgy3K1RJAaa0d0H5scuxDpwYDr7TK96KiejgSp3gB63
 WOiCN8YQ4aVJFTnkFMFEE8AQ4by3r6NTCHkUXBNaJZLm95sTwQ6wEcUkwhfQZO/HiBoc
 CxNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=CqXhj3q91bjz1mSBtu3TGEky6bWICkWpQVHNfwGYcTo=;
 b=SEQVbdFq21d/Nr6rjLJoWfYRq/ns1HP6FYjsQRzy6r7tVwQBPcyKpWZMgGH3nW+xgb
 J/DzIJh5vNMGDGwsGSSTJKHVsH9zjP/62kCqPMXIidFekI3LiSQCBxys3XQRgZ66sVU7
 nOnHknavuA4Ddtz63y052RY/CrtLXnhT8F6lgdlWtfj6rgJC5bGvw/qpVTzTakHTvAvE
 nfeTkOfxyRSXEaaOFFKPGZ89/3GhtrZcnXboJ22zy+VAsO6/A4FbbkL/mvKkCWXrZE6X
 akaaEiigjhWC5t7lIqEUqN/mefWFQKeSg7/Jj+6Gd7H+Wke7272JHAboBi0MHnyRdq4d
 dSsw==
X-Gm-Message-State: AOAM533H8nkASQPs1bIcJuu8K4TPT99fm8QA2HFwH+owccau1DhVIWZ/
 IfMoFFDjbPbyTqZD3V0jXXB6Wmh5MVaH2Q==
X-Google-Smtp-Source: ABdhPJxSmbCErFs3leI8xOsoSpCf+Vsxa2fX2rdG4sFtMwZ80yIC4EJylavU9brttFRgIdOwyTKQYg==
X-Received: by 2002:a05:6000:2c2:: with SMTP id
 o2mr27460287wry.360.1639336969465; 
 Sun, 12 Dec 2021 11:22:49 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id n13sm8463087wrt.44.2021.12.12.11.22.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Dec 2021 11:22:49 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 12 Dec 2021 20:22:37 +0100
Message-Id: <20211212192237.838191-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libmediaart: fix static build
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

Fix the following static build failure raised since bump to version
1.9.5 in commit 3db4d486d689b4a9d59c8f7637211893b0a1cb1b:

/home/buildroot/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: /home/buildroot/autobuild/instance-0/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libc.a(__uClibc_main.os): in function `__uClibc_fini':
__uClibc_main.c:(.text+0x15c): undefined reference to `__fini_array_start'

Fixes:
 - http://autobuild.buildroot.org/results/18d26882a68dcf8f09b3e3d25636454a12939310

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...t-meson.build-replace-shared_library.patch | 35 +++++++++++++++++++
 1 file changed, 35 insertions(+)
 create mode 100644 package/libmediaart/0003-libmediaart-meson.build-replace-shared_library.patch

diff --git a/package/libmediaart/0003-libmediaart-meson.build-replace-shared_library.patch b/package/libmediaart/0003-libmediaart-meson.build-replace-shared_library.patch
new file mode 100644
index 0000000000..d4b377d327
--- /dev/null
+++ b/package/libmediaart/0003-libmediaart-meson.build-replace-shared_library.patch
@@ -0,0 +1,35 @@
+From 2272d762436a3b0d2e4fef8fb4f1669814904620 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 12 Dec 2021 20:14:54 +0100
+Subject: [PATCH] libmediaart/meson.build: replace shared_library
+
+Replace shared_library by library call to avoid the following build
+failure when building statically:
+
+/home/buildroot/autobuild/instance-0/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: /home/buildroot/autobuild/instance-0/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libc.a(__uClibc_main.os): in function `__uClibc_fini':
+__uClibc_main.c:(.text+0x15c): undefined reference to `__fini_array_start'
+
+Fixes:
+ - http://autobuild.buildroot.org/results/18d26882a68dcf8f09b3e3d25636454a12939310
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ libmediaart/meson.build | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/libmediaart/meson.build b/libmediaart/meson.build
+index 2f44e63..1fd3b99 100644
+--- a/libmediaart/meson.build
++++ b/libmediaart/meson.build
+@@ -30,7 +30,7 @@ marshal = gnome.genmarshal('marshal',
+ 
+ libmediaart_dependencies = [glib, gio_unix, gobject, image_library]
+ 
+-libmediaart = shared_library(
++libmediaart = library(
+   'mediaart-' + libmediaart_api_version,
+   libmediaart_sources, marshal[0], marshal[1],
+   version: libmediaart_ltversion,
+-- 
+2.33.0
+
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
