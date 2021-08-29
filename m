Return-Path: <SRS0=jfQC=N2=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43457C433EF
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 18:46:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11B9360E74
	for <buildroot@archiver.kernel.org>; Sat,  4 Sep 2021 18:46:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 11B9360E74
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DDD4840167;
	Sat,  4 Sep 2021 18:46:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JUgjaxrr5uw7; Sat,  4 Sep 2021 18:46:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 53BCD402C9;
	Sat,  4 Sep 2021 18:46:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 12FAD1BF5DD
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 18:26:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C13C24029C
 for <buildroot@lists.busybox.net>; Sat,  4 Sep 2021 18:25:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5C3ZsHmXjxkz for <buildroot@lists.busybox.net>;
 Sat,  4 Sep 2021 18:25:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DD7B3402BC
 for <buildroot@buildroot.org>; Sat,  4 Sep 2021 18:25:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id B368B8834C; Sat,  4 Sep 2021 18:23:56 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 29 Aug 2021 18:27:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c938698b4a9e537d3e43c692a5c2a3a15c5d8d37
X-Git-Newrev: 62b135af5e1e2ad9ea38e33125b40b3ed074cf57
X-Patchwork-Hint: ignore
Message-Id: <20210904182356.B368B8834C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/vuejs-router: new package
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=62b135af5e1e2ad9ea38e33125b40b3ed074cf57
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Vue Router is the official router for Vue.js.

Signed-off-by: Thomas Claveirole <thomas.claveirole@green-communications.fr>
[Arnout: use comment instead of submenu]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 DEVELOPERS                             |  1 +
 package/Config.in                      |  4 ++++
 package/vuejs-router/Config.in         |  6 ++++++
 package/vuejs-router/vuejs-router.hash |  3 +++
 package/vuejs-router/vuejs-router.mk   | 19 +++++++++++++++++++
 5 files changed, 33 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 31bcd27747..66c5a6703c 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2568,6 +2568,7 @@ F:	package/x265/
 N:	Thomas Claveirole <thomas.claveirole@green-communications.fr>
 F:	package/fcgiwrap/
 F:	package/openlayers/
+F:	package/vuejs-router/
 
 N:	Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 F:	docs/manual/
diff --git a/package/Config.in b/package/Config.in
index 2dc105defa..2dbe511de0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1639,6 +1639,10 @@ endif
 	source "package/openlayers/Config.in"
 	source "package/popperjs/Config.in"
 	source "package/vuejs/Config.in"
+if BR2_PACKAGE_VUEJS
+comment "External Vue.js plugins"
+	source "package/vuejs-router/Config.in"
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
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
