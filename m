Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93967C46CD2
	for <buildroot@archiver.kernel.org>; Tue,  2 Jan 2024 22:41:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5098060FBA;
	Tue,  2 Jan 2024 22:41:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5098060FBA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ztYzU_nZ-bJJ; Tue,  2 Jan 2024 22:41:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 56C7F60FE7;
	Tue,  2 Jan 2024 22:41:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 56C7F60FE7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C0E331BF2FB
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 22:39:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 975C4813E0
 for <buildroot@lists.busybox.net>; Tue,  2 Jan 2024 22:39:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 975C4813E0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id raBji3dCwCpY for <buildroot@lists.busybox.net>;
 Tue,  2 Jan 2024 22:39:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D90A88144E
 for <buildroot@buildroot.org>; Tue,  2 Jan 2024 22:39:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D90A88144E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C571A83E70; Tue,  2 Jan 2024 22:39:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 2 Jan 2024 23:34:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 34b9fa1caaddf11e52953f087eeb9cf9c26cbd62
X-Git-Newrev: 9ffb74fd91bd301f1ec0cc0fbd30da9bbd0f1eac
X-Patchwork-Hint: ignore
Message-Id: <20240102223939.C571A83E70@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-google-auth: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=9ffb74fd91bd301f1ec0cc0fbd30da9bbd0f1eac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in                                  |  1 +
 package/python-google-auth/Config.in               |  9 +++++++++
 package/python-google-auth/python-google-auth.hash |  5 +++++
 package/python-google-auth/python-google-auth.mk   | 14 ++++++++++++++
 4 files changed, 29 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index af330eeacf..422e8a8b40 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1104,6 +1104,7 @@ menu "External python modules"
 	source "package/python-gitdb2/Config.in"
 	source "package/python-gnupg/Config.in"
 	source "package/python-gobject/Config.in"
+	source "package/python-google-auth/Config.in"
 	source "package/python-gpiozero/Config.in"
 	source "package/python-greenlet/Config.in"
 	source "package/python-grpcio/Config.in"
diff --git a/package/python-google-auth/Config.in b/package/python-google-auth/Config.in
new file mode 100644
index 0000000000..eb5be9cda5
--- /dev/null
+++ b/package/python-google-auth/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_GOOGLE_AUTH
+	bool "python-google-auth"
+	select BR2_PACKAGE_PYTHON_CACHETOOLS # runtime
+	select BR2_PACKAGE_PYTHON_PYASN1_MODULES # runtime
+	select BR2_PACKAGE_PYTHON_RSA # runtime
+	help
+	  Google Authentication Library.
+
+	  https://github.com/googleapis/google-auth-library-python
diff --git a/package/python-google-auth/python-google-auth.hash b/package/python-google-auth/python-google-auth.hash
new file mode 100644
index 0000000000..2f965edc91
--- /dev/null
+++ b/package/python-google-auth/python-google-auth.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/google-auth/json
+md5  40413bc699c6e02d7732e7e09e8cec0c  google-auth-2.25.2.tar.gz
+sha256  42f707937feb4f5e5a39e6c4f343a17300a459aaf03141457ba505812841cc40  google-auth-2.25.2.tar.gz
+# Locally computed sha256 checksums
+sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/python-google-auth/python-google-auth.mk b/package/python-google-auth/python-google-auth.mk
new file mode 100644
index 0000000000..8638a2ca46
--- /dev/null
+++ b/package/python-google-auth/python-google-auth.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-google-auth
+#
+################################################################################
+
+PYTHON_GOOGLE_AUTH_VERSION = 2.25.2
+PYTHON_GOOGLE_AUTH_SOURCE = google-auth-$(PYTHON_GOOGLE_AUTH_VERSION).tar.gz
+PYTHON_GOOGLE_AUTH_SITE = https://files.pythonhosted.org/packages/05/77/84608894384e02f3b0b2621b09ecb0b85e57ba368f13eecbbc43cd1b8719
+PYTHON_GOOGLE_AUTH_SETUP_TYPE = setuptools
+PYTHON_GOOGLE_AUTH_LICENSE = Apache-2.0
+PYTHON_GOOGLE_AUTH_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
