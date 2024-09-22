Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EDE7CF9C6D
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 10:34:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A1E181455;
	Sun, 22 Sep 2024 10:34:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AWtuTlF_FQwW; Sun, 22 Sep 2024 10:34:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CF3628145F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CF3628145F;
	Sun, 22 Sep 2024 10:34:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C13151BF47A
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 10:34:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AC0D640630
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 10:34:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HjFLqfiknXqU for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 10:34:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C9084062F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7C9084062F
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 10:34:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 74E6E83AD5; Sun, 22 Sep 2024 10:34:36 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 22 Sep 2024 11:31:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a8f36640f638eb2468e13d0e10b81a2bcf3f7b64
X-Git-Newrev: 2860b92c6218f8ed0bf7b2a701b505b1ce3173b4
X-Patchwork-Hint: ignore
Message-Id: <20240922103436.74E6E83AD5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-selenium: bump to version
 4.25.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=2860b92c6218f8ed0bf7b2a701b505b1ce3173b4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Migrate to setuptools-rust build backend.

Add new python-typing-extensions runtime dependency.

Add new python-websocket-client runtime dependency.

Add license file which was previously missing from release.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-selenium/Config.in            |  3 +++
 package/python-selenium/python-selenium.hash |  7 ++++---
 package/python-selenium/python-selenium.mk   | 10 ++++++----
 3 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/package/python-selenium/Config.in b/package/python-selenium/Config.in
index 30820f07f8..fa725cdf44 100644
--- a/package/python-selenium/Config.in
+++ b/package/python-selenium/Config.in
@@ -1,10 +1,13 @@
 config BR2_PACKAGE_PYTHON_SELENIUM
 	bool "python-selenium"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	select BR2_PACKAGE_PYTHON_CERTIFI # runtime
 	select BR2_PACKAGE_PYTHON_PYSOCKS # runtime
 	select BR2_PACKAGE_PYTHON_TRIO # runtime
 	select BR2_PACKAGE_PYTHON_TRIO_WEBSOCKET # runtime
+	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
 	select BR2_PACKAGE_PYTHON_URLLIB3 # runtime
+	select BR2_PACKAGE_PYTHON_WEBSOCKET_CLIENT # runtime
 	help
 	  Python language bindings for Selenium WebDriver.
 
diff --git a/package/python-selenium/python-selenium.hash b/package/python-selenium/python-selenium.hash
index ef1c34bfd3..aa492248a5 100644
--- a/package/python-selenium/python-selenium.hash
+++ b/package/python-selenium/python-selenium.hash
@@ -1,3 +1,4 @@
-# md5, sha256 from https://pypi.org/pypi/selenium/json
-md5  9afd7110a9e06721baae028ac42a2221  selenium-4.16.0.tar.gz
-sha256  b2e987a445306151f7be0e6dfe2aa72a479c2ac6a91b9d5ef2d6dd4e49ad0435  selenium-4.16.0.tar.gz
+# Locally calculated after vendoring
+sha256  2e801325943bae1ccf4978b76e25f539d2e24d5765891be20d77d117940a9674  python-selenium-4.25.0-cargo2.tar.gz
+# Locally computed sha256 checksums
+sha256  de658a7d3761e92b471e2f630ea99eeb3389b27820809b1e4853baabd5fbadb7  LICENSE
diff --git a/package/python-selenium/python-selenium.mk b/package/python-selenium/python-selenium.mk
index 0428cefa46..b317a83148 100644
--- a/package/python-selenium/python-selenium.mk
+++ b/package/python-selenium/python-selenium.mk
@@ -4,10 +4,12 @@
 #
 ################################################################################
 
-PYTHON_SELENIUM_VERSION = 4.16.0
-PYTHON_SELENIUM_SOURCE = selenium-$(PYTHON_SELENIUM_VERSION).tar.gz
-PYTHON_SELENIUM_SITE = https://files.pythonhosted.org/packages/16/fd/a0ef793383077dd6296e4637acc82d1e9893e9a49a47f56e96996909e427
-PYTHON_SELENIUM_SETUP_TYPE = setuptools
+PYTHON_SELENIUM_VERSION = 4.25.0
+PYTHON_SELENIUM_SOURCE_PYPI = selenium-$(PYTHON_SELENIUM_VERSION).tar.gz
+PYTHON_SELENIUM_SITE_PYPI = https://files.pythonhosted.org/packages/0e/5a/d3735b189b91715fd0f5a9b8d55e2605061309849470e96ab830f02cba40
+PYTHON_SELENIUM_SITE = $(PYTHON_SELENIUM_SITE_PYPI)/$(PYTHON_SELENIUM_SOURCE_PYPI)?buildroot-path=filename
+PYTHON_SELENIUM_SETUP_TYPE = setuptools-rust
 PYTHON_SELENIUM_LICENSE = Apache-2.0
+PYTHON_SELENIUM_LICENSE_FILES = LICENSE
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
