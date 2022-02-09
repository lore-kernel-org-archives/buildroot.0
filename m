Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63A95C433EF
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 17:09:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 188B4404EE;
	Wed,  9 Feb 2022 17:09:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SUlEG3MUNphA; Wed,  9 Feb 2022 17:09:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1D31240146;
	Wed,  9 Feb 2022 17:09:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AC9C71BF27C
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 16:59:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A91DD401BD
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 16:59:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j-DZ3sFSM3Ya for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 16:59:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EDF604018C
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 16:59:26 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (unknown [217.70.183.198])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 0735ED1B44
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 16:52:39 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 24B29C0004;
 Wed,  9 Feb 2022 16:52:34 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1nHqCo-0001GP-MZ; Wed, 09 Feb 2022 17:52:34 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed,  9 Feb 2022 17:50:51 +0100
Message-Id: <20220209165213.4498-26-peter@korsgaard.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220209165213.4498-1-peter@korsgaard.com>
References: <20220209165213.4498-1-peter@korsgaard.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 025/107] package/libpwquality: drop python2
 support
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
Cc: =?UTF-8?q?Stefan=20S=C3=B8rensen?= <stefan.sorensen@spectralink.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libpwquality/libpwquality.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libpwquality/libpwquality.mk b/package/libpwquality/libpwquality.mk
index 54a03be453..d4f7a47120 100644
--- a/package/libpwquality/libpwquality.mk
+++ b/package/libpwquality/libpwquality.mk
@@ -12,9 +12,9 @@ LIBPWQUALITY_INSTALL_STAGING = YES
 LIBPWQUALITY_DEPENDENCIES = cracklib
 LIBPWQUALITY_LICENSE_FILES = COPYING
 
-ifeq ($(BR2_PACKAGE_PYTHON)$(BR2_PACKAGE_PYTHON3),y)
+ifeq ($(BR2_PACKAGE_PYTHON3),y)
 LIBPWQUALITY_CONF_OPTS += --enable-python-bindings
-LIBPWQUALITY_DEPENDENCIES += $(if $(BR2_PACKAGE_PYTHON3),python3,python)
+LIBPWQUALITY_DEPENDENCIES += python3
 LIBPWQUALITY_MAKE_ENV += $(PKG_PYTHON_DISTUTILS_ENV)
 else
 LIBPWQUALITY_CONF_OPTS += --disable-python-bindings
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
