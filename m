Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37DB6C433EF
	for <buildroot@archiver.kernel.org>; Wed, 12 Jan 2022 20:39:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BCC674159D;
	Wed, 12 Jan 2022 20:39:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 78l8oCm6A4LV; Wed, 12 Jan 2022 20:39:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1EC844159B;
	Wed, 12 Jan 2022 20:39:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3D34F1BF578
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 20:39:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2613D4159B
 for <buildroot@lists.busybox.net>; Wed, 12 Jan 2022 20:39:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7zf5AoNMBImj for <buildroot@lists.busybox.net>;
 Wed, 12 Jan 2022 20:39:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 816124159A
 for <buildroot@buildroot.org>; Wed, 12 Jan 2022 20:39:47 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id i82so5424536ioa.8
 for <buildroot@buildroot.org>; Wed, 12 Jan 2022 12:39:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=h3rzaG2xk7k/zoK+a/2eSZuoYHIMU+69LkInMibKyPE=;
 b=hWbuomm7Dk8kuYQnHQfkwKo/84Nwv/nfVEqSZ/5B7Tv8BD9W467sdaeuVCKYXLjjAz
 4nF+9PMNgh9LuaoXBIIzRZvYEpi0eNxkiCFJUwLIrrUwIMcBe6zfFA+HonGPck8f2D8+
 Nvil7ZeBe3lTxSs0467LsTL0dSs1EepdKThAmHuKrWizprjym5koO0HXxiLklsY+0Qim
 x4W/QKNXI+dKgAhA02rR67h70MzaQ+eg+WP+2oP4PVMWu1+Q+RHCWHbvzYsg8NmjTX5h
 9NF+TJtKd9qH3kWAiYc5Wund/DI826a1HYXLgnRqBfC426mltzvM4/c9Up5em8En+Ap4
 LRxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=h3rzaG2xk7k/zoK+a/2eSZuoYHIMU+69LkInMibKyPE=;
 b=2GDk4LdPNLOxG/Smls7M19d4X0AIn3pKNR9kS66g68z8+RyXntI2f0KiJ86Png3oJX
 FEBniYJTPCwPY3hQ6+NsmtUCOdvCZZZO3a/qDTKWJTjP521iTLrF2lr4t2/p7hwCOXvC
 y/BXmHXUeDz8CyA4VBf3Csry+iQcUE9vqAr3KjqSqELotNe+KFAP4QkdogEp50CAgADY
 pGJznWWDyAifRA4BbkzTqen+wBoS5n7NBGsaNuCcwIrjWAWjDTloPkkZS4rYY1X2xi2H
 ayYedUrA8+ASeF9SxXG2teleM4/GPqnqXgn8YExk5HaQ+cwVIniuEOTxIoTMIG4aA670
 SQmQ==
X-Gm-Message-State: AOAM532nxET2tPlHJuIRq/qGvMJ86vvmFiABNwx+woyPpiFX5u35+RzO
 GhsXMfYJujAXsAPBp+A6Kh5uFZ/g3ZA=
X-Google-Smtp-Source: ABdhPJxpNC7lfUd714OZivRmssQPT3MPlOXtuZUOvMC/EpUxSXYTTqVuUWGQdOnbP0DLeJp5UBePzQ==
X-Received: by 2002:a02:b113:: with SMTP id r19mr695920jah.194.1642019986423; 
 Wed, 12 Jan 2022 12:39:46 -0800 (PST)
Received: from james-x399.localdomain (97-118-242-51.hlrn.qwest.net.
 [97.118.242.51])
 by smtp.gmail.com with ESMTPSA id e17sm495752ili.37.2022.01.12.12.39.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jan 2022 12:39:46 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 12 Jan 2022 13:39:39 -0700
Message-Id: <20220112203939.606775-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/qt5/qt5base: disable broken qmake
 sysrootify
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

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/qt5/qt5base/qt.conf.in | 18 +++++++++++++++---
 package/qt5/qt5base/qt5base.mk |  2 ++
 2 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/package/qt5/qt5base/qt.conf.in b/package/qt5/qt5base/qt.conf.in
index 2215cbd4e1..db9ab0c364 100644
--- a/package/qt5/qt5base/qt.conf.in
+++ b/package/qt5/qt5base/qt.conf.in
@@ -2,6 +2,18 @@
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
+Data=@@STAGING_DIR@@
+Translations=@@STAGING_DIR@@/translations
+ArchData=@@STAGING_DIR@@/usr
+LibraryExecutables=@@STAGING_DIR@@/usr/libexec
+Imports=@@STAGING_DIR@@/usr/imports
+Qml2Imports=@@STAGING_DIR@@/usr/qml
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
