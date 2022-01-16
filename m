Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22B0DC433F5
	for <buildroot@archiver.kernel.org>; Sun, 16 Jan 2022 10:17:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF9434032D;
	Sun, 16 Jan 2022 10:17:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4Kwcq-MWxP7Z; Sun, 16 Jan 2022 10:17:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E630740325;
	Sun, 16 Jan 2022 10:17:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EF8451BF426
 for <buildroot@lists.busybox.net>; Sun, 16 Jan 2022 10:17:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EBC7040325
 for <buildroot@lists.busybox.net>; Sun, 16 Jan 2022 10:17:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wcPvbEUFWmO7 for <buildroot@lists.busybox.net>;
 Sun, 16 Jan 2022 10:17:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3F1EC40321
 for <buildroot@buildroot.org>; Sun, 16 Jan 2022 10:17:52 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id d14so12257545ila.1
 for <buildroot@buildroot.org>; Sun, 16 Jan 2022 02:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=El9lGphzk4LX0+XfK0enCsvI2Ycn6XgNtPZsMvH7K+w=;
 b=OJizuxgV0qOqkstAd9Q2JDe4LW+PGEkA8uO1pHq2RXMu6wnqFWeu01hXKMdq/Y616u
 RyNerBscGJtuWYftr8MmaogMoMVyLWzS59xs5uEvG7/cAwHmrOTLhRym8auPJcIHuj8d
 yhem1zObwT0vYrQ2sJuqGUE07pVcbphW8UEzIh/fZ3n0rJKgLzhsZ50p9CAp1Mh+Uow5
 ws2ALIvvcJiMjoc4nOgQkk8GrbqroqfYWtuf57Cr6MG01FOagNsRuKAves1ucJ9bx0N2
 3lp5Slszsb7PyXRZOomWypRse2TUj6znIUaDP0h/0qRB7tUSmXDuyo7Me35TyTLIeUDZ
 JKeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=El9lGphzk4LX0+XfK0enCsvI2Ycn6XgNtPZsMvH7K+w=;
 b=QsGDHbn6dTdHuL97nG6fToPmCtnOlXdfW5J7Wlgnobswqy21eBUiOLvMYEA9w+dIf2
 6D6yRNrIGXN4XAMjd+HHngxVto4TmyAqRZTp2bkRdytcQe1O4UnCi6yh/tAM8Oh+ZPlG
 b4O3lWn9f72yDi7Nsti4+uu7Ne3ucfwMETYM4yK5CFqQCvrb2h70AaOBz0wLEwHfK8dM
 2RE7m2LmbV+jkemcJu4lOrqdxcTykZjhOboEI52ehEhbvkRyWSIlLkd1jso/1BfzPt/f
 z7i6uwwK/BTRpSeOdYbgAb9SQCl6CGt16E0L2NJRK/DJZq6FSZuC5l44+JdApLsFoq9b
 /bNQ==
X-Gm-Message-State: AOAM531xPpkV79CgEaP5Ozlbc8DwwqKLZdVBz7Km61UGeSZZOLf/Orvc
 9aJC5CFpmkZEzH7EvHs2vWPvT/Mt3uE=
X-Google-Smtp-Source: ABdhPJw+p97uyHPSZm+RmepI4RnOC/daCtWH+tF/XV9QU9EbGt+O1YaFHLJA5uH8SI8FiOZN4oh7Bg==
X-Received: by 2002:a05:6e02:1a86:: with SMTP id
 k6mr8944589ilv.223.1642328271005; 
 Sun, 16 Jan 2022 02:17:51 -0800 (PST)
Received: from james-x399.localdomain (97-118-239-242.hlrn.qwest.net.
 [97.118.239.242])
 by smtp.gmail.com with ESMTPSA id d16sm6564651ila.51.2022.01.16.02.17.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Jan 2022 02:17:50 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 16 Jan 2022 03:17:39 -0700
Message-Id: <20220116101739.2623120-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 1/1] package/qt5/qt5base: disable broken
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
 Peter Seiderer <ps.report@gmx.net>, Julien Corjon <corjon.j@ecagroup.com>
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

Also set qmake target pkg-config path for qt5webengine.

This fixes some build errors with per-package directories such as:
/home/buildroot/buildroot/output/per-package/qt5base/host/opt/ext-toolchain/bin/../lib/gcc/aarch64-buildroot-linux-gnu/10.3.0/../../../../aarch64-buildroot-linux-gnu/bin/ld:
cannot find /lib64/libc.so.6
/home/buildroot/buildroot/output/per-package/qt5base/host/opt/ext-toolchain/bin/../lib/gcc/aarch64-buildroot-linux-gnu/10.3.0/../../../../aarch64-buildroot-linux-gnu/bin/ld:
cannot find /usr/lib64/libc_nonshared.a
/home/buildroot/buildroot/output/per-package/qt5base/host/opt/ext-toolchain/bin/../lib/gcc/aarch64-buildroot-linux-gnu/10.3.0/../../../../aarch64-buildroot-linux-gnu/bin/ld:
cannot find /lib/ld-linux-aarch64.so.1
collect2: error: ld returned 1 exit status
make[4]: *** [Makefile:122: ../../lib/libQt5Svg.so.5.15.2] Error 1
make[3]: *** [Makefile:48: sub-svg-make_first-ordered] Error 2
make[2]: *** [Makefile:49: sub-src-make_first] Error 2
make[1]: *** [package/pkg-generic.mk:295:
/home/buildroot/buildroot/output/build/qt5svg-5.15.2/.stamp_built]
Error 2

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v2 -> v3:
  - set target pkg-config path
Changes v1 -> v2:
  - add some missing overrides to qt.conf.in
---
 package/qt5/qt5base/qmake.conf.in |  4 ++++
 package/qt5/qt5base/qt.conf.in    | 21 ++++++++++++++++++---
 package/qt5/qt5base/qt5base.mk    |  2 ++
 3 files changed, 24 insertions(+), 3 deletions(-)

diff --git a/package/qt5/qt5base/qmake.conf.in b/package/qt5/qt5base/qmake.conf.in
index 024c074928..d12f884a55 100644
--- a/package/qt5/qt5base/qmake.conf.in
+++ b/package/qt5/qt5base/qmake.conf.in
@@ -8,6 +8,10 @@
 
 include(../common/linux_device_pre.conf)
 
+# set up pkg-config
+QMAKE_PKG_CONFIG        = $$[QT_HOST_PREFIX]/bin/pkg-config
+QMAKE_PKGCONFIG_PREFIX  = /usr
+
 # modifications to g++-unix.conf
 QMAKE_CC                = $${CROSS_COMPILE}gcc
 QMAKE_CXX               = $${CROSS_COMPILE}g++
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
index bcdf036f00..6c05e710d8 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -311,8 +311,10 @@ define QT5BASE_CONFIGURE_CMDS
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
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
