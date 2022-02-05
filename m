Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CBDBC433EF
	for <buildroot@archiver.kernel.org>; Sat,  5 Feb 2022 20:19:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 844FC408D1;
	Sat,  5 Feb 2022 20:19:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aKHwXNtUn-hO; Sat,  5 Feb 2022 20:19:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 91DF5408E5;
	Sat,  5 Feb 2022 20:19:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D62C11BF39E
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 20:18:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C2DC040550
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 20:18:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ENmZcXg-hBR2 for <buildroot@lists.busybox.net>;
 Sat,  5 Feb 2022 20:18:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DD179400FE
 for <buildroot@buildroot.org>; Sat,  5 Feb 2022 20:18:47 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id i62so11851496ioa.1
 for <buildroot@buildroot.org>; Sat, 05 Feb 2022 12:18:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yXnHyoA/8fAJygE2nW3wmgfFB8PQlNjJkiifUE+hzbY=;
 b=Df3N/0C0S3CY4XaM05NSWp3f4laUN+lr+Ygy4ZqqzKP6T9xAyBfYtXbBc7ChGq2lim
 x7IPNIRLBabXniKJmFHBU262G2vDuIQmpyhUd8dpNEUlbB2gxmeO2yWln8av1ryIKDuD
 CsxF6npdtMtOq2WzoZJTVoI79Vq1xDJp8esHzoMaXocYkKVLvvy520l05D+k560mTFHE
 Jpy/vjkA1xMKXUJgTzCtGmF7a/gqAsrJzPKc7XHgZmgtC/yqPQtPd6UJZsdFoKJQyJL+
 iX1z1mFSkqVLIoQwhW6xXEr0csyaNuHrEwZwuV4kdJ4W8mSTb5JoSbZ1yEn3lYdYo8lB
 9bFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yXnHyoA/8fAJygE2nW3wmgfFB8PQlNjJkiifUE+hzbY=;
 b=kaMeYCdvXqf6ZGr3ylQCPv9QwI5Epq4+zT4yltuk9ckYci8vjquG2EVqNx4KGtNFpM
 xvPcJxd/Bmw2peTQ6Jj+rwogT1TCtOmKgQsBCuN35hfV5twSJIRG2EcZqG5k2NkErNde
 VEe5OAADQBmXwijDXavsMz/FKeoT3LNZ6quJ+2IylakQHwH6DzY8giPl805X984ffX3Y
 e3aPpyYGUUVKBdQb3U8aUPrIy3neXlm2s7mba4dFFRaARtAQLXIDythgcq9eqDdD3ou3
 r3sIB+DBCVGwHcIvMB65ljW8yFXc0w6QzFW+KsIvF+NQundAmguvSjcdqaGEgJQRdwZP
 rxqA==
X-Gm-Message-State: AOAM532bFZpMniTgjFC5pdM7FOs7kY0tzyJwQJLmxk7fO5vS9AtVDuQ7
 3KNNKAjEKhY3uDuBnNl+lzuUsZaHNks=
X-Google-Smtp-Source: ABdhPJwdk/p4LF6cI7wjJT8zY1pZVp3n2jihhqVFVGzkJCyeMy8AOHbXhCJr5RTI2jFGjO8i+WcKxQ==
X-Received: by 2002:a02:8814:: with SMTP id r20mr2235179jai.162.1644092326798; 
 Sat, 05 Feb 2022 12:18:46 -0800 (PST)
Received: from james-x399.localdomain (71-218-245-50.hlrn.qwest.net.
 [71.218.245.50])
 by smtp.gmail.com with ESMTPSA id a7sm2781090ilq.88.2022.02.05.12.18.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Feb 2022 12:18:46 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  5 Feb 2022 13:18:36 -0700
Message-Id: <20220205201837.3324085-7-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220205201837.3324085-1-james.hilliard1@gmail.com>
References: <20220205201837.3324085-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v6 7/8] package/qt5/qt5base: disable broken
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
Cc: Daniel Price <daniel.price@gmail.com>,
 Gilles Talis <gilles.talis@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Peter Seiderer <ps.report@gmx.net>,
 Julien Corjon <corjon.j@ecagroup.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Martin Bark <martin@barkynet.com>,
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
index 4b7a2a937d..ea41c8fd72 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -315,12 +315,15 @@ define QT5BASE_CONFIGURE_CMDS
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
@@ -329,6 +332,6 @@ define QT5BASE_CONFIGURE_CMDS
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
