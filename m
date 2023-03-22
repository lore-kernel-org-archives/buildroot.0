Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37097C6FD1C
	for <buildroot@archiver.kernel.org>; Wed, 22 Mar 2023 22:44:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E36C883FBC;
	Wed, 22 Mar 2023 22:44:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E36C883FBC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FsYKLYYynJJN; Wed, 22 Mar 2023 22:44:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0954E820CD;
	Wed, 22 Mar 2023 22:44:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0954E820CD
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2E1A81BF97A
 for <buildroot@lists.busybox.net>; Wed, 22 Mar 2023 22:44:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0894241C88
 for <buildroot@lists.busybox.net>; Wed, 22 Mar 2023 22:44:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0894241C88
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G8CjDF3WP6Yd for <buildroot@lists.busybox.net>;
 Wed, 22 Mar 2023 22:44:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 331B9405BF
 for <buildroot@buildroot.org>; Wed, 22 Mar 2023 22:44:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 331B9405BF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 23BC987585; Wed, 22 Mar 2023 22:44:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 22 Mar 2023 23:39:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 68ca5f1e1f9f3f79e5a48928ad2dfac0cceee843
X-Git-Newrev: 6ca823f6eb478fe5b9db06ff9bec16cb20e4d6e6
X-Patchwork-Hint: ignore
Message-Id: <20230322224400.23BC987585@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-aexpect: bump to version
 1.7.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=6ca823f6eb478fe5b9db06ff9bec16cb20e4d6e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop no longer required six runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-aexpect/Config.in           | 1 -
 package/python-aexpect/python-aexpect.hash | 4 ++--
 package/python-aexpect/python-aexpect.mk   | 4 ++--
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/python-aexpect/Config.in b/package/python-aexpect/Config.in
index cc805da657..59671621dc 100644
--- a/package/python-aexpect/Config.in
+++ b/package/python-aexpect/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_AEXPECT
 	bool "python-aexpect"
-	select BR2_PACKAGE_PYTHON_SIX # runtime
 	help
 	  Aexpect.
 
diff --git a/package/python-aexpect/python-aexpect.hash b/package/python-aexpect/python-aexpect.hash
index efe4f55fb8..ff30c765e3 100644
--- a/package/python-aexpect/python-aexpect.hash
+++ b/package/python-aexpect/python-aexpect.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aexpect/json
-md5  d37473ff0024c15938bfe86a543537e6  aexpect-1.6.4.tar.gz
-sha256  3998aa84ae54963fd59488f0caa533f6edbb31bc6cb842da09b041cbad56ad88  aexpect-1.6.4.tar.gz
+md5  bb05319c277cfe97114780579d251c30  aexpect-1.7.0.tar.gz
+sha256  11bfeea78ef6147ac8f6e29c2a720bd332598383d88274cdca5e6413c2070d52  aexpect-1.7.0.tar.gz
 # Locally computed sha256 checksums
 sha256  7be26abf35e531a226dc742d2379d42d372cb61f027a6e26477c0e2f1a03bfcb  LICENSE
diff --git a/package/python-aexpect/python-aexpect.mk b/package/python-aexpect/python-aexpect.mk
index 8b5e165135..1cfcc9ffaf 100644
--- a/package/python-aexpect/python-aexpect.mk
+++ b/package/python-aexpect/python-aexpect.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AEXPECT_VERSION = 1.6.4
+PYTHON_AEXPECT_VERSION = 1.7.0
 PYTHON_AEXPECT_SOURCE = aexpect-$(PYTHON_AEXPECT_VERSION).tar.gz
-PYTHON_AEXPECT_SITE = https://files.pythonhosted.org/packages/3b/22/f87ffa70348dde4597d9314995be89c8d4c7728260033b972a8d691e3f7d
+PYTHON_AEXPECT_SITE = https://files.pythonhosted.org/packages/dd/32/738b5190adb5ed387d3e755885f646b714fbf9c22adbda7ff988db7ede49
 PYTHON_AEXPECT_SETUP_TYPE = setuptools
 PYTHON_AEXPECT_LICENSE = GPL-2.0+
 PYTHON_AEXPECT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
