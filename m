Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2695FC617E
	for <buildroot@archiver.kernel.org>; Sat,  3 Jan 2026 12:18:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6023981E3C;
	Sat,  3 Jan 2026 12:18:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8nob5SlNKwyE; Sat,  3 Jan 2026 12:18:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 59FD181E40
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767442729;
	bh=nohAa1ad2ezso2860Jtu0ASseFuh4Vs0vza9kUWwrzI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=mXlWZm4IJQ2M93cQYmzgDgzeZHhsQV2c3V7jibsVVTjgEGAKMiNqSw35CGEMyc8aL
	 FBxmySkYucOJncKaRhzb2s981aB5sTALPSklHn9H8kjo2We3BwAd1zD4kdVcQ/CGvR
	 f7h3dHxaPRimEpO+wcTWr1F4/gyUcNqDm91NTIxpl/NA3bG6IGjp1FMX4nN59vANQR
	 cd6WQhdkiFbIfNUx75StXzdv8USy+ehnWfr3u2E0nl9SfmCQVbreUIkMkg8OcH/Sgo
	 w9qRHLWh/rSfFklDWAGXpdt+8n+VoQ/W4LduOhUtG9Urm9k63vtQvuXQlak5ns0r91
	 nTHTZDcFyeUpw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 59FD181E40;
	Sat,  3 Jan 2026 12:18:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 994FFA21
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 12:18:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 804164083E
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 12:18:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YwGex89Whl-U for <buildroot@buildroot.org>;
 Sat,  3 Jan 2026 12:18:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD91B407F7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BD91B407F7
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 12:18:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B375A8813C; Sat,  3 Jan 2026 12:18:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Jan 2026 13:12:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 79df2f2e57b9d38c507f55cd3dbfb8b8af6b322f
X-Git-Newrev: 01cd953a3eb1a97977c19d312fa27f033da2f80d
X-Patchwork-Hint: ignore
Message-Id: <20260103121846.B375A8813C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-iptables: bump to version
 1.2.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=01cd953a3eb1a97977c19d312fa27f033da2f80d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patch which is no longer required.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...config-get_path-instead-of-get_python_lib.patch | 40 ----------------------
 package/python-iptables/python-iptables.hash       |  7 ++--
 package/python-iptables/python-iptables.mk         |  5 +--
 3 files changed, 6 insertions(+), 46 deletions(-)

diff --git a/package/python-iptables/0001-use-sysconfig-get_path-instead-of-get_python_lib.patch b/package/python-iptables/0001-use-sysconfig-get_path-instead-of-get_python_lib.patch
deleted file mode 100644
index 2a4de3daf2..0000000000
--- a/package/python-iptables/0001-use-sysconfig-get_path-instead-of-get_python_lib.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From fd415a3613fad872062fb7cb4e271ac1476402ef Mon Sep 17 00:00:00 2001
-From: Adam Duskett <adam.duskett@amarulasolutions.com>
-Date: Tue, 24 Oct 2023 08:47:12 +0200
-Subject: [PATCH] use sysconfig.get_path instead of get_python_lib
-
-Distutils has been removed from python 3.12.0. Use sysconfig.get_path instead
-of get_python_lib.
-
-Upstream: https://github.com/ldx/python-iptables/pull/340
-
-Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
----
- iptc/util.py | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/iptc/util.py b/iptc/util.py
-index 04fe905..94befc5 100644
---- a/iptc/util.py
-+++ b/iptc/util.py
-@@ -3,7 +3,7 @@ import os
- import sys
- import ctypes
- import ctypes.util
--from distutils.sysconfig import get_python_lib
-+import sysconfig
- from itertools import product
- from subprocess import Popen, PIPE
- from sys import version_info
-@@ -64,7 +64,7 @@ def _do_find_library(name):
- 
-     # probably we have been installed in a virtualenv
-     try:
--        lib = ctypes.CDLL(os.path.join(get_python_lib(), name),
-+        lib = ctypes.CDLL(os.path.join(sysconfig.get_path("purelib"), name),
-                           mode=ctypes.RTLD_GLOBAL)
-         return lib
-     except:
--- 
-2.41.0
-
diff --git a/package/python-iptables/python-iptables.hash b/package/python-iptables/python-iptables.hash
index 1b7c9e9324..e1d66aa691 100644
--- a/package/python-iptables/python-iptables.hash
+++ b/package/python-iptables/python-iptables.hash
@@ -1,6 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-iptables/json
-md5  bd6950c1ed9c6b48b7d552ff8e6766c5  python-iptables-1.0.1.tar.gz
-sha256  1989f2b48598392c3574052a95f456985cb06fb4287b61bf8794e93ebc37eddb  python-iptables-1.0.1.tar.gz
-
-# Locally calculated
+md5  b93381df79a3d6f61040f399cb2bd57c  python_iptables-1.2.0.tar.gz
+sha256  60f120d548f6d940f682f2c78851956018588936de05b9d5d338c3cb9bb47ca2  python_iptables-1.2.0.tar.gz
+# Locally computed sha256 checksums
 sha256  b827789c74144d9bb92595ed3bc568aef767a7e8d930fba61c2cdd9f6ec27599  NOTICE
diff --git a/package/python-iptables/python-iptables.mk b/package/python-iptables/python-iptables.mk
index d01545d8b2..21698a0458 100644
--- a/package/python-iptables/python-iptables.mk
+++ b/package/python-iptables/python-iptables.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-PYTHON_IPTABLES_VERSION = 1.0.1
-PYTHON_IPTABLES_SITE = https://files.pythonhosted.org/packages/35/e4/33e639b9e153c2d798d73342a96715a4edca6f46431d763b275a34b3aeca
+PYTHON_IPTABLES_VERSION = 1.2.0
+PYTHON_IPTABLES_SOURCE = python_iptables-$(PYTHON_IPTABLES_VERSION).tar.gz
+PYTHON_IPTABLES_SITE = https://files.pythonhosted.org/packages/55/3c/a2626b88fffb5bcebae80a2dca1e09ff539ab454a8e5fb2e50141943a1f8
 PYTHON_IPTABLES_SETUP_TYPE = setuptools
 PYTHON_IPTABLES_LICENSE = Apache-2.0
 PYTHON_IPTABLES_LICENSE_FILES = NOTICE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
