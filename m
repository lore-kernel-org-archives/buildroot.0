Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ECBFC433F5
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 16:53:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DDC3A812D0;
	Wed,  9 Feb 2022 16:53:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xKECXhbsFP9A; Wed,  9 Feb 2022 16:53:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2301381258;
	Wed,  9 Feb 2022 16:53:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0E1E31BF9BA
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 16:52:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EF2984099F
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 16:52:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cBRj7l6tPqDx for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 16:52:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0943340904
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 16:52:30 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id EFBF81C0008;
 Wed,  9 Feb 2022 16:52:28 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1nHqCi-0001Ej-IA; Wed, 09 Feb 2022 17:52:28 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed,  9 Feb 2022 17:50:39 +0100
Message-Id: <20220209165213.4498-14-peter@korsgaard.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220209165213.4498-1-peter@korsgaard.com>
References: <20220209165213.4498-1-peter@korsgaard.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 013/107] package/fail2ban: drop python2 support
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/fail2ban/Config.in   | 2 +-
 package/fail2ban/fail2ban.mk | 7 ++-----
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/package/fail2ban/Config.in b/package/fail2ban/Config.in
index 86e6233793..8a48a8c1d0 100644
--- a/package/fail2ban/Config.in
+++ b/package/fail2ban/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_FAIL2BAN
 	bool "fail2ban"
-	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
+	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_SYSTEMD if BR2_PACKAGE_SYSTEMD
 	help
 	  Fail2ban scans log files (e.g. /var/log/apache/error_log) and
diff --git a/package/fail2ban/fail2ban.mk b/package/fail2ban/fail2ban.mk
index 9202dc1ddd..4a08981a97 100644
--- a/package/fail2ban/fail2ban.mk
+++ b/package/fail2ban/fail2ban.mk
@@ -15,15 +15,13 @@ FAIL2BAN_SETUP_TYPE = distutils
 # 0001-fixed-possible-RCE-vulnerability-unset-escape-variable.patch
 FAIL2BAN_IGNORE_CVES += CVE-2021-32749
 
-ifeq ($(BR2_PACKAGE_PYTHON3),y)
 define FAIL2BAN_PYTHON_2TO3
 	$(HOST_DIR)/bin/2to3 --write --nobackups --no-diffs $(@D)/bin/* $(@D)/fail2ban
 endef
-FAIL2BAN_DEPENDENCIES += host-python3
+FAIL2BAN_DEPENDENCIES = host-python3
 # We can't use _POST_PATCH_HOOKS because dependencies are not guaranteed
 # to build and install before _POST_PATCH_HOOKS run.
 FAIL2BAN_PRE_CONFIGURE_HOOKS += FAIL2BAN_PYTHON_2TO3
-endif
 
 define FAIL2BAN_FIX_DEFAULT_CONFIG
 	$(SED) '/^socket/c\socket = /run/fail2ban.sock' $(TARGET_DIR)/etc/fail2ban/fail2ban.conf
@@ -34,8 +32,7 @@ FAIL2BAN_POST_INSTALL_TARGET_HOOKS += FAIL2BAN_FIX_DEFAULT_CONFIG
 
 # fail2ban-python points to host python
 define FAIL2BAN_FIX_FAIL2BAN_PYTHON_SYMLINK
-	ln -snf $(if $(BR2_PACKAGE_PYTHON),python,python3) \
-		$(TARGET_DIR)/usr/bin/fail2ban-python
+	ln -snf python3	$(TARGET_DIR)/usr/bin/fail2ban-python
 endef
 FAIL2BAN_POST_INSTALL_TARGET_HOOKS += FAIL2BAN_FIX_FAIL2BAN_PYTHON_SYMLINK
 
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
