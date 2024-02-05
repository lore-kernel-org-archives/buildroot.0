Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8B9DC48291
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 11:06:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 99FAC40108;
	Mon,  5 Feb 2024 11:06:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 99FAC40108
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4QYnEw9wvcjD; Mon,  5 Feb 2024 11:06:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 92FF141724;
	Mon,  5 Feb 2024 11:06:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 92FF141724
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BAE341BF95D
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 11:06:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9444982907
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 11:06:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9444982907
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mrqCr6nNdp9Z for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 11:06:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5FE9881E8F
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 11:06:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5FE9881E8F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4C1A486B6E; Mon,  5 Feb 2024 11:06:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 5 Feb 2024 12:05:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fff23fd15d6b22e5099304b7e914ee2f81c930f8
X-Git-Newrev: 5cfd08bd302e7d2e3585ef4d25e448abec3c8453
X-Patchwork-Hint: ignore
Message-Id: <20240205110640.4C1A486B6E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-qrcode: bump to version
 7.4.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=5cfd08bd302e7d2e3585ef4d25e448abec3c8453
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add new python-pypng runtime dependency.

Add new python-typing-extensions runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/python-qrcode/Config.in          | 2 ++
 package/python-qrcode/python-qrcode.hash | 8 ++++----
 package/python-qrcode/python-qrcode.mk   | 4 ++--
 3 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/package/python-qrcode/Config.in b/package/python-qrcode/Config.in
index 9a17cc1f08..6e63d83e41 100644
--- a/package/python-qrcode/Config.in
+++ b/package/python-qrcode/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_PYTHON_QRCODE
 	bool "python-qrcode"
+	select BR2_PACKAGE_PYTHON_PYPNG # runtime
+	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
 	help
 	  Pure python QR Code generator
 
diff --git a/package/python-qrcode/python-qrcode.hash b/package/python-qrcode/python-qrcode.hash
index 1ab84dd355..48b2d7b2b0 100644
--- a/package/python-qrcode/python-qrcode.hash
+++ b/package/python-qrcode/python-qrcode.hash
@@ -1,5 +1,5 @@
-# md5 from https://pypi.python.org/pypi/qrcode/json
-md5  124103c685e96ba3b7a1616760f31c11  qrcode-7.3.1.tar.gz
-sha256  375a6ff240ca9bd41adc070428b5dfc1dcfbb0f2507f1ac848f6cded38956578  qrcode-7.3.1.tar.gz
-# Locally computed
+# md5, sha256 from https://pypi.org/pypi/qrcode/json
+md5  a4c47fe5ff966b105098998cfb2294de  qrcode-7.4.2.tar.gz
+sha256  9dd969454827e127dbd93696b20747239e6d540e082937c90f14ac95b30f5845  qrcode-7.4.2.tar.gz
+# Locally computed sha256 checksums
 sha256  40dfb903c94ee3f789500131311186548ecba5cefd3557623d7700e2522ab994  LICENSE
diff --git a/package/python-qrcode/python-qrcode.mk b/package/python-qrcode/python-qrcode.mk
index 23e7dd3b88..97b181a1e1 100644
--- a/package/python-qrcode/python-qrcode.mk
+++ b/package/python-qrcode/python-qrcode.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_QRCODE_VERSION = 7.3.1
+PYTHON_QRCODE_VERSION = 7.4.2
 PYTHON_QRCODE_SOURCE = qrcode-$(PYTHON_QRCODE_VERSION).tar.gz
-PYTHON_QRCODE_SITE = https://files.pythonhosted.org/packages/94/9f/31f33cdf3cf8f98e64c42582fb82f39ca718264df61957f28b0bbb09b134
+PYTHON_QRCODE_SITE = https://files.pythonhosted.org/packages/30/35/ad6d4c5a547fe9a5baf85a9edbafff93fc6394b014fab30595877305fa59
 PYTHON_QRCODE_SETUP_TYPE = setuptools
 PYTHON_QRCODE_LICENSE = BSD-3-Clause
 PYTHON_QRCODE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
