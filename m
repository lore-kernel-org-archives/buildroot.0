Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7561C48297
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 17:56:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 73E4182F32;
	Tue,  6 Feb 2024 17:56:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BPEjyIMmbefb; Tue,  6 Feb 2024 17:56:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8170182F99
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8170182F99;
	Tue,  6 Feb 2024 17:56:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6E9EF1BF3A1
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 17:56:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4D1D2611ED
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 17:56:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D1D2611ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RHsEhzlnbbuc for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 17:56:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5C5F16113E
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 17:56:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C5F16113E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 47340873AF; Tue,  6 Feb 2024 17:56:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Feb 2024 18:53:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 60a6188a8616fdf5b4c8d71c650ff014c29f7c32
X-Git-Newrev: 46a985eb4dacac201dfc8b2b8d272ee3112ef80f
X-Patchwork-Hint: ignore
Message-Id: <20240206175614.47340873AF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-opcua-asyncio: bump to
 version 1.0.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=46a985eb4dacac201dfc8b2b8d272ee3112ef80f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add new python-aiosqlite, python-sortedcontainers and python-pyopenssl
runtime dependencies.

Remove no longer required python-lxml runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/python-opcua-asyncio/Config.in                 | 4 +++-
 package/python-opcua-asyncio/python-opcua-asyncio.hash | 4 ++--
 package/python-opcua-asyncio/python-opcua-asyncio.mk   | 4 ++--
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/python-opcua-asyncio/Config.in b/package/python-opcua-asyncio/Config.in
index e5b8623f0d..139238b5e9 100644
--- a/package/python-opcua-asyncio/Config.in
+++ b/package/python-opcua-asyncio/Config.in
@@ -2,10 +2,12 @@ config BR2_PACKAGE_PYTHON_OPCUA_ASYNCIO
 	bool "python-opcua-asyncio"
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-cryptography
 	select BR2_PACKAGE_PYTHON_AIOFILES # runtime
+	select BR2_PACKAGE_PYTHON_AIOSQLITE # runtime
 	select BR2_PACKAGE_PYTHON_CRYPTOGRAPHY # runtime
 	select BR2_PACKAGE_PYTHON_DATEUTIL # runtime
-	select BR2_PACKAGE_PYTHON_LXML # runtime
 	select BR2_PACKAGE_PYTHON_PYTZ # runtime
+	select BR2_PACKAGE_PYTHON_SORTEDCONTAINERS # runtime
+	select BR2_PACKAGE_PYTHON_PYOPENSSL # runtime
 	help
 	  opcua-asyncio is an asyncio-based asynchronous
 	  OPC UA client based on python-opcua, removing
diff --git a/package/python-opcua-asyncio/python-opcua-asyncio.hash b/package/python-opcua-asyncio/python-opcua-asyncio.hash
index 21b5794ebf..f5856019a5 100644
--- a/package/python-opcua-asyncio/python-opcua-asyncio.hash
+++ b/package/python-opcua-asyncio/python-opcua-asyncio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/asyncua/json
-md5  f67770b896d2ffe975adbaea38c5efc9  asyncua-1.0.1.tar.gz
-sha256  515342470022b9c391587dcf526015ff4c7582f566c72406c778c9f9a2757cad  asyncua-1.0.1.tar.gz
+md5  37000bc60b98b4822511ced1c2b4c020  asyncua-1.0.5.tar.gz
+sha256  2757163f2a2ff1d8b923297d4af9b8161d25bed95867c1f67078faaf7f2d3f92  asyncua-1.0.5.tar.gz
 # Locally computed sha256 checksums
 sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  COPYING
diff --git a/package/python-opcua-asyncio/python-opcua-asyncio.mk b/package/python-opcua-asyncio/python-opcua-asyncio.mk
index 52c5d5117e..a8be2c8722 100644
--- a/package/python-opcua-asyncio/python-opcua-asyncio.mk
+++ b/package/python-opcua-asyncio/python-opcua-asyncio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_OPCUA_ASYNCIO_VERSION = 1.0.1
+PYTHON_OPCUA_ASYNCIO_VERSION = 1.0.5
 PYTHON_OPCUA_ASYNCIO_SOURCE = asyncua-$(PYTHON_OPCUA_ASYNCIO_VERSION).tar.gz
-PYTHON_OPCUA_ASYNCIO_SITE = https://files.pythonhosted.org/packages/9f/88/c32bd5904c92475dd30fa2c3130c4f9170a36343d390e2ce5b002fdf1cee
+PYTHON_OPCUA_ASYNCIO_SITE = https://files.pythonhosted.org/packages/bf/c6/3c17b8b5335faffc2f08c728008c5ae7cc46d24f674bc1038a69d1849ef6
 PYTHON_OPCUA_ASYNCIO_SETUP_TYPE = setuptools
 PYTHON_OPCUA_ASYNCIO_LICENSE = LGPL-3.0+
 PYTHON_OPCUA_ASYNCIO_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
