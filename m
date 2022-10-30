Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11BB1C38A02
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 14:06:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8CBFE4033B;
	Sun, 30 Oct 2022 14:06:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8CBFE4033B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K8oz1wGqfsbZ; Sun, 30 Oct 2022 14:06:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A162402C3;
	Sun, 30 Oct 2022 14:06:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A162402C3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6F96B1BF957
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 14:05:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4B7EE403AA
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 14:05:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4B7EE403AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p5hN4ZG4uZRk for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 14:05:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 49D8540352
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 14:05:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 49D8540352
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 385AD87511; Sun, 30 Oct 2022 14:05:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Oct 2022 15:03:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f3f71a4f6cede1b3461deccdf99c06017df56afa
X-Git-Newrev: a855e21bcbcabfc6fec0c1c34bc3346180031a34
X-Patchwork-Hint: ignore
Message-Id: <20221030140545.385AD87511@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-ujson: bump to version 5.5.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=a855e21bcbcabfc6fec0c1c34bc3346180031a34
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switch to now supported system double-conversion library.

Disable built in strip so that stripping is handled by buildroot.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-ujson/Config.in         |  3 ++-
 package/python-ujson/python-ujson.hash |  4 ++--
 package/python-ujson/python-ujson.mk   | 10 +++++++---
 3 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/package/python-ujson/Config.in b/package/python-ujson/Config.in
index 7af03e6497..31b4d484d8 100644
--- a/package/python-ujson/Config.in
+++ b/package/python-ujson/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PYTHON_UJSON
 	bool "python-ujson"
-	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_INSTALL_LIBSTDCPP # double-conversion
+	select BR2_PACKAGE_DOUBLE_CONVERSION
 	help
 	  UltraJSON is an ultra fast JSON encoder and decoder written
 	  in pure C with bindings for Python 3.
diff --git a/package/python-ujson/python-ujson.hash b/package/python-ujson/python-ujson.hash
index e88e273145..27df5aa355 100644
--- a/package/python-ujson/python-ujson.hash
+++ b/package/python-ujson/python-ujson.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/ujson/json
-md5  2c7ffd2bf23f6f07da3a0cbf5ff5c2f0  ujson-5.2.0.tar.gz
-sha256  163191b88842d874e081707d35de2e205e0e396e70fd068d1038879bca8b17ad  ujson-5.2.0.tar.gz
+md5  73b42e3f4bf3130073cfffbd82608275  ujson-5.5.0.tar.gz
+sha256  b25077a971c7da47bd6846a912a747f6963776d90720c88603b1b55d81790780  ujson-5.5.0.tar.gz
 # Locally computed sha256 checksums
 sha256  6a00a8f8b4050303368b694147bde1aed9c96bdff869c181dbbf3ccb784a1501  LICENSE.txt
diff --git a/package/python-ujson/python-ujson.mk b/package/python-ujson/python-ujson.mk
index 8eb5f6a0a7..95cb0ebad1 100644
--- a/package/python-ujson/python-ujson.mk
+++ b/package/python-ujson/python-ujson.mk
@@ -4,12 +4,16 @@
 #
 ################################################################################
 
-PYTHON_UJSON_VERSION = 5.2.0
+PYTHON_UJSON_VERSION = 5.5.0
 PYTHON_UJSON_SOURCE = ujson-$(PYTHON_UJSON_VERSION).tar.gz
-PYTHON_UJSON_SITE = https://files.pythonhosted.org/packages/e4/fc/2dee0e78162aa1ad03dadde9a9b5c281d6f8bb0eed6810a270486d8fc041
+PYTHON_UJSON_SITE = https://files.pythonhosted.org/packages/6e/4a/03ddad85a10dd52e209993a14afa0cb0dc5c348e4647329f1c53856ad9e6
 PYTHON_UJSON_SETUP_TYPE = setuptools
 PYTHON_UJSON_LICENSE = BSD-3-Clause
 PYTHON_UJSON_LICENSE_FILES = LICENSE.txt
-PYTHON_UJSON_DEPENDENCIES = host-python-setuptools-scm
+PYTHON_UJSON_DEPENDENCIES = host-python-setuptools-scm double-conversion
+PYTHON_UJSON_ENV = \
+	UJSON_BUILD_DC_INCLUDES="$(STAGING_DIR)/usr/include/double-conversion" \
+	UJSON_BUILD_DC_LIBS="-ldouble-conversion" \
+	UJSON_BUILD_NO_STRIP=1
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
