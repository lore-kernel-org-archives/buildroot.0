Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82DF1C433EF
	for <buildroot@archiver.kernel.org>; Wed, 20 Apr 2022 07:26:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2FF6C61307;
	Wed, 20 Apr 2022 07:26:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wbTWjZIf1nm4; Wed, 20 Apr 2022 07:26:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 302DB612FF;
	Wed, 20 Apr 2022 07:26:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CB68E1BF38A
 for <buildroot@lists.busybox.net>; Wed, 20 Apr 2022 07:26:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B8AAC840CE
 for <buildroot@lists.busybox.net>; Wed, 20 Apr 2022 07:26:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SeODNMwPZjqX for <buildroot@lists.busybox.net>;
 Wed, 20 Apr 2022 07:26:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9B98682ADD
 for <buildroot@busybox.net>; Wed, 20 Apr 2022 07:26:53 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id p189so573733wmp.3
 for <buildroot@busybox.net>; Wed, 20 Apr 2022 00:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hYW4aA1gxDhBYjPT8u4ZKfiyjLRYf8jMLZKySVT6u94=;
 b=c8dIuXtKqdqufrUNcAeDXy1OyRDi9fs0BfpOdRwNt3GWErDgjQSU/yNyKOau6Vi2xn
 Mp114sO7YGUtv/VrLMQNkwAe/4so1oAAKn4xZSicProprLg+WLCRUew9795gWrd4vCcr
 RApyDVQllm3apQ7sCK8/I0G3zkLwZ6fR1kkmLUvgjgVD0BiOju2IqG6pAVbiXsMqv5qO
 B/RU75SgcgJ8CUf1UtYcHHyhUcpDmNrB92IxVx26UjJiqxCHmSF1dQWk3Sj5i/zaXQr4
 L3jVlZPbIjtdtbrm5lAIw1dq9SkjpfSAmTjjlkWoHtXdQ8IpleWXUZ3Oem1Y7N7nNsVl
 FhkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hYW4aA1gxDhBYjPT8u4ZKfiyjLRYf8jMLZKySVT6u94=;
 b=VWdrEoq+vsmhCwnhFOS+r376f46YsYeXdC44k6URMFxASPphUowSYta800T//NzmKo
 exmpbRSKgzw54F0VjpbFWwjvePKmQu/+9erhooUyPcBq69GgsCN0ffj24LCYnzFS6445
 lkpfcvsnDIrECQKl4Kzw1BslU9zKwbGsAJW9WcWKAeuAb21IKx02PyHdiW6IbvGB/dfz
 eutZhF5iP+BQRX0rq7Nsia56IFodFO8rIQwuyP5goNEqPHlyB3vjIreDMtMQKwUSFMfJ
 fMOytpFscqtSrCZ9K2/FVjWbvuuTc3tSn7u0HXcDza6RI+ZPNw3di9MRaFQHkUFVoxxO
 bAuA==
X-Gm-Message-State: AOAM532iF5LVbP9gNiQHnEjTP4zB2dClJahHm6nRaBfB6+4Z+4oS9vPj
 4/Oq0NSui5A+0Dgoer/UBURalOwhrtI=
X-Google-Smtp-Source: ABdhPJwhWKQVjEb4Q8cFKbtnXaMuH9DHKo4Wxvw/6MDjpZ94VWWACx4QeopSXhpcoXvMMqGAlQ3DMQ==
X-Received: by 2002:a1c:f413:0:b0:37b:d1de:5762 with SMTP id
 z19-20020a1cf413000000b0037bd1de5762mr2249704wma.108.1650439611860; 
 Wed, 20 Apr 2022 00:26:51 -0700 (PDT)
Received: from v2021.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 j9-20020a5d4529000000b00207a5b7f613sm13670077wra.69.2022.04.20.00.26.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 00:26:51 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 20 Apr 2022 09:26:41 +0200
Message-Id: <20220420072641.3422337-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/pango: bump to version 1.50.7
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

