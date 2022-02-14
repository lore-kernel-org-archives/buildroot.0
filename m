Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97C75C433EF
	for <buildroot@archiver.kernel.org>; Mon, 14 Feb 2022 04:20:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 23622403EC;
	Mon, 14 Feb 2022 04:20:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EtGxdwaBmBG2; Mon, 14 Feb 2022 04:20:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 274304050E;
	Mon, 14 Feb 2022 04:20:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0D86D1BF312
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 04:19:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E6600402BB
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 04:19:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PgyoNmVyLPbY for <buildroot@lists.busybox.net>;
 Mon, 14 Feb 2022 04:19:37 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3468C402BE
 for <buildroot@buildroot.org>; Mon, 14 Feb 2022 04:19:37 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id d3so11390213ilr.10
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 20:19:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=V6JnYx6X0eX+niOneA7ZPYtBWJ5iSmZtRB/w9fY6Dnk=;
 b=aGLJXL+uYgQS7ujv9QycldRpqAaIE22L5SE5gRcrWBYDhoXWG4KTbvf7/6a/i7Q7W0
 YU+vNSEsDHFoW1DAV/8uMWA2VlX9zJkZTK6MCeBIUAEmGhog2iz2oLvB0hAe7Lgk9hQL
 0KXOjuSQ/T03gApmTQdb5YclJ2TCQ0dJxomUAbferHC/ZrUJGcwqDh2xu9IzjBkoufdC
 pFScuyrYFZ4dnEJ8nyZTb8ykvDGC0WrNtHKOAXPmUC2UzdOhe9cK3IAcR4bJDCL7Cp29
 g2vo+UCYYK4+ZKyT4xPukSWb+OQZiFVp+nF3JvpgddkL/6Dpuu3sOicHqn1lMeHJA2ii
 hagg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=V6JnYx6X0eX+niOneA7ZPYtBWJ5iSmZtRB/w9fY6Dnk=;
 b=wSaxj+I/hQzJ4DuFfn80m728CUQ33UgBEEUq9U2XYsa5Zvz8jl0BGUnIgVRBTh7Eq5
 94sf4N2gTv42v+xMDWj3mfbQJKxa63Diqv0TMR2xNttT4eCVz59aTojrxU8KKOJKF+gx
 gUvjih9m+DBVk2pUZz4S4WExKX6pFvTMDmCUkplevoyRV4bGh0dBLJ4YbQDJPmOWqJME
 rjMqLqV77A6Cc/aju7MhMtZfDrRSh4ogWtILdHdgPpV7eRGvPDtnfPHyPXCX9ZYvcpJh
 f+hSIPPvu7/MxKApiY4sMexzJCnUuvcuMsRG5fomcmDAdCVBOFHNDoRk0kHrMsdCPaa/
 qXSg==
X-Gm-Message-State: AOAM533QdD+sDddIMjGxfXehJGS+PEhid6jospUh6SbdgF5dfxgU4qs+
 QQeswzmSLV24b+PgSGV13JEThLA7RNQ=
X-Google-Smtp-Source: ABdhPJyOhlWRP6oi32Bi83+2duxwOHGBoKyaUJ2YpfpvD/s5h3QKygw8ITmp1YFj7feU7fzHv6sKlQ==
X-Received: by 2002:a92:ca4d:: with SMTP id q13mr6496539ilo.165.1644812376076; 
 Sun, 13 Feb 2022 20:19:36 -0800 (PST)
Received: from james-x399.localdomain (97-118-156-98.hlrn.qwest.net.
 [97.118.156.98])
 by smtp.gmail.com with ESMTPSA id y3sm4628957iov.29.2022.02.13.20.19.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Feb 2022 20:19:35 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 13 Feb 2022 21:19:28 -0700
Message-Id: <20220214041929.1916468-4-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220214041929.1916468-1-james.hilliard1@gmail.com>
References: <20220214041929.1916468-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v7 4/5] package/qt5/qt5base: disable broken
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
 Peter Seiderer <ps.report@gmx.net>,
 =?UTF-8?q?Ga=C3=ABl=20Portay?= <gael.portay@collabora.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Julien Corjon <corjon.j@ecagroup.com>
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
