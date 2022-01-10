Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B420DC433F5
	for <buildroot@archiver.kernel.org>; Mon, 10 Jan 2022 05:41:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2CA1F40229;
	Mon, 10 Jan 2022 05:41:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RHBHHEY4u8wp; Mon, 10 Jan 2022 05:41:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 68918401E1;
	Mon, 10 Jan 2022 05:41:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 06D3E1BF421
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 05:41:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E7679405B3
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 05:41:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UksafkOf1JBa for <buildroot@lists.busybox.net>;
 Mon, 10 Jan 2022 05:41:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C3F5F40122
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 05:41:49 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id i14so16049201ioj.12
 for <buildroot@buildroot.org>; Sun, 09 Jan 2022 21:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IuMzBfZKBM79zrSVVM+oc4XQDfS9+ma4cWBHQTipvuE=;
 b=GCrBkUUSWieTzwrMCmwHFENCNV4g50CbjAlFzXdxaYsDsU+hdreuCgAuJfZ1eczszS
 jCA5B5ikKxXT9Ij7G67KdnI/zeEJi8Fh3DAZGJOsxJCa2gIIuO3UsEMuwSeQUfuqe6Ft
 g/jy4uy294/HVGrBDDHkFzQGiZ+yQdzOzW2cq2D2krUMleDxt7CUsYnJQJlAMjh1uGly
 wen40PgpORhVDtFRt6W5ctxx+bYl2CRtVawDB6iuEVatq8oMMtOQMG4lqJ26izGv0xrN
 d5D4Gw8TfSM3/WwloLC90DWWzn6diwYRcMLxElNogTHoQK2Tvr72BMkfTATdA3hQGsv+
 wl/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IuMzBfZKBM79zrSVVM+oc4XQDfS9+ma4cWBHQTipvuE=;
 b=CZeq4LrqAmEgqIJhqGdLZNIdzr7ABn2V/kvGprKS/I+V//2J7jUbMYnwHkIMq/xQwj
 4QaNHHmF4ojBaIcFyJzelO19+a+sxaS1ywD77BhSNBcaiWLhSWhYIe5PVQvUsZysZcE8
 Gh9UK1zS7UX0d3n+VtzHKLsv4bCI4sBa15kT1mLcgYjdl8qtioaNAdZGPgKJT/1coiZc
 qyfajk9yc1rWsJXeuWgw3/ToVCyEZbVXN6uuh8FrGXuKAJbJq1bG7KNeBhkXbpCNp79/
 vB7G3wD6jym2k/vJGQ15Vow3vAjXVFELWeT7ECctKoxaplQJ6z4C6OAaMTtCJF8tlXNT
 37zw==
X-Gm-Message-State: AOAM532CWMLaaD9bUaC6SpE3n/HDdqX61hgI1b7AM/95SSk94yT/muLM
 /jQP/4/KSSur8tDQPKFNCBsCmpNS2FIOBQ==
X-Google-Smtp-Source: ABdhPJxsNVUlrYLj9fEtIujVTmcjspeV0KwqfNTVhnRT9U+yEWMUeTMGhssy2jOqPeAJ8aLiE9kAYg==
X-Received: by 2002:a05:6638:3009:: with SMTP id
 r9mr33614508jak.262.1641793308650; 
 Sun, 09 Jan 2022 21:41:48 -0800 (PST)
Received: from james-x399.localdomain (97-118-242-51.hlrn.qwest.net.
 [97.118.242.51])
 by smtp.gmail.com with ESMTPSA id e16sm3739697iom.51.2022.01.09.21.41.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 21:41:48 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  9 Jan 2022 22:41:42 -0700
Message-Id: <20220110054144.1294907-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v4 1/3]
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
Cc: Naumann Andreas <ANaumann@ultratronik.de>,
 Joshua Henderson <joshua.henderson@microchip.com>,
 Bartosz Bilas <b.bilas@grinn-global.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Peter Seiderer <ps.report@gmx.net>, Julien Corjon <corjon.j@ecagroup.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 =?UTF-8?q?Ga=C3=ABl=20Portay?= <gael.portay@collabora.com>
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
