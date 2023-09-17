Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 695F1CD37B4
	for <buildroot@archiver.kernel.org>; Sun, 17 Sep 2023 20:25:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0735C4048E;
	Sun, 17 Sep 2023 20:25:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0735C4048E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fjXk18IDI-Os; Sun, 17 Sep 2023 20:25:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EE8F440901;
	Sun, 17 Sep 2023 20:25:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE8F440901
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B01EF1BF399
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 20:25:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9602B4054E
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 20:25:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9602B4054E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id l36HZFPqyxkK for <buildroot@lists.busybox.net>;
 Sun, 17 Sep 2023 20:25:44 +0000 (UTC)
Received: from smtpcmd13147.aruba.it (smtpcmd13147.aruba.it [62.149.156.147])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BDBF14048E
 for <buildroot@buildroot.org>; Sun, 17 Sep 2023 20:25:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BDBF14048E
Received: from localhost.localdomain ([146.241.100.148])
 by Aruba Outgoing Smtp  with ESMTPSA
 id hyKqqTsVzvDh7hyKqqmWlw; Sun, 17 Sep 2023 22:25:41 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun, 17 Sep 2023 22:25:39 +0200
Message-Id: <20230917202539.365838-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfPBu/SETUmFaKfBjVTOPtDLi5q8llfkakCLcglFASCG4AjVcfCPW6uh6NbapruHRhViL/R47l7lvD/YodAYMJkjcavT6q/0JPx9S2fR0BdYzi29+I6Wm
 Tns23nZSM3lDKLRJ3pj8VxiCX9UMpjO89/zhr0+RLuDcpWYoGCrFtKEW2wIJN+6twVT95ZNE1StUcGt5bnlX8wNK/yVibkNk3aIuVhcuFVBoOuyFAgOtkwBi
 iDKsOJRLb3/gnS075CY2s6BGZ5IfZAkn9Mfy3TnfbtI5f6anrs+B7U3etkTzj2/QtaOa7xE3Xy6qyhsIuJaa9fit11NDt0bam5Zf7q2fQyafsafYf9mTCJcR
 MckbufE9ZPRAFWZ1ZJ6tBDmRyRxaUoU0fEqUeJ3Yx451TJa7FdI+idR3FsZKeZDfE7AXy4WIrqMVPMLueyGLLn/RhmFB1EKcEqCwG3tIMHpdkOThaROyEX9d
 H3w12kjW1/F2yb52
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1694982341; bh=8Oa6tcjf4LG4JLYfBw/ha/ZCEqSRzW7WSHjeG/lRWoE=;
 h=From:To:Subject:Date:MIME-Version;
 b=Mlj7/Wiuf8/ZUPOJl2INYw2xc5TnjTmVJ3yL321PSmxla1uH4iNG5pMuKNrg2nld6
 WzJnsFvr7qtVpFeTC2O5Hsz+uC85tKVGDVpq04Oc4MyoCebMT7CQ8XXiBJ93LCxrEf
 RejGA5wjv8uTwX9+GHe8E/AFXcRic4+ULewWgKdVTdhOvi5N+yC7Y5nVsdaGbZvp4U
 zj1q6Xbj7RHBs+PO9RCEbYIsl+ZrBLlyOWW87UxMopn8FBULUH6EDf2xPtAJSvCNOn
 VLa997Gh9pWbZ2RUOy4CkEtelpkrhj7RHr+Q7MXynioF0hdRmsjOdnhezSMcR+p205
 e/e2690p3Trew==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=Mlj7/Wiu
Subject: [Buildroot] [PATCH] package/apache: add option to only build apache
 utils
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
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Giulio Benetti <giulio.benetti+tekvox@benettiengineering.com>,
 James Autry <jautry@tekvox.com>, Matthew Maron <matthewm@tekvox.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Jim Reinhart <jimr@tekvox.com>, "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Giulio Benetti <giulio.benetti+tekvox@benettiengineering.com>

With option BR2_PACKAGE_APACHE_UTILS_ONLY only htdigest and htpasswd are
built and installed. This is useful for Mongoose credential handling.

Cc: Jim Reinhart <jimr@tekvox.com>
Cc: James Autry <jautry@tekvox.com>
Cc: Matthew Maron <matthewm@tekvox.com>
Signed-off-by: Giulio Benetti <giulio.benetti+tekvox@benettiengineering.com>
---
 package/apache/Config.in |  7 +++++++
 package/apache/apache.mk | 23 +++++++++++++++++++++--
 2 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/package/apache/Config.in b/package/apache/Config.in
index 270296bce4..aad35fb5da 100644
--- a/package/apache/Config.in
+++ b/package/apache/Config.in
@@ -17,6 +17,12 @@ config BR2_PACKAGE_APACHE
 
 if BR2_PACKAGE_APACHE
 
+config BR2_PACKAGE_APACHE_UTILS_ONLY
+	bool "apache-utils-only"
+	help
+	  Provide only Apache utils like htdigest and htpasswd.
+
+if !BR2_PACKAGE_APACHE_UTILS_ONLY
 choice
 	prompt "Multi-Processing Module (MPM)"
 	default BR2_PACKAGE_APACHE_MPM_WORKER
@@ -40,6 +46,7 @@ config BR2_PACKAGE_APACHE_MPM_WORKER
 	  Implements a hybrid multi-threaded multi-process web server
 
 endchoice
+endif
 
 endif
 
diff --git a/package/apache/apache.mk b/package/apache/apache.mk
index 320a6ad20e..49edab838a 100644
--- a/package/apache/apache.mk
+++ b/package/apache/apache.mk
@@ -12,8 +12,6 @@ APACHE_LICENSE_FILES = LICENSE
 APACHE_CPE_ID_VENDOR = apache
 APACHE_CPE_ID_PRODUCT = http_server
 APACHE_SELINUX_MODULES = apache
-# Needed for mod_php
-APACHE_INSTALL_STAGING = YES
 # We have a patch touching configure.in and Makefile.in,
 # so we need to autoreconf:
 APACHE_AUTORECONF = YES
@@ -31,6 +29,26 @@ else ifeq ($(BR2_PACKAGE_APACHE_MPM_WORKER),y)
 APACHE_MPM = worker
 endif
 
+ifeq ($(BR2_PACKAGE_APACHE_UTILS_ONLY),y)
+APACHE_CONF_OPTS = \
+	--with-apr=$(STAGING_DIR)/usr \
+	--with-apr-util=$(STAGING_DIR)/usr \
+	--with-pcre=$(STAGING_DIR)/usr/bin/pcre2-config \
+	--with-static-htdigest \
+	--with-static-htpasswd
+
+define APACHE_BUILD_CMDS
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/support htdigest htpasswd
+endef
+
+define APACHE_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0755 -D $(@D)/support/htdigest $(TARGET_DIR)/usr/bin/htdigest
+	$(INSTALL) -m 0755 -D $(@D)/support/htpasswd $(TARGET_DIR)/usr/bin/htpasswd
+endef
+else
+# Needed for mod_php
+APACHE_INSTALL_STAGING = YES
+
 APACHE_CONF_OPTS = \
 	--sysconfdir=/etc/apache2 \
 	--with-apr=$(STAGING_DIR)/usr \
@@ -121,5 +139,6 @@ define APACHE_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 644 package/apache/apache.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/apache.service
 endef
+endif
 
 $(eval $(autotools-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
