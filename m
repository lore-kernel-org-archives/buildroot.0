Return-Path: <SRS0=hSOo=MZ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2697C4320A
	for <buildroot@archiver.kernel.org>; Mon,  2 Aug 2021 15:49:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7168660F50
	for <buildroot@archiver.kernel.org>; Mon,  2 Aug 2021 15:49:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7168660F50
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=green-communications.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D14283AFD;
	Mon,  2 Aug 2021 15:49:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vZ18fzTgKz64; Mon,  2 Aug 2021 15:49:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 36E3883A91;
	Mon,  2 Aug 2021 15:49:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3C3CC1BF4D5
 for <buildroot@lists.busybox.net>; Mon,  2 Aug 2021 15:48:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 37402400EF
 for <buildroot@lists.busybox.net>; Mon,  2 Aug 2021 15:48:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DMwxcDztNQ1h for <buildroot@lists.busybox.net>;
 Mon,  2 Aug 2021 15:48:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 85B73400A4
 for <buildroot@buildroot.org>; Mon,  2 Aug 2021 15:48:57 +0000 (UTC)
Received: from houde.tangerine ([141.98.255.145]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.184]) with ESMTPSA (Nemesis) id
 1Mt6x5-1mzfR63M6L-00tSBR; Mon, 02 Aug 2021 17:48:54 +0200
From: Thomas Claveirole <thomas.claveirole@green-communications.fr>
To: buildroot@buildroot.org
Date: Mon,  2 Aug 2021 17:48:12 +0200
Message-Id: <20210802154812.408921-1-thomas.claveirole@green-communications.fr>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:ZgHwQFqM6yrO4e1O6pYhtaH5VOMnKyaSFC1bUsQ9gZdtJX05AVb
 MQiX9x7Xkt9pw7PHcUnjoAchDcOlsEX2Yo8FfW56rH/TAD6N1jwG0yNLN6cM37korQBixsZ
 D2A+oXsb/94xLQJ5GZEAyvCaZTMKfOC+w2yOkvXkVAlPscZwyVYOEgecsqgQJNgLsDmkkFQ
 swTndHG0GnFqemA+dzgvA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:QGIwF4+m13U=:GCYtW21PJ9ROmCrysd7E5R
 fH/zjsx9MnJk1wtrwdIWWy4waKJIWbrh6vS6HczgTiE7UO1FN1KTYE6+ilzM+tiojwt/I0anw
 PkOa4riPMPBWUiaDc3yADApCzH6j1uGNgpLY0DIEPtmXoY71W9Hn1Ie6pto1qttMU6w6lr2S7
 M1hWcfHfk9GfmNdeXo43L1kTMKq6dmfX1LOUNtXG2J8F5u565o4LaM8WaYhMUqXIKJt9+HYbe
 xIr69iOozIFcRsW/C+vMoHhBjCOGCYwWJO+wnjnuGoD4W4PPulzHFWlAJSKxv4OKQu2tP+vP6
 GahH7Gy75JHRcoS6l7XRO70VxdhEBgQFgXn8aKLuRdgKoRfScq2nNpTxcwc1pQOjcRPMzLVqL
 f5dCRfw41vBWH+xcupzQ4zPxPu3aqL+b6m7Fj2ll9jq079RbXILhjluAzs+ZK/kMv/FpTvPRC
 EWsFgijxGJ/8vY6J2gswuXO8WoWFqg7Aw9E0HjPDV90MqWv1z1IF7Ij+1qo8557z/GVL8CZuD
 7Kk8J63bh8N8eV2yFcfH+e5W+TW7bEKzy5hVyYAqxOekNdcV1TsmF6ODlRIasw5nJ7lzjV1XV
 r0x52FYl3LX/VV6AcH6on7b6Q4ScZ7v97zwDikJMQEOHNXCmPCeEqbgOVb9hBAWDBRKEM8mX0
 XOm1NiJhhMGlmXHsjjIJds7mmv8YX2IwiCOLxeH8ih1rsPC3e9fLj5U+7z68Y2u4Yv6Xvz2Pr
 VN0Fr36h5kfQ5VEIE76Y6uDtyOYEvf1laADBXIZLbuaH2pdR+pmLEyO2+W2PcBTkyl3qQlBDW
 ifN6DBQncY8J5Vg4pyHSnwqPgeT5RAcYYYgL2NoITnSZwQkyhwaYWiNLraRC7u/E5BuXtXTwN
 PazsjcsvA5S4fWfvtBZMFnCUkRdTVLMv58MgRMrxQ=
