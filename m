Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DE27C52D6F
	for <buildroot@archiver.kernel.org>; Tue,  6 Aug 2024 20:35:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4522240457;
	Tue,  6 Aug 2024 20:35:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UKnKF5wInciW; Tue,  6 Aug 2024 20:35:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F2E9E402B0
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F2E9E402B0;
	Tue,  6 Aug 2024 20:35:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5A6EA1BF33D
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 20:35:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4803980B60
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 20:35:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BbNn4pVZrZn7 for <buildroot@lists.busybox.net>;
 Tue,  6 Aug 2024 20:35:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5195F80B42
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5195F80B42
 for <buildroot@buildroot.org>; Tue,  6 Aug 2024 20:35:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3CD02842BC; Tue,  6 Aug 2024 20:35:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Aug 2024 22:31:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 33d45b9c672df06b7157be957f81b2cf17dccdd7
X-Git-Newrev: 6e3bf1fe76db187fbdf4fee5eb5e894ec4cc3e54
X-Patchwork-Hint: ignore
Message-Id: <20240806203523.3CD02842BC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-configobj: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=6e3bf1fe76db187fbdf4fee5eb5e894ec4cc3e54
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

python-configobj package was removed in commit
8d264a96172cfa1c1f515d1160b921c013fa3bd7 because of the missing
support for Python 3.x.

Meanwhile, this problem was fixed, hence readd the package.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy                               |  6 ------
 package/Config.in                              |  1 +
 package/python-configobj/Config.in             |  7 +++++++
 package/python-configobj/python-configobj.hash |  5 +++++
 package/python-configobj/python-configobj.mk   | 14 ++++++++++++++
 5 files changed, 27 insertions(+), 6 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 94092d38f4..6473947a9a 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -1164,12 +1164,6 @@ config BR2_PACKAGE_PYTHON_DIALOG
 	help
 	  Package was removed together with python 2.7 support.
 
-config BR2_PACKAGE_PYTHON_CONFIGOBJ
-	bool "python-configobj removed"
-	select BR2_LEGACY
-	help
-	  Package was removed together with python 2.7 support.
-
 config BR2_PACKAGE_PYTHON_YIELDFROM
 	bool "python-yieldfrom removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 0d51c6af1e..0472ec2daf 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1051,6 +1051,7 @@ menu "External python modules"
 	source "package/python-colorama/Config.in"
 	source "package/python-colorlog/Config.in"
 	source "package/python-colorzero/Config.in"
+	source "package/python-configobj/Config.in"
 	source "package/python-configshell-fb/Config.in"
 	source "package/python-constantly/Config.in"
 	source "package/python-construct/Config.in"
diff --git a/package/python-configobj/Config.in b/package/python-configobj/Config.in
new file mode 100644
index 0000000000..365aa17fcb
--- /dev/null
+++ b/package/python-configobj/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_CONFIGOBJ
+	bool "python-configobj"
+	select BR2_PACKAGE_PYTHON_SIX # runtime
+	help
+	  Config file reading, writing and validation.
+
+	  https://github.com/DiffSK/configobj
diff --git a/package/python-configobj/python-configobj.hash b/package/python-configobj/python-configobj.hash
new file mode 100644
index 0000000000..682dc987f1
--- /dev/null
+++ b/package/python-configobj/python-configobj.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/configobj/json
+md5  8dda7b31bb3aea87ecfe3b7a87812b17  configobj-5.0.8.tar.gz
+sha256  6f704434a07dc4f4dc7c9a745172c1cad449feb548febd9f7fe362629c627a97  configobj-5.0.8.tar.gz
+# Locally computed sha256 checksums
+sha256  0d95e648469a711f5ec1e59e6d4492150ec65d968c1ea6c6d96154a92879997a  LICENSE
diff --git a/package/python-configobj/python-configobj.mk b/package/python-configobj/python-configobj.mk
new file mode 100644
index 0000000000..fe1776f79f
--- /dev/null
+++ b/package/python-configobj/python-configobj.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-configobj
+#
+################################################################################
+
+PYTHON_CONFIGOBJ_VERSION = 5.0.8
+PYTHON_CONFIGOBJ_SOURCE = configobj-$(PYTHON_CONFIGOBJ_VERSION).tar.gz
+PYTHON_CONFIGOBJ_SITE = https://files.pythonhosted.org/packages/cb/87/17d4c6d634c044ab08b11c0cd2a8a136d103713d438f8792d7be2c5148fb
+PYTHON_CONFIGOBJ_SETUP_TYPE = setuptools
+PYTHON_CONFIGOBJ_LICENSE = BSD-3-Clause
+PYTHON_CONFIGOBJ_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
