Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F26AEC433EF
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 04:56:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 54FBD42479;
	Fri,  7 Jan 2022 04:56:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WPlqRxw52UlW; Fri,  7 Jan 2022 04:56:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3DE6040283;
	Fri,  7 Jan 2022 04:56:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 547421BF589
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 04:56:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 40EE740283
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 04:56:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CqwCwThLiOaW for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 04:56:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 24D4F4014E
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 04:56:11 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id o7so5723784ioo.9
 for <buildroot@buildroot.org>; Thu, 06 Jan 2022 20:56:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IuMzBfZKBM79zrSVVM+oc4XQDfS9+ma4cWBHQTipvuE=;
 b=iM1z3hwlxYHerJyL+0UseshmWotfFaWJPuP33HsaX5Jskp7LtDaP8HSCyCWeoFjoEq
 UXRQH6E/qrDLGN3ZVQsN85T2UGrKMal4WKC+OOY+n/9KNPaZgF69KcY1aihu7+hMp4bZ
 RAhsqUKjdaz8aztQSrAwZzQ6zjK4DR6azkrf87iJqd9LfycJq5DLBZm3mixl03HjJT9W
 zSMLNEL1QPhN1Y3FRUTzZ5irRarXXIecinipt5ZDG2kaNpelrCgKV9XqGwpfJfh5uyuE
 bQ2U48qCFQ1wO8lELy5RRkuwsurI8kOxNX1QDWWKbagT/yli85P4rCFf88ZqV4qxOuRV
 I5/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IuMzBfZKBM79zrSVVM+oc4XQDfS9+ma4cWBHQTipvuE=;
 b=mKMn75JgmS8d+L1tGqgM5Tqz7vKuC4t3WbZy2mPYuID+VrOhIJYbAMfhZ7Gi2CSg19
 4f3x9WyAAd8oe1vhlGCgcKoEe9UsE2eptyfP1HrgBlwDgJ5rw5mKHCOFJi3Z2rwRehKm
 ZKwz//++klIdyZRqI0OmhP3FMrzaAIk+Yk+uZtfBokh7CuXtuC6uTuRtZu4FyUDNkxri
 +wHSORn/q3ZBkkpdD0PRdrOtbjfBcG06Nn4dcOAjCak4BEckwyMZXLRpRQVZp5qqO5DC
 goRkY8czSPy3RnOdWi/gpHRLgXMyuWMEj7CHAbpx2ZwlN1kdLq2TZaZpQfWxZ2uugebK
 k1gw==
X-Gm-Message-State: AOAM532B9zukAlPJUhQtejeOfRFj0jMzF/pi09tBJCYFex1IOn+ILcwW
 YiueZJUxzUTTYP1FhjUrL5MC88HU2b9hrQ==
X-Google-Smtp-Source: ABdhPJyehl1DT75ua2CIxXvqwlY+noYlb7lorRH3kd3ukd3G80/9BJKiSdU3nAGhwXkifbOQDmxR0w==
X-Received: by 2002:a05:6638:2395:: with SMTP id
 q21mr28831065jat.313.1641531370033; 
 Thu, 06 Jan 2022 20:56:10 -0800 (PST)
Received: from james-x399.localdomain (71-218-242-12.hlrn.qwest.net.
 [71.218.242.12])
 by smtp.gmail.com with ESMTPSA id j3sm2310996ilu.64.2022.01.06.20.56.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 20:56:09 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  6 Jan 2022 21:55:29 -0700
Message-Id: <20220107045531.3985241-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 1/3]
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
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Bartosz Bilas <b.bilas@grinn-global.com>, Peter Seiderer <ps.report@gmx.net>,
 Julien Corjon <corjon.j@ecagroup.com>,
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
