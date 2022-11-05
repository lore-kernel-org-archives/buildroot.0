Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C4C2C4321E
	for <buildroot@archiver.kernel.org>; Mon,  5 Dec 2022 12:04:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9BF224026C;
	Mon,  5 Dec 2022 12:04:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9BF224026C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mEziF5Qw4cYI; Mon,  5 Dec 2022 12:04:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E59240330;
	Mon,  5 Dec 2022 12:04:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E59240330
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 630151BF352
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:27:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DBD75405BA
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:26:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DBD75405BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EKsjftfttj1b for <buildroot@lists.busybox.net>;
 Mon,  5 Dec 2022 11:26:07 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 804B440607
 for <buildroot@buildroot.org>; Mon,  5 Dec 2022 11:26:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 804B440607
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7AA4C85B9E; Mon,  5 Dec 2022 11:26:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 5 Nov 2022 23:08:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dbd5a684e00e01ceab95b9db00d2915a4d75a1a8
X-Git-Newrev: 133a37d810a66f22e793efe2654645c743902ed0
X-Patchwork-Hint: ignore
Message-Id: <20221205112607.7AA4C85B9E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-zeroconf: bump to version
 0.39.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=133a37d810a66f22e793efe2654645c743902ed0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add new async timeout runtime dependency.

Verified license is still LGPL-2.1+ after hash changed.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-zeroconf/Config.in            | 1 +
 package/python-zeroconf/python-zeroconf.hash | 6 +++---
 package/python-zeroconf/python-zeroconf.mk   | 4 ++--
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-zeroconf/Config.in b/package/python-zeroconf/Config.in
index 1570674f59..69ea81d93a 100644
--- a/package/python-zeroconf/Config.in
+++ b/package/python-zeroconf/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_ZEROCONF
 	bool "python-zeroconf"
+	select BR2_PACKAGE_PYTHON_ASYNC_TIMEOUT # runtime
 	select BR2_PACKAGE_PYTHON_IFADDR # runtime
 	help
 	  Pure Python Multicast DNS Service Discovery Library
diff --git a/package/python-zeroconf/python-zeroconf.hash b/package/python-zeroconf/python-zeroconf.hash
index be91b59048..13e1d16cde 100644
--- a/package/python-zeroconf/python-zeroconf.hash
+++ b/package/python-zeroconf/python-zeroconf.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/zeroconf/json
-md5  98e683a247fe9915a5d4845c38b37ff3  zeroconf-0.29.0.tar.gz
-sha256  7aefbb658b452b1fd7e51124364f938c6f5e42d6ea893fa2557bea8c06c540af  zeroconf-0.29.0.tar.gz
+md5  f85fb9d239397b53836495fd49b85e5f  zeroconf-0.39.4.tar.gz
+sha256  701e4d697f89fe952aa9c13a512ed6bf472dcf4f0a6d275e71085604b3882295  zeroconf-0.39.4.tar.gz
 # Locally computed sha256 checksums
-sha256  bb117c0fbd7f57f64170b690285d7df07c2371b578e3b3cd3aa2e1155ef461a0  COPYING
+sha256  35e4136e96aace60757a8b939741959d8627c4bc1fce62af99df325395276c56  COPYING
diff --git a/package/python-zeroconf/python-zeroconf.mk b/package/python-zeroconf/python-zeroconf.mk
index 67bfa72e03..d939b2e5ae 100644
--- a/package/python-zeroconf/python-zeroconf.mk
+++ b/package/python-zeroconf/python-zeroconf.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ZEROCONF_VERSION = 0.29.0
+PYTHON_ZEROCONF_VERSION = 0.39.4
 PYTHON_ZEROCONF_SOURCE = zeroconf-$(PYTHON_ZEROCONF_VERSION).tar.gz
-PYTHON_ZEROCONF_SITE = https://files.pythonhosted.org/packages/ca/77/eb6137997adc60811c6c46b28b00abac5c16daf14383f61d8a0180326b38
+PYTHON_ZEROCONF_SITE = https://files.pythonhosted.org/packages/f5/4f/c47cea73d7ae5467b63de3999d7207fd5b14d70cb2f35ce81c4ab7d7a52e
 PYTHON_ZEROCONF_SETUP_TYPE = setuptools
 PYTHON_ZEROCONF_LICENSE = LGPL-2.1+
 PYTHON_ZEROCONF_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
