Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9683C4332F
	for <buildroot@archiver.kernel.org>; Thu,  9 Nov 2023 21:28:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 985CB420A9;
	Thu,  9 Nov 2023 21:28:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 985CB420A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OXyLtLpTZSYB; Thu,  9 Nov 2023 21:28:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB019420A2;
	Thu,  9 Nov 2023 21:28:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB019420A2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CDDE71BF990
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 21:28:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A76044208F
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 21:28:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A76044208F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wlYgBHEjgZtE for <buildroot@lists.busybox.net>;
 Thu,  9 Nov 2023 21:28:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D866D42088
 for <buildroot@buildroot.org>; Thu,  9 Nov 2023 21:28:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D866D42088
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C445386EA3; Thu,  9 Nov 2023 21:28:38 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 9 Nov 2023 22:26:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e5467ad9f5b47d0672b42f28d65a2197a65dca07
X-Git-Newrev: 2add559e506e0af92beb2841c07db038ea48127a
X-Patchwork-Hint: ignore
Message-Id: <20231109212838.C445386EA3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-kmod: new package
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2add559e506e0af92beb2841c07db038ea48127a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package is currently used in Fedora39 to provide python bindings
for kmod, and it is Python 3.12.0 compatible.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
[yann.morin.1998@free.fr: LGPL in in COPYING.LESSER]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 DEVELOPERS                           |  1 +
 package/Config.in                    |  1 +
 package/python-kmod/Config.in        | 12 ++++++++++++
 package/python-kmod/python-kmod.hash |  3 +++
 package/python-kmod/python-kmod.mk   | 16 ++++++++++++++++
 5 files changed, 33 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 12257fae8c..d80931e84a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -37,6 +37,7 @@ F:	package/flutter-engine/
 F:	package/flutter-gallery/
 F:	package/flutter-pi/
 F:	package/flutter-sdk-bin/
+F:	package/python-kmod/
 F:	support/testing/tests/package/test_firewalld.py
 F:	support/testing/tests/package/test_flutter.py
 
diff --git a/package/Config.in b/package/Config.in
index ce46d30fed..56e793ceae 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1135,6 +1135,7 @@ menu "External python modules"
 	source "package/python-jsonschema/Config.in"
 	source "package/python-keyring/Config.in"
 	source "package/python-kiwisolver/Config.in"
+	source "package/python-kmod/Config.in"
 	source "package/python-lark/Config.in"
 	source "package/python-libconfig/Config.in"
 	source "package/python-libevdev/Config.in"
diff --git a/package/python-kmod/Config.in b/package/python-kmod/Config.in
new file mode 100644
index 0000000000..244baee3a0
--- /dev/null
+++ b/package/python-kmod/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_PYTHON_KMOD
+	bool "python-kmod"
+	depends on !BR2_STATIC_LIBS # kmod
+	select BR2_PACKAGE_HOST_PYTHON_CYTHON
+	select BR2_PACKAGE_KMOD
+	help
+	  Python binding for kmod
+
+	  https://github.com/maurizio-lombardi/python-kmod
+
+comment "python-kmod needs a toolchain w/ dynamic library"
+	depends on BR2_STATIC_LIBS
diff --git a/package/python-kmod/python-kmod.hash b/package/python-kmod/python-kmod.hash
new file mode 100644
index 0000000000..b838914c19
--- /dev/null
+++ b/package/python-kmod/python-kmod.hash
@@ -0,0 +1,3 @@
+# Locally computed sha256 checksums
+sha256  0100ff27b7030a73e68ec07829d6123f412ce195dc761b954c92a38d18ba8539  python-kmod-0.9.2.tar.gz
+sha256  1a136f227d8318af7d2320dad880a9f1a057c08cff044b545bb33430ab9c6860  COPYING.LESSER
diff --git a/package/python-kmod/python-kmod.mk b/package/python-kmod/python-kmod.mk
new file mode 100644
index 0000000000..337a61491f
--- /dev/null
+++ b/package/python-kmod/python-kmod.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# python-kmod
+#
+################################################################################
+
+# The python-kmod package listed at https://pypi.org/project/kmod/#description
+# is not the same as the one listed below.
+PYTHON_KMOD_VERSION = 0.9.2
+PYTHON_KMOD_SITE = $(call github,maurizio-lombardi,python-kmod,v$(PYTHON_KMOD_VERSION))
+PYTHON_KMOD_SETUP_TYPE = setuptools
+PYTHON_KMOD_LICENSE = LGPL-2.1+
+PYTHON_KMOD_LICENSE_FILES = COPYING.LESSER
+PYTHON_KMOD_DEPENDENCIES = host-python-cython kmod
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
