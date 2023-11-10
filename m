Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0749CC4332F
	for <buildroot@archiver.kernel.org>; Fri, 10 Nov 2023 21:06:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B365C4285A;
	Fri, 10 Nov 2023 21:06:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B365C4285A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cFQB32NlvEAQ; Fri, 10 Nov 2023 21:06:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC2F54218B;
	Fri, 10 Nov 2023 21:06:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC2F54218B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1A9721BF41B
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 21:05:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 003DF6101F
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 21:05:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 003DF6101F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0boRxmk51dhk for <buildroot@lists.busybox.net>;
 Fri, 10 Nov 2023 21:05:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 123006F6FF
 for <buildroot@buildroot.org>; Fri, 10 Nov 2023 21:05:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 123006F6FF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0240386FCE; Fri, 10 Nov 2023 21:05:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 10 Nov 2023 22:01:47 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2a36024a6301826d90ce3375e11724008e659a9b
X-Git-Newrev: 94e985fdc35cbc149f9d31e247b3787db6b35905
X-Patchwork-Hint: ignore
Message-Id: <20231110210508.0240386FCE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-jsonschema-specifications:
 new package
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=94e985fdc35cbc149f9d31e247b3787db6b35905
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/Config.in                                       |  1 +
 package/python-jsonschema-specifications/Config.in      |  9 +++++++++
 .../python-jsonschema-specifications.hash               |  5 +++++
 .../python-jsonschema-specifications.mk                 | 17 +++++++++++++++++
 4 files changed, 32 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 967091081d..10d6393523 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1133,6 +1133,7 @@ menu "External python modules"
 	source "package/python-json-schema-validator/Config.in"
 	source "package/python-jsonmodels/Config.in"
 	source "package/python-jsonschema/Config.in"
+	source "package/python-jsonschema-specifications/Config.in"
 	source "package/python-keyring/Config.in"
 	source "package/python-kiwisolver/Config.in"
 	source "package/python-kmod/Config.in"
diff --git a/package/python-jsonschema-specifications/Config.in b/package/python-jsonschema-specifications/Config.in
new file mode 100644
index 0000000000..31453a12ea
--- /dev/null
+++ b/package/python-jsonschema-specifications/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_JSONSCHEMA_SPECIFICATIONS
+	bool "python-jsonschema-specifications"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-referencing -> python-rpds-py
+	select BR2_PACKAGE_PYTHON_REFERENCING # runtime
+	help
+	  The JSON Schema meta-schemas and vocabularies, exposed as a
+	  Registry.
+
+	  https://github.com/python-jsonschema/jsonschema-specifications
diff --git a/package/python-jsonschema-specifications/python-jsonschema-specifications.hash b/package/python-jsonschema-specifications/python-jsonschema-specifications.hash
new file mode 100644
index 0000000000..5aaba45210
--- /dev/null
+++ b/package/python-jsonschema-specifications/python-jsonschema-specifications.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/jsonschema-specifications/json
+md5  d37762167688d8a05024b92dc8a1e20f  jsonschema_specifications-2023.7.1.tar.gz
+sha256  c91a50404e88a1f6ba40636778e2ee08f6e24c5613fe4c53ac24578a5a7f72bb  jsonschema_specifications-2023.7.1.tar.gz
+# Locally computed sha256 checksums
+sha256  42dcd63495f87b4eb7c7757afa379bb55a53f94afd7a5f657d9adf57236e515c  COPYING
diff --git a/package/python-jsonschema-specifications/python-jsonschema-specifications.mk b/package/python-jsonschema-specifications/python-jsonschema-specifications.mk
new file mode 100644
index 0000000000..7a19eee423
--- /dev/null
+++ b/package/python-jsonschema-specifications/python-jsonschema-specifications.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# python-jsonschema-specifications
+#
+################################################################################
+
+PYTHON_JSONSCHEMA_SPECIFICATIONS_VERSION = 2023.7.1
+PYTHON_JSONSCHEMA_SPECIFICATIONS_SOURCE = jsonschema_specifications-$(PYTHON_JSONSCHEMA_SPECIFICATIONS_VERSION).tar.gz
+PYTHON_JSONSCHEMA_SPECIFICATIONS_SITE = https://files.pythonhosted.org/packages/12/ce/eb5396b34c28cbac19a6a8632f0e03d309135d77285536258b82120198d8
+PYTHON_JSONSCHEMA_SPECIFICATIONS_SETUP_TYPE = pep517
+PYTHON_JSONSCHEMA_SPECIFICATIONS_LICENSE = MIT
+PYTHON_JSONSCHEMA_SPECIFICATIONS_LICENSE_FILES = COPYING
+PYTHON_JSONSCHEMA_SPECIFICATIONS_DEPENDENCIES = \
+	host-python-hatchling \
+	host-python-hatch-vcs
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
