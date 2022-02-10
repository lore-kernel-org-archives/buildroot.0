Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8527BC433F5
	for <buildroot@archiver.kernel.org>; Thu, 10 Feb 2022 22:41:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2455160AB5;
	Thu, 10 Feb 2022 22:41:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h9x7RxPVAtdZ; Thu, 10 Feb 2022 22:41:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 54AF660B64;
	Thu, 10 Feb 2022 22:41:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id BA95E1BF2CA
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 22:40:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B7AF7607C9
 for <buildroot@lists.busybox.net>; Thu, 10 Feb 2022 22:40:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YVHFi7-JHRYQ for <buildroot@lists.busybox.net>;
 Thu, 10 Feb 2022 22:40:57 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9D6E6607BC
 for <buildroot@buildroot.org>; Thu, 10 Feb 2022 22:40:57 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 82D6D100005;
 Thu, 10 Feb 2022 22:40:53 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1nII7Q-00038T-Lg; Thu, 10 Feb 2022 23:40:52 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 10 Feb 2022 23:40:45 +0100
Message-Id: <20220210224047.11992-4-peter@korsgaard.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220210224047.11992-1-peter@korsgaard.com>
References: <20220210224047.11992-1-peter@korsgaard.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 4/5] package/python3-ply: drop host package
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
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Now that host-python2 is gone, the custom python3 variant can be dropped.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libcamera/libcamera.mk       |  2 +-
 package/python-ply/python-ply.mk     |  1 -
 package/python3-ply/python3-ply.hash |  1 -
 package/python3-ply/python3-ply.mk   | 16 ----------------
 4 files changed, 1 insertion(+), 19 deletions(-)
 delete mode 120000 package/python3-ply/python3-ply.hash
 delete mode 100644 package/python3-ply/python3-ply.mk

diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
index 534d8d2637..7cd4bfa758 100644
--- a/package/libcamera/libcamera.mk
+++ b/package/libcamera/libcamera.mk
@@ -11,7 +11,7 @@ LIBCAMERA_DEPENDENCIES = \
 	host-openssl \
 	host-pkgconf \
 	host-python-jinja2 \
-	host-python3-ply \
+	host-python-ply \
 	host-python-pyyaml \
 	gnutls
 LIBCAMERA_CONF_OPTS = \
diff --git a/package/python-ply/python-ply.mk b/package/python-ply/python-ply.mk
index 50a3e32bc2..5dc7964d5f 100644
--- a/package/python-ply/python-ply.mk
+++ b/package/python-ply/python-ply.mk
@@ -4,7 +4,6 @@
 #
 ################################################################################
 
-# Please keep in sync with package/python3-ply/python3-ply.mk
 PYTHON_PLY_VERSION = 3.11
 PYTHON_PLY_SOURCE = ply-$(PYTHON_PLY_VERSION).tar.gz
 PYTHON_PLY_SITE = https://files.pythonhosted.org/packages/e5/69/882ee5c9d017149285cab114ebeab373308ef0f874fcdac9beb90e0ac4da
diff --git a/package/python3-ply/python3-ply.hash b/package/python3-ply/python3-ply.hash
deleted file mode 120000
index 5e07165c93..0000000000
--- a/package/python3-ply/python3-ply.hash
+++ /dev/null
@@ -1 +0,0 @@
-../python-ply/python-ply.hash
\ No newline at end of file
diff --git a/package/python3-ply/python3-ply.mk b/package/python3-ply/python3-ply.mk
deleted file mode 100644
index 15f66a49db..0000000000
--- a/package/python3-ply/python3-ply.mk
+++ /dev/null
@@ -1,16 +0,0 @@
-################################################################################
-#
-# python3-ply
-#
-################################################################################
-
-PYTHON3_PLY_VERSION = 3.11
-PYTHON3_PLY_SOURCE = ply-$(PYTHON3_PLY_VERSION).tar.gz
-PYTHON3_PLY_SITE = https://files.pythonhosted.org/packages/e5/69/882ee5c9d017149285cab114ebeab373308ef0f874fcdac9beb90e0ac4da
-PYTHON3_PLY_SETUP_TYPE = setuptools
-PYTHON3_PLY_LICENSE = BSD-3-Clause
-PYTHON3_PLY_LICENSE_FILES = README.md
-
-HOST_PYTHON3_PLY_NEEDS_HOST_PYTHON = python3
-
-$(eval $(host-python-package))
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
