Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBB72D767F2
	for <buildroot@archiver.kernel.org>; Thu, 31 Oct 2024 18:10:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 464AC60B30;
	Thu, 31 Oct 2024 18:10:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id olBY6-fFSuzn; Thu, 31 Oct 2024 18:10:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B592360AFD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B592360AFD;
	Thu, 31 Oct 2024 18:10:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 53C095E50
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 18:10:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 41177403C9
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 18:10:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bchORhkMgKvF for <buildroot@buildroot.org>;
 Thu, 31 Oct 2024 18:10:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F087840288
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F087840288
 for <buildroot@buildroot.org>; Thu, 31 Oct 2024 18:10:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E5D23851A9; Thu, 31 Oct 2024 18:10:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 31 Oct 2024 19:09:30 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 964102392b5babc10f2d344be07fd606ca76c0b7
X-Git-Newrev: 6293d383ecf4b79c7a7328a7f8c37aed20c6c420
X-Patchwork-Hint: ignore
Message-Id: <20241031181044.E5D23851A9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/i2c-tools: bump to version 4.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=6293d383ecf4b79c7a7328a7f8c37aed20c6c420
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop upstream patch.

Update README hash for text changes that are not related to license.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...smbus-Use-setuptools-instead-of-distutils.patch | 38 ----------------------
 package/i2c-tools/i2c-tools.hash                   |  4 +--
 package/i2c-tools/i2c-tools.mk                     |  2 +-
 3 files changed, 3 insertions(+), 41 deletions(-)

diff --git a/package/i2c-tools/0001-py-smbus-Use-setuptools-instead-of-distutils.patch b/package/i2c-tools/0001-py-smbus-Use-setuptools-instead-of-distutils.patch
deleted file mode 100644
index 63b2a7f82f..0000000000
--- a/package/i2c-tools/0001-py-smbus-Use-setuptools-instead-of-distutils.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From cf3541b8a7ed50782edd05836020d31230fb86c6 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@arm.com>
-Date: Wed, 19 Jan 2022 12:08:53 +0100
-Subject: py-smbus: Use setuptools instead of distutils
-
-As per [1], distutils is deprecated in Python 3.10 and will be removed
-entirely in Python 3.12.
-
-As setuptools is essentially an enhanced version of distutils, it's
-trivial to port to that.
-
-[1] https://docs.python.org/3/whatsnew/3.10.html#distutils-deprecated
-
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-Signed-off-by: Jean Delvare <jdelvare@suse.de>
-
-Upstream: https://git.kernel.org/pub/scm/utils/i2c-tools/i2c-tools.git/commit/?id=cf3541b8a7ed50782edd05836020d31230fb86c6
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- py-smbus/setup.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/py-smbus/setup.py b/py-smbus/setup.py
-index 28a4500..26db33a 100644
---- a/py-smbus/setup.py
-+++ b/py-smbus/setup.py
-@@ -1,6 +1,6 @@
- #!/usr/bin/env python
- 
--from distutils.core import setup, Extension
-+from setuptools import setup, Extension
- 
- setup(	name="smbus",
- 	version="1.1",
--- 
-cgit 
-
diff --git a/package/i2c-tools/i2c-tools.hash b/package/i2c-tools/i2c-tools.hash
index 9bfdacb3f1..bdefefa2cc 100644
--- a/package/i2c-tools/i2c-tools.hash
+++ b/package/i2c-tools/i2c-tools.hash
@@ -1,7 +1,7 @@
 # From https://www.kernel.org/pub/software/utils/i2c-tools/sha256sums.asc
-sha256  1f899e43603184fac32f34d72498fc737952dbc9c97a8dd9467fadfdf4600cf9  i2c-tools-4.3.tar.xz
+sha256  8b15f0a880ab87280c40cfd7235cfff28134bf14d5646c07518b1ff6642a2473  i2c-tools-4.4.tar.xz
 
 # License files
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
-sha256  2293b6e9076984d02184ff620baac557143e16cfa47d88f0a791d05a1271742c  README
+sha256  adcc60d0fdf7b4e2ad22fe8a29d65c260ad3fc619b3105439b70914df5f6b5a8  README
diff --git a/package/i2c-tools/i2c-tools.mk b/package/i2c-tools/i2c-tools.mk
index 99388d9537..43d82b4bbb 100644
--- a/package/i2c-tools/i2c-tools.mk
+++ b/package/i2c-tools/i2c-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-I2C_TOOLS_VERSION = 4.3
+I2C_TOOLS_VERSION = 4.4
 I2C_TOOLS_SOURCE = i2c-tools-$(I2C_TOOLS_VERSION).tar.xz
 I2C_TOOLS_SITE = https://www.kernel.org/pub/software/utils/i2c-tools
 I2C_TOOLS_LICENSE = GPL-2.0+, GPL-2.0 (py-smbus), LGPL-2.1+ (libi2c)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
