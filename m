Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9392C636D6
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 23:04:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A6EE7822E2;
	Mon, 20 Feb 2023 23:04:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A6EE7822E2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6ynO4pD0zbXW; Mon, 20 Feb 2023 23:04:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8C065826EA;
	Mon, 20 Feb 2023 23:03:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C065826EA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A18071BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:56:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8E758612C8
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E758612C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZkzabWnvHc24 for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9E5316128E
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E5316128E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8D81581979; Mon, 20 Feb 2023 20:52:11 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 18 Dec 2022 14:40:24 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 4b869587c6c88a15dc2ecf6c417896de18501a17
X-Git-Newrev: 7165965fe57725c32ce3a9c69274d1a4c2c54c80
X-Patchwork-Hint: ignore
Message-Id: <20230220205211.8D81581979@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-ipdb: bump to
 version 0.13.11
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

commit: https://git.buildroot.net/buildroot/commit/?id=7165965fe57725c32ce3a9c69274d1a4c2c54c80
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Drop no longer required setuptools runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-ipdb/Config.in        | 1 -
 package/python-ipdb/python-ipdb.hash | 4 ++--
 package/python-ipdb/python-ipdb.mk   | 4 ++--
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/python-ipdb/Config.in b/package/python-ipdb/Config.in
index a9d6af1684..9259421c6a 100644
--- a/package/python-ipdb/Config.in
+++ b/package/python-ipdb/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_IPDB
 	bool "python-ipdb"
-	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
 	select BR2_PACKAGE_PYTHON_IPYTHON # runtime
 	help
 	  IPython-enabled pdb.
diff --git a/package/python-ipdb/python-ipdb.hash b/package/python-ipdb/python-ipdb.hash
index 7d483e1777..1e8a45fbd6 100644
--- a/package/python-ipdb/python-ipdb.hash
+++ b/package/python-ipdb/python-ipdb.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/ipdb/json
-md5  4f5ffb71cd6551319acf8cbceabd8936  ipdb-0.13.9.tar.gz
-sha256  951bd9a64731c444fd907a5ce268543020086a697f6be08f7cc2c9a752a278c5  ipdb-0.13.9.tar.gz
+md5  e624221cbc9261f68f412b748179d5e2  ipdb-0.13.11.tar.gz
+sha256  c23b6736f01fd4586cc2ecbebdf79a5eb454796853e1cd8f2ed3b7b91d4a3e93  ipdb-0.13.11.tar.gz
 # Locally computed sha256 checksums
 sha256  4eeb49de04f4894f8ea1f69a04f500799041b750b3d554c06de5ca877258e734  COPYING.txt
diff --git a/package/python-ipdb/python-ipdb.mk b/package/python-ipdb/python-ipdb.mk
index 7828f83020..151a3d45a4 100644
--- a/package/python-ipdb/python-ipdb.mk
+++ b/package/python-ipdb/python-ipdb.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_IPDB_VERSION = 0.13.9
+PYTHON_IPDB_VERSION = 0.13.11
 PYTHON_IPDB_SOURCE = ipdb-$(PYTHON_IPDB_VERSION).tar.gz
-PYTHON_IPDB_SITE = https://files.pythonhosted.org/packages/fc/56/9f67dcd4a4b9960373173a31be1b8c47fe351a1c9385677a7bdd82810e57
+PYTHON_IPDB_SITE = https://files.pythonhosted.org/packages/23/b2/c972cc266b0ba8508b42dab7f5dea1be03ea32213258441bf1b00baca555
 PYTHON_IPDB_SETUP_TYPE = setuptools
 PYTHON_IPDB_LICENSE = BSD-3-Clause
 PYTHON_IPDB_LICENSE_FILES = COPYING.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
