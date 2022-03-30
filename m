Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2D07C433F5
	for <buildroot@archiver.kernel.org>; Wed, 30 Mar 2022 16:58:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 955FC40DC2;
	Wed, 30 Mar 2022 16:58:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id En9_IOIVHFHR; Wed, 30 Mar 2022 16:58:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A0B4940576;
	Wed, 30 Mar 2022 16:58:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 69DEE1BF341
 for <buildroot@lists.busybox.net>; Wed, 30 Mar 2022 16:58:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 53798610A1
 for <buildroot@lists.busybox.net>; Wed, 30 Mar 2022 16:58:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YO8xy9UieGOZ for <buildroot@lists.busybox.net>;
 Wed, 30 Mar 2022 16:58:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F1550607F0
 for <buildroot@buildroot.org>; Wed, 30 Mar 2022 16:58:43 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id r13so30146513wrr.9
 for <buildroot@buildroot.org>; Wed, 30 Mar 2022 09:58:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XFVpFx1TbYl3dqWukGXqEO/U1pkBLWY+3QkJ7NblqPo=;
 b=ZHHX0ckODyKRxblq9J+Ded2yPRQwRfYXNwdgnJU6QaXFyno48eYvipGI5hwy7wyNQ4
 6ou0XqB/C4tE+vrOjVYgL7M0nhnN66uD/Xm1Ra2Iwq7nWurlOw+Yfg6ZWlMhuL7CEeen
 5WoyHktDONXkIok5XFi0V7d2EB8+DEY3clTJ5Ckw0e9MV671sypaX1ro2OdUNQVE6DY1
 IoeVEKKF8XlrAP8Wz+iiFYeJxQzbDiBtsNmJtuUOZv1ek6hGo1/SMDkSNTjwm+Lh8Pkn
 cJb6Uv55x539p8WbyjSbgd7UPirJ61PEjQo+fzttPTrwDYxY49BjYYvaC2gHEcOPkiB6
 CkgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XFVpFx1TbYl3dqWukGXqEO/U1pkBLWY+3QkJ7NblqPo=;
 b=AFD6uZ4r/TNBEZdkdSiroFyWIyg+cH6CAxK+ghtTvlNE8NchC7vqCxTL2B2FE5Udd+
 W20Y0LRYkEX0lEBCYQI83qQQC0Sj4yVwuYtV/jfEwV9NHmkCUfinKBFJFBpmBgf2LP4w
 mpRuHMDntLp7BWKFNIn/9BczTCY78o99oirdWS5rmsFi6RelG66TesUWUZknHJdVznv5
 TR3zZFIskatBGB3/o2FrBK1P5xJ5l7Rbkloxt314+fL2f5X7yj74q2uGNMmbAAnjiL1O
 UZfTXcaDeeLmjoPUfRUfa8EXGnxC9d3gc2DR6/ROaQ2d7T2WULxuOpi/lSiz6nfDDo+W
 Cf+g==
X-Gm-Message-State: AOAM531ndThZw8ti6x7Z/KjxBT5TS1kNp9jMpbEsl5YeKb3iXIP9ZMvs
 7jdQG3yjSKRjZu9hval1oINhgiGHtL4=
X-Google-Smtp-Source: ABdhPJzKMJmYGAMb1vykKmXPzjbMN8o+SNxGXYxWRMZ7gqWJ/H78VlHl5dJ+OniIklHbsAH+ZloKNQ==
X-Received: by 2002:a5d:6205:0:b0:1e4:b3fd:9ba8 with SMTP id
 y5-20020a5d6205000000b001e4b3fd9ba8mr494275wru.426.1648659521886; 
 Wed, 30 Mar 2022 09:58:41 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 l3-20020a1ced03000000b0038ce57d28a1sm5074638wmh.26.2022.03.30.09.58.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 09:58:41 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 30 Mar 2022 18:57:02 +0200
Message-Id: <20220330165702.1018014-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2,1/1] package/pango: fix empty-body
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

Fix the following build failure raised since bump to version 1.50.5 in
commit 68b0efbae49a42d0e14d6040e5e7e573d382ff75:

../utils/viewer-cairo.c: In function 'cairo_vector_view_create':
../utils/viewer-cairo.c:228:5: error: suggest braces around empty body in an 'if' statement [-Werror=empty-body]
     ;
     ^

Fixes:
 - http://autobuild.buildroot.org/results/dee3d631474f83b345f22eb26c59a305c32258f8

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Arnout Vandecappelle):
 - Fix error instead of dropping -Werror

 ...-utils-viewer-cairo-c-fix-empty-body.patch | 40 +++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 package/pango/0001-utils-viewer-cairo-c-fix-empty-body.patch

diff --git a/package/pango/0001-utils-viewer-cairo-c-fix-empty-body.patch b/package/pango/0001-utils-viewer-cairo-c-fix-empty-body.patch
new file mode 100644
index 0000000000..4b7b5f9b19
--- /dev/null
+++ b/package/pango/0001-utils-viewer-cairo-c-fix-empty-body.patch
@@ -0,0 +1,40 @@
+From 5372a0cfd641776ece77db5590bf0d265e810086 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 29 Mar 2022 21:39:03 +0000
+Subject: [PATCH] utils/viewer-cairo.c: fix empty-body
+
+Fix the following build failure raised
+since version 1.50.5 and
+https://gitlab.gnome.org/GNOME/pango/-/commit/cd08fb7402498e6ea542b4628447547477ac212e:
+
+../utils/viewer-cairo.c: In function 'cairo_vector_view_create':
+../utils/viewer-cairo.c:228:5: error: suggest braces around empty body in an 'if' statement [-Werror=empty-body]
+     ;
+     ^
+
+Fixes:
+ - http://autobuild.buildroot.org/results/dee3d631474f83b345f22eb26c59a305c32258f8
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://gitlab.gnome.org/GNOME/pango/-/commit/5372a0cfd641776ece77db5590bf0d265e810086]
+---
+ utils/viewer-cairo.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/utils/viewer-cairo.c b/utils/viewer-cairo.c
+index ca98c1cd..f15b3fb9 100644
+--- a/utils/viewer-cairo.c
++++ b/utils/viewer-cairo.c
+@@ -225,7 +225,7 @@ cairo_vector_view_create (const PangoViewer *klass G_GNUC_UNUSED)
+     return NULL;
+ 
+   if (0)
+-    ;
++    {}
+   #ifdef CAIRO_HAS_SVG_SURFACE
+     else if (0 == g_ascii_strcasecmp (extension, "svg"))
+       constructor = cairo_svg_surface_create;
+-- 
+GitLab
+
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
