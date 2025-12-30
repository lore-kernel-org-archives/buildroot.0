Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 164ACEE4990
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 18:12:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DCA4660C16;
	Tue, 30 Dec 2025 18:12:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ho8Bp7SaQjh4; Tue, 30 Dec 2025 18:12:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C28D860BE3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767118375;
	bh=AYYpXZAEu6hkG5+Hy4IPPS56b+S8pYNMwjs2Fk1rYo0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=FYUqKikeeVZJblnJOx54bNwTQIshQbXHl+r/QKKorT3XFIpQBU7BejvjPHV2ZJ1h+
	 SrebSrjKZmZ5/029n6fbu1smFZ6R4tSjYl8VzwX2JZXYHoYzhHLmU3wEvvAdKa1u0W
	 FZw5remj/0KKg5MnJhnHWlO74IZl+GC3QxIb7KbIpx54z4QLg4S+wWnaVD+xUTKytn
	 aGi+XLJACiRQe9tO3g2N/PhQEGgfXWRwWf5E+jfM4B73lx4zb04/v6/Sj5Jysn80f6
	 +nL1mVQYZ4m7K0WdHeWf7iDmmndDp8qaJVgPW0xoJrhADQgNC/XubBBElaLnhBxbQZ
	 /BoPwSFifV3rw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C28D860BE3;
	Tue, 30 Dec 2025 18:12:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D0C435B
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 18:12:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 53A8160B44
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 18:12:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7IKMCUqpdSI3 for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 18:12:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 221E660B4C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 221E660B4C
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 18:12:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2190A87C40; Tue, 30 Dec 2025 18:12:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Dec 2025 19:12:12 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 05ca9bfcdb2db1e5d28031d6c5c9ade751e8224b
X-Git-Newrev: 0e12ccc6c5ccf20b7ddd3b007a9c962ac1bfd401
X-Patchwork-Hint: ignore
Message-Id: <20251230181235.2190A87C40@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-aioredis: remove package
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

commit: https://git.buildroot.net/buildroot/commit/?id=0e12ccc6c5ccf20b7ddd3b007a9c962ac1bfd401
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/aio-libs-abandoned/aioredis-py/blob/19be499015a8cf32580e937cbfd711fd48489eca/README.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy                             |  8 ++++++++
 package/Config.in                            |  1 -
 package/python-aioredis/Config.in            |  8 --------
 package/python-aioredis/python-aioredis.hash |  5 -----
 package/python-aioredis/python-aioredis.mk   | 14 --------------
 5 files changed, 8 insertions(+), 28 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 44351cf3ca..ecd22e2194 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,14 @@ endif
 
 comment "Legacy options removed in 2026.02"
 
+config BR2_PACKAGE_PYTHON_AIOREDIS
+	bool "python-aioredis has been removed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_PYTHON_REDIS
+	help
+	  python-aioredis was abandoned upstream and replaced by
+	  python-redis
+
 config BR2_PACKAGE_LIBCUEFILE
 	bool "libcuefile has been removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 0b11a7df48..6ad17c1925 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -981,7 +981,6 @@ menu "External python modules"
 	source "package/python-aiomonitor/Config.in"
 	source "package/python-aiomqtt/Config.in"
 	source "package/python-aioprocessing/Config.in"
-	source "package/python-aioredis/Config.in"
 	source "package/python-aiorwlock/Config.in"
 	source "package/python-aiosignal/Config.in"
 	source "package/python-aiosqlite/Config.in"
diff --git a/package/python-aioredis/Config.in b/package/python-aioredis/Config.in
deleted file mode 100644
index 46ed2c7a46..0000000000
--- a/package/python-aioredis/Config.in
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_PYTHON_AIOREDIS
-	bool "python-aioredis"
-	select BR2_PACKAGE_PYTHON_ASYNC_TIMEOUT # runtime
-	select BR2_PACKAGE_PYTHON_HIREDIS # runtime
-	help
-	  Provides simple and clear interface to Redis based on asyncio.
-
-	  https://github.com/aio-libs/aioredis
diff --git a/package/python-aioredis/python-aioredis.hash b/package/python-aioredis/python-aioredis.hash
deleted file mode 100644
index 29e6361014..0000000000
--- a/package/python-aioredis/python-aioredis.hash
+++ /dev/null
@@ -1,5 +0,0 @@
-# md5, sha256 from https://pypi.org/pypi/aioredis/json
-md5  8f3547af83ef4b863b18c19f23166a9d  aioredis-2.0.1.tar.gz
-sha256  eaa51aaf993f2d71f54b70527c440437ba65340588afeb786cd87c55c89cd98e  aioredis-2.0.1.tar.gz
-# Locally computed sha256 checksums
-sha256  183b21f240e41af611c951d01d4f36793d470a82d5fd79efc21f25ae4cf68543  LICENSE
diff --git a/package/python-aioredis/python-aioredis.mk b/package/python-aioredis/python-aioredis.mk
deleted file mode 100644
index 798dbd0c3c..0000000000
--- a/package/python-aioredis/python-aioredis.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# python-aioredis
-#
-################################################################################
-
-PYTHON_AIOREDIS_VERSION = 2.0.1
-PYTHON_AIOREDIS_SOURCE = aioredis-$(PYTHON_AIOREDIS_VERSION).tar.gz
-PYTHON_AIOREDIS_SITE = https://files.pythonhosted.org/packages/2e/cf/9eb144a0b05809ffc5d29045c4b51039000ea275bc1268d0351c9e7dfc06
-PYTHON_AIOREDIS_SETUP_TYPE = setuptools
-PYTHON_AIOREDIS_LICENSE = MIT
-PYTHON_AIOREDIS_LICENSE_FILES = LICENSE
-
-$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
