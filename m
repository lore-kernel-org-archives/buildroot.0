Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6092FC4321E
	for <buildroot@archiver.kernel.org>; Mon,  5 Dec 2022 12:19:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 13ADB81E43;
	Mon,  5 Dec 2022 12:19:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 13ADB81E43
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3yvjx84uMNp1; Mon,  5 Dec 2022 12:19:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2B39A81E1B;
	Mon,  5 Dec 2022 12:19:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2B39A81E1B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7BB7A1BF352
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:28:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A6B2A4074E
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:26:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A6B2A4074E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O_LQ8vRS-v57 for <buildroot@lists.busybox.net>;
 Mon,  5 Dec 2022 11:26:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B93EA408D4
 for <buildroot@buildroot.org>; Mon,  5 Dec 2022 11:26:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B93EA408D4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B18EA85B9B; Mon,  5 Dec 2022 11:26:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 24 Nov 2022 22:47:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f3aaa6fd2aa5ba132ba6f95a12fc463ed6f4d850
X-Git-Newrev: e52eb61842acb4a3b8a2d4b716ba673bc972cf89
X-Patchwork-Hint: ignore
Message-Id: <20221205112611.B18EA85B9B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-dicttoxml2: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=e52eb61842acb4a3b8a2d4b716ba673bc972cf89
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a maintained fork instead of the abandoned dicttoxml.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in                                |  1 +
 package/python-dicttoxml2/Config.in              |  8 ++++++++
 package/python-dicttoxml2/python-dicttoxml2.hash |  5 +++++
 package/python-dicttoxml2/python-dicttoxml2.mk   | 14 ++++++++++++++
 4 files changed, 28 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index cafd3b338c..7d227f8112 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1021,6 +1021,7 @@ menu "External python modules"
 	source "package/python-defusedxml/Config.in"
 	source "package/python-dialog3/Config.in"
 	source "package/python-dicttoxml/Config.in"
+	source "package/python-dicttoxml2/Config.in"
 	source "package/python-distro/Config.in"
 	source "package/python-django/Config.in"
 	source "package/python-django-enumfields/Config.in"
diff --git a/package/python-dicttoxml2/Config.in b/package/python-dicttoxml2/Config.in
new file mode 100644
index 0000000000..0bd8068dd6
--- /dev/null
+++ b/package/python-dicttoxml2/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_PYTHON_DICTTOXML2
+	bool "python-dicttoxml2"
+	select BR2_PACKAGE_PYTHON3_PYEXPAT
+	help
+	  Converts a Python dictionary or other native data type into
+	  a valid XML string.
+
+	  https://github.com/Ousret/dicttoxml
diff --git a/package/python-dicttoxml2/python-dicttoxml2.hash b/package/python-dicttoxml2/python-dicttoxml2.hash
new file mode 100644
index 0000000000..7f584cc000
--- /dev/null
+++ b/package/python-dicttoxml2/python-dicttoxml2.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/dicttoxml2/json
+md5  787ea4b80cd6234a41c016e8efa7ff40  dicttoxml2-2.1.0.tar.gz
+sha256  67cb729f337dd752808c021b70c8df8a34f84b9e111a5dbaa37e000eeaf4d462  dicttoxml2-2.1.0.tar.gz
+# Locally computed
+sha256 4514114bd9da0b2fbf8c4fa264c0e6cc80fd41e6ac7f09d7a39a215662951c7c  LICENCE.txt
diff --git a/package/python-dicttoxml2/python-dicttoxml2.mk b/package/python-dicttoxml2/python-dicttoxml2.mk
new file mode 100644
index 0000000000..d2abe63860
--- /dev/null
+++ b/package/python-dicttoxml2/python-dicttoxml2.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-dicttoxml2
+#
+################################################################################
+
+PYTHON_DICTTOXML2_VERSION = 2.1.0
+PYTHON_DICTTOXML2_SOURCE = dicttoxml2-$(PYTHON_DICTTOXML2_VERSION).tar.gz
+PYTHON_DICTTOXML2_SITE = https://files.pythonhosted.org/packages/0b/24/7a6d37b2770843e34685e470fd711955cb0f77c354c73d8ca64b02420bce
+PYTHON_DICTTOXML2_SETUP_TYPE = setuptools
+PYTHON_DICTTOXML2_LICENSE = GPL-2.0
+PYTHON_DICTTOXML2_LICENSE_FILES = LICENCE.txt
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
