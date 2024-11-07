Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19B2DD5AE71
	for <buildroot@archiver.kernel.org>; Thu,  7 Nov 2024 08:02:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 551E6409CF;
	Thu,  7 Nov 2024 08:02:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id doaWfM5Dq8Vb; Thu,  7 Nov 2024 08:02:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1989941987
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1989941987;
	Thu,  7 Nov 2024 08:02:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 15A8CC1
 for <buildroot@buildroot.org>; Thu,  7 Nov 2024 08:02:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A71A5820FC
 for <buildroot@buildroot.org>; Thu,  7 Nov 2024 08:01:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ku_Hjw2vTytk for <buildroot@buildroot.org>;
 Thu,  7 Nov 2024 08:01:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 94559820BC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 94559820BC
 for <buildroot@buildroot.org>; Thu,  7 Nov 2024 08:01:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8F11A85C67; Thu,  7 Nov 2024 08:01:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 7 Nov 2024 08:56:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 94b1286636e916c56b25f6b2c849480f4dac3544
X-Git-Newrev: e8b61bc2bbf23398dd9352490ce5e21f0763575d
X-Patchwork-Hint: ignore
Message-Id: <20241107080153.8F11A85C67@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-async-timeout: bump to
 version 5.0.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=e8b61bc2bbf23398dd9352490ce5e21f0763575d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop no longer required python-typing-extensions runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-async-timeout/Config.in                 | 1 -
 package/python-async-timeout/python-async-timeout.hash | 4 ++--
 package/python-async-timeout/python-async-timeout.mk   | 6 +++---
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/python-async-timeout/Config.in b/package/python-async-timeout/Config.in
index d19f15b3c6..04dfc81052 100644
--- a/package/python-async-timeout/Config.in
+++ b/package/python-async-timeout/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_ASYNC_TIMEOUT
 	bool "python-async-timeout"
-	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
 	help
 	  asyncio-compatible timeout context manager.
 
diff --git a/package/python-async-timeout/python-async-timeout.hash b/package/python-async-timeout/python-async-timeout.hash
index d46489396f..68cdbc3ca8 100644
--- a/package/python-async-timeout/python-async-timeout.hash
+++ b/package/python-async-timeout/python-async-timeout.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/async-timeout/json
-md5  9bf7b764a7310cb063c1c261c21342e4  async-timeout-4.0.3.tar.gz
-sha256  4640d96be84d82d02ed59ea2b7105a0f7b33abe8703703cd0ab0bf87c427522f  async-timeout-4.0.3.tar.gz
+md5  1507a6758b30c673d01ac9db6beec95e  async_timeout-5.0.0.tar.gz
+sha256  49675ec889daacfe65ff66d2dde7dd1447a6f4b2f23721022e4ba121f8772a85  async_timeout-5.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256  e18d7bb8f513e2c46bb585c94b585bd30720dd3ccb21ddb0786f72d16658f92c  LICENSE
diff --git a/package/python-async-timeout/python-async-timeout.mk b/package/python-async-timeout/python-async-timeout.mk
index 9760b8ae25..eda75c4277 100644
--- a/package/python-async-timeout/python-async-timeout.mk
+++ b/package/python-async-timeout/python-async-timeout.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ASYNC_TIMEOUT_VERSION = 4.0.3
-PYTHON_ASYNC_TIMEOUT_SOURCE = async-timeout-$(PYTHON_ASYNC_TIMEOUT_VERSION).tar.gz
-PYTHON_ASYNC_TIMEOUT_SITE = https://files.pythonhosted.org/packages/87/d6/21b30a550dafea84b1b8eee21b5e23fa16d010ae006011221f33dcd8d7f8
+PYTHON_ASYNC_TIMEOUT_VERSION = 5.0.0
+PYTHON_ASYNC_TIMEOUT_SOURCE = async_timeout-$(PYTHON_ASYNC_TIMEOUT_VERSION).tar.gz
+PYTHON_ASYNC_TIMEOUT_SITE = https://files.pythonhosted.org/packages/61/1f/44d9efc904bbe4d9967433522b691a9c4f1e81c2c64fbe44bad63d5de646
 PYTHON_ASYNC_TIMEOUT_LICENSE = Apache-2.0
 PYTHON_ASYNC_TIMEOUT_LICENSE_FILES = LICENSE
 PYTHON_ASYNC_TIMEOUT_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
