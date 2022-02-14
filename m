Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4629CC433EF
	for <buildroot@archiver.kernel.org>; Mon, 14 Feb 2022 04:19:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B6259403ED;
	Mon, 14 Feb 2022 04:19:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xe3-iveVBMy5; Mon, 14 Feb 2022 04:19:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A622040495;
	Mon, 14 Feb 2022 04:19:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 609071BF312
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 04:19:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AFC69402BB
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 04:19:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GRI_ixuDOWkp for <buildroot@lists.busybox.net>;
 Mon, 14 Feb 2022 04:19:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 89C83402BE
 for <buildroot@buildroot.org>; Mon, 14 Feb 2022 04:19:35 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id m185so18464226iof.10
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 20:19:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IuMzBfZKBM79zrSVVM+oc4XQDfS9+ma4cWBHQTipvuE=;
 b=RVGWmObiopDyb8Ku1TsCJzBu0XFHeFWKd+bTye+pyJme2L/Fbuhb9G3D5WlXBIiKsQ
 NRaHKnqoWe9c0bgqNyCT+EOvalZIdR0/Ijk95BWqU7EK6Ft/KgfCcJAHtu5crlLgQEVu
 PRsJFua8RNrjxH3FTdcBgafBZoGq13Fln3MP/WUBKV2rZ3VMNDmr3yyiifbTi25l0gyA
 Wbz6XDDu1OR7V5eNimoSiUQU7OffVO0gUwaejvC0EEHEhFGMlHq78IF7Bm8VyQ1Cm3yO
 J+V1OxdFWQ4ywH+EmsBAIu0DDFp5u59RUZPBiyHCtMyngQ9Yxsr8DcURu5/M4BYsbCiK
 lTDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IuMzBfZKBM79zrSVVM+oc4XQDfS9+ma4cWBHQTipvuE=;
 b=kcUwX963ZwvUgPRQEGwUKw8mR5ySDcBebXrAUxKd/U4/w83C6Y++L0/shqii3t1ci1
 T9hT5Y3ktBNgOCYxR+0azSZZgStOO44IO9ZHZUwWTFzEIheC5IGHI5GHLZJSvaj/q3oy
 CXWdyLP3P5Z/KFGo9/VYQ1+pyItCzuHjV9HrcKnbKHfawPpDfwqxKHMRW1L8FNYNPMMy
 KpnN59PI7KaTO5Dq0wyvc/otUvszxihgZrCKERgmMPAer50KOAhbBaRW/b7I4GaqHPdi
 6S+Imq7+T/U0ISQgJ+h+CKFRAcNJHjg8Y1EjQYWS4P+PopoLNlYjjmR04XocDaDlZovS
 GaQw==
X-Gm-Message-State: AOAM531/erqNSB9q7wZwS0eYKA7CF2FxTIqNOTBZin4U7tC01HtLvMm9
 zyTWh2HMEoylDKSCfgSjLe2K8srYuuU=
X-Google-Smtp-Source: ABdhPJy9ZIP1aYs/qj6rfNM38ewQ5eI6sqVFk2Trer3Llu2crzp4hxsl3KKF3D0GQn0e9WmjS6/bmw==
X-Received: by 2002:a02:852e:: with SMTP id g43mr7410152jai.15.1644812374509; 
 Sun, 13 Feb 2022 20:19:34 -0800 (PST)
Received: from james-x399.localdomain (97-118-156-98.hlrn.qwest.net.
 [97.118.156.98])
 by smtp.gmail.com with ESMTPSA id y3sm4628957iov.29.2022.02.13.20.19.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Feb 2022 20:19:34 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 13 Feb 2022 21:19:26 -0700
Message-Id: <20220214041929.1916468-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220214041929.1916468-1-james.hilliard1@gmail.com>
References: <20220214041929.1916468-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v7 2/5]
 package/qt5/qt5webengine-chromium-catapult: new package
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

