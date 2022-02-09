Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 321E1C433FE
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 17:04:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E1B564049B;
	Wed,  9 Feb 2022 17:04:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l2v7WjxMyBSQ; Wed,  9 Feb 2022 17:04:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ADDB5404DB;
	Wed,  9 Feb 2022 17:04:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AA6A11BF47D
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 16:53:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9674A60D5D
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 16:53:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X4F93ofWHHeK for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 16:53:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4400360BAF
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 16:53:10 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 87AAFC0006;
 Wed,  9 Feb 2022 16:53:08 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1nHqDM-0001Pw-3w; Wed, 09 Feb 2022 17:53:08 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed,  9 Feb 2022 17:51:56 +0100
Message-Id: <20220209165213.4498-91-peter@korsgaard.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220209165213.4498-1-peter@korsgaard.com>
References: <20220209165213.4498-1-peter@korsgaard.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 090/107] package/python-ipaddr: drop python2
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
 Config.in.legacy                         |  6 ++++++
 DEVELOPERS                               |  1 -
 package/Config.in                        |  1 -
 package/python-ipaddr/Config.in          |  9 ---------
 package/python-ipaddr/python-ipaddr.hash |  5 -----
 package/python-ipaddr/python-ipaddr.mk   | 14 --------------
 6 files changed, 6 insertions(+), 30 deletions(-)
 delete mode 100644 package/python-ipaddr/Config.in
 delete mode 100644 package/python-ipaddr/python-ipaddr.hash
 delete mode 100644 package/python-ipaddr/python-ipaddr.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 03ea14a512..c78fb20756 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2022.02"
 
+config BR2_PACKAGE_PYTHON_IPADDR
+	bool "python-ipaddr removed"
+	select BR2_LEGACY
+	help
+	  Package was removed together with python 2.7 support.
+
 config BR2_PACKAGE_PYTHON_ID3
 	bool "python-id3 removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 985f43b614..c74bb3ae38 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2248,7 +2248,6 @@ F:	package/python-docker-pycreds/
 F:	package/python-enum/
 F:	package/python-enum34/
 F:	package/python-functools32/
-F:	package/python-ipaddr/
 F:	package/python-pam/
 F:	package/python-psutil/
 F:	package/python-request-id/
diff --git a/package/Config.in b/package/Config.in
index 0ee1c8ddb4..611a8f6aa8 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1058,7 +1058,6 @@ menu "External python modules"
 	source "package/python-iniparse/Config.in"
 	source "package/python-intelhex/Config.in"
 	source "package/python-iowait/Config.in"
-	source "package/python-ipaddr/Config.in"
 	source "package/python-ipaddress/Config.in"
 	source "package/python-ipdb/Config.in"
 	source "package/python-iptables/Config.in"
diff --git a/package/python-ipaddr/Config.in b/package/python-ipaddr/Config.in
deleted file mode 100644
index 57279273f9..0000000000
--- a/package/python-ipaddr/Config.in
+++ /dev/null
@@ -1,9 +0,0 @@
-config BR2_PACKAGE_PYTHON_IPADDR
-	bool "python-ipaddr"
-	depends on BR2_PACKAGE_PYTHON # included since python3.3
-	help
-	  An IPv4/IPv6 manipulation library in Python. This library is
-	  used to create/poke/manipulate IPv4 and IPv6 addresses and
-	  prefixes.
-
-	  https://github.com/google/ipaddr-py
diff --git a/package/python-ipaddr/python-ipaddr.hash b/package/python-ipaddr/python-ipaddr.hash
deleted file mode 100644
index d9963a2933..0000000000
--- a/package/python-ipaddr/python-ipaddr.hash
+++ /dev/null
@@ -1,5 +0,0 @@
-# md5, sha256 from https://pypi.org/pypi/ipaddr/json
-md5	f88353e40dec06410acfa075b8209b27  ipaddr-2.2.0.tar.gz
-sha256	4092dfe667588d16aa12b59acb7c8a4024e5dcb23a681cd0b0b602373eca88d6  ipaddr-2.2.0.tar.gz
-# Locally computed sha256 checksums
-sha256	175b3b509d5c840db72ad8c22d22a690d15c67b317f34de8a8bb0a66059e8215  COPYING
diff --git a/package/python-ipaddr/python-ipaddr.mk b/package/python-ipaddr/python-ipaddr.mk
deleted file mode 100644
index 9a5d147533..0000000000
--- a/package/python-ipaddr/python-ipaddr.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# python-ipaddr
-#
-################################################################################
-
-PYTHON_IPADDR_VERSION = 2.2.0
-PYTHON_IPADDR_SOURCE = ipaddr-$(PYTHON_IPADDR_VERSION).tar.gz
-PYTHON_IPADDR_SITE = https://files.pythonhosted.org/packages/9d/a7/1b39a16cb90dfe491f57e1cab3103a15d4e8dd9a150872744f531b1106c1
-PYTHON_IPADDR_SETUP_TYPE = distutils
-PYTHON_IPADDR_LICENSE = Apache-2.0
-PYTHON_IPADDR_LICENSE_FILES = COPYING
-
-$(eval $(python-package))
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
