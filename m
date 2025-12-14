Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5631CD59D99
	for <buildroot@archiver.kernel.org>; Sun, 14 Dec 2025 21:21:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 141B160DF0;
	Sun, 14 Dec 2025 21:21:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hyJ6uPYPkFIt; Sun, 14 Dec 2025 21:21:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2705C60DED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765747313;
	bh=2PO8lJsPGep6BUpobI7X4lMMR97/chZzaEtFV4lf8UE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pCT3ZsCSxqhMqWkozoWdQk/iPziuwEUWr/NgVIvrsKjpjIpT1lMTvZZmQRRHEohxq
	 C7MwHP35dNypM5zx6Cl4nIAdS3Lpvp6aq+RwMUk3dDZ4vIgj/HM4m9MSXIhEGbw/lz
	 f3BwDYtWL55ApesykUUX4ys8T/yGRj9cXg0oecuXoBbAOxIIvmdvi/2c0fF8lghmhh
	 ytNugnWSV74Og6Q/6ip+9SjzuDRAB+wERIXPS/7WPCQevJ/TMVVUWDDNX6QCo4ky/h
	 nKkadjc+G5Cpxvyx5hKklWhH08tn1rcEN6CI4sfOiDjuPV1udChTa1Du7CMuCVYoUo
	 3y4ebcEAcwi1A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2705C60DED;
	Sun, 14 Dec 2025 21:21:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 048FC117
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 21:21:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7CA4A60793
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 21:21:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H0pt66Ip2S2s for <buildroot@buildroot.org>;
 Sun, 14 Dec 2025 21:21:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE3A060877
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id AE3A060877
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 21:21:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AD52E8355B; Sun, 14 Dec 2025 21:21:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 14 Dec 2025 22:20:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e0bb91fd64135c285fb61c0a3c5be234b5dd624e
X-Git-Newrev: 1a17185606161d7a03198e249c02bdc2bdc972d0
X-Patchwork-Hint: ignore
Message-Id: <20251214212140.AD52E8355B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-iniconfig: bump version to
 2.3.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1a17185606161d7a03198e249c02bdc2bdc972d0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/pytest-dev/iniconfig/blob/v2.3.0/CHANGELOG
"* migrate from hatchling to setuptools 77 with setuptools_scm"

Updated project URL according to https://pypi.org/project/iniconfig/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-iniconfig/Config.in             | 2 +-
 package/python-iniconfig/python-iniconfig.hash | 4 ++--
 package/python-iniconfig/python-iniconfig.mk   | 6 +++---
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-iniconfig/Config.in b/package/python-iniconfig/Config.in
index a288da8a64..6dd11aba3b 100644
--- a/package/python-iniconfig/Config.in
+++ b/package/python-iniconfig/Config.in
@@ -3,4 +3,4 @@ config BR2_PACKAGE_PYTHON_INICONFIG
 	help
 	  iniconfig: brain-dead simple config-ini parsing.
 
-	  http://github.com/RonnyPfannschmidt/iniconfig
+	  https://github.com/pytest-dev/iniconfig
diff --git a/package/python-iniconfig/python-iniconfig.hash b/package/python-iniconfig/python-iniconfig.hash
index 7e5884bb7c..576a93455b 100644
--- a/package/python-iniconfig/python-iniconfig.hash
+++ b/package/python-iniconfig/python-iniconfig.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/iniconfig/json
-md5  437ede5b20b0ab2e76ca08f02b5c49dd  iniconfig-2.1.0.tar.gz
-sha256  3abbd2e30b36733fee78f9c7f7308f2d0050e88f0087fd25c2645f63c773e1c7  iniconfig-2.1.0.tar.gz
+md5  5c1d9c21275feb3da71400bf716edd72  iniconfig-2.3.0.tar.gz
+sha256  c76315c77db068650d49c5b56314774a7804df16fee4402c1f19d6d15d8c4730  iniconfig-2.3.0.tar.gz
 # Locally computed sha256 checksums
 sha256  3409fa91f7ace557894632676656e32264fe5ef7581535725dc9a23774551bd4  LICENSE
diff --git a/package/python-iniconfig/python-iniconfig.mk b/package/python-iniconfig/python-iniconfig.mk
index 3276032fd3..68392aaa10 100644
--- a/package/python-iniconfig/python-iniconfig.mk
+++ b/package/python-iniconfig/python-iniconfig.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_INICONFIG_VERSION = 2.1.0
+PYTHON_INICONFIG_VERSION = 2.3.0
 PYTHON_INICONFIG_SOURCE = iniconfig-$(PYTHON_INICONFIG_VERSION).tar.gz
-PYTHON_INICONFIG_SITE = https://files.pythonhosted.org/packages/f2/97/ebf4da567aa6827c909642694d71c9fcf53e5b504f2d96afea02718862f3
-PYTHON_INICONFIG_SETUP_TYPE = hatch
+PYTHON_INICONFIG_SITE = https://files.pythonhosted.org/packages/72/34/14ca021ce8e5dfedc35312d08ba8bf51fdd999c576889fc2c24cb97f4f10
+PYTHON_INICONFIG_SETUP_TYPE = setuptools
 PYTHON_INICONFIG_LICENSE = MIT
 PYTHON_INICONFIG_LICENSE_FILES = LICENSE
 PYTHON_INICONFIG_DEPENDENCIES = host-python-hatch-vcs
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
