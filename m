Return-Path: <SRS0=V1ZZ=OR=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CFA5C433F5
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 14:40:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 08DEC60FC0
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 14:40:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 08DEC60FC0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CDCB1403AA;
	Mon, 27 Sep 2021 14:40:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z3WxwFmHe915; Mon, 27 Sep 2021 14:40:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E1F2B404B8;
	Mon, 27 Sep 2021 14:40:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 07DBD1BF97F
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 14:38:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B3DC060890
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 14:38:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7FY9vo8vxqzb for <buildroot@lists.busybox.net>;
 Mon, 27 Sep 2021 14:38:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D5D996089E
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 14:38:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 975038D267; Mon, 27 Sep 2021 14:35:54 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 27 Sep 2021 16:34:22 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1c543c729ede329cf57c6a5a3afbc02a8297188f
X-Git-Newrev: 10a82e3e50ad89313b813cd84f79059947f13ef9
X-Patchwork-Hint: ignore
Message-Id: <20210927143554.975038D267@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-traitlets: bump to version
 5.1.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=10a82e3e50ad89313b813cd84f79059947f13ef9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The package is now standalone (no dependencies) and supports
only python3.
Plus, indent with two spaces in the hash file.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-traitlets/Config.in             | 5 +----
 package/python-traitlets/python-traitlets.hash | 6 +++---
 package/python-traitlets/python-traitlets.mk   | 4 ++--
 3 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/package/python-traitlets/Config.in b/package/python-traitlets/Config.in
index f1804e55be..6515cdf8d1 100644
--- a/package/python-traitlets/Config.in
+++ b/package/python-traitlets/Config.in
@@ -1,9 +1,6 @@
 config BR2_PACKAGE_PYTHON_TRAITLETS
 	bool "python-traitlets"
-	select BR2_PACKAGE_PYTHON_ENUM34 if BR2_PACKAGE_PYTHON # runtime
-	select BR2_PACKAGE_PYTHON_SIX  # runtime
-	select BR2_PACKAGE_PYTHON_IPYTHON_GENUTILS  # runtime
-	select BR2_PACKAGE_PYTHON_DECORATOR  # runtime
+	depends on BR2_PACKAGE_PYTHON3
 	help
 	  A configuration system for Python applications.
 
diff --git a/package/python-traitlets/python-traitlets.hash b/package/python-traitlets/python-traitlets.hash
index 068db553c3..01e2bf8e30 100644
--- a/package/python-traitlets/python-traitlets.hash
+++ b/package/python-traitlets/python-traitlets.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/traitlets/json
-md5	3a4f263af65d3d79f1c279f0247077ef  traitlets-4.3.3.tar.gz
-sha256	d023ee369ddd2763310e4c3eae1ff649689440d4ae59d7485eb4cfbbe3e359f7  traitlets-4.3.3.tar.gz
+md5  19483ec0685e837912cff128209aa845  traitlets-5.1.0.tar.gz
+sha256  bd382d7ea181fbbcce157c133db9a829ce06edffe097bcf3ab945b435452b46d  traitlets-5.1.0.tar.gz
 # Locally computed sha256 checksums
-sha256	71c89129039b870cc92309466c4fbe8f285a82fa0ea36f0e840fa83979cbe31f  COPYING.md
+sha256  71c89129039b870cc92309466c4fbe8f285a82fa0ea36f0e840fa83979cbe31f  COPYING.md
diff --git a/package/python-traitlets/python-traitlets.mk b/package/python-traitlets/python-traitlets.mk
index 5973caf3bb..5f41f6ee8f 100644
--- a/package/python-traitlets/python-traitlets.mk
+++ b/package/python-traitlets/python-traitlets.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TRAITLETS_VERSION = 4.3.3
+PYTHON_TRAITLETS_VERSION = 5.1.0
 PYTHON_TRAITLETS_SOURCE = traitlets-$(PYTHON_TRAITLETS_VERSION).tar.gz
-PYTHON_TRAITLETS_SITE = https://files.pythonhosted.org/packages/75/b0/43deb021bc943f18f07cbe3dac1d681626a48997b7ffa1e7fb14ef922b21
+PYTHON_TRAITLETS_SITE = https://files.pythonhosted.org/packages/d5/bc/37d490908e7ac949614d62767db3c86f37bc5adb6129d378c35859a75b87
 PYTHON_TRAITLETS_LICENSE = BSD-3-Clause
 PYTHON_TRAITLETS_LICENSE_FILES = COPYING.md
 PYTHON_TRAITLETS_SETUP_TYPE = distutils
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
