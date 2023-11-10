Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F223C4332F
	for <buildroot@archiver.kernel.org>; Fri, 10 Nov 2023 21:05:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A3E94218B;
	Fri, 10 Nov 2023 21:05:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A3E94218B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l9W1709H8gTe; Fri, 10 Nov 2023 21:05:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5BC4E42858;
	Fri, 10 Nov 2023 21:05:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5BC4E42858
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1AB111BF99A
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 21:05:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D70626F70E
 for <buildroot@lists.busybox.net>; Fri, 10 Nov 2023 21:05:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D70626F70E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i-IN0T3Oerdu for <buildroot@lists.busybox.net>;
 Fri, 10 Nov 2023 21:05:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 076456F6F7
 for <buildroot@buildroot.org>; Fri, 10 Nov 2023 21:05:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 076456F6F7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E87AF86FCB; Fri, 10 Nov 2023 21:05:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 10 Nov 2023 22:01:46 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: aaa315b6a7171f0239676964d524bd19b18219dc
X-Git-Newrev: 2a36024a6301826d90ce3375e11724008e659a9b
X-Patchwork-Hint: ignore
Message-Id: <20231110210507.E87AF86FCB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-referencing: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=2a36024a6301826d90ce3375e11724008e659a9b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/Config.in                                  |  1 +
 package/python-referencing/Config.in               |  9 +++++++++
 package/python-referencing/python-referencing.hash |  5 +++++
 package/python-referencing/python-referencing.mk   | 17 +++++++++++++++++
 4 files changed, 32 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index dac5058bbe..967091081d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1276,6 +1276,7 @@ menu "External python modules"
 	source "package/python-redis/Config.in"
 	source "package/python-reedsolo/Config.in"
 	source "package/python-reentry/Config.in"
+	source "package/python-referencing/Config.in"
 	source "package/python-regex/Config.in"
 	source "package/python-remi/Config.in"
 	source "package/python-request-id/Config.in"
diff --git a/package/python-referencing/Config.in b/package/python-referencing/Config.in
new file mode 100644
index 0000000000..273c42543e
--- /dev/null
+++ b/package/python-referencing/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PYTHON_REFERENCING
+	bool "python-referencing"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-rpds-py
+	select BR2_PACKAGE_PYTHON_ATTRS # runtime
+	select BR2_PACKAGE_PYTHON_RPDS_PY # runtime
+	help
+	  JSON Referencing + Python.
+
+	  https://github.com/python-jsonschema/referencing
diff --git a/package/python-referencing/python-referencing.hash b/package/python-referencing/python-referencing.hash
new file mode 100644
index 0000000000..d4f3dce5a4
--- /dev/null
+++ b/package/python-referencing/python-referencing.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/referencing/json
+md5  617d973b9ce86b6f74b2216c6f3af5c9  referencing-0.30.2.tar.gz
+sha256  794ad8003c65938edcdbc027f1933215e0d0ccc0291e3ce20a4d87432b59efc0  referencing-0.30.2.tar.gz
+# Locally computed sha256 checksums
+sha256  42dcd63495f87b4eb7c7757afa379bb55a53f94afd7a5f657d9adf57236e515c  COPYING
diff --git a/package/python-referencing/python-referencing.mk b/package/python-referencing/python-referencing.mk
new file mode 100644
index 0000000000..4d11c99deb
--- /dev/null
+++ b/package/python-referencing/python-referencing.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# python-referencing
+#
+################################################################################
+
+PYTHON_REFERENCING_VERSION = 0.30.2
+PYTHON_REFERENCING_SOURCE = referencing-$(PYTHON_REFERENCING_VERSION).tar.gz
+PYTHON_REFERENCING_SITE = https://files.pythonhosted.org/packages/e1/43/d3f6cf3e1ec9003520c5fb31dc363ee488c517f09402abd2a1c90df63bbb
+PYTHON_REFERENCING_SETUP_TYPE = pep517
+PYTHON_REFERENCING_LICENSE = MIT
+PYTHON_REFERENCING_LICENSE_FILES = COPYING
+PYTHON_REFERENCING_DEPENDENCIES = \
+	host-python-hatchling \
+	host-python-hatch-vcs
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
