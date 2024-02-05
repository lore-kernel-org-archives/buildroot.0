Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA7F7C48291
	for <buildroot@archiver.kernel.org>; Mon,  5 Feb 2024 11:18:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 653EB402A7;
	Mon,  5 Feb 2024 11:18:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 653EB402A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x1kztOVeyM8W; Mon,  5 Feb 2024 11:18:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7D1C541743;
	Mon,  5 Feb 2024 11:18:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7D1C541743
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 819671BF281
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 11:17:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 67A63418B6
 for <buildroot@lists.busybox.net>; Mon,  5 Feb 2024 11:17:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 67A63418B6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1I-v59VOGNME for <buildroot@lists.busybox.net>;
 Mon,  5 Feb 2024 11:17:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 11EFB418B9
 for <buildroot@buildroot.org>; Mon,  5 Feb 2024 11:17:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 11EFB418B9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F0D9986BB9; Mon,  5 Feb 2024 11:17:37 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 5 Feb 2024 12:17:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: efa955ac415e2b50f63710e4fc1de8fd3e0dc099
X-Git-Newrev: 83763e58de2393eac2db52af3f5ea825bf77f88f
X-Patchwork-Hint: ignore
Message-Id: <20240205111737.F0D9986BB9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-tabledata: bump to version
 1.3.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=83763e58de2393eac2db52af3f5ea825bf77f88f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-tabledata/Config.in             | 2 --
 package/python-tabledata/python-tabledata.hash | 4 ++--
 package/python-tabledata/python-tabledata.mk   | 4 ++--
 3 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/package/python-tabledata/Config.in b/package/python-tabledata/Config.in
index 9947f41af6..3ee3057a39 100644
--- a/package/python-tabledata/Config.in
+++ b/package/python-tabledata/Config.in
@@ -1,8 +1,6 @@
 config BR2_PACKAGE_PYTHON_TABLEDATA
 	bool "python-tabledata"
 	select BR2_PACKAGE_PYTHON_DATAPROPERTY # runtime
-	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
-	select BR2_PACKAGE_PYTHON_SIX # runtime
 	select BR2_PACKAGE_PYTHON_TYPEPY # runtime
 	help
 	  A Python library to represent tabular data for
diff --git a/package/python-tabledata/python-tabledata.hash b/package/python-tabledata/python-tabledata.hash
index 3613589ae0..19fd4ea9c5 100644
--- a/package/python-tabledata/python-tabledata.hash
+++ b/package/python-tabledata/python-tabledata.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tabledata/json
-md5  1874cb0bf69cbc824a7bec67431023a9  tabledata-1.3.0.tar.gz
-sha256  54541b0c9e58f8fa38251ea0a60965dbaf95737027fa80e6ab56f98d7e4d61e9  tabledata-1.3.0.tar.gz
+md5  579c4e7454a837d252d4977b73556aae  tabledata-1.3.3.tar.gz
+sha256  c90daaba9a408e4397934b3ff2f6c06797d5289676420bf520c741ad43e6ff91  tabledata-1.3.3.tar.gz
 # Locally computed sha256 checksums
 sha256  bebbdf0524a147f89a615fff53d79bdc90cbc7631550fb4b725cd3f3bdcd24f6  LICENSE
diff --git a/package/python-tabledata/python-tabledata.mk b/package/python-tabledata/python-tabledata.mk
index 48f544b115..43e22d45d1 100644
--- a/package/python-tabledata/python-tabledata.mk
+++ b/package/python-tabledata/python-tabledata.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TABLEDATA_VERSION = 1.3.0
+PYTHON_TABLEDATA_VERSION = 1.3.3
 PYTHON_TABLEDATA_SOURCE = tabledata-$(PYTHON_TABLEDATA_VERSION).tar.gz
-PYTHON_TABLEDATA_SITE = https://files.pythonhosted.org/packages/ed/ed/dd0d6975963967492ac2c230107587593c7bd94acfa802b0c60a5395125c
+PYTHON_TABLEDATA_SITE = https://files.pythonhosted.org/packages/48/6a/7f78fbf883f325b70ba9ce5c10d97652f5c371e224940097c2cea9d0f456
 PYTHON_TABLEDATA_SETUP_TYPE = setuptools
 PYTHON_TABLEDATA_LICENSE = MIT
 PYTHON_TABLEDATA_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
