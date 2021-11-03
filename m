Return-Path: <SRS0=0gS+=PW=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9169C433EF
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 21:50:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 72E6D6112E
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 21:50:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 72E6D6112E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3CBBB40165;
	Wed,  3 Nov 2021 21:50:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YwhFIKYI_4Ce; Wed,  3 Nov 2021 21:50:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 20E5C40398;
	Wed,  3 Nov 2021 21:50:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E16491BF38A
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 21:50:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CE78981011
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 21:50:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oMOgP4qUKtB6 for <buildroot@lists.busybox.net>;
 Wed,  3 Nov 2021 21:50:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id F1B3A8100F
 for <buildroot@buildroot.org>; Wed,  3 Nov 2021 21:50:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 46C358A4C0; Wed,  3 Nov 2021 21:46:23 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Wed, 3 Nov 2021 22:49:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a7b63ebec3fa74b3ea14ecf640e36864096923b4
X-Git-Newrev: d735d8225c11b5a4eb3c54c716008f8fe813776a
X-Patchwork-Hint: ignore
Message-Id: <20211103214623.46C358A4C0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-async-timeout: bump to
 version 4.0.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=d735d8225c11b5a4eb3c54c716008f8fe813776a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

License hash change due to removal of full license text:
https://github.com/aio-libs/async-timeout/commit/63e781b8745cca5bcf4d3ec1cd9a7a19e988a6d0

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-async-timeout/Config.in                 | 1 +
 package/python-async-timeout/python-async-timeout.hash | 8 ++++----
 package/python-async-timeout/python-async-timeout.mk   | 4 ++--
 3 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/python-async-timeout/Config.in b/package/python-async-timeout/Config.in
index 659a0fdeca..27cfe51f7b 100644
--- a/package/python-async-timeout/Config.in
+++ b/package/python-async-timeout/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PYTHON_ASYNC_TIMEOUT
 	bool "python-async-timeout"
 	depends on BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
 	help
 	  asyncio-compatible timeout context manager.
 
diff --git a/package/python-async-timeout/python-async-timeout.hash b/package/python-async-timeout/python-async-timeout.hash
index f99e1daddb..1a64c3a77d 100644
--- a/package/python-async-timeout/python-async-timeout.hash
+++ b/package/python-async-timeout/python-async-timeout.hash
@@ -1,5 +1,5 @@
-# md5, sha256 from https://pypi.python.org/pypi/async_timeout/json
-md5	305c4fa529f2485c403d0dbe14390175  async-timeout-3.0.1.tar.gz
-sha256	0c3c816a028d47f659d6ff5c745cb2acf1f966da1fe5c19c77a70282b25f4c5f  async-timeout-3.0.1.tar.gz
+# md5, sha256 from https://pypi.org/pypi/async-timeout/json
+md5  2871f3853060ac7e76e6278b85dfb3c9  async-timeout-4.0.0.tar.gz
+sha256  7d87a4e8adba8ededb52e579ce6bc8276985888913620c935094c2276fd83382  async-timeout-4.0.0.tar.gz
 # Locally computed sha256 checksums
-sha256	b40930bbcf80744c86c46a12bc9da056641d722716c378f5659b9e555ef833e1  LICENSE
+sha256  e18d7bb8f513e2c46bb585c94b585bd30720dd3ccb21ddb0786f72d16658f92c  LICENSE
diff --git a/package/python-async-timeout/python-async-timeout.mk b/package/python-async-timeout/python-async-timeout.mk
index 093adc5c19..1d2c716fa9 100644
--- a/package/python-async-timeout/python-async-timeout.mk
+++ b/package/python-async-timeout/python-async-timeout.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ASYNC_TIMEOUT_VERSION = 3.0.1
+PYTHON_ASYNC_TIMEOUT_VERSION = 4.0.0
 PYTHON_ASYNC_TIMEOUT_SOURCE = async-timeout-$(PYTHON_ASYNC_TIMEOUT_VERSION).tar.gz
-PYTHON_ASYNC_TIMEOUT_SITE = https://files.pythonhosted.org/packages/a1/78/aae1545aba6e87e23ecab8d212b58bb70e72164b67eb090b81bb17ad38e3
+PYTHON_ASYNC_TIMEOUT_SITE = https://files.pythonhosted.org/packages/28/0c/1cd218ea84964f0740a3ab6152dfa99661174abdd8e4053e06c0285ac42a
 PYTHON_ASYNC_TIMEOUT_LICENSE = Apache-2.0
 PYTHON_ASYNC_TIMEOUT_LICENSE_FILES = LICENSE
 PYTHON_ASYNC_TIMEOUT_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
