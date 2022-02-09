Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDD49C4332F
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 17:04:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 78F2F60AEC;
	Wed,  9 Feb 2022 17:04:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q90lLkySUxBf; Wed,  9 Feb 2022 17:04:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ADDF660E26;
	Wed,  9 Feb 2022 17:04:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B58D51BF47D
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 16:53:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9BD434049B
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 16:53:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AtHnO4n0A0YU for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 16:53:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0E524400D0
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 16:53:10 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id E937C20002;
 Wed,  9 Feb 2022 16:53:06 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1nHqDK-0001PZ-G6; Wed, 09 Feb 2022 17:53:06 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed,  9 Feb 2022 17:51:53 +0100
Message-Id: <20220209165213.4498-88-peter@korsgaard.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220209165213.4498-1-peter@korsgaard.com>
References: <20220209165213.4498-1-peter@korsgaard.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 087/107]
 package/python-backports-ssl-match-hostname: drop python2 specific package
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
 Config.in.legacy                                   |  6 ++++++
 DEVELOPERS                                         |  1 -
 package/Config.in                                  |  1 -
 .../python-backports-ssl-match-hostname/Config.in  |  7 -------
 .../python-backports-ssl-match-hostname.hash       |  5 -----
 .../python-backports-ssl-match-hostname.mk         | 14 --------------
 6 files changed, 6 insertions(+), 28 deletions(-)
 delete mode 100644 package/python-backports-ssl-match-hostname/Config.in
 delete mode 100644 package/python-backports-ssl-match-hostname/python-backports-ssl-match-hostname.hash
 delete mode 100644 package/python-backports-ssl-match-hostname/python-backports-ssl-match-hostname.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 89c095a388..10476a2adf 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2022.02"
 
+config BR2_PACKAGE_PYTHON_BACKPORTS_SSL_MATCH_HOSTNAME
+	bool "python-backports-ssl-match-hostname removed"
+	select BR2_LEGACY
+	help
+	  Package was removed together with python 2.7 support.
+
 config BR2_PACKAGE_PYTHON_BACKPORTS_SHUTIL_GET_TERMINAL_SIZE
 	bool "python-backports-shutil-get-terminal-size removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 2fd8d4d010..c94a7831fc 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2243,7 +2243,6 @@ F:	package/lzop/
 F:	package/memtool/
 F:	package/mosquitto/
 F:	package/python-alsaaudio/
-F:	package/python-backports-ssl-match-hostname/
 F:	package/python-cached-property/
 F:	package/python-docker/
 F:	package/python-dockerpty/
diff --git a/package/Config.in b/package/Config.in
index fbfc876d89..73f266504a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -941,7 +941,6 @@ menu "External python modules"
 	source "package/python-avro/Config.in"
 	source "package/python-babel/Config.in"
 	source "package/python-backcall/Config.in"
-	source "package/python-backports-ssl-match-hostname/Config.in"
 	source "package/python-bcrypt/Config.in"
 	source "package/python-beautifulsoup4/Config.in"
 	source "package/python-bidict/Config.in"
diff --git a/package/python-backports-ssl-match-hostname/Config.in b/package/python-backports-ssl-match-hostname/Config.in
deleted file mode 100644
index 8e55191a9e..0000000000
--- a/package/python-backports-ssl-match-hostname/Config.in
+++ /dev/null
@@ -1,7 +0,0 @@
-config BR2_PACKAGE_PYTHON_BACKPORTS_SSL_MATCH_HOSTNAME
-	bool "python-backports-ssl-match-hostname"
-	depends on BR2_PACKAGE_PYTHON
-	help
-	  The ssl.match_hostname() function from Python 3.5.
-
-	  http://bitbucket.org/brandon/backports.ssl_match_hostname
diff --git a/package/python-backports-ssl-match-hostname/python-backports-ssl-match-hostname.hash b/package/python-backports-ssl-match-hostname/python-backports-ssl-match-hostname.hash
deleted file mode 100644
index 145174cd5b..0000000000
--- a/package/python-backports-ssl-match-hostname/python-backports-ssl-match-hostname.hash
+++ /dev/null
@@ -1,5 +0,0 @@
-# md5, sha256 from https://pypi.org/pypi/backports.ssl_match_hostname/json
-md5	32d2f593af01a046bec3d2f5181a420a  backports.ssl_match_hostname-3.7.0.1.tar.gz
-sha256	bb82e60f9fbf4c080eabd957c39f0641f0fc247d9a16e31e26d594d8f42b9fd2  backports.ssl_match_hostname-3.7.0.1.tar.gz
-# Locally computed sha256 checksums
-sha256	bfc8a75a4b9aec224aa7973c0c9d7cc0134bdcbf8eefd008936b58554d66e97e  LICENSE.txt
diff --git a/package/python-backports-ssl-match-hostname/python-backports-ssl-match-hostname.mk b/package/python-backports-ssl-match-hostname/python-backports-ssl-match-hostname.mk
deleted file mode 100644
index 300961662d..0000000000
--- a/package/python-backports-ssl-match-hostname/python-backports-ssl-match-hostname.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# python-backports-ssl-match-hostname
-#
-################################################################################
-
-PYTHON_BACKPORTS_SSL_MATCH_HOSTNAME_VERSION = 3.7.0.1
-PYTHON_BACKPORTS_SSL_MATCH_HOSTNAME_SOURCE = backports.ssl_match_hostname-$(PYTHON_BACKPORTS_SSL_MATCH_HOSTNAME_VERSION).tar.gz
-PYTHON_BACKPORTS_SSL_MATCH_HOSTNAME_SITE = https://files.pythonhosted.org/packages/ff/2b/8265224812912bc5b7a607c44bf7b027554e1b9775e9ee0de8032e3de4b2
-PYTHON_BACKPORTS_SSL_MATCH_HOSTNAME_SETUP_TYPE = distutils
-PYTHON_BACKPORTS_SSL_MATCH_HOSTNAME_LICENSE = Python-2.0
-PYTHON_BACKPORTS_SSL_MATCH_HOSTNAME_LICENSE_FILES = LICENSE.txt
-
-$(eval $(python-package))
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
