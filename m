Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E52CC433F5
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 17:09:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 245A181498;
	Wed,  9 Feb 2022 17:09:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7X7b2sS7UqZl; Wed,  9 Feb 2022 17:09:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C50181CE7;
	Wed,  9 Feb 2022 17:09:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1B06E1BF27C
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 16:59:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0614F404F8
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 16:59:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rPPSC_E0HqqL for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 16:59:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1D6D3404F1
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 16:59:24 +0000 (UTC)
Received: from relay7-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::227])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id AC4D8C990C
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 16:52:30 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 4BB0820003;
 Wed,  9 Feb 2022 16:52:24 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1nHqCe-0001DZ-Bo; Wed, 09 Feb 2022 17:52:24 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed,  9 Feb 2022 17:50:31 +0100
Message-Id: <20220209165213.4498-6-peter@korsgaard.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220209165213.4498-1-peter@korsgaard.com>
References: <20220209165213.4498-1-peter@korsgaard.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 005/107] package/boost: drop python2 support
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/boost/Config.in |  2 +-
 package/boost/boost.mk  | 11 +++--------
 2 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index 2c458bf88a..33a5337096 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -296,7 +296,7 @@ config BR2_PACKAGE_BOOST_PROGRAM_OPTIONS
 
 config BR2_PACKAGE_BOOST_PYTHON
 	bool "boost-python"
-	depends on BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
+	depends on BR2_PACKAGE_PYTHON3
 	help
 	  The Boost Python Library is a framework for interfacing Python
 	  and C++. It allows you to quickly and seamlessly expose C++
diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index b6681b0ad3..032ba5c820 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -68,16 +68,11 @@ BOOST_DEPENDENCIES += bzip2 zlib
 endif
 
 ifeq ($(BR2_PACKAGE_BOOST_PYTHON),y)
-BOOST_FLAGS += --with-python-root=$(HOST_DIR)
-ifeq ($(BR2_PACKAGE_PYTHON3),y)
-BOOST_FLAGS += --with-python=$(HOST_DIR)/bin/python$(PYTHON3_VERSION_MAJOR)
+BOOST_FLAGS += \
+	--with-python-root=$(HOST_DIR) \
+	--with-python=$(HOST_DIR)/bin/python$(PYTHON3_VERSION_MAJOR)
 BOOST_TARGET_CXXFLAGS += -I$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR)
 BOOST_DEPENDENCIES += python3
-else
-BOOST_FLAGS += --with-python=$(HOST_DIR)/bin/python$(PYTHON_VERSION_MAJOR)
-BOOST_TARGET_CXXFLAGS += -I$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)
-BOOST_DEPENDENCIES += python
-endif
 endif
 
 HOST_BOOST_OPTS += --no-cmake-config toolset=gcc threading=multi \
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