remove merged patch

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 ...-utils-viewer-cairo-c-fix-empty-body.patch | 40 -------------------
 package/pango/pango.hash                      |  4 +-
 package/pango/pango.mk                        |  2 +-
 3 files changed, 3 insertions(+), 43 deletions(-)
 delete mode 100644 package/pango/0001-utils-viewer-cairo-c-fix-empty-body.patch

diff --git a/package/pango/0001-utils-viewer-cairo-c-fix-empty-body.patch b/package/pango/0001-utils-viewer-cairo-c-fix-empty-body.patch
deleted file mode 100644
index 4b7b5f9b1..000000000
--- a/package/pango/0001-utils-viewer-cairo-c-fix-empty-body.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 5372a0cfd641776ece77db5590bf0d265e810086 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Tue, 29 Mar 2022 21:39:03 +0000
-Subject: [PATCH] utils/viewer-cairo.c: fix empty-body
-
-Fix the following build failure raised
-since version 1.50.5 and
-https://gitlab.gnome.org/GNOME/pango/-/commit/cd08fb7402498e6ea542b4628447547477ac212e:
-
-../utils/viewer-cairo.c: In function 'cairo_vector_view_create':
-../utils/viewer-cairo.c:228:5: error: suggest braces around empty body in an 'if' statement [-Werror=empty-body]
-     ;
-     ^
-
-Fixes:
- - http://autobuild.buildroot.org/results/dee3d631474f83b345f22eb26c59a305c32258f8
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Retrieved from:
-https://gitlab.gnome.org/GNOME/pango/-/commit/5372a0cfd641776ece77db5590bf0d265e810086]
----
- utils/viewer-cairo.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/utils/viewer-cairo.c b/utils/viewer-cairo.c
-index ca98c1cd..f15b3fb9 100644
---- a/utils/viewer-cairo.c
-+++ b/utils/viewer-cairo.c
-@@ -225,7 +225,7 @@ cairo_vector_view_create (const PangoViewer *klass G_GNUC_UNUSED)
-     return NULL;
- 
-   if (0)
--    ;
-+    {}
-   #ifdef CAIRO_HAS_SVG_SURFACE
-     else if (0 == g_ascii_strcasecmp (extension, "svg"))
-       constructor = cairo_svg_surface_create;
--- 
-GitLab
-
diff --git a/package/pango/pango.hash b/package/pango/pango.hash
index fecf36853..7864df7a2 100644
--- a/package/pango/pango.hash
+++ b/package/pango/pango.hash
@@ -1,5 +1,5 @@
-# From https://ftp.acc.umu.se/pub/GNOME/sources/pango/1.50/pango-1.50.6.sha256sum
-sha256  a998bcf36881c3ac20495d40bceb304f4eaa9175bd2967c85656434cbdafe86a  pango-1.50.6.tar.xz
+# From https://ftp.acc.umu.se/pub/GNOME/sources/pango/1.50/pango-1.50.7.sha256sum
+sha256  0477f369a3d4c695df7299a6989dc004756a7f4de27eecac405c6790b7e3ad33  pango-1.50.7.tar.xz
 
 # Locally computed
 sha256  d245807f90032872d1438d741ed21e2490e1175dc8aa3afa5ddb6c8e529b58e5  COPYING
diff --git a/package/pango/pango.mk b/package/pango/pango.mk
index c264e7674..c1c7ceeed 100644
--- a/package/pango/pango.mk
+++ b/package/pango/pango.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 PANGO_VERSION_MAJOR = 1.50
-PANGO_VERSION = $(PANGO_VERSION_MAJOR).6
+PANGO_VERSION = $(PANGO_VERSION_MAJOR).7
 PANGO_SOURCE = pango-$(PANGO_VERSION).tar.xz
 PANGO_SITE = http://ftp.gnome.org/pub/GNOME/sources/pango/$(PANGO_VERSION_MAJOR)
 PANGO_INSTALL_STAGING = YES
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
