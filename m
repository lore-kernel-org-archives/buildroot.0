Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4399EED628
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 17:16:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8DCE180C94;
	Fri,  2 Jan 2026 17:16:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 437MSSKx9FkG; Fri,  2 Jan 2026 17:16:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B926680EB1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767374206;
	bh=YzMGQVCNbuU4CHu1XRRK5L/48F6cW42NXIwmNsRMDjI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=i/Kozav5LBeHcQMbFq3WIjEiTlZKgDGrjh8CWkz8LuO7cMHm4S4tgmQO6r3FWTTfA
	 CZPQFTQFPIHhZonfKfDQVvjylzPQDx8Fi6RbSkHInsetrZIlSw7nRFvANgVV74I15I
	 thjumfKBdyxC4GhmCjuOaexo8b/TMNr2IQMUcmx0ch3NAlDW1TOqGBUGC5GK5TMfHg
	 NF+i1CVZwr3B/gwqbRgjET6CFiUMqcWErncWUHWxmZBT0lP0i3gou/OutgzZ6nz5vY
	 Xh8UluVyGpAwsepQsaxKWjaN3vfKK9rg0HIYVwniasy+91268/xQIrMNeGNNfjvVMJ
	 NdYpRrXqQ3y7w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B926680EB1;
	Fri,  2 Jan 2026 17:16:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 23CB619D
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 17:16:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 153B9607DA
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 17:16:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YsCxAdedogNB for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 17:16:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1FEC36087D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1FEC36087D
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 17:16:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 114068775A; Fri,  2 Jan 2026 17:16:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 Jan 2026 18:11:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 38d3739b20518caf33fd2fc3caa7f76940fde1e7
X-Git-Newrev: a8c7517320ca682a4e5383100d1afb13792a8ff2
X-Patchwork-Hint: ignore
Message-Id: <20260102171641.114068775A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-platformdirs: new package
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a8c7517320ca682a4e5383100d1afb13792a8ff2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                           |  1 +
 package/Config.in                                    |  1 +
 package/python-platformdirs/Config.in                |  7 +++++++
 package/python-platformdirs/python-platformdirs.hash |  5 +++++
 package/python-platformdirs/python-platformdirs.mk   | 15 +++++++++++++++
 5 files changed, 29 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index f423045314..50fd6dd119 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1122,6 +1122,7 @@ F:	package/panel-mipi-dbi-firmware/
 F:	package/python-aiomqtt/
 F:	package/python-markdown-it-py/
 F:	package/python-mdurl/
+F:	package/python-platformdirs/
 F:	package/python-pyasynchat/
 F:	package/python-pyasyncore/
 F:	support/testing/tests/package/sample_python_networkmanager_goi.py
diff --git a/package/Config.in b/package/Config.in
index 54c7333ea5..6aadb3481b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1272,6 +1272,7 @@ menu "External python modules"
 	source "package/python-pigpio/Config.in"
 	source "package/python-pillow/Config.in"
 	source "package/python-pip/Config.in"
+	source "package/python-platformdirs/Config.in"
 	source "package/python-pluggy/Config.in"
 	source "package/python-ply/Config.in"
 	source "package/python-portend/Config.in"
diff --git a/package/python-platformdirs/Config.in b/package/python-platformdirs/Config.in
new file mode 100644
index 0000000000..b0cde72585
--- /dev/null
+++ b/package/python-platformdirs/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_PLATFORMDIRS
+	bool "python-platformdirs"
+	help
+	  A small Python package for determining appropriate
+	  platform-specific dirs, e.g. a "user data dir".
+
+	  https://github.com/tox-dev/platformdirs
diff --git a/package/python-platformdirs/python-platformdirs.hash b/package/python-platformdirs/python-platformdirs.hash
new file mode 100644
index 0000000000..b35d10dba1
--- /dev/null
+++ b/package/python-platformdirs/python-platformdirs.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/platformdirs/json
+md5  90aef8202386996ce2e4b560a9f1d3e6  platformdirs-4.3.8.tar.gz
+sha256  3d512d96e16bcb959a814c9f348431070822a6496326a4be0911c40b5a74c2bc  platformdirs-4.3.8.tar.gz
+# Locally computed sha256 checksums
+sha256  29e0fd62e929850e86eb28c3fdccf0cefdf4fa94879011cffb3d0d4bed6d4db6  LICENSE
diff --git a/package/python-platformdirs/python-platformdirs.mk b/package/python-platformdirs/python-platformdirs.mk
new file mode 100644
index 0000000000..b24d6d78d8
--- /dev/null
+++ b/package/python-platformdirs/python-platformdirs.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-platformdirs
+#
+################################################################################
+
+PYTHON_PLATFORMDIRS_VERSION = 4.3.8
+PYTHON_PLATFORMDIRS_SOURCE = platformdirs-$(PYTHON_PLATFORMDIRS_VERSION).tar.gz
+PYTHON_PLATFORMDIRS_SITE = https://files.pythonhosted.org/packages/fe/8b/3c73abc9c759ecd3f1f7ceff6685840859e8070c4d947c93fae71f6a0bf2
+PYTHON_PLATFORMDIRS_SETUP_TYPE = hatch
+PYTHON_PLATFORMDIRS_LICENSE = MIT
+PYTHON_PLATFORMDIRS_LICENSE_FILES = LICENSE
+PYTHON_PLATFORMDIRS_DEPENDENCIES = host-python-hatch-vcs
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