Subject: [Buildroot] [PATCH 1/1] package/vuejs-router: new package
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Thomas Claveirole <thomas.claveirole@green-communications.fr>,
 Johan Oudinet <johan.oudinet@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Vue Router is the official router for Vue.js.

Signed-off-by: Thomas Claveirole <thomas.claveirole@green-communications.fr>
---
 DEVELOPERS                             |  1 +
 package/Config.in                      |  5 +++++
 package/vuejs-router/Config.in         |  6 ++++++
 package/vuejs-router/vuejs-router.hash |  3 +++
 package/vuejs-router/vuejs-router.mk   | 19 +++++++++++++++++++
 5 files changed, 34 insertions(+)
 create mode 100644 package/vuejs-router/Config.in
 create mode 100644 package/vuejs-router/vuejs-router.hash
 create mode 100644 package/vuejs-router/vuejs-router.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 1547ff123b..6d336c8661 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2591,6 +2591,7 @@ F:	package/x265/
 N:	Thomas Claveirole <thomas.claveirole@green-communications.fr>
 F:	package/fcgiwrap/
 F:	package/openlayers/
+F:	package/vuejs-router/
 
 N:	Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 F:	docs/manual/
diff --git a/package/Config.in b/package/Config.in
index 046c04e994..9612dc9ff2 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1639,6 +1639,11 @@ endif
 	source "package/openlayers/Config.in"
 	source "package/popperjs/Config.in"
 	source "package/vuejs/Config.in"
+if BR2_PACKAGE_VUEJS
+menu "External Vue.js plugins"
+	source "package/vuejs-router/Config.in"
+endmenu
+endif
 endmenu
 
 menu "JSON/XML"
diff --git a/package/vuejs-router/Config.in b/package/vuejs-router/Config.in
new file mode 100644
index 0000000000..ac79b3ea61
--- /dev/null
+++ b/package/vuejs-router/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_VUEJS_ROUTER
+	bool "vuejs-router"
+	help
+	  The official router for Vue.js.
+
+	  http://router.vuejs.org
diff --git a/package/vuejs-router/vuejs-router.hash b/package/vuejs-router/vuejs-router.hash
new file mode 100644
index 0000000000..62b16505ea
--- /dev/null
+++ b/package/vuejs-router/vuejs-router.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  d85cb70686cad36a087ad9586f1839c9997f707eb0065445fb1ea3d9218494f6  vue-router-4.0.10.tgz
+sha256  9c0015250f592a09d7787efc07152afcf661fff6bda2554359f6d00987828c02  LICENSE
diff --git a/package/vuejs-router/vuejs-router.mk b/package/vuejs-router/vuejs-router.mk
new file mode 100644
index 0000000000..60e751e1d1
--- /dev/null
+++ b/package/vuejs-router/vuejs-router.mk
@@ -0,0 +1,19 @@
+################################################################################
+#
+# vuejs-router
+#
+################################################################################
+
+VUEJS_ROUTER_VERSION = 4.0.10
+VUEJS_ROUTER_SOURCE = vue-router-$(VUEJS_ROUTER_VERSION).tgz
+VUEJS_ROUTER_SITE = https://registry.npmjs.org/vue-router/-
+VUEJS_ROUTER_LICENSE = MIT
+VUEJS_ROUTER_LICENSE_FILES = LICENSE
+
+# Install .prod.js as .js
+define VUEJS_ROUTER_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 644 -D $(@D)/dist/vue-router.global.prod.js \
+		$(TARGET_DIR)/var/www/vue-router.js
+endef
+
+$(eval $(generic-package))
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
