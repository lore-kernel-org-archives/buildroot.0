Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83AC6C52D6F
	for <buildroot@archiver.kernel.org>; Tue,  6 Aug 2024 11:59:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E22A960829;
	Tue,  6 Aug 2024 11:59:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F0dpibaHRhH4; Tue,  6 Aug 2024 11:59:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D77BC6082B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D77BC6082B;
	Tue,  6 Aug 2024 11:59:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1CF951BF2E4
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 11:59:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0A9B2805A9
 for <buildroot@lists.busybox.net>; Tue,  6 Aug 2024 11:59:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I2QeXvoV_nWN for <buildroot@lists.busybox.net>;
 Tue,  6 Aug 2024 11:59:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E8E980594
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1E8E980594
 for <buildroot@buildroot.org>; Tue,  6 Aug 2024 11:59:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 140B484138; Tue,  6 Aug 2024 11:59:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Aug 2024 13:23:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f00b18c48aa7e1fdf68ac49a1d143eb664c05826
X-Git-Newrev: d70bbedd0d284744521ca3bc68984f6d8057ee50
X-Patchwork-Hint: ignore
Message-Id: <20240806115938.140B484138@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/crudini: bump to 0.9.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=d70bbedd0d284744521ca3bc68984f6d8057ee50
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removing backported patch and introducing new dependency
setuptools-scm.
As setuptools-scm doesn't work with github release tarballs, also
switching back to download the tarball from pypi...

Signed-off-by: Zoltan Gyarmati <zgyarmati@zgyarmati.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/crudini/0001-prefer-shlex-over-pipes.patch | 41 ----------------------
 package/crudini/crudini.hash                       |  3 +-
 package/crudini/crudini.mk                         |  7 ++--
 3 files changed, 6 insertions(+), 45 deletions(-)

diff --git a/package/crudini/0001-prefer-shlex-over-pipes.patch b/package/crudini/0001-prefer-shlex-over-pipes.patch
deleted file mode 100644
index 16296f619f..0000000000
--- a/package/crudini/0001-prefer-shlex-over-pipes.patch
+++ /dev/null
@@ -1,41 +0,0 @@
-From d81b703f3e8e29c1547386135c7e9ca539c1f054 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?P=C3=A1draig=20Brady?= <P@draigBrady.com>
-Date: Tue, 2 Aug 2022 14:40:37 +0100
-Subject: [PATCH] prefer shlex over pipes
-
-pipes is deprecated since python 3.10
-and slated for removal in python 3.13
-
-[Romain backport to 0.9.3]
-Upstream: https://github.com/pixelb/crudini/commit/e1650941054822faad4cda788bff6fe364eb4ca3
-Signed-off-by: Romain Naour <romain.naour@smile.fr>
----
- crudini | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/crudini b/crudini
-index 669596b..a136241 100755
---- a/crudini
-+++ b/crudini
-@@ -17,15 +17,17 @@ import getopt
- import hashlib
- import iniparse
- import os
--import pipes
-+import re
- import shutil
- import string
- import tempfile
- 
- if sys.version_info[0] >= 3:
-+    import shlex as pipes
-     from io import StringIO
-     import configparser
- else:
-+    import pipes
-     from cStringIO import StringIO
-     import ConfigParser as configparser
- 
--- 
-2.34.3
-
diff --git a/package/crudini/crudini.hash b/package/crudini/crudini.hash
index 6f2563dfdd..5b92c0e4da 100644
--- a/package/crudini/crudini.hash
+++ b/package/crudini/crudini.hash
@@ -1,3 +1,4 @@
+# from https://pypi.org/project/crudini/#files
+sha256  59ae650f45af82a64afc33eb876909ee0c4888dc4e8711ef59731c1edfda5e24  crudini-0.9.5.tar.gz
 # locally computed
-sha256  e1b8125ac4373ece3bb0bb047ba9336e5bd55ed5d56b9729968058c9385ab546  crudini-0.9.3.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/crudini/crudini.mk b/package/crudini/crudini.mk
index 48e0ebde8f..0f5cfcedd9 100644
--- a/package/crudini/crudini.mk
+++ b/package/crudini/crudini.mk
@@ -4,14 +4,15 @@
 #
 ################################################################################
 
-CRUDINI_VERSION = 0.9.3
-CRUDINI_SITE = $(call github,pixelb,crudini,$(CRUDINI_VERSION))
+CRUDINI_VERSION = 0.9.5
+CRUDINI_SITE = https://files.pythonhosted.org/packages/32/67/c4e838930e2f434db08d6a6aadffca3d14e7455d1c2c2332e22003ad453d
 CRUDINI_SETUP_TYPE = setuptools
+CRUDINI_DEPENDENCIES = host-python-setuptools-scm
 CRUDINI_LICENSE = GPL-2.0
 CRUDINI_LICENSE_FILES = COPYING
 # This is a runtime dependency, but we don't have the concept of
 # runtime dependencies for host packages.
-HOST_CRUDINI_DEPENDENCIES = host-python-iniparse
+HOST_CRUDINI_DEPENDENCIES = host-python-iniparse host-python-setuptools-scm
 
 $(eval $(python-package))
 $(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
