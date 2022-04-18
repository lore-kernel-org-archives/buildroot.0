Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7DE4C433F5
	for <buildroot@archiver.kernel.org>; Mon, 18 Apr 2022 21:37:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3BC4441C90;
	Mon, 18 Apr 2022 21:37:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GY_Z1occnRfu; Mon, 18 Apr 2022 21:37:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DBB16417CD;
	Mon, 18 Apr 2022 21:37:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EED921BF2F1
 for <buildroot@lists.busybox.net>; Mon, 18 Apr 2022 21:37:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DABD560E0A
 for <buildroot@lists.busybox.net>; Mon, 18 Apr 2022 21:37:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DU2hwli6pZgn for <buildroot@lists.busybox.net>;
 Mon, 18 Apr 2022 21:37:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DE02B60D60
 for <buildroot@buildroot.org>; Mon, 18 Apr 2022 21:37:12 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id y21so7990339wmi.2
 for <buildroot@buildroot.org>; Mon, 18 Apr 2022 14:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+sA4ZZYc6jNwLfchK/Zztl+WkZMBa/KlLXMEfVOQhAM=;
 b=U9S461ciPdHcKnq7LpZE0tlvx66cwMyskW1qfLQj/llpcC6ne63zYK76SwFrxKUfSq
 tHMALyA+C03YTrMazCUVUytKUYWoKcOU+snZASlhAakBxloGMWpRkLpqXCzU8JG5k2pH
 1QFn4+hyjRaPxJQPtNLzFJuAB6hIhJeGlATtF1Yw2ozd2AYbN6LnO+IrpGHgDBlnqifA
 gvTr7cxU69XG1UlDfgyfnEv4hgiDDv75W05+uXDWvkMDwx2h7TZeGc9PiJwAS9uWB7bW
 qKJ8d4GGVHLyfKvNXyHfnJSFWCtPGK9tVsrhaIGZFbyydbSoyvouNbaDcmhHZk9CELlB
 FGWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+sA4ZZYc6jNwLfchK/Zztl+WkZMBa/KlLXMEfVOQhAM=;
 b=PWh66IrEsaWgEkgxVm/oAYcqxcfhL8Wokc1QfieM0OvMrKc6X2Yufu+9AnHNhuMaKf
 zQakVQSIdh4gsNJ4xYmoIZksi2JXxgNq4tGz5cjcqTObVSFYVM6mBs79TKToYlQ1msD4
 9eWLc/9r1M2kRUoOCxyvxTblGsDJqAfPJJ7a0KgotW/TAr+tKdA/8F43F+V8++f0jOgy
 g40VuwiPgJp0UuyNCdVY01XQ7HGCZlWtvjq1LbyZ/LjxQtdX//Jtka6AdVWkwSvzwwPQ
 ew/M7C9/OmWqyZ7BDtYS25lWEWXrBvVq+IySpKj3bZHzKBd2VzPA2V8yBka4+INJSnrS
 fyvA==
X-Gm-Message-State: AOAM532eM2WpGNWtIlkCASwtmDi68heaQMno5lVaTaLjwq3NDKC+eNyX
 OPvkE2GwipX2sxRj5nH6rVGLaNSZzss=
X-Google-Smtp-Source: ABdhPJxfGTwFf9nA6ZauFPfWXzSdHw6bNkO6MhhGlVc9PsRz83yJ6CWzq9A68S+sRiMierolBE9UOA==
X-Received: by 2002:a05:600c:1991:b0:392:9143:27c3 with SMTP id
 t17-20020a05600c199100b00392914327c3mr9297977wmq.0.1650317830570; 
 Mon, 18 Apr 2022 14:37:10 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 o11-20020adf9d4b000000b001f0077ea337sm11472555wre.22.2022.04.18.14.37.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Apr 2022 14:37:09 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 18 Apr 2022 23:34:51 +0200
Message-Id: <20220418213451.845353-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/wayland: fix build with gcc 4.8
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with gcc 4.8 raised since bump to
version 1.20.0 in commit f94ba5c31cf7f863e6fae996fc042a56e20118f3 and
https://gitlab.freedesktop.org/wayland/wayland/-/commit/80164ef3005e8bb5f785082b97a75cab15444f82:

../src/wayland-util.c: In function 'for_each_helper':
../src/wayland-util.c:373:2: error: 'for' loop initial declarations are only allowed in C99 mode
  for (size_t idx = 0; idx < count; idx++) {
  ^
../src/wayland-util.c:373:2: note: use option -std=c99 or -std=gnu99 to compile your code

Fixes:
 - http://autobuild.buildroot.org/results/3040c9a8cf08415a7f4338185f6dc7245c68c64c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../wayland/0001-build-set-c_std-c99.patch    | 34 +++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 package/wayland/0001-build-set-c_std-c99.patch

diff --git a/package/wayland/0001-build-set-c_std-c99.patch b/package/wayland/0001-build-set-c_std-c99.patch
new file mode 100644
index 0000000000..69f728aa11
--- /dev/null
+++ b/package/wayland/0001-build-set-c_std-c99.patch
@@ -0,0 +1,34 @@
+From 40c275f642e3895aeb748403fcdfd92d7d875d65 Mon Sep 17 00:00:00 2001
+From: Simon Ser <contact@emersion.fr>
+Date: Mon, 10 Jan 2022 14:54:02 +0100
+Subject: [PATCH] build: set c_std=c99
+
+Set explicitly the C standard to use to make sure we don't use
+features not available on our target platforms.
+
+Signed-off-by: Simon Ser <contact@emersion.fr>
+
+[Retrieved from:
+https://gitlab.freedesktop.org/wayland/wayland/-/commit/40c275f642e3895aeb748403fcdfd92d7d875d65]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ meson.build | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/meson.build b/meson.build
+index cab267e9..e9691ffe 100644
+--- a/meson.build
++++ b/meson.build
+@@ -5,7 +5,8 @@ project(
+ 	meson_version: '>= 0.52.1',
+ 	default_options: [
+ 		'warning_level=2',
+-		'buildtype=debugoptimized'
++		'buildtype=debugoptimized',
++		'c_std=c99',
+ 	]
+ )
+ wayland_version = meson.project_version().split('.')
+-- 
+GitLab
+
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
