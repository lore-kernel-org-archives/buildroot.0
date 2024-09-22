Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EC20CF9C6C
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 10:37:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1BFF781119;
	Sun, 22 Sep 2024 10:37:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zO3l3zXmCs16; Sun, 22 Sep 2024 10:37:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A7337841AE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A7337841AE;
	Sun, 22 Sep 2024 10:37:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9D9D21BF47A
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 10:35:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C643940633
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 10:34:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tdDbQvuib9pA for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 10:34:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 71B7E40634
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 71B7E40634
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 10:34:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6F9D08219F; Sun, 22 Sep 2024 10:34:42 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 22 Sep 2024 12:30:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a4cbbb401df524d22fdf9e9e9abac06e3d5111e2
X-Git-Newrev: 7e0c46410aa28b17726da3b628bc380bd0aca51c
X-Patchwork-Hint: ignore
Message-Id: <20240922103442.6F9D08219F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-werkzeug: bump to version
 3.0.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=7e0c46410aa28b17726da3b628bc380bd0aca51c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Migrate from setuptools to flit build backend.

Add new python-markupsafe runtime dependency.

License file renamed without content changes.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-werkzeug/Config.in            | 1 +
 package/python-werkzeug/python-werkzeug.hash | 6 +++---
 package/python-werkzeug/python-werkzeug.mk   | 8 ++++----
 3 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/package/python-werkzeug/Config.in b/package/python-werkzeug/Config.in
index 27b2fdeaab..7b2a9a09ad 100644
--- a/package/python-werkzeug/Config.in
+++ b/package/python-werkzeug/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_WERKZEUG
 	bool "python-werkzeug"
+	select BR2_PACKAGE_PYTHON_MARKUPSAFE # runtime
 	select BR2_PACKAGE_PYTHON3_ZLIB # runtime
 	help
 	  Werkzeug is a WSGI utility library for Python. It's widely
diff --git a/package/python-werkzeug/python-werkzeug.hash b/package/python-werkzeug/python-werkzeug.hash
index 34adc67088..31972eacf2 100644
--- a/package/python-werkzeug/python-werkzeug.hash
+++ b/package/python-werkzeug/python-werkzeug.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/werkzeug/json
-md5  3bb49cd2f2b51a1c638532e9a935e207  werkzeug-2.3.8.tar.gz
-sha256  554b257c74bbeb7a0d254160a4f8ffe185243f52a52035060b761ca62d977f03  werkzeug-2.3.8.tar.gz
+md5  c69f88f79e8b84d77abd262558ccd8fa  werkzeug-3.0.4.tar.gz
+sha256  34f2371506b250df4d4f84bfe7b0921e4762525762bbd936614909fe25cd7306  werkzeug-3.0.4.tar.gz
 # Locally computed sha256 checksums
-sha256  3b49dcee4105eb37bac10faf1be260408fe85d252b8e9df2e0979fc1e094437b  LICENSE.rst
+sha256  3b49dcee4105eb37bac10faf1be260408fe85d252b8e9df2e0979fc1e094437b  LICENSE.txt
diff --git a/package/python-werkzeug/python-werkzeug.mk b/package/python-werkzeug/python-werkzeug.mk
index e8ef32bb1b..fa3d3cfd37 100644
--- a/package/python-werkzeug/python-werkzeug.mk
+++ b/package/python-werkzeug/python-werkzeug.mk
@@ -4,12 +4,12 @@
 #
 ################################################################################
 
-PYTHON_WERKZEUG_VERSION = 2.3.8
+PYTHON_WERKZEUG_VERSION = 3.0.4
 PYTHON_WERKZEUG_SOURCE = werkzeug-$(PYTHON_WERKZEUG_VERSION).tar.gz
-PYTHON_WERKZEUG_SITE = https://files.pythonhosted.org/packages/3d/4b/d746f1000782c89d6c97df9df43ba8f4d126038608843d3560ae88d201b5
-PYTHON_WERKZEUG_SETUP_TYPE = setuptools
+PYTHON_WERKZEUG_SITE = https://files.pythonhosted.org/packages/0f/e2/6dbcaab07560909ff8f654d3a2e5a60552d937c909455211b1b36d7101dc
+PYTHON_WERKZEUG_SETUP_TYPE = flit
 PYTHON_WERKZEUG_LICENSE = BSD-3-Clause
-PYTHON_WERKZEUG_LICENSE_FILES = LICENSE.rst
+PYTHON_WERKZEUG_LICENSE_FILES = LICENSE.txt
 PYTHON_WERKZEUG_CPE_ID_VENDOR = palletsprojects
 PYTHON_WERKZEUG_CPE_ID_PRODUCT = werkzeug
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
