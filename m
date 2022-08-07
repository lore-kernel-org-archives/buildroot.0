Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1EDEC19F2A
	for <buildroot@archiver.kernel.org>; Sun,  7 Aug 2022 12:55:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8A8E5827AA;
	Sun,  7 Aug 2022 12:55:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A8E5827AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Elvqc8bykE23; Sun,  7 Aug 2022 12:55:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 78A2C827A1;
	Sun,  7 Aug 2022 12:55:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 78A2C827A1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CDEF41BF2F0
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 12:55:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B220E4162C
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 12:55:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B220E4162C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id L5jqP0p3vA0K for <buildroot@lists.busybox.net>;
 Sun,  7 Aug 2022 12:55:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9A59341626
 for <buildroot@buildroot.org>; Sun,  7 Aug 2022 12:55:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9A59341626
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 5E99886F2C; Sun,  7 Aug 2022 12:40:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 7 Aug 2022 14:52:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7674400360b0c9cdf195e3cf2478c30756559014
X-Git-Newrev: 08be3dfa15e97134c150a46c42fa2059be90b1c6
X-Patchwork-Hint: ignore
Message-Id: <20220807124058.5E99886F2C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-dtschema: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=08be3dfa15e97134c150a46c42fa2059be90b1c6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in                            |  1 +
 package/python-dtschema/Config.in            | 10 ++++++++++
 package/python-dtschema/python-dtschema.hash |  5 +++++
 package/python-dtschema/python-dtschema.mk   | 15 +++++++++++++++
 4 files changed, 31 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 96c54ca672..57733f80b5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1024,6 +1024,7 @@ menu "External python modules"
 	source "package/python-docutils/Config.in"
 	source "package/python-dominate/Config.in"
 	source "package/python-dpkt/Config.in"
+	source "package/python-dtschema/Config.in"
 	source "package/python-ecdsa/Config.in"
 	source "package/python-engineio/Config.in"
 	source "package/python-entrypoints/Config.in"
diff --git a/package/python-dtschema/Config.in b/package/python-dtschema/Config.in
new file mode 100644
index 0000000000..961d0e04b2
--- /dev/null
+++ b/package/python-dtschema/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_PYTHON_DTSCHEMA
+	bool "python-dtschema"
+	select BR2_PACKAGE_PYTHON_JSONSCHEMA # runtime
+	select BR2_PACKAGE_PYTHON_PYLIBFDT # runtime
+	select BR2_PACKAGE_PYTHON_RFC3987 # runtime
+	select BR2_PACKAGE_PYTHON_RUAMEL_YAML # runtime
+	help
+	  DeviceTree validation schema and tools.
+
+	  https://github.com/devicetree-org/dt-schema
diff --git a/package/python-dtschema/python-dtschema.hash b/package/python-dtschema/python-dtschema.hash
new file mode 100644
index 0000000000..7b183e28e3
--- /dev/null
+++ b/package/python-dtschema/python-dtschema.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/dtschema/json
+md5  ed75defac9a7297a567f278994b14d5b  dtschema-2022.8.tar.gz
+sha256  1befe7c9f74cea248a8b524cf6185ac48912a5b2aae96854d77cb94584433ca4  dtschema-2022.8.tar.gz
+# Locally computed sha256 checksums
+sha256  ca0d66263406dc684fe9db60577b234f65ffdf620d7e041c708e969447b69111  LICENSE.txt
diff --git a/package/python-dtschema/python-dtschema.mk b/package/python-dtschema/python-dtschema.mk
new file mode 100644
index 0000000000..263061dc98
--- /dev/null
+++ b/package/python-dtschema/python-dtschema.mk
@@ -0,0 +1,15 @@
+################################################################################
+#
+# python-dtschema
+#
+################################################################################
+
+PYTHON_DTSCHEMA_VERSION = 2022.8
+PYTHON_DTSCHEMA_SOURCE = dtschema-$(PYTHON_DTSCHEMA_VERSION).tar.gz
+PYTHON_DTSCHEMA_SITE = https://files.pythonhosted.org/packages/95/be/cb576760b9578cb69da020aeb80f3c2d05ff46b4090ab350c1e05691329e
+PYTHON_DTSCHEMA_SETUP_TYPE = setuptools
+PYTHON_DTSCHEMA_LICENSE = BSD-2-Clause
+PYTHON_DTSCHEMA_LICENSE_FILES = LICENSE.txt
+PYTHON_DTSCHEMA_DEPENDENCIES = host-python-setuptools-scm
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
