Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F55EF3028D
	for <buildroot@archiver.kernel.org>; Sun, 15 Mar 2026 22:18:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B35CF6119A;
	Sun, 15 Mar 2026 22:18:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BiGX_z0BtEuh; Sun, 15 Mar 2026 22:18:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE422610B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773613084;
	bh=+yaPDsV/0rQBttwAyRgjsRqk5nsLxVUKVPiCk2DkBFg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=cgfNOc0XbOEeYukMpPG/qN7+R4ObUn/7UyX4tmnSSeFa5whbRKAURelgic0ogvb/0
	 40/qPIif+rZJ6KLmVFkVdR439rpZke3edcgaq9c7Aq87wyL8Rg5gSbETi5+IoHBv0X
	 yNoRwxEAMvhod5YHvcJQ0SmCVhsVd71+Tdva7vrNU70BNTpmiCtdmQS36o1e92PvS4
	 8fr3Mw4dwck73hxXWrogX4gJLra1tYFW43NUIZDV94H9CATpSsgBA2uTEwChv5YHz1
	 xwKI4b3v8YKXmAVDpBgcOHHn0xzi2XV6+a5RphWHZw2yjMktMkRefN9hXZftQw+k89
	 BU6dodRz2E/cg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE422610B9;
	Sun, 15 Mar 2026 22:18:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9370E3BA
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 795F040724
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6w8ZruFSAaZ5 for <buildroot@buildroot.org>;
 Sun, 15 Mar 2026 22:18:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 838A440711
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 838A440711
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C514285BFF; Sun, 15 Mar 2026 22:18:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Mar 2026 16:21:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 44c2393af96bc29cd2a7a9c28ab334925760c7c3
X-Git-Newrev: 69b36ebac9b83991739e7ece34fc029cb8cd9434
X-Patchwork-Hint: ignore
Message-Id: <20260315221800.C514285BFF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-async-lru: bump version to
 2.2.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/69b36ebac9b83991739e7ece34fc029cb8cd9434
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/aio-libs/async-lru/blob/v2.2.0/CHANGES.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-async-lru/python-async-lru.hash | 4 ++--
 package/python-async-lru/python-async-lru.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-async-lru/python-async-lru.hash b/package/python-async-lru/python-async-lru.hash
index 8f296ce1ee..40cb990ee4 100644
--- a/package/python-async-lru/python-async-lru.hash
+++ b/package/python-async-lru/python-async-lru.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/async-lru/json
-md5  c972e8755626506ca019085e0620e192  async_lru-2.0.5.tar.gz
-sha256  481d52ccdd27275f42c43a928b4a50c3bfb2d67af4e78b170e3e0bb39c66e5bb  async_lru-2.0.5.tar.gz
+md5  588dd2fcc8ca6a808a8ecbfca4f92ca1  async_lru-2.2.0.tar.gz
+sha256  80abae2a237dbc6c60861d621619af39f0d920aea306de34cb992c879e01370c  async_lru-2.2.0.tar.gz
 # Locally computed sha256 checksums
 sha256  ea65975679bc2093be925d520358e41096bd96fddedee3e929160a5faadcf573  LICENSE
diff --git a/package/python-async-lru/python-async-lru.mk b/package/python-async-lru/python-async-lru.mk
index d80a8dfb6c..1a146ed2ad 100644
--- a/package/python-async-lru/python-async-lru.mk
+++ b/package/python-async-lru/python-async-lru.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ASYNC_LRU_VERSION = 2.0.5
+PYTHON_ASYNC_LRU_VERSION = 2.2.0
 PYTHON_ASYNC_LRU_SOURCE = async_lru-$(PYTHON_ASYNC_LRU_VERSION).tar.gz
-PYTHON_ASYNC_LRU_SITE = https://files.pythonhosted.org/packages/b2/4d/71ec4d3939dc755264f680f6c2b4906423a304c3d18e96853f0a595dfe97
+PYTHON_ASYNC_LRU_SITE = https://files.pythonhosted.org/packages/05/8a/ca724066c32a53fa75f59e0f21aa822fdaa8a0dffa112d223634e3caabf9
 PYTHON_ASYNC_LRU_SETUP_TYPE = setuptools
 PYTHON_ASYNC_LRU_LICENSE = MIT
 PYTHON_ASYNC_LRU_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
