Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9D83FC6182
	for <buildroot@archiver.kernel.org>; Fri, 13 Sep 2024 22:22:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6DBC8406B0;
	Fri, 13 Sep 2024 22:22:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U1GkyKWCg_0R; Fri, 13 Sep 2024 22:22:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E94A040598
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E94A040598;
	Fri, 13 Sep 2024 22:22:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1A0FE1BF2BE
 for <buildroot@lists.busybox.net>; Fri, 13 Sep 2024 22:22:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 08B1B40263
 for <buildroot@lists.busybox.net>; Fri, 13 Sep 2024 22:22:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 342jc57XSzGr for <buildroot@lists.busybox.net>;
 Fri, 13 Sep 2024 22:22:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C2C594024D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C2C594024D
 for <buildroot@buildroot.org>; Fri, 13 Sep 2024 22:22:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ABDF187038; Fri, 13 Sep 2024 22:22:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 00:21:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 565e8e8d18792746373c5932d13acc8c68f6d95a
X-Git-Newrev: 426e91e977d302015e748c4310ca75084085c091
X-Patchwork-Hint: ignore
Message-Id: <20240913222217.ABDF187038@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-aiohttp: bump to version
 3.10.5
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

commit: https://git.buildroot.net/buildroot/commit/?id=426e91e977d302015e748c4310ca75084085c091
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove no longer required python-async-timeout runtime dependency.

Add new python-aiohappyeyeballs runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-aiohttp/Config.in           | 2 +-
 package/python-aiohttp/python-aiohttp.hash | 4 ++--
 package/python-aiohttp/python-aiohttp.mk   | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-aiohttp/Config.in b/package/python-aiohttp/Config.in
index 0507106fe7..01a1ed8a3d 100644
--- a/package/python-aiohttp/Config.in
+++ b/package/python-aiohttp/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_PYTHON_AIOHTTP
 	bool "python-aiohttp"
 	select BR2_PACKAGE_PYTHON_AIODNS # runtime
+	select BR2_PACKAGE_PYTHON_AIOHAPPYEYEBALLS # runtime
 	select BR2_PACKAGE_PYTHON_AIOSIGNAL # runtime
-	select BR2_PACKAGE_PYTHON_ASYNC_TIMEOUT # runtime
 	select BR2_PACKAGE_PYTHON_ATTRS # runtime
 	select BR2_PACKAGE_PYTHON_BROTLI # runtime
 	select BR2_PACKAGE_PYTHON_FROZENLIST # runtime
diff --git a/package/python-aiohttp/python-aiohttp.hash b/package/python-aiohttp/python-aiohttp.hash
index 542a46f032..76b79e4586 100644
--- a/package/python-aiohttp/python-aiohttp.hash
+++ b/package/python-aiohttp/python-aiohttp.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiohttp/json
-md5  f237bcac4ade112b9e7c4b1098197244  aiohttp-3.9.3.tar.gz
-sha256  90842933e5d1ff760fae6caca4b2b3edba53ba8f4b71e95dacf2818a2aca06f7  aiohttp-3.9.3.tar.gz
+md5  29173b702ff6043fa62da8de0795ddea  aiohttp-3.10.5.tar.gz
+sha256  f071854b47d39591ce9a17981c46790acb30518e2f83dfca8db2dfa091178691  aiohttp-3.10.5.tar.gz
 # Locally computed sha256 checksums
 sha256  9f80d0db7d755a941db4572172c270ecbd8f082ba215ddd095985942ed94a9eb  LICENSE.txt
diff --git a/package/python-aiohttp/python-aiohttp.mk b/package/python-aiohttp/python-aiohttp.mk
index 315d68cb2e..be721c1ed5 100644
--- a/package/python-aiohttp/python-aiohttp.mk
+++ b/package/python-aiohttp/python-aiohttp.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOHTTP_VERSION = 3.9.3
+PYTHON_AIOHTTP_VERSION = 3.10.5
 PYTHON_AIOHTTP_SOURCE = aiohttp-$(PYTHON_AIOHTTP_VERSION).tar.gz
-PYTHON_AIOHTTP_SITE = https://files.pythonhosted.org/packages/18/93/1f005bbe044471a0444a82cdd7356f5120b9cf94fe2c50c0cdbf28f1258b
+PYTHON_AIOHTTP_SITE = https://files.pythonhosted.org/packages/ca/28/ca549838018140b92a19001a8628578b0f2a3b38c16826212cc6f706e6d4
 PYTHON_AIOHTTP_SETUP_TYPE = setuptools
 PYTHON_AIOHTTP_LICENSE = Apache-2.0
 PYTHON_AIOHTTP_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
