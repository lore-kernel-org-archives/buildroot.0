Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DAB0C77B7A
	for <buildroot@archiver.kernel.org>; Thu, 18 May 2023 21:31:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B7A9A844C4;
	Thu, 18 May 2023 21:31:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B7A9A844C4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D0DMFFD7-1gj; Thu, 18 May 2023 21:31:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1964E8448F;
	Thu, 18 May 2023 21:31:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1964E8448F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 52F3D1BF319
 for <buildroot@lists.busybox.net>; Thu, 18 May 2023 21:31:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2C9D28448A
 for <buildroot@lists.busybox.net>; Thu, 18 May 2023 21:31:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C9D28448A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gCVAkQV5JUsm for <buildroot@lists.busybox.net>;
 Thu, 18 May 2023 21:31:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1F54684483
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1F54684483
 for <buildroot@buildroot.org>; Thu, 18 May 2023 21:30:59 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-309550263e0so2128f8f.2
 for <buildroot@buildroot.org>; Thu, 18 May 2023 14:30:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684445458; x=1687037458;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=je94+HCLjEIjHY7dX8z4CrucA+E0Di4Dmg52wAC3k8o=;
 b=XP+03TwH19pNdx4v2VOCvp5DNDHyxKmknaRcbKaf5uDEbVcZs9R05s6S9b2ZphtjiH
 gcqv7WdbvI+Qd3lVNmGmgI9ECTowYIoOmPdIyhbsByYICE9DhWO+8rsikoqbSRtxXQQR
 SWZehs5PGFst4WlhKey33+9nlh6TGjdI4Ui+Vrnz9QyDgn28oyJXLeuLJlvoic/gv5Yo
 GwLMsZvFPDCdgfiUV+VTia/gY8DkBoVUfJ8m9PTtluZJa/2OJOKEZYbD6BlAjeQBGy+/
 TGuwMZ9iC99lYSnB/WD6hfsw1xWsnRr8nNfqUQbjEufakkSrEhbIdqJLMofEXmZRBFct
 ga1g==
X-Gm-Message-State: AC+VfDwZYBJ1pzF6hWtDK+SqwbpY2LdL46iZeMo2z1GxynhEA1TrdImU
 OlSQMuVqEUsEwuB6QY9hUWGm3fY9/e4=
X-Google-Smtp-Source: ACHHUZ7Ta01Hcp6vticGvWkn1gJBCkeLXgL2NZI6ZkRUA2TZ5hs8U8c9AjgThGAApcn40YjK34Qtig==
X-Received: by 2002:adf:fa0c:0:b0:309:3ddc:1c90 with SMTP id
 m12-20020adffa0c000000b003093ddc1c90mr90814wrr.30.1684445457969; 
 Thu, 18 May 2023 14:30:57 -0700 (PDT)
Received: from atlas.home
 (2a01cb05945b7e0087f8ae3666c23a18.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:87f8:ae36:66c2:3a18])
 by smtp.gmail.com with ESMTPSA id
 w18-20020adfee52000000b003078354f774sm3211315wro.36.2023.05.18.14.30.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 May 2023 14:30:57 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 18 May 2023 23:30:53 +0200
Message-Id: <20230518213053.33760-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684445458; x=1687037458;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=je94+HCLjEIjHY7dX8z4CrucA+E0Di4Dmg52wAC3k8o=;
 b=sT9R8K50s89F45a5HkfH3WqE6ncDaWdloh967o7cN8QbxsPctg2+wmC/lQ36RJiIYD
 E6udDvp7sifw16EGLLlH3lRm2Xs2WNd7StUwa6DtqTlRvL/u5VRzLgzI3ntftTkY0oKS
 RUDDCmUphV8RXnnp0rxAx/OOy3dMxvx+SFjfBDTg7w0AFmyET/crygYidAhBiQ8ykVVs
 83TPF+vKqJ/UVGVZkBmFbxneOMf8K6GkBBthBgg5CzHfN870Mg1ASmQUf8WOyT3s8NJf
 HCXwoYlXRCzU3V6dTNYmuSnXGMyP2wL0wwQ4NtaDig64dFi0MjHbMKt6O0jaMxFiEWri
 3qNw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=sT9R8K50
