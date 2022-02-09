Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30CE5C433F5
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 21:54:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E776841606;
	Wed,  9 Feb 2022 21:54:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wuK96hPiTvsg; Wed,  9 Feb 2022 21:54:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1DAA5415FA;
	Wed,  9 Feb 2022 21:54:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 628F01BF2F0
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 21:34:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 655D560E6E
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 21:33:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bUNvHDJp1aou for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 21:33:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8B59D60FF5
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 21:33:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 8FD8581335; Wed,  9 Feb 2022 21:26:02 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 9 Feb 2022 22:13:31 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6ad80649c769e0ebc7f30392da493e26d00d9299
X-Git-Newrev: da9233cee3c93a7e903794008f35e87839aed746
X-Patchwork-Hint: ignore
Message-Id: <20220209212602.8FD8581335@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-ipaddr: drop python2
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=da9233cee3c93a7e903794008f35e87839aed746
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Config.in.legacy                         |  6 ++++++
 DEVELOPERS                               |  1 -
 package/Config.in                        |  1 -
 package/python-ipaddr/Config.in          |  9 ---------
 package/python-ipaddr/python-ipaddr.hash |  5 -----
 package/python-ipaddr/python-ipaddr.mk   | 14 --------------
 6 files changed, 6 insertions(+), 30 deletions(-)

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
index 371a0aab9a..dbed9df4b5 100644
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
