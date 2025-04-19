Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7532FC369C9
	for <buildroot@archiver.kernel.org>; Sat, 19 Apr 2025 21:47:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 343C24050A;
	Sat, 19 Apr 2025 21:47:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4UazyDigN-rT; Sat, 19 Apr 2025 21:47:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 62A834056F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 62A834056F;
	Sat, 19 Apr 2025 21:47:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6472E22F
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 21:47:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4A6F881364
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 21:47:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 13aPNlPzQ6nu for <buildroot@buildroot.org>;
 Sat, 19 Apr 2025 21:47:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 783FB81366
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 783FB81366
 for <buildroot@buildroot.org>; Sat, 19 Apr 2025 21:47:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 643EA85D6D; Sat, 19 Apr 2025 21:47:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 19 Apr 2025 23:46:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: eb685196cdf557e6e7554852be31b6189ede368e
X-Git-Newrev: 09bf1365f138ea22f2b9b64fc317ce6808d73d9a
X-Patchwork-Hint: ignore
Message-Id: <20250419214741.643EA85D6D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-cachelib: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=09bf1365f138ea22f2b9b64fc317ce6808d73d9a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Provides caching APIs.
https://cachelib.readthedocs.io/en/stable/

Signed-off-by: Daniel Crowe <daniel.crowe@maxmine.com.au>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                   |  3 +++
 package/Config.in                            |  1 +
 package/python-cachelib/Config.in            |  6 ++++++
 package/python-cachelib/python-cachelib.hash |  6 ++++++
 package/python-cachelib/python-cachelib.mk   | 14 ++++++++++++++
 5 files changed, 30 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 3a2797d7ec..d0561a10de 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -728,6 +728,9 @@ F:	configs/odroidc2_defconfig
 F:	package/meson-tools/
 F:	package/odroidc2-firmware/
 
+N:	Daniel Crowe <daniel.crowe@maxmine.com.au>
+F:	package/python-cachelib/
+
 N:	Daniel J. Leach <dleach@belcan.com>
 F:	package/dacapo/
 
diff --git a/package/Config.in b/package/Config.in
index 46e8a5c8e3..2d4ef81a2c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1037,6 +1037,7 @@ menu "External python modules"
 	source "package/python-brotli/Config.in"
 	source "package/python-bsdiff4/Config.in"
 	source "package/python-cached-property/Config.in"
+	source "package/python-cachelib/Config.in"
 	source "package/python-cachetools/Config.in"
 	source "package/python-can/Config.in"
 	source "package/python-canopen/Config.in"
diff --git a/package/python-cachelib/Config.in b/package/python-cachelib/Config.in
new file mode 100644
index 0000000000..c17454c4be
--- /dev/null
+++ b/package/python-cachelib/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_CACHELIB
+	bool "python-cachelib"
+	help
+	  A collection of cache libraries in the same API interface.
+
+	  https://github.com/pallets-eco/cachelib/
diff --git a/package/python-cachelib/python-cachelib.hash b/package/python-cachelib/python-cachelib.hash
new file mode 100644
index 0000000000..6a50350aa1
--- /dev/null
+++ b/package/python-cachelib/python-cachelib.hash
@@ -0,0 +1,6 @@
+# md5, sha256 from https://pypi.org/pypi/cachelib/json
+md5  fc25e9c9165cd5fd42ce282c2ba540fd  cachelib-0.13.0.tar.gz
+sha256  209d8996e3c57595bee274ff97116d1d73c4980b2fd9a34c7846cd07fd2e1a48  cachelib-0.13.0.tar.gz
+# Locally computed sha256 checksums
+sha256  cd418120812dc2626281ae027e81b648229d166b5aca7472cecd510038d36e7d  LICENSE.rst
+sha256  c9362a7258a11c84a8f7e825ccbbb5c425c6fc02368d3aee6494533fb99ba1f4  docs/license.rst
diff --git a/package/python-cachelib/python-cachelib.mk b/package/python-cachelib/python-cachelib.mk
new file mode 100644
index 0000000000..7361a21f4f
--- /dev/null
+++ b/package/python-cachelib/python-cachelib.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-cachelib
+#
+################################################################################
+
+PYTHON_CACHELIB_VERSION = 0.13.0
+PYTHON_CACHELIB_SOURCE = cachelib-$(PYTHON_CACHELIB_VERSION).tar.gz
+PYTHON_CACHELIB_SITE = https://files.pythonhosted.org/packages/1d/69/0b5c1259e12fbcf5c2abe5934b5c0c1294ec0f845e2b4b2a51a91d79a4fb
+PYTHON_CACHELIB_SETUP_TYPE = setuptools
+PYTHON_CACHELIB_LICENSE = BSD-3-Clause
+PYTHON_CACHELIB_LICENSE_FILES = LICENSE.rst docs/license.rst
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