This version of catapult is python3 compatible and will be used to
replace the python2 only version in qt5webengine-chromium.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v2 -> v3:
  - add kconfig entry
---
 package/qt5/Config.in                              |  1 +
 .../qt5/qt5webengine-chromium-catapult/Config.in   |  4 ++++
 .../qt5webengine-chromium-catapult.hash            |  3 +++
 .../qt5webengine-chromium-catapult.mk              | 14 ++++++++++++++
 4 files changed, 22 insertions(+)
 create mode 100644 package/qt5/qt5webengine-chromium-catapult/Config.in
 create mode 100644 package/qt5/qt5webengine-chromium-catapult/qt5webengine-chromium-catapult.hash
 create mode 100644 package/qt5/qt5webengine-chromium-catapult/qt5webengine-chromium-catapult.mk

diff --git a/package/qt5/Config.in b/package/qt5/Config.in
index 5751d6cb70..143926b743 100644
--- a/package/qt5/Config.in
+++ b/package/qt5/Config.in
@@ -68,6 +68,7 @@ source "package/qt5/qt5wayland/Config.in"
 source "package/qt5/qt5webchannel/Config.in"
 source "package/qt5/qt5webkit/Config.in"
 source "package/qt5/qt5webengine/Config.in"
+source "package/qt5/qt5webengine-chromium-catapult/Config.in"
 source "package/qt5/qt5websockets/Config.in"
 source "package/qt5/qt5webview/Config.in"
 source "package/qt5/qt5x11extras/Config.in"
diff --git a/package/qt5/qt5webengine-chromium-catapult/Config.in b/package/qt5/qt5webengine-chromium-catapult/Config.in
new file mode 100644
index 0000000000..471c2a2dbc
--- /dev/null
+++ b/package/qt5/qt5webengine-chromium-catapult/Config.in
@@ -0,0 +1,4 @@
+# Not user-selectable, it is only needed to be copied
+# into the chromium source tree.
+config BR2_PACKAGE_QT5WEBENGINE_CHROMIUM_CATAPULT
+	bool
diff --git a/package/qt5/qt5webengine-chromium-catapult/qt5webengine-chromium-catapult.hash b/package/qt5/qt5webengine-chromium-catapult/qt5webengine-chromium-catapult.hash
new file mode 100644
index 0000000000..8190a6dd5d
--- /dev/null
+++ b/package/qt5/qt5webengine-chromium-catapult/qt5webengine-chromium-catapult.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256  66b8593e665c4236f7b1c487548d41d3826eddbf486ff985dbdfd01cddcaa1a8  qt5webengine-chromium-catapult-5eedfe23148a234211ba477f76fc2ea2e8529189-br1.tar.gz
+sha256  f0df289ba9d03d857ad1c2f5918861376b1510b71588ffc60eff5c7a7bfedb09  LICENSE
diff --git a/package/qt5/qt5webengine-chromium-catapult/qt5webengine-chromium-catapult.mk b/package/qt5/qt5webengine-chromium-catapult/qt5webengine-chromium-catapult.mk
new file mode 100644
index 0000000000..5d0db1e790
--- /dev/null
+++ b/package/qt5/qt5webengine-chromium-catapult/qt5webengine-chromium-catapult.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# qt5webengine-chromium-catapult
+#
+################################################################################
+
+QT5WEBENGINE_CHROMIUM_CATAPULT_VERSION = 5eedfe23148a234211ba477f76fc2ea2e8529189
+QT5WEBENGINE_CHROMIUM_CATAPULT_SITE = https://chromium.googlesource.com/catapult.git
+QT5WEBENGINE_CHROMIUM_CATAPULT_SITE_METHOD = git
+QT5WEBENGINE_CHROMIUM_CATAPULT_LICENSE = BSD-3-Clause
+QT5WEBENGINE_CHROMIUM_CATAPULT_LICENSE_FILES = LICENSE
+QT5WEBENGINE_CHROMIUM_CATAPULT_INSTALL_TARGET = NO
+
+$(eval $(generic-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
