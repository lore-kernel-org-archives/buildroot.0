Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E930D10BFF
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 16:36:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 40BA9406D3;
	Sat, 26 Oct 2024 16:36:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wxNI2tNHVuph; Sat, 26 Oct 2024 16:36:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 91381406EF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 91381406EF;
	Sat, 26 Oct 2024 16:36:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C11932318
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 16:36:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9D54A60780
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 16:36:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FX6zMarfdPCn for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 16:36:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CCEC660751
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CCEC660751
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 16:36:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 81DD883F7B; Sat, 26 Oct 2024 16:36:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 26 Oct 2024 18:35:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b8735ae228c4e796c7a44b3897cad51fd8ce2a61
X-Git-Newrev: 74ad4124fb98e421419ec38ef7637808a86c9ac4
X-Patchwork-Hint: ignore
Message-Id: <20241026163643.81DD883F7B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-aiomqtt: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=74ad4124fb98e421419ec38ef7637808a86c9ac4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

MQTT client library for use with Python asyncio.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                 |  1 +
 package/Config.in                          |  1 +
 package/python-aiomqtt/Config.in           |  8 ++++++++
 package/python-aiomqtt/python-aiomqtt.hash |  5 +++++
 package/python-aiomqtt/python-aiomqtt.mk   | 15 +++++++++++++++
 5 files changed, 30 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 2f86bcfab5..3db1b3b7e8 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1098,6 +1098,7 @@ N:	Falco Hyfing <hyfinglists@gmail.com>
 F:	package/python-pymodbus/
 
 N:	Fiona Klute <fiona.klute@gmx.de>
+F:	package/python-aiomqtt/
 F:	package/python-dunamai/
 F:	package/python-poetry-dynamic-versioning/
 F:	package/python-pyasynchat/
diff --git a/package/Config.in b/package/Config.in
index 6aceef9e7f..3c2e75db6c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -986,6 +986,7 @@ menu "External python modules"
 	source "package/python-aiojobs/Config.in"
 	source "package/python-aiologstash/Config.in"
 	source "package/python-aiomonitor/Config.in"
+	source "package/python-aiomqtt/Config.in"
 	source "package/python-aioprocessing/Config.in"
 	source "package/python-aioredis/Config.in"
 	source "package/python-aiorwlock/Config.in"
diff --git a/package/python-aiomqtt/Config.in b/package/python-aiomqtt/Config.in
new file mode 100644
index 0000000000..d0d31b48ba
--- /dev/null
+++ b/package/python-aiomqtt/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_AIOMQTT
+	bool "python-aiomqtt"
+	select BR2_PACKAGE_PYTHON_PAHO_MQTT # runtime
+	select BR2_PACKAGE_PYTHON3_SSL # runtime
+	help
+	  The idiomatic asyncio MQTT client, wrapped around paho-mqtt.
+
+	  https://github.com/empicano/aiomqtt
diff --git a/package/python-aiomqtt/python-aiomqtt.hash b/package/python-aiomqtt/python-aiomqtt.hash
new file mode 100644
index 0000000000..12ea86d538
--- /dev/null
+++ b/package/python-aiomqtt/python-aiomqtt.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/aiomqtt/json
+md5  e23feb8ad69a1ae3a9701fb1f3c03a3c  aiomqtt-2.3.0.tar.gz
+sha256  312feebe20bc76dc7c20916663011f3bd37aa6f42f9f687a19a1c58308d80d47  aiomqtt-2.3.0.tar.gz
+# Locally computed sha256 checksums
+sha256  2cdee9e997c759749069649dfb9060fdb885da82bc50c0dcb4841b1dcab0b032  LICENSE
diff --git a/package/python-aiomqtt/python-aiomqtt.mk b/package/python-aiomqtt/python-aiomqtt.mk
new file mode 100644
index 0000000000..291547f11f
--- /dev/null
+++ b/package/python-aiomqtt/python-aiomqtt.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-aiomqtt
+#
+################################################################################
+
+PYTHON_AIOMQTT_VERSION = 2.3.0
+PYTHON_AIOMQTT_SOURCE = aiomqtt-$(PYTHON_AIOMQTT_VERSION).tar.gz
+PYTHON_AIOMQTT_SITE = https://files.pythonhosted.org/packages/db/c9/168e78bd35b21d9bdbb26178db33a8f265e4a69bb4193e72434e7cb3d1cd
+PYTHON_AIOMQTT_SETUP_TYPE = pep517
+PYTHON_AIOMQTT_LICENSE = BSD-3-Clause
+PYTHON_AIOMQTT_LICENSE_FILES = LICENSE
+PYTHON_AIOMQTT_DEPENDENCIES = host-python-poetry-dynamic-versioning
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
