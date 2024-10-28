Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E144D33992
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 14:42:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 67768408A5;
	Mon, 28 Oct 2024 14:42:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XrQlhanBcZ5P; Mon, 28 Oct 2024 14:42:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07BEC40740
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 07BEC40740;
	Mon, 28 Oct 2024 14:42:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7FDA1AEE
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 14:41:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6C88B408B7
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 14:40:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g2G-a2Xky7wy for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 14:40:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 42A9A40970
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 42A9A40970
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 14:40:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3FE3F813EA; Mon, 28 Oct 2024 14:40:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 28 Oct 2024 14:48:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2fa55b43827b9e8a22638623e5d5615525205e8e
X-Git-Newrev: 6276e8044dae5e6fa48910e909f8f6b2bda15152
X-Patchwork-Hint: ignore
Message-Id: <20241028144053.3FE3F813EA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-yarl: bump to version 1.16.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=6276e8044dae5e6fa48910e909f8f6b2bda15152
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add new python-propcache runtime dependency.

Add new host-python-cython build dependency.

Add new host-python-expandvars build dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-yarl/Config.in        | 5 +++--
 package/python-yarl/python-yarl.hash | 4 ++--
 package/python-yarl/python-yarl.mk   | 7 +++++--
 3 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/package/python-yarl/Config.in b/package/python-yarl/Config.in
index 84e14ce92e..48ed07cfde 100644
--- a/package/python-yarl/Config.in
+++ b/package/python-yarl/Config.in
@@ -1,7 +1,8 @@
 config BR2_PACKAGE_PYTHON_YARL
 	bool "python-yarl"
-	select BR2_PACKAGE_PYTHON_MULTIDICT
-	select BR2_PACKAGE_PYTHON_IDNA
+	select BR2_PACKAGE_PYTHON_IDNA # runtime
+	select BR2_PACKAGE_PYTHON_MULTIDICT # runtime
+	select BR2_PACKAGE_PYTHON_PROPCACHE # runtime
 	help
 	  Yet another URL library.
 
diff --git a/package/python-yarl/python-yarl.hash b/package/python-yarl/python-yarl.hash
index 624297aeba..766541bc94 100644
--- a/package/python-yarl/python-yarl.hash
+++ b/package/python-yarl/python-yarl.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/yarl/json
-md5  4e46a0c7078d34d9734a7c5d182dee92  yarl-1.9.2.tar.gz
-sha256  04ab9d4b9f587c06d801c2abfe9317b77cdf996c65a90d5e84ecc45010823571  yarl-1.9.2.tar.gz
+md5  23595f461eb3eeba689e3567f60cd07a  yarl-1.16.0.tar.gz
+sha256  b6f687ced5510a9a2474bbae96a4352e5ace5fa34dc44a217b0537fec1db00b4  yarl-1.16.0.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-yarl/python-yarl.mk b/package/python-yarl/python-yarl.mk
index e4424ff577..78f5082bce 100644
--- a/package/python-yarl/python-yarl.mk
+++ b/package/python-yarl/python-yarl.mk
@@ -4,11 +4,14 @@
 #
 ################################################################################
 
-PYTHON_YARL_VERSION = 1.9.2
+PYTHON_YARL_VERSION = 1.16.0
 PYTHON_YARL_SOURCE = yarl-$(PYTHON_YARL_VERSION).tar.gz
-PYTHON_YARL_SITE = https://files.pythonhosted.org/packages/5f/3f/04b3c5e57844fb9c034b09c5cb6d2b43de5d64a093c30529fd233e16cf09
+PYTHON_YARL_SITE = https://files.pythonhosted.org/packages/23/52/e9766cc6c2eab7dd1e9749c52c9879317500b46fb97d4105223f86679f93
 PYTHON_YARL_LICENSE = Apache-2.0
 PYTHON_YARL_LICENSE_FILES = LICENSE
 PYTHON_YARL_SETUP_TYPE = setuptools
+PYTHON_YARL_DEPENDENCIES = \
+	host-python-cython \
+	host-python-expandvars
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
