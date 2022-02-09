Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC1F8C433EF
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 16:56:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C2008149A;
	Wed,  9 Feb 2022 16:56:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QaOFZP6NzAPp; Wed,  9 Feb 2022 16:56:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E80A1813C8;
	Wed,  9 Feb 2022 16:56:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3E2A61BF47D
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 16:52:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E3BE9403CA
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 16:52:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JC5YAlALg5Hv for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 16:52:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2B9A8408E2
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 16:52:35 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 0705B40007;
 Wed,  9 Feb 2022 16:52:33 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1nHqCn-0001G5-Ld; Wed, 09 Feb 2022 17:52:33 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed,  9 Feb 2022 17:50:49 +0100
Message-Id: <20220209165213.4498-24-peter@korsgaard.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220209165213.4498-1-peter@korsgaard.com>
References: <20220209165213.4498-1-peter@korsgaard.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 023/107] package/libftdi1: drop python2 support
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
Cc: Daniel Sangue <daniel.sangue@sangue.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libftdi1/Config.in   | 2 +-
 package/libftdi1/libftdi1.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libftdi1/Config.in b/package/libftdi1/Config.in
index 2d32573563..ec91366115 100644
--- a/package/libftdi1/Config.in
+++ b/package/libftdi1/Config.in
@@ -24,7 +24,7 @@ comment "libftdipp1 needs a toolchain w/ C++, wchar"
 
 config BR2_PACKAGE_LIBFTDI1_PYTHON_BINDINGS
 	bool "python bindings"
-	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
+	depends on BR2_PACKAGE_PYTHON3
 	help
 	  Python bindings for libftdi
 
diff --git a/package/libftdi1/libftdi1.mk b/package/libftdi1/libftdi1.mk
index 6688694b47..d2e3f42e14 100644
--- a/package/libftdi1/libftdi1.mk
+++ b/package/libftdi1/libftdi1.mk
@@ -24,7 +24,7 @@ LIBFTDI1_CONF_OPTS += -DFTDIPP=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_LIBFTDI1_PYTHON_BINDINGS),y)
-LIBFTDI1_DEPENDENCIES += $(if $(BR2_PACKAGE_PYTHON),python,python3) host-swig
+LIBFTDI1_DEPENDENCIES += python3 host-swig
 LIBFTDI1_CONF_OPTS += -DPYTHON_BINDINGS=ON
 else
 LIBFTDI1_CONF_OPTS += -DPYTHON_BINDINGS=OFF
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
