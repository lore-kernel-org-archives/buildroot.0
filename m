Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 288A4E6FE47
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 19:59:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B8C8F81ED9;
	Fri,  6 Sep 2024 19:58:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gbBw0vuZ4KgC; Fri,  6 Sep 2024 19:58:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E522D84121
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E522D84121;
	Fri,  6 Sep 2024 19:58:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8B6331BF37F
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:58:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 795C34023C
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:58:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kf9zjq5FWFgB for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 19:58:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AAE1840151
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AAE1840151
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 19:58:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 97A6286EE4; Fri,  6 Sep 2024 19:58:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Aug 2024 23:58:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: efb917a17e66b425e2a0c5a0387d4b6ab35fe71d
X-Git-Newrev: d2f1985994da4dc95a67f1513e9f186324533bc5
X-Patchwork-Hint: ignore
Message-Id: <20240906195852.97A6286EE4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/simple-mail: enable for qt6
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d2f1985994da4dc95a67f1513e9f186324533bc5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/simple-mail/Config.in      | 5 +++--
 package/simple-mail/simple-mail.mk | 7 ++++++-
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/package/simple-mail/Config.in b/package/simple-mail/Config.in
index 681a8410db..fd82a224d3 100644
--- a/package/simple-mail/Config.in
+++ b/package/simple-mail/Config.in
@@ -1,7 +1,8 @@
 config BR2_PACKAGE_SIMPLE_MAIL
 	bool "simple-mail"
-	depends on BR2_PACKAGE_QT5
-	select BR2_PACKAGE_QT5BASE_NETWORK
+	depends on BR2_PACKAGE_QT5 || BR2_PACKAGE_QT6
+	select BR2_PACKAGE_QT5BASE_NETWORK if BR2_PACKAGE_QT5
+	select BR2_PACKAGE_QT6BASE_NETWORK if BR2_PACKAGE_QT6
 	select BR2_PACKAGE_OPENSSL
 	help
 	  An SMTP library written in C++ for Qt.
diff --git a/package/simple-mail/simple-mail.mk b/package/simple-mail/simple-mail.mk
index 94f2369816..82bea45f21 100644
--- a/package/simple-mail/simple-mail.mk
+++ b/package/simple-mail/simple-mail.mk
@@ -9,7 +9,12 @@ SIMPLE_MAIL_SITE = $(call github,cutelyst,simple-mail,v$(SIMPLE_MAIL_VERSION))
 SIMPLE_MAIL_INSTALL_STAGING = YES
 SIMPLE_MAIL_LICENSE = LGPL-2.1+
 SIMPLE_MAIL_LICENSE_FILES = LICENSE
-SIMPLE_MAIL_DEPENDENCIES = qt5base
 SIMPLE_MAIL_CONF_OPTS = -DBUILD_DEMOS=OFF
+ifeq ($(BR2_PACKAGE_QT5BASE),y)
+SIMPLE_MAIL_DEPENDENCIES += qt5base
+else ifeq ($(BR2_PACKAGE_QT6BASE),y)
+SIMPLE_MAIL_DEPENDENCIES += qt6base
+SIMPLE_MAIL_CONF_OPTS += -DQT_VERSION_MAJOR=6
+endif
 
 $(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
