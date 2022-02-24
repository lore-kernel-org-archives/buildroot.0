Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A6B9C433EF
	for <buildroot@archiver.kernel.org>; Thu, 24 Feb 2022 16:25:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1FCDC40A02;
	Thu, 24 Feb 2022 16:25:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2gdxRXyVhfpP; Thu, 24 Feb 2022 16:25:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DD7F3409F9;
	Thu, 24 Feb 2022 16:25:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0D2C41BF41D
 for <buildroot@lists.busybox.net>; Thu, 24 Feb 2022 16:25:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 08B30409F9
 for <buildroot@lists.busybox.net>; Thu, 24 Feb 2022 16:25:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MvmyIhiN-MVv for <buildroot@lists.busybox.net>;
 Thu, 24 Feb 2022 16:25:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CB2A2409F2
 for <buildroot@buildroot.org>; Thu, 24 Feb 2022 16:25:24 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id d28so493626wra.4
 for <buildroot@buildroot.org>; Thu, 24 Feb 2022 08:25:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=awV9cz587pK4dbRFlRWOM3ha4jyqtxYCPLn+gZO6UAU=;
 b=G/rDp9towESIeAaZPsUOX+pi85MXGasmoAAJJ0i1eiWBQWSnYhvP/+zGeErS83DUpJ
 AxwuNq2WsM3CZg12laJEivhY/LhvuIyp7PCcNpE4WrZ1nXuPf0v+1peBSdFsahbyvFbz
 ekcznugSkIoJLtmdWuY6bOyvJMbjuINMIittLJoDZ9PIS4e8tEUgiIdGWRmZgSnNFlk/
 5HYQUgICfKD1qmqnO7mNUNyb5xpj5dIZmwRRnIAnQiayiMx3HNFnpv5uwtf36YGDvHxy
 wdxA4yNHWzK5uPEe5b+HPdW1O4oh2el0W5p4oS4DYKv2YskN6P6r9COXQjFzx+pJxC+m
 g+dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=awV9cz587pK4dbRFlRWOM3ha4jyqtxYCPLn+gZO6UAU=;
 b=L8DRHmsHCyMbE86rQBSgHdC6QvkxHGCsCuJ4w89dNsxnZGn1yS/Cetogq1aLFtIOJx
 otIXo8KKaUwWSoAfcAv62HxCpFsrdmX0VtOKB68Y1WLrWlRlmtmivXf/CRWMAkS6k8qp
 BQGNdDC7Uob05SsZf/jaQZKqcSBjRFx6gGGtkIq/wI7lTNZ5OiasMhqrKxhWU6u8egTV
 HRxzvwqBaa5NyX7483R77ODDnXPkibsCBc81q0QXFVcg9pxAm/HOJ59yz0LDqG192QnS
 2j96fFDcg4kTCxlV1A9lkrORVoAjmdI1XPj17wBRFL2BUb8dlK1I3X+U/yDIIxr6FGnC
 bJZQ==
X-Gm-Message-State: AOAM53143pFyZkJShkwKDVso492CCdXTv77L0DzOUhb3MVlgIlKH20PL
 93CjAwzDKPnt8hbW20ew7ecVgDmKve8=
X-Google-Smtp-Source: ABdhPJxUR37hdmhmb3JMoj6oyasIWCs71GbofF6SP4XEEX8NwCIn2DKWPDuOTI97Q7OMZ9GKdBJcEw==
X-Received: by 2002:a5d:6d0e:0:b0:1e2:fa3d:7f22 with SMTP id
 e14-20020a5d6d0e000000b001e2fa3d7f22mr2884469wrq.142.1645719923020; 
 Thu, 24 Feb 2022 08:25:23 -0800 (PST)
Received: from atlas.home
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id l34sm3300733wms.15.2022.02.24.08.25.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 08:25:22 -0800 (PST)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 24 Feb 2022 17:25:17 +0100
Message-Id: <20220224162517.222437-2-romain.naour@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220224162517.222437-1-romain.naour@gmail.com>
References: <20220224162517.222437-1-romain.naour@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCHv2 2/2] package/efl: handle input option
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
[Romain:
  Rename BR2_PACKAGE_EFL_LIBINPUT to BR2_PACKAGE_EFL_ELPUT to match the
  upstream name.
  use BR2_PACKAGE_EFL_ELPUT for BR2_PACKAGE_EFL_DRM
  remove duplicate libxkbcommon in EFL_DEPENDENCIES]
Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
v2: rework BR2_PACKAGE_EFL_DRM
---
 package/efl/Config.in | 19 +++++++++++++++----
 package/efl/efl.mk    |  9 +++++++--
 2 files changed, 22 insertions(+), 6 deletions(-)

diff --git a/package/efl/Config.in b/package/efl/Config.in
index 4c78bef7c8..c4f82b92e3 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -85,6 +85,19 @@ config BR2_PACKAGE_EFL_LIBFRIBIDI
 	  so you may also trigger code paths with bugs that are never
 	  normally used.
 
+config BR2_PACKAGE_EFL_ELPUT
+	bool "Enable elput support (recommended)"
+	default y
+	depends on BR2_PACKAGE_HAS_UDEV # libinput, efl-eeze
+	select BR2_PACKAGE_EFL_EEZE
+	select BR2_PACKAGE_LIBINPUT
+	select BR2_PACKAGE_LIBXKBCOMMON
+	help
+	  Eplut is used to support gesture recognition.
+
+comment "elput needs udev /dev management"
+	depends on !BR2_PACKAGE_HAS_UDEV
+
 config BR2_PACKAGE_EFL_LIBSNDFILE
 	bool "Enable libsndfile support (recommended)"
 	default y
@@ -216,13 +229,11 @@ endchoice # OpenGL support
 
 config BR2_PACKAGE_EFL_DRM
 	bool "Evas DRM Engine"
-	depends on BR2_PACKAGE_HAS_UDEV # efl-eeze
+	depends on BR2_PACKAGE_HAS_UDEV # efl-elput, efl-eeze
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm
 	depends on BR2_PACKAGE_MESA3D_OPENGL_EGL # require libgbm from mesa3d
-	select BR2_PACKAGE_EFL_EEZE
+	select BR2_PACKAGE_EFL_ELPUT
 	select BR2_PACKAGE_LIBDRM
-	select BR2_PACKAGE_LIBINPUT # For elput
-	select BR2_PACKAGE_LIBXKBCOMMON
 	help
 	  This option enable building support for the Evas DRM Engine.
 
diff --git a/package/efl/efl.mk b/package/efl/efl.mk
index 43a2dc4fcb..bb0bd3f76d 100644
--- a/package/efl/efl.mk
+++ b/package/efl/efl.mk
@@ -67,6 +67,13 @@ else
 EFL_CONF_OPTS += -Deeze=false
 endif
 
+ifeq ($(BR2_PACKAGE_EFL_ELPUT),y)
+EFL_DEPENDENCIES += libinput libxkbcommon
+EFL_CONF_OPTS += -Dinput=true
+else
+EFL_CONF_OPTS += -Dinput=false
+endif
+
 ifeq ($(BR2_PACKAGE_EFL_UTIL_LINUX_LIBMOUNT),y)
 EFL_DEPENDENCIES += util-linux
 EFL_CONF_OPTS += -Dlibmount=true
@@ -204,8 +211,6 @@ else
 EFL_CONF_OPTS += -Dwl=false
 endif
 
-EFL_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBXKBCOMMON),libxkbcommon)
-
 # json evas loader is disabled by default by upstream.
 # Disable libspectre (ps).
 # Keep all other evas loader enabled or handled below.
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
