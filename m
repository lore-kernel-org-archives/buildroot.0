Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21FEEC433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 19:16:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BCB7A42472;
	Sat, 23 Jul 2022 19:16:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BCB7A42472
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LxtPvd53f2BX; Sat, 23 Jul 2022 19:16:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 272274246E;
	Sat, 23 Jul 2022 19:16:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 272274246E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6D2521BF5A5
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 19:16:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 547FD42452
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 19:16:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 547FD42452
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L9DaN2YymSsF for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 19:16:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 319464246D
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 19:16:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 319464246D
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id B0D5884B12; Sat, 23 Jul 2022 19:02:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 21:15:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 57522040017d07efaf5c52f7a12d06aee717738f
X-Git-Newrev: 33d953588f94603cb79f408308e4ded2a6ddd447
X-Patchwork-Hint: ignore
Message-Id: <20220723190228.B0D5884B12@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-ruamel-yaml: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=33d953588f94603cb79f408308e4ded2a6ddd447
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in                                  |  1 +
 package/python-ruamel-yaml/Config.in               |  8 ++++++++
 package/python-ruamel-yaml/python-ruamel-yaml.hash |  5 +++++
 package/python-ruamel-yaml/python-ruamel-yaml.mk   | 14 ++++++++++++++
 4 files changed, 28 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index de02f3388f..e19b84b6bf 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1216,6 +1216,7 @@ menu "External python modules"
 	source "package/python-rpi-ws281x/Config.in"
 	source "package/python-rsa/Config.in"
 	source "package/python-rtslib-fb/Config.in"
+	source "package/python-ruamel-yaml/Config.in"
 	source "package/python-s3transfer/Config.in"
 	source "package/python-scandir/Config.in"
 	source "package/python-scapy/Config.in"
diff --git a/package/python-ruamel-yaml/Config.in b/package/python-ruamel-yaml/Config.in
new file mode 100644
index 0000000000..afde3d53d4
--- /dev/null
+++ b/package/python-ruamel-yaml/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_RUAMEL_YAML
+	bool "python-ruamel-yaml"
+	help
+	  ruamel.yaml is a YAML parser/emitter that supports roundtrip
+	  preservation of comments, seq/map flow style, and map key
+	  order.
+
+	  https://sourceforge.net/projects/ruamel-yaml/
diff --git a/package/python-ruamel-yaml/python-ruamel-yaml.hash b/package/python-ruamel-yaml/python-ruamel-yaml.hash
new file mode 100644
index 0000000000..29852a51ed
--- /dev/null
+++ b/package/python-ruamel-yaml/python-ruamel-yaml.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/rfc3987/json
+md5  206bda0f33ab2c2f63777636200748b7  ruamel.yaml-0.17.21.tar.gz
+sha256  8b7ce697a2f212752a35c1ac414471dc16c424c9573be4926b56ff3f5d23b7af  ruamel.yaml-0.17.21.tar.gz
+# Locally computed sha256 checksums
+sha256  ab837b032c5aae84503fc0c733a116a26fd272e90dc4402fa68d3c9e51aed3b0  LICENSE
diff --git a/package/python-ruamel-yaml/python-ruamel-yaml.mk b/package/python-ruamel-yaml/python-ruamel-yaml.mk
new file mode 100644
index 0000000000..95d20de4a6
--- /dev/null
+++ b/package/python-ruamel-yaml/python-ruamel-yaml.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-ruamel-yaml
+#
+################################################################################
+
+PYTHON_RUAMEL_YAML_VERSION = 0.17.21
+PYTHON_RUAMEL_YAML_SOURCE = ruamel.yaml-$(PYTHON_RUAMEL_YAML_VERSION).tar.gz
+PYTHON_RUAMEL_YAML_SITE = https://files.pythonhosted.org/packages/46/a9/6ed24832095b692a8cecc323230ce2ec3480015fbfa4b79941bd41b23a3c
+PYTHON_RUAMEL_YAML_SETUP_TYPE = setuptools
+PYTHON_RUAMEL_YAML_LICENSE = MIT
+PYTHON_RUAMEL_YAML_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