Subject: [Buildroot] [PATCH] package/mesa3d: fix glxinfo crash when gles1 is
 disabled
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
 Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

mesa3d 23.1 introduced a regression crashing glxinfo (and some piglit tests)
when gles1 is disabled.
See: https://gitlab.freedesktop.org/mesa/mesa/-/issues/9038

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/4287983490

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .checkpackageignore                           |  1 +
 ...arly-when-trying-to-create-an-unsupp.patch | 50 +++++++++++++++++++
 2 files changed, 51 insertions(+)
 create mode 100644 package/mesa3d/0005-mesa-main-Exit-early-when-trying-to-create-an-unsupp.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 947f4606aa..eb572de9f1 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -995,6 +995,7 @@ package/mender-connect/S43mender-connect Shellcheck
 package/menu-cache/0001-Support-gcc10-compilation.patch Upstream
 package/mesa3d-demos/0001-demos-makes-opengl-an-optional-component.patch Upstream
 package/mesa3d/0001-meson-Set-proper-value-for-LIBCLC_INCLUDEDIR.patch Upstream
+package/mesa3d/0005-mesa-main-Exit-early-when-trying-to-create-an-unsupp.patch Upstream
 package/meson-tools/0001-amlbootenc-gxl-remove-non-std-C-convention-in-for.patch Upstream
 package/meson/0001-Prefer-ext-static-libs-when-default-library-static.patch Upstream
 package/meson/0002-mesonbuild-dependencies-base.py-add-pkg_config_stati.patch Upstream
diff --git a/package/mesa3d/0005-mesa-main-Exit-early-when-trying-to-create-an-unsupp.patch b/package/mesa3d/0005-mesa-main-Exit-early-when-trying-to-create-an-unsupp.patch
new file mode 100644
index 0000000000..6080a551cc
--- /dev/null
+++ b/package/mesa3d/0005-mesa-main-Exit-early-when-trying-to-create-an-unsupp.patch
@@ -0,0 +1,50 @@
+From 2a6908ff4c94284b39c3cd4c97e1069876720eb7 Mon Sep 17 00:00:00 2001
+From: Jordan Justen <jordan.l.justen@intel.com>
+Date: Tue, 16 May 2023 18:46:50 -0700
+Subject: [PATCH] mesa/main: Exit early when trying to create an unsupported
+ context API
+
+Fixes: adbe8b6c17a ("mesa: optimize out _mesa_is_desktop_gl*() and _mesa_is_gles*() calls when not built")
+Closes: https://gitlab.freedesktop.org/mesa/mesa/-/issues/9038
+Signed-off-by: Jordan Justen <jordan.l.justen@intel.com>
+Reviewed-by: Eric Engestrom <eric@engestrom.ch>
+Part-of: <https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/23068>
+(cherry picked from commit 8bb1ecaa02177720758255bdd7ec34a5d15feca4)
+[Romain: backport to 23.1]
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ src/mesa/main/context.c | 18 ++++++++++++++++++
+ 1 file changed, 18 insertions(+)
+
+diff --git a/src/mesa/main/context.c b/src/mesa/main/context.c
+index d8eea2ea867..2b810b0d863 100644
+--- a/src/mesa/main/context.c
++++ b/src/mesa/main/context.c
+@@ -996,6 +996,24 @@ _mesa_initialize_context(struct gl_context *ctx,
+    struct gl_shared_state *shared;
+    int i;
+ 
++   switch (api) {
++   case API_OPENGL_COMPAT:
++   case API_OPENGL_CORE:
++      if (!HAVE_OPENGL)
++         return GL_FALSE;
++      break;
++   case API_OPENGLES2:
++      if (!HAVE_OPENGL_ES_2)
++         return GL_FALSE;
++      break;
++   case API_OPENGLES:
++      if (!HAVE_OPENGL_ES_1)
++         return GL_FALSE;
++      break;
++   default:
++      return GL_FALSE;
++   }
++
+    ctx->API = api;
+    ctx->DrawBuffer = NULL;
+    ctx->ReadBuffer = NULL;
+-- 
+2.40.1
+
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
