Return-Path: <SRS0=n+Pr=OD=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC238C433EF
	for <buildroot@archiver.kernel.org>; Mon, 13 Sep 2021 13:44:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A66A261AFE
	for <buildroot@archiver.kernel.org>; Mon, 13 Sep 2021 13:44:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A66A261AFE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 80AAA80EA0;
	Mon, 13 Sep 2021 13:44:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1v1oU4RvpIkp; Mon, 13 Sep 2021 13:44:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B7E9880E80;
	Mon, 13 Sep 2021 13:44:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3654E1BF378
 for <buildroot@lists.busybox.net>; Mon, 13 Sep 2021 13:43:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 169DA4036D
 for <buildroot@lists.busybox.net>; Mon, 13 Sep 2021 13:43:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HUQCZPyJj9M5 for <buildroot@lists.busybox.net>;
 Mon, 13 Sep 2021 13:43:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A2E0A4036C
 for <buildroot@buildroot.org>; Mon, 13 Sep 2021 13:43:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id E7F828A4D8; Mon, 13 Sep 2021 13:41:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 13 Sep 2021 15:25:49 +0200
X-Git-Refname: refs/heads/2021.08.x
X-Git-Oldrev: 5e1e7e0cfe203c3668e357019d11a698bf18ab79
X-Git-Newrev: 2fb201cbec258683518fbfb3bd2cf649ae6e8f14
X-Patchwork-Hint: ignore
Message-Id: <20210913134134.E7F828A4D8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.08.x] package/swupdate: add
 webserver config option
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

commit: https://git.buildroot.net/buildroot/commit/?id=2fb201cbec258683518fbfb3bd2cf649ae6e8f14
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.08.x

Since the website depends on the webserver being enabled we should
add a config option for it and make the website depend on that.

We should also ensure that the mongoose(webserver) config is present.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 25b0645aa4f6a6457942b50161e7e0c05b4222d3)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/swupdate/10-mongoose-args |  1 +
 package/swupdate/Config.in        |  7 +++++++
 package/swupdate/swupdate.mk      | 14 ++++++++++++++
 3 files changed, 22 insertions(+)

diff --git a/package/swupdate/10-mongoose-args b/package/swupdate/10-mongoose-args
new file mode 100644
index 0000000000..d0b0f8be94
--- /dev/null
+++ b/package/swupdate/10-mongoose-args
@@ -0,0 +1 @@
+SWUPDATE_WEBSERVER_ARGS="-r /var/www/swupdate ${SWUPDATE_MONGOOSE_EXTRA_ARGS:--p 8080}"
diff --git a/package/swupdate/Config.in b/package/swupdate/Config.in
index f601e45fcd..6b832cfcbf 100644
--- a/package/swupdate/Config.in
+++ b/package/swupdate/Config.in
@@ -60,9 +60,16 @@ config BR2_PACKAGE_SWUPDATE_CONFIG
 	  I you wish to use your own modified swupdate configuration
 	  file specify the config file location with this option.
 
+config BR2_PACKAGE_SWUPDATE_WEBSERVER
+	bool "swupdate webserver"
+	default y
+	help
+	  Enable update from remote using a web server on the target.
+
 config BR2_PACKAGE_SWUPDATE_INSTALL_WEBSITE
 	bool "install default website"
 	default y
+	depends on BR2_PACKAGE_SWUPDATE_WEBSERVER
 	help
 	  Install the provided website to /var/www/swupdate.
 
diff --git a/package/swupdate/swupdate.mk b/package/swupdate/swupdate.mk
index 256f0930ce..cf3607a661 100644
--- a/package/swupdate/swupdate.mk
+++ b/package/swupdate/swupdate.mk
@@ -187,6 +187,16 @@ ifeq ($(BR2_PACKAGE_LIBRSYNC),y)
 SWUPDATE_DEPENDENCIES += librsync
 endif
 
+ifeq ($(BR2_PACKAGE_SWUPDATE_WEBSERVER),y)
+define SWUPDATE_SET_WEBSERVER
+	$(call KCONFIG_ENABLE_OPT,CONFIG_WEBSERVER)
+endef
+else
+define SWUPDATE_SET_WEBSERVER
+	$(call KCONFIG_DISABLE_OPT,CONFIG_WEBSERVER)
+endef
+endif
+
 SWUPDATE_BUILD_CONFIG = $(@D)/.config
 
 SWUPDATE_KCONFIG_FILE = $(call qstrip,$(BR2_PACKAGE_SWUPDATE_CONFIG))
@@ -200,6 +210,7 @@ SWUPDATE_MAKE_OPTS = \
 define SWUPDATE_KCONFIG_FIXUP_CMDS
 	$(SWUPDATE_SET_LUA_VERSION)
 	$(SWUPDATE_SET_SYSTEMD)
+	$(SWUPDATE_SET_WEBSERVER)
 endef
 
 define SWUPDATE_BUILD_CMDS
@@ -229,6 +240,9 @@ define SWUPDATE_INSTALL_COMMON
 		$(TARGET_DIR)/usr/lib/swupdate/conf.d
 	$(INSTALL) -D -m 755 package/swupdate/swupdate.sh \
 		$(TARGET_DIR)/usr/lib/swupdate/swupdate.sh
+	$(if $(BR2_PACKAGE_SWUPDATE_WEBSERVER), \
+		$(INSTALL) -D -m 644 package/swupdate/10-mongoose-args \
+			$(TARGET_DIR)/usr/lib/swupdate/conf.d/10-mongoose-args)
 endef
 define SWUPDATE_INSTALL_INIT_SYSTEMD
 	$(SWUPDATE_INSTALL_COMMON)
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
