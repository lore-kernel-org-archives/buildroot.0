Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ED4CC636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 23:50:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B1BA283E57;
	Mon, 20 Feb 2023 23:50:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B1BA283E57
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 443JXO_E9m3A; Mon, 20 Feb 2023 23:50:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB4F484399;
	Mon, 20 Feb 2023 23:50:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AB4F484399
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3F10F1BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:58:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B9C254177E
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B9C254177E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7Bp7kaM6ke4d for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C5E5341777
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C5E5341777
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B41E286495; Mon, 20 Feb 2023 20:52:43 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 29 Jan 2023 17:41:18 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 3eb3116bfe8ef503acd7756f5071701132d430b1
X-Git-Newrev: 352f4418e4ece05fc075f48e4af6f0918bf11873
X-Patchwork-Hint: ignore
Message-Id: <20230220205243.B41E286495@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-selenium: new
 package
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

commit: https://git.buildroot.net/buildroot/commit/?id=352f4418e4ece05fc075f48e4af6f0918bf11873
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                                   |  1 +
 package/Config.in                            |  1 +
 package/python-selenium/Config.in            | 11 +++++++++++
 package/python-selenium/python-selenium.hash |  3 +++
 package/python-selenium/python-selenium.mk   | 13 +++++++++++++
 5 files changed, 29 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 7e9e4df8f1..d0a51086cd 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1396,6 +1396,7 @@ F:	package/python-pydyf/
 F:	package/python-pypa-build/
 F:	package/python-pyphen/
 F:	package/python-rtoml/
+F:	package/python-selenium/
 F:	package/python-snappy/
 F:	package/python-sniffio/
 F:	package/python-sockjs/
diff --git a/package/Config.in b/package/Config.in
index 46679095b3..fc468148df 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1260,6 +1260,7 @@ menu "External python modules"
 	source "package/python-sdnotify/Config.in"
 	source "package/python-secretstorage/Config.in"
 	source "package/python-see/Config.in"
+	source "package/python-selenium/Config.in"
 	source "package/python-semver/Config.in"
 	source "package/python-sentry-sdk/Config.in"
 	source "package/python-serial/Config.in"
diff --git a/package/python-selenium/Config.in b/package/python-selenium/Config.in
new file mode 100644
index 0000000000..30820f07f8
--- /dev/null
+++ b/package/python-selenium/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_PYTHON_SELENIUM
+	bool "python-selenium"
+	select BR2_PACKAGE_PYTHON_CERTIFI # runtime
+	select BR2_PACKAGE_PYTHON_PYSOCKS # runtime
+	select BR2_PACKAGE_PYTHON_TRIO # runtime
+	select BR2_PACKAGE_PYTHON_TRIO_WEBSOCKET # runtime
+	select BR2_PACKAGE_PYTHON_URLLIB3 # runtime
+	help
+	  Python language bindings for Selenium WebDriver.
+
+	  https://www.selenium.dev
diff --git a/package/python-selenium/python-selenium.hash b/package/python-selenium/python-selenium.hash
new file mode 100644
index 0000000000..d462abc62b
--- /dev/null
+++ b/package/python-selenium/python-selenium.hash
@@ -0,0 +1,3 @@
+# md5, sha256 from https://pypi.org/pypi/selenium/json
+md5  e9054eb95920bb2a1d594090f0773f61  selenium-4.8.0.tar.gz
+sha256  fee36724d6cf0b18c73781bb8ec7be4a35ab1e2564e64e64e64da75e50e052af  selenium-4.8.0.tar.gz
diff --git a/package/python-selenium/python-selenium.mk b/package/python-selenium/python-selenium.mk
new file mode 100644
index 0000000000..6dbea6fb7e
--- /dev/null
+++ b/package/python-selenium/python-selenium.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# python-selenium
+#
+################################################################################
+
+PYTHON_SELENIUM_VERSION = 4.8.0
+PYTHON_SELENIUM_SOURCE = selenium-$(PYTHON_SELENIUM_VERSION).tar.gz
+PYTHON_SELENIUM_SITE = https://files.pythonhosted.org/packages/2e/3d/492cf1a6823c48369328572c6bc63b7a957ba25c0009ee6bdb507cd9a6a4
+PYTHON_SELENIUM_SETUP_TYPE = setuptools
+PYTHON_SELENIUM_LICENSE = Apache-2.0
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
