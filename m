Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14C7BC433F5
	for <buildroot@archiver.kernel.org>; Tue, 15 Feb 2022 01:53:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 91B3940523;
	Tue, 15 Feb 2022 01:53:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ryb0UH1-fSQ3; Tue, 15 Feb 2022 01:53:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7AF8C40475;
	Tue, 15 Feb 2022 01:53:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C61481BF282
 for <buildroot@lists.busybox.net>; Tue, 15 Feb 2022 01:53:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C24F140475
 for <buildroot@lists.busybox.net>; Tue, 15 Feb 2022 01:53:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XjuyLWd_getW for <buildroot@lists.busybox.net>;
 Tue, 15 Feb 2022 01:53:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E79A84036E
 for <buildroot@buildroot.org>; Tue, 15 Feb 2022 01:53:13 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id e79so22091221iof.13
 for <buildroot@buildroot.org>; Mon, 14 Feb 2022 17:53:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=V6JnYx6X0eX+niOneA7ZPYtBWJ5iSmZtRB/w9fY6Dnk=;
 b=IxuG9xsckXfGqsuMeYk2LpfXMlxLUpE8WnpzF1RNvCOFh08L90qyPQtMKcne+7W/eu
 TZBvNHXmLZOssV8TOasQfnulWAYCMrHMcIY9mzj8CRD/keefhKLFKxQyaU8zOOT6WA6h
 vBdyGYuRHPWOrWf+mfk26+OKesLutca7fQJL1QGbxpis+8jAnAZnsm1EeqEtGtzcKjDN
 ekMg4bgIBZk0NQwWynfkzXfpveFcLOAZJXl6Pr8BDsB2/yfVBV6zWP87BjBAaUf92Amz
 WB2+64BRtBCirvu9exv7f+mq8CkaKCkAOnf4bujLRybUDYI2byKWIxEJN4WsP0wGAK6d
 TByw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=V6JnYx6X0eX+niOneA7ZPYtBWJ5iSmZtRB/w9fY6Dnk=;
 b=VMXu4hTpyPC+om3ERyTFIuTRb/L+RwZjjOJ93gFCcx9OwPknKjklaIuJJuNnhhYg6c
 l6vZwlQaWMigow6afX0DEgStDOCbjRzQ8KeJnx9eW4WOBFirxv454Y2eHR8PaVyVU+on
 IrPAOoH1vtACrg9x0G/YKpL4brp0j1SeiRTAST8qC36oK8ONQWMH0sU0Qs/oayhHYQcl
 VSp1LIh9CMIUoj5+U+9RAz27H5RxXI52wsmWqeXbYs4w30FvTn9jrY8jQMQJTH9ttKLy
 dZffz9sPwhUGMmATelCBy1TH7Dm+cub5NfD32ofFg/ltqtsV1e6EP7xAH2oi2Uzual+u
 k8sw==
X-Gm-Message-State: AOAM533M1JwHxIZiQS7O6rtAiEsUSmAh23mOlDvPeAE1zOByZ0+0Psfr
 ccYwf5h/v8WMI+6zZeHeXazxbjwPHXU=
X-Google-Smtp-Source: ABdhPJzimLzr8qwMEanilRv5jpFfLghvxI5Ia04K6OEJVTajB6oTiPw/VhyltrsXfY6swHHU+ProEg==
X-Received: by 2002:a05:6638:1501:: with SMTP id
 b1mr1137435jat.251.1644889992612; 
 Mon, 14 Feb 2022 17:53:12 -0800 (PST)
Received: from james-x399.localdomain (97-118-156-98.hlrn.qwest.net.
 [97.118.156.98])
 by smtp.gmail.com with ESMTPSA id u15sm4729628ill.75.2022.02.14.17.53.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 17:53:12 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 14 Feb 2022 18:53:06 -0700
