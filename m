Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96176C3DA49
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 09:29:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5B0454058E;
	Tue, 23 Jul 2024 09:29:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hhjaEL4yJ36k; Tue, 23 Jul 2024 09:29:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E4F6B409F5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E4F6B409F5;
	Tue, 23 Jul 2024 09:29:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E9FA91BF3AA
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 09:28:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D7CA7607D5
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 09:28:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fW64TMMOY56r for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 09:28:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A56A60686
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0A56A60686
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 09:28:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E6D63872EC; Tue, 23 Jul 2024 09:28:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 23 Jul 2024 10:59:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e996d399b82aac7ebd7565bd33afe4d1b3635395
X-Git-Newrev: b6f3278539216f55fb18ff7e63ce2da39ed0c3e1
X-Patchwork-Hint: ignore
Message-Id: <20240723092857.E6D63872EC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-autocommand: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=b6f3278539216f55fb18ff7e63ce2da39ed0c3e1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in                                  |  1 +
 package/python-autocommand/Config.in               |  6 ++++++
 package/python-autocommand/python-autocommand.hash |  5 +++++
 package/python-autocommand/python-autocommand.mk   | 14 ++++++++++++++
 4 files changed, 26 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index a0d78518b6..3f60d2f037 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1009,6 +1009,7 @@ menu "External python modules"
 	source "package/python-attrs/Config.in"
 	source "package/python-augeas/Config.in"
 	source "package/python-autobahn/Config.in"
+	source "package/python-autocommand/Config.in"
 	source "package/python-automat/Config.in"
 	source "package/python-avro/Config.in"
 	source "package/python-babel/Config.in"
diff --git a/package/python-autocommand/Config.in b/package/python-autocommand/Config.in
new file mode 100644
index 0000000000..41533e644e
--- /dev/null
+++ b/package/python-autocommand/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_AUTOCOMMAND
+	bool "python-autocommand"
+	help
+	  A library to create a command-line program from a function.
+
+	  https://github.com/Lucretiel/autocommand
diff --git a/package/python-autocommand/python-autocommand.hash b/package/python-autocommand/python-autocommand.hash
new file mode 100644
index 0000000000..9513010d0e
--- /dev/null
+++ b/package/python-autocommand/python-autocommand.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/autocommand/json
+md5  0cab5141bad0dfb363b086e93fd4125e  autocommand-2.2.2.tar.gz
+sha256  878de9423c5596491167225c2a455043c3130fb5b7286ac83443d45e74955f34  autocommand-2.2.2.tar.gz
+# Locally computed sha256 checksums
+sha256  ade78d04982d69972d444a8e14a94f87a2334dd3855cc80348ea8e240aa0df2d  LICENSE
diff --git a/package/python-autocommand/python-autocommand.mk b/package/python-autocommand/python-autocommand.mk
new file mode 100644
index 0000000000..37b421e418
--- /dev/null
+++ b/package/python-autocommand/python-autocommand.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-autocommand
+#
+################################################################################
+
+PYTHON_AUTOCOMMAND_VERSION = 2.2.2
+PYTHON_AUTOCOMMAND_SOURCE = autocommand-$(PYTHON_AUTOCOMMAND_VERSION).tar.gz
+PYTHON_AUTOCOMMAND_SITE = https://files.pythonhosted.org/packages/5b/18/774bddb96bc0dc0a2b8ac2d2a0e686639744378883da0fc3b96a54192d7a
+PYTHON_AUTOCOMMAND_SETUP_TYPE = setuptools
+PYTHON_AUTOCOMMAND_LICENSE = LGPL-3.0+
+PYTHON_AUTOCOMMAND_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
