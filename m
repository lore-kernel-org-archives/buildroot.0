Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7114DCD54BE
	for <buildroot@archiver.kernel.org>; Mon, 25 Sep 2023 20:03:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1139B4172F;
	Mon, 25 Sep 2023 20:03:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1139B4172F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 538AFUSYWLx9; Mon, 25 Sep 2023 20:03:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3AEB34171A;
	Mon, 25 Sep 2023 20:03:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3AEB34171A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3173D1BF94D
 for <buildroot@lists.busybox.net>; Mon, 25 Sep 2023 20:03:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 09AA1408B5
 for <buildroot@lists.busybox.net>; Mon, 25 Sep 2023 20:03:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 09AA1408B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ozCvp9kFxBfH for <buildroot@lists.busybox.net>;
 Mon, 25 Sep 2023 20:03:06 +0000 (UTC)
Received: from smtpcmd0757.aruba.it (smtpcmd0757.aruba.it [62.149.156.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3DD31408AE
 for <buildroot@buildroot.org>; Mon, 25 Sep 2023 20:03:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3DD31408AE
Received: from localhost.localdomain ([146.241.127.78])
 by Aruba Outgoing Smtp  with ESMTPSA
 id krnKqX8r6DAHrkrnLqB70d; Mon, 25 Sep 2023 22:03:03 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Mon, 25 Sep 2023 22:02:58 +0200
Message-Id: <20230925200301.2790925-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230925200301.2790925-1-giulio.benetti@benettiengineering.com>
References: <20230925200301.2790925-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfA303DfX2JDQZ0zYCxukpV7+clXJR8W7A3u5oI4ctPflQ2JF+beMvc0eTgvRGEmYlp/vZ4h5kpAz9eXqY0LHgroBvnYK9acWnIniQRV7rSmOLL+4EPim
 myGgCXpWUqTr4tpbTrd2vJEC4bzUPLMHTk+3V0zCH2vNYMiZIKpvt2xtOTZnKFO0xXCrhltJ/jzBpeXROmZ796obHh0APvMjb1GYzxxPSYEfae2clC1FfwqE
 yI6qOpPCStAdzxHqFky7W5r5y6cV3jTdODTZbwE98ZmqKYjc8vIxULKaN1k6ogvDUIbksddVvRaQd0cL6YgxFKHC2ZmBKWnfchoHB6RD4m6pHWjPT2KKXMfw
 va9ogFQxrLAduZPR6ak43UicX3IiiA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1695672183; bh=hCKyNu/nQdU7X9w/1wPyDoR4Hd3cW4pIrSkDwkfdRx0=;
 h=From:To:Subject:Date:MIME-Version;
 b=gO/Q2BIY0D4CiWhUlV1ER+6uYm4FiJHcCdURx6QGX9Xu1PHcpSoSYyzT3abJDhCUy
 us3vOvHr2eO4s+Eu2wQ4LouIWsK5Awip4AiaHGLAAmRoS9arMJ3ycqmzrA9oIh+hUc
 kGSHtS7gkRqiYAEYRLm43iIZ2v6ZzbWFiuH3F3SEUoArGADWsTxtoDffBkFIzS6w8D
 9JMy8xN//92fFcDfrKdwXl02WhN3KQxfnRB7fuobSICXVRzh36LyQSURbSiq3sE9ho
 PDlAYh/Kom+CwEOi9yGS61ueSGbmUHL9AVJHRsrNLRtZtbXuW9L/kiTQVnVde070hC
 gCzEpxMhbxrRw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=gO/Q2BIY
Subject: [Buildroot] [PATCH 1/4] package/libnvme: new package
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Marek Belisko <marek.belisko@open-nandra.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

libnvme provides type definitions for NVMe specification and utilities
for nvme devices handling in Linux. libnvme is needed by udisks from
version 2.10.0+

https://github.com/linux-nvme/libnvme

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 DEVELOPERS                   |  1 +
 package/Config.in            |  1 +
 package/libnvme/Config.in    |  7 ++++++
 package/libnvme/libnvme.hash |  3 +++
 package/libnvme/libnvme.mk   | 41 ++++++++++++++++++++++++++++++++++++
 5 files changed, 53 insertions(+)
 create mode 100644 package/libnvme/Config.in
 create mode 100644 package/libnvme/libnvme.hash
 create mode 100644 package/libnvme/libnvme.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 1ed5285961..8927a2653b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1207,6 +1207,7 @@ F:	package/harfbuzz/
 F:	package/libfuse3/
 F:	package/libnspr/
 F:	package/libnss/
+F:	package/libnvme/
 F:	package/mali-driver/
 F:	package/minicom/
 F:	package/mmc-utils/
diff --git a/package/Config.in b/package/Config.in
index db6cf432e3..1e8b6f90c1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1711,6 +1711,7 @@ menu "Hardware handling"
 	source "package/libllcp/Config.in"
 	source "package/libmbim/Config.in"
 	source "package/libnfc/Config.in"
+	source "package/libnvme/Config.in"
 	source "package/libpciaccess/Config.in"
 	source "package/libphidget/Config.in"
 	source "package/libpri/Config.in"
diff --git a/package/libnvme/Config.in b/package/libnvme/Config.in
new file mode 100644
index 0000000000..f298046563
--- /dev/null
+++ b/package/libnvme/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LIBNVME
+	bool "libnvme"
+	help
+	  libnvme provides type definitions for NVMe specification
+	  and utilities for nvme devices handling in Linux.
+
+	  https://github.com/linux-nvme/libnvme
diff --git a/package/libnvme/libnvme.hash b/package/libnvme/libnvme.hash
new file mode 100644
index 0000000000..b869ae295a
--- /dev/null
+++ b/package/libnvme/libnvme.hash
@@ -0,0 +1,3 @@
+# Locally calculated sha256 checksums
+sha256  f73ba1edde059b2d5e7c1048ad4f895e6047bff241c94b34a7aff5894779d086  libnvme-1.5.tar.gz
+sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/libnvme/libnvme.mk b/package/libnvme/libnvme.mk
new file mode 100644
index 0000000000..71885e198c
--- /dev/null
+++ b/package/libnvme/libnvme.mk
@@ -0,0 +1,41 @@
+################################################################################
+#
+# libnvme
+#
+################################################################################
+
+LIBNVME_VERSION = 1.5
+LIBNVME_SITE = $(call github,linux-nvme,libnvme,v$(LIBNVME_VERSION))
+LIBNVME_LICENSE = LGPL-2.1
+LIBNVME_LICENSE_FILES = COPYING
+LIBNVME_INSTALL_STAGING = YES
+
+ifeq ($(BR2_PACKAGE_PYTHON3),y)
+LIBNVME_DEPENDENCIES += python3
+LIBNVME_CONF_OPTS += -Dpython=enabled
+else
+LIBNVME_CONF_OPTS += -Dpython=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_OPENSSL),y)
+LIBNVME_DEPENDENCIES += openssl
+LIBNVME_CONF_OPTS += -Dopenssl=enabled
+else
+LIBNVME_CONF_OPTS += -Dopenssl=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_JSON_C),y)
+LIBNVME_DEPENDENCIES += json-c
+LIBNVME_CONF_OPTS += -Djson-c=enabled
+else
+LIBNVME_CONF_OPTS += -Djson-c=disabled
+endif
+
+ifeq ($(BR2_PACKAGE_KEYUTILS),y)
+LIBNVME_DEPENDENCIES += keyutils
+LIBNVME_CONF_OPTS += -Dkeyutils=enabled
+else
+LIBNVME_CONF_OPTS += -Dkeyutils=disabled
+endif
+
+$(eval $(meson-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
