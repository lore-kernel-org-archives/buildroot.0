Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36C90C3ABA2
	for <buildroot@archiver.kernel.org>; Mon, 16 Sep 2024 10:01:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E9A44606EA;
	Mon, 16 Sep 2024 10:01:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BciL_MQOFLVE; Mon, 16 Sep 2024 10:01:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BCDD560A88
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BCDD560A88;
	Mon, 16 Sep 2024 10:01:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ECFB41BF397
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 10:01:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DC22380BBD
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 10:01:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EpYZzafg6pU8 for <buildroot@lists.busybox.net>;
 Mon, 16 Sep 2024 10:01:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 02BE280B8C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 02BE280B8C
 for <buildroot@buildroot.org>; Mon, 16 Sep 2024 10:01:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B2B2B8266F; Mon, 16 Sep 2024 10:01:46 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 16 Sep 2024 11:47:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7649293490874df3bca71fe0c855b049f363552b
X-Git-Newrev: 032b33d4fa33e03d752835a9d04532306b3710f0
X-Patchwork-Hint: ignore
Message-Id: <20240916100146.B2B2B8266F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-lmdb: bump to version 1.5.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=032b33d4fa33e03d752835a9d04532306b3710f0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop no longer required python-cffi dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-lmdb/Config.in        | 1 -
 package/python-lmdb/python-lmdb.hash | 4 ++--
 package/python-lmdb/python-lmdb.mk   | 5 ++---
 3 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/package/python-lmdb/Config.in b/package/python-lmdb/Config.in
index baf9bce5ac..b63af96ec4 100644
--- a/package/python-lmdb/Config.in
+++ b/package/python-lmdb/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_LMDB
 	bool "python-lmdb"
-	select BR2_PACKAGE_PYTHON_CFFI # runtime
 	help
 	  Universal Python binding for the LMDB 'Lightning' Database.
 
diff --git a/package/python-lmdb/python-lmdb.hash b/package/python-lmdb/python-lmdb.hash
index ad176d5d21..064c76fb58 100644
--- a/package/python-lmdb/python-lmdb.hash
+++ b/package/python-lmdb/python-lmdb.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/lmdb/json
-md5  d216e0220c625aa72de2acc158e81a0e  lmdb-1.4.1.tar.gz
-sha256  1f4c76af24e907593487c904ef5eba1993beb38ed385af82adb25a858f2d658d  lmdb-1.4.1.tar.gz
+md5  bdd78148e8374cb0001af06cc64bfefb  lmdb-1.5.1.tar.gz
+sha256  717c255827d331e02f7242b44051aa06466c90f6d732ecb07b31edfb1e06c67a  lmdb-1.5.1.tar.gz
 # Locally computed sha256 checksums
 sha256  310fe25c858a9515fc8c8d7d1f24a67c9496f84a91e0a0e41ea9975b1371e569  LICENSE
diff --git a/package/python-lmdb/python-lmdb.mk b/package/python-lmdb/python-lmdb.mk
index 7906d388ae..7105fd1464 100644
--- a/package/python-lmdb/python-lmdb.mk
+++ b/package/python-lmdb/python-lmdb.mk
@@ -4,14 +4,13 @@
 #
 ################################################################################
 
-PYTHON_LMDB_VERSION = 1.4.1
+PYTHON_LMDB_VERSION = 1.5.1
 PYTHON_LMDB_SOURCE = lmdb-$(PYTHON_LMDB_VERSION).tar.gz
-PYTHON_LMDB_SITE = https://files.pythonhosted.org/packages/de/13/dd9b0c1924f0becc93e0bacd123a4e7a347966e3e74753ace3b1e85acc39
+PYTHON_LMDB_SITE = https://files.pythonhosted.org/packages/67/2c/0cc9375341121ca1f4b31a2137f955dc24550e095d733c9b42ea94113ba1
 PYTHON_LMDB_LICENSE = OLDAP-2.8
 PYTHON_LMDB_LICENSE_FILES = LICENSE
 PYTHON_LMDB_CPE_ID_VENDOR = py-lmdb_project
 PYTHON_LMDB_CPE_ID_PRODUCT = py-lmdb
 PYTHON_LMDB_SETUP_TYPE = setuptools
-PYTHON_LMDB_DEPENDENCIES = host-python-cffi
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
