Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0A29C77B61
	for <buildroot@archiver.kernel.org>; Fri, 28 Apr 2023 08:00:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E5296168F;
	Fri, 28 Apr 2023 08:00:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4E5296168F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vlTJyzfpg9ov; Fri, 28 Apr 2023 08:00:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25C2161696;
	Fri, 28 Apr 2023 08:00:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 25C2161696
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E54701BF215
 for <buildroot@lists.busybox.net>; Fri, 28 Apr 2023 07:59:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CCAC483C05
 for <buildroot@lists.busybox.net>; Fri, 28 Apr 2023 07:59:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CCAC483C05
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k4yGBjob05wk for <buildroot@lists.busybox.net>;
 Fri, 28 Apr 2023 07:59:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0930483BEF
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0930483BEF
 for <buildroot@buildroot.org>; Fri, 28 Apr 2023 07:59:32 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id
 a640c23a62f3a-9536df4b907so1803871266b.0
 for <buildroot@buildroot.org>; Fri, 28 Apr 2023 00:59:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682668771; x=1685260771;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wEV2RKOEpXVnqcwq9Q7eEyGYlDRPtWbwajd32o2pDwk=;
 b=ZaovtfebYQJaGh1p3IeRXsbS0ooif4iAzX2MYRD5W57LP3NAO+0oSJVa/5fBa0YJpq
 eR+XVAXQ3z6JCeGJEGVp/ytSApJ/LSooWwCqO16EkYs0/hZf/NmKri+Osjp6jLydZVgM
 wcJx/FdLE1gnjikUs58EeiuSCun3EyaQsqKVDrk0+y4Jc/AAJdFnVp61K8SGyl8/zxDO
 jNhd9l2qQnXyisDhYFdAtJuklJJRGYqqBNmdpQUUBB82rFVL3v3eRhI8UeS/BmotlxG3
 d9JAWrYUqsNZ+VcyaIeBRDI3jH0/+BFSmlgOacKDteMOLwcMOpxir9u1BhBUTRWFkl8x
 9HTg==
X-Gm-Message-State: AC+VfDx47jb0AwwIWxuBQO0wQhEfnPltdftDyiEMXjVoN9G+Hu/XXip4
 2R9yUNt/7PTsErOOIZ5tjKmq1BvCkp4Xew==
X-Google-Smtp-Source: ACHHUZ69KqHFx0Yr0TlFHOnE5pthNpbvGWXU6wyX0rairMzzy6zB57ewiCZFKt9Xrd5U4GPFX19x1g==
X-Received: by 2002:a17:907:628a:b0:958:801b:9945 with SMTP id
 nd10-20020a170907628a00b00958801b9945mr4906173ejc.31.1682668770584; 
 Fri, 28 Apr 2023 00:59:30 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:a03f:eb68:2f00:627a:ae86:20c8:b204])
 by smtp.gmail.com with ESMTPSA id
 sd22-20020a1709076e1600b009572bd99281sm9324798ejc.224.2023.04.28.00.59.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 00:59:30 -0700 (PDT)
From: Thomas Devoogdt <thomas@devoogdt.com>
To: buildroot@buildroot.org
Date: Fri, 28 Apr 2023 09:59:19 +0200
Message-Id: <20230428075920.3750005-4-thomas@devoogdt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230428075920.3750005-1-thomas@devoogdt.com>
References: <20230428075920.3750005-1-thomas@devoogdt.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v7 4/5] package/libgtk3: re-enable atk-bridge
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>, Daniel Lang <d.lang@abatec.at>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>,
 James Knight <james.knight@collins.com>,
 Adrian Perez de Castro <aperez@igalia.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The at-spi2-core and at-spi2-atk were merged, and are now built by default,
so this patch is no longer required.

Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
Tested-by: Adrian Perez de Castro <aperez@igalia.com>
---
v5: added re-enable atk-bridge patch to the package/at-spi2-core: bump to version 2.47.1 group
v6: no change
v7: no change
---
 package/libgtk3/0001-disable-atk-bridge.patch | 41 -------------------
 1 file changed, 41 deletions(-)
 delete mode 100644 package/libgtk3/0001-disable-atk-bridge.patch

diff --git a/package/libgtk3/0001-disable-atk-bridge.patch b/package/libgtk3/0001-disable-atk-bridge.patch
deleted file mode 100644
index f3e9bff2ba..0000000000
--- a/package/libgtk3/0001-disable-atk-bridge.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-Remove atk-bridge support.
-
-atk-bridge doesn't seem useful for now in Buildroot and requires to
-add two new packages just for it: at-spi2-core and at-spi2-atk.
-
-Signed-off-by: Hadrien Boutteville <hadrien.boutteville@gmail.com>
-
---- a/gtk/a11y/gtkaccessibility.c
-+++ b/gtk/a11y/gtkaccessibility.c
-@@ -37,10 +37,6 @@
- #include <gtk/gtktogglebutton.h>
- #include <gtk/gtkaccessible.h>
-
--#ifdef GDK_WINDOWING_X11
--#include <atk-bridge.h>
--#endif
--
- static gboolean gail_focus_watcher      (GSignalInvocationHint *ihint,
-                                          guint                  n_param_values,
-                                          const GValue          *param_values,
-@@ -988,9 +984,5 @@ _gtk_accessibility_init (void)
-   _gtk_accessibility_override_atk_util ();
-   do_window_event_initialization ();
-
--#ifdef GDK_WINDOWING_X11
--  atk_bridge_adaptor_init (NULL, NULL);
--#endif
--
-   atk_misc_instance = g_object_new (GTK_TYPE_MISC_IMPL, NULL);
- }
---- a/meson.build
-+++ b/meson.build
-@@ -564,7 +564,7 @@ if x11_enabled
-   xfixes_dep     = dependency('xfixes', required: false)
-   xcomposite_dep = dependency('xcomposite', required: false)
-   fontconfig_dep = dependency('fontconfig', fallback: ['fontconfig', 'fontconfig_dep'])
--  atkbridge_dep  = dependency('atk-bridge-2.0', version: at_spi2_atk_req)
-+  atkbridge_dep  = dependency('atk-bridge-2.0', version: at_spi2_atk_req, required: false)
- 
-   backend_immodules += ['xim']
- 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