Message-Id: <20220215015307.855341-4-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220215015307.855341-1-james.hilliard1@gmail.com>
References: <20220215015307.855341-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v8 4/5] package/qt5/qt5base: disable broken
 qmake sysrootify
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Peter Seiderer <ps.report@gmx.net>, Julien Corjon <corjon.j@ecagroup.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?Ga=C3=ABl=20Portay?= <gael.portay@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Currently the qmake gcc sysrootify path logic causes issues with
per-package directories, disable automatic gcc sysroot for qt5base
install and override all qt.conf paths manually to point to their
correct locations.

Redirect HostData to STAGING_DIR as mkspecs need to be available there
instead of the HOST_DIR for cross compilation to work.

Improves pkg-config target/host separation.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v5 -> v6:
  - rebase/rework with qt5webengine bump
Changes v4 -> v5:
  - rework qt5webengine config to use feature flags
  - try to fix more random breakage
Changes v3 -> v4:
  - fix target pkg-config path mangling
Changes v2 -> v3:
  - set target pkg-config path
Changes v1 -> v2:
  - add some missing overrides to qt.conf.in
---
 package/qt5/qt5base/qt.conf.in | 21 ++++++++++++++++++---
 package/qt5/qt5base/qt5base.mk |  5 ++++-
 2 files changed, 22 insertions(+), 4 deletions(-)

diff --git a/package/qt5/qt5base/qt.conf.in b/package/qt5/qt5base/qt.conf.in
index 2215cbd4e1..c92f52ced0 100644
--- a/package/qt5/qt5base/qt.conf.in
+++ b/package/qt5/qt5base/qt.conf.in
@@ -2,6 +2,21 @@
 Prefix=/usr
 HostPrefix=@@HOST_DIR@@
 Sysroot=@@STAGING_DIR@@
-Headers=/usr/include/qt5
-Plugins=/usr/lib/qt/plugins
-Examples=/usr/lib/qt/examples
+SysrootifyPrefix=false
+Binaries=@@STAGING_DIR@@/usr/bin
+Libraries=@@STAGING_DIR@@/usr/lib
+Headers=@@STAGING_DIR@@/usr/include/qt5
+Plugins=@@STAGING_DIR@@/usr/lib/qt/plugins
+Examples=@@STAGING_DIR@@/usr/lib/qt/examples
+Tests=@@STAGING_DIR@@/usr/lib/qt/tests
+Data=@@STAGING_DIR@@
+Translations=@@STAGING_DIR@@/translations
+Documentation=@@STAGING_DIR@@/doc
+ArchData=@@STAGING_DIR@@/usr
+LibraryExecutables=@@STAGING_DIR@@/usr/libexec
+Imports=@@STAGING_DIR@@/usr/imports
+Qml2Imports=@@STAGING_DIR@@/usr/qml
+Settings=@@STAGING_DIR@@/etc
+HostBinaries=@@HOST_DIR@@/bin
+HostLibraries=@@HOST_DIR@@/lib
+HostData=@@STAGING_DIR@@
diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index cce92db81b..1ef70eb7f6 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -323,12 +323,15 @@ define QT5BASE_CONFIGURE_CMDS
 		-v \
 		-prefix /usr \
 		-hostprefix $(HOST_DIR) \
+		-hostdatadir $(STAGING_DIR) \
 		-headerdir /usr/include/qt5 \
 		-sysroot $(STAGING_DIR) \
+		-no-gcc-sysroot \
 		-plugindir /usr/lib/qt/plugins \
 		-examplesdir /usr/lib/qt/examples \
 		-no-rpath \
 		-nomake tests \
+		-pkg-config \
 		-device buildroot \
 		-device-option CROSS_COMPILE="$(TARGET_CROSS)" \
 		-device-option BR_COMPILER_CFLAGS="$(QT5BASE_CFLAGS)" \
@@ -337,6 +340,6 @@ define QT5BASE_CONFIGURE_CMDS
 	)
 endef
 
-QT5BASE_POST_INSTALL_STAGING_HOOKS += QT5_INSTALL_QT_CONF
+QT5BASE_PRE_INSTALL_STAGING_HOOKS += QT5_INSTALL_QT_CONF
 
 $(eval $(qmake-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
