Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEAF2D5CCAF
	for <buildroot@archiver.kernel.org>; Wed, 30 Oct 2024 13:34:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6574C405B3;
	Wed, 30 Oct 2024 13:34:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cTYVcKlEPSJa; Wed, 30 Oct 2024 13:34:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E1690403EF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1690403EF;
	Wed, 30 Oct 2024 13:34:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2D0025E50
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 13:34:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1B1CF403EF
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 13:34:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CVGrMAGy9jK7 for <buildroot@buildroot.org>;
 Wed, 30 Oct 2024 13:34:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=194.117.254.33;
 helo=mail.zeus03.de; envelope-from=wsa+renesas@sang-engineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4FF64403C7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4FF64403C7
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4FF64403C7
 for <buildroot@buildroot.org>; Wed, 30 Oct 2024 13:34:11 +0000 (UTC)
Received: (qmail 3088006 invoked from network); 30 Oct 2024 14:34:08 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 30 Oct 2024 14:34:08 +0100
X-UD-Smtp-Session: l3s3148p1@TnSiwbElEtbAwtcC
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: buildroot@buildroot.org
Date: Wed, 30 Oct 2024 15:33:32 +0200
Message-ID: <20241030133332.505377-2-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 sang-engineering.com; h=from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding; s=k1; bh=3NAgC3fVc2MY+L
 AJIhStncHl2DqXy2LEX4oWpbmWHCI=; b=bjFQEOnKoM4zl+qHyzOON3GjzPsv1Q
 T5IIVNRTTB0gQDGaLWm/dcuWdEtP9/qPpP6dknrB/cOHZATY0puuRQgnTgFj5VHD
 yJ+gthZrlG7QbP56x0DjrG2AJh0jijjIR4EkHS9BN+z592sihGFvyr9TLiUXmFYg
 1VfrsjjRuDE8EV21cYIdQuEdKNlV7OP1wHBZSOloRZ+fvBwA9GQeAq8oNv5b+/QI
 ffJ115t64pXP0gxCuRXCh/qcKFUYuoLmIpntpIKiwepF01EpWcQ5AuWw8tbtqJvO
 JCbnmEpDSq6aBWxtXVS8A5LVAH5KLUBhuUgmPlGZfwfgJjYUbuH89nGg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=sang-engineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com
 header.a=rsa-sha256 header.s=k1 header.b=bjFQEOnK
Subject: [Buildroot] [PATCH] package/i2c-tools: bump to version 4.4
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
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop upstream patch.

Update README hash for text changes that are not related to license.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

Now I subscribed to the list...

 ...-Use-setuptools-instead-of-distutils.patch | 38 -------------------
 package/i2c-tools/i2c-tools.hash              |  4 +-
 package/i2c-tools/i2c-tools.mk                |  2 +-
 3 files changed, 3 insertions(+), 41 deletions(-)
 delete mode 100644 package/i2c-tools/0001-py-smbus-Use-setuptools-instead-of-distutils.patch

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
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
