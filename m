Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E336C433EF
	for <buildroot@archiver.kernel.org>; Sat,  5 Feb 2022 20:19:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54B55408C5;
	Sat,  5 Feb 2022 20:19:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id czSC07x6Z7B5; Sat,  5 Feb 2022 20:19:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8619A408B3;
	Sat,  5 Feb 2022 20:19:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 097141BF39E
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 20:18:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5A6DF40550
 for <buildroot@lists.busybox.net>; Sat,  5 Feb 2022 20:18:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CdyGRhRAxPVO for <buildroot@lists.busybox.net>;
 Sat,  5 Feb 2022 20:18:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 39020400FE
 for <buildroot@buildroot.org>; Sat,  5 Feb 2022 20:18:46 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id m8so1268310ilg.7
 for <buildroot@buildroot.org>; Sat, 05 Feb 2022 12:18:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IuMzBfZKBM79zrSVVM+oc4XQDfS9+ma4cWBHQTipvuE=;
 b=m0BIph9O0uQpwByXchKeSyGDirnqyg6hMUT0aQtyCGUNTG2zxNzrnWy4scxUAfjYU/
 p4cNen8Szq35CIoslUHB/W4QDx0UJdaQIvwVJpioPt+vpwh070aNw3MpHSr2gCCQd1JS
 5U9X+Wx4snKitnbPtGtbpekHxQicTRq5WgPEOdb1qSW0AoLb1KWPCwVS4RS7cP9tpa7r
 DSMMvxPYBsMqi3n6D8Bz5yKY+74S5l5CMHryU7Wfa5arQfpq4kfYmj22tDDzyPCcnAL2
 bFkndegwT8kI5FgSivaio4eMcDVinqnNkav9A6vNgZZUfSqFwzkRk7NpHDhsGnwFvvJO
 nuxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IuMzBfZKBM79zrSVVM+oc4XQDfS9+ma4cWBHQTipvuE=;
 b=rnaBqXKJmor/VHEk5shHCFj1XTZgXXALOsa7kL8bZs681DbX5hsfK5/7y90KU42jpI
 2BX3vhhIqxC/CmvWWU7UcphxFMBFXjEowxZG81wQ79EuofibqJoKw0kEh8YOrkns788b
 fZNep1YMVst13ICdr0GzyElJgjZpxYSerp80TpIQhb5xJv5imU08xBseyLhvfq9D7/GD
 qN8lEaLUAmZuyb6+kv3/brd5pSFVG2bWf7e7C5DBl7/lm3+kAnet1v9xpZe3jKOOXotq
 w3IRrlK0I3bs1dps7yDUVtv+XRWxxH+gzNbi6v1MEcyVmwIyWi0BNWeTpT3lAiHZVxiB
 UN6A==
X-Gm-Message-State: AOAM531d4AUyNJtqmUgvi6gbVpWHhv4zNqAA8OBHoPFsaimTeOV71r1I
 btWgri06U9v8pbc+tqwwcOEVaM0srX8=
X-Google-Smtp-Source: ABdhPJzf1qSzd2AM9uPydWNzjuT7WoEWAaPNH9AB3bz8X5ofeIQj4xAbU0ETysbs7u7MwHMFnP8WMQ==
X-Received: by 2002:a05:6e02:1808:: with SMTP id
 a8mr2589785ilv.276.1644092325041; 
 Sat, 05 Feb 2022 12:18:45 -0800 (PST)
Received: from james-x399.localdomain (71-218-245-50.hlrn.qwest.net.
 [71.218.245.50])
 by smtp.gmail.com with ESMTPSA id a7sm2781090ilq.88.2022.02.05.12.18.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Feb 2022 12:18:44 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  5 Feb 2022 13:18:34 -0700
Message-Id: <20220205201837.3324085-5-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220205201837.3324085-1-james.hilliard1@gmail.com>
References: <20220205201837.3324085-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v6 5/8]
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
