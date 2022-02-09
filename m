Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF2B7C433F5
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 17:04:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 750AB400EA;
	Wed,  9 Feb 2022 17:04:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XedlCzzzPjgb; Wed,  9 Feb 2022 17:04:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 93CA9401CD;
	Wed,  9 Feb 2022 17:04:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7CC3E1BF47D
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 16:53:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 783BB400D0
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 16:53:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tOVP41Xo4o1s for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 16:53:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 070DC40146
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 16:53:08 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6612A1BF205;
 Wed,  9 Feb 2022 16:53:07 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1nHqDL-0001Pg-0g; Wed, 09 Feb 2022 17:53:07 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed,  9 Feb 2022 17:51:54 +0100
Message-Id: <20220209165213.4498-89-peter@korsgaard.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220209165213.4498-1-peter@korsgaard.com>
References: <20220209165213.4498-1-peter@korsgaard.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 088/107] package/python-futures: drop python2
 specific package
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
 Config.in.legacy                           |  6 ++++++
 DEVELOPERS                                 |  1 -
 package/Config.in                          |  1 -
 package/python-futures/Config.in           |  7 -------
 package/python-futures/python-futures.hash |  5 -----
 package/python-futures/python-futures.mk   | 14 --------------
 6 files changed, 6 insertions(+), 28 deletions(-)
 delete mode 100644 package/python-futures/Config.in
 delete mode 100644 package/python-futures/python-futures.hash
 delete mode 100644 package/python-futures/python-futures.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 10476a2adf..7e85e4cf63 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2022.02"
 
+config BR2_PACKAGE_PYTHON_FUTURES
+	bool "python-futures removed"
+	select BR2_LEGACY
+	help
+	  Package was removed together with python 2.7 support.
+
 config BR2_PACKAGE_PYTHON_BACKPORTS_SSL_MATCH_HOSTNAME
 	bool "python-backports-ssl-match-hostname removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index c94a7831fc..d2ed22dac0 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -436,7 +436,6 @@ F:	package/pulseaudio/
 F:	package/pure-ftpd/
 F:	package/python-couchdb/
 F:	package/python-cssutils/
-F:	package/python-futures/
 F:	package/python-mwclient/
 F:	package/python-mwscrape/
 F:	package/python-mwscrape2slob/
diff --git a/package/Config.in b/package/Config.in
index 73f266504a..b18d298a1b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1032,7 +1032,6 @@ menu "External python modules"
 	source "package/python-frozenlist/Config.in"
 	source "package/python-functools32/Config.in"
 	source "package/python-future/Config.in"
-	source "package/python-futures/Config.in"
 	source "package/python-git/Config.in"
 	source "package/python-gitdb2/Config.in"
 	source "package/python-gnupg/Config.in"
diff --git a/package/python-futures/Config.in b/package/python-futures/Config.in
deleted file mode 100644
index 2eb40e93bd..0000000000
--- a/package/python-futures/Config.in
+++ /dev/null
@@ -1,7 +0,0 @@
-config BR2_PACKAGE_PYTHON_FUTURES
-	bool "python-futures"
-	depends on BR2_PACKAGE_PYTHON # not needed for python3
-	help
-	  Backport of the concurrent.futures package from Python 3.2.
-
-	  https://github.com/agronholm/pythonfutures
diff --git a/package/python-futures/python-futures.hash b/package/python-futures/python-futures.hash
deleted file mode 100644
index a4fbdf4fe9..0000000000
--- a/package/python-futures/python-futures.hash
+++ /dev/null
@@ -1,5 +0,0 @@
-# md5, sha256 from https://pypi.org/pypi/futures/json
-md5	b43a39ae1475e3fd6940f2b4f7214675  futures-3.3.0.tar.gz
-sha256	7e033af76a5e35f58e56da7a91e687706faf4e7bdfb2cbc3f2cca6b9bcda9794  futures-3.3.0.tar.gz
-# Locally computed sha256 checksums
-sha256	a698bd5d441e4a16af6c992b8e80cbfa12755d72d910854fa1fb11d4deb0059a  LICENSE
diff --git a/package/python-futures/python-futures.mk b/package/python-futures/python-futures.mk
deleted file mode 100644
index 0666948115..0000000000
--- a/package/python-futures/python-futures.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# python-futures
-#
-################################################################################
-
-PYTHON_FUTURES_VERSION = 3.3.0
-PYTHON_FUTURES_SOURCE = futures-$(PYTHON_FUTURES_VERSION).tar.gz
-PYTHON_FUTURES_SITE = https://files.pythonhosted.org/packages/47/04/5fc6c74ad114032cd2c544c575bffc17582295e9cd6a851d6026ab4b2c00
-PYTHON_FUTURES_SETUP_TYPE = setuptools
-PYTHON_FUTURES_LICENSE = BSD-2-Clause
-PYTHON_FUTURES_LICENSE_FILES = LICENSE
-
-$(eval $(python-package))
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
