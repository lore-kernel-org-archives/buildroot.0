Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C22A1D13578
	for <buildroot@archiver.kernel.org>; Sun, 27 Oct 2024 18:42:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8B0D6813B0;
	Sun, 27 Oct 2024 18:42:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z35zgmLXCHvU; Sun, 27 Oct 2024 18:42:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D8AD80D4A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D8AD80D4A;
	Sun, 27 Oct 2024 18:42:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 15FD0AEE
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 18:41:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8D408607E8
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 18:41:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wqNKXDBJEVKq for <buildroot@buildroot.org>;
 Sun, 27 Oct 2024 18:41:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 66F0D607AD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 66F0D607AD
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 18:41:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 61CBC812BF; Sun, 27 Oct 2024 18:41:08 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 27 Oct 2024 19:14:04 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b0760d4485c986cbddd5de73b7922dd720c8d3eb
X-Git-Newrev: 5daf49911e03ce14f17719e41d033868c1533e2a
X-Patchwork-Hint: ignore
Message-Id: <20241027184108.61CBC812BF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-orjson: bump to version
 3.10.10
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

commit: https://git.buildroot.net/buildroot/commit/?id=5daf49911e03ce14f17719e41d033868c1533e2a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop no longer required python-cffi dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-orjson/Config.in          | 1 -
 package/python-orjson/python-orjson.hash | 2 +-
 package/python-orjson/python-orjson.mk   | 5 ++---
 3 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/package/python-orjson/Config.in b/package/python-orjson/Config.in
index 420e023b0a..258024032d 100644
--- a/package/python-orjson/Config.in
+++ b/package/python-orjson/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_PYTHON_ORJSON
 	bool "python-orjson"
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
-	select BR2_PACKAGE_PYTHON_CFFI # runtime
 	help
 	  orjson is a fast, correct JSON library for Python. It
 	  benchmarks as the fastest Python library for JSON and is more
diff --git a/package/python-orjson/python-orjson.hash b/package/python-orjson/python-orjson.hash
index 4ef98beaa0..b48eec080d 100644
--- a/package/python-orjson/python-orjson.hash
+++ b/package/python-orjson/python-orjson.hash
@@ -1,5 +1,5 @@
 # Locally calculated after vendoring
-sha256  cb462f63497889632807345b609fda0562888b0432b0764eeb1215901ae9f3d6  python-orjson-3.10.7-cargo2.tar.gz
+sha256  48e12af76f92259e429af9d830bb222d1262e8cddedc07aa5208b589b314fae9  python-orjson-3.10.10-cargo2.tar.gz
 # Locally computed sha256 checksums
 sha256  a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  LICENSE-APACHE
 sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/python-orjson/python-orjson.mk b/package/python-orjson/python-orjson.mk
index 4e1b1e9629..60e6078132 100644
--- a/package/python-orjson/python-orjson.mk
+++ b/package/python-orjson/python-orjson.mk
@@ -4,13 +4,12 @@
 #
 ################################################################################
 
-PYTHON_ORJSON_VERSION = 3.10.7
+PYTHON_ORJSON_VERSION = 3.10.10
 PYTHON_ORJSON_SOURCE_PYPI = orjson-$(PYTHON_ORJSON_VERSION).tar.gz
-PYTHON_ORJSON_SITE_PYPI = https://files.pythonhosted.org/packages/9e/03/821c8197d0515e46ea19439f5c5d5fd9a9889f76800613cfac947b5d7845
+PYTHON_ORJSON_SITE_PYPI = https://files.pythonhosted.org/packages/80/44/d36e86b33fc84f224b5f2cdf525adf3b8f9f475753e721c402b1ddef731e
 PYTHON_ORJSON_SITE = $(PYTHON_ORJSON_SITE_PYPI)/$(PYTHON_ORJSON_SOURCE_PYPI)?buildroot-path=filename
 PYTHON_ORJSON_SETUP_TYPE = maturin
 PYTHON_ORJSON_LICENSE = Apache-2.0 or MIT
 PYTHON_ORJSON_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
-PYTHON_ORJSON_DEPENDENCIES = host-python-cffi
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
