Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2033F3027F
	for <buildroot@archiver.kernel.org>; Sun, 15 Mar 2026 22:18:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA86B41342;
	Sun, 15 Mar 2026 22:18:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QAIBssIOpSpg; Sun, 15 Mar 2026 22:18:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C517C4133E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773613096;
	bh=aZ88ghkHNLXHwNvYshuIKNa4i5bL8UykibW2KgCoigU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=AUbvr3ZezaHmmqoQw8YJtAX9YH5SlYfsO/juMV4Wd1FW7/GwXm0XoK3mG2Ch467Lw
	 Q5/IQVN+DNhjTBQV6tssXWpGZd3OCJg57Tnj8iONYSiwnPV+T0tfMK1Avw0P/vQQXT
	 MJaRT32mnM3ckzCCZgZlviN9yu+CH7je73wqZftBICwu8P9zFo7c4cWCAlpIYk/y4n
	 sDgSssxHbjrWSWV7pWD/LkrF4MIZPnUA4vpMCG6h94s/uHNVxtMKIJTOL3oJt/klHV
	 YlvjauSv2TqDLCUnsYv+cd1BzFQPCbZxpkIfQbCjxMkSyNbalkzL21PrPV6xxolx9k
	 lnXOwEACQd8aA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C517C4133E;
	Sun, 15 Mar 2026 22:18:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 21ED5357
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 39BE961095
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wRzhUGsw4mpT for <buildroot@buildroot.org>;
 Sun, 15 Mar 2026 22:18:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7265061089
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7265061089
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A6CE183F4D; Sun, 15 Mar 2026 22:18:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Mar 2026 16:21:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9e08e5029fb375fad5a62c767acd1309f090c79b
X-Git-Newrev: bdacb1a48389f4ee41facb56c941e3ca50f6c431
X-Patchwork-Hint: ignore
Message-Id: <20260315221800.A6CE183F4D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-aiorwlock: bump version to
 1.5.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/bdacb1a48389f4ee41facb56c941e3ca50f6c431
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/aio-libs/aiorwlock/blob/v1.5.1/CHANGES.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-aiorwlock/python-aiorwlock.hash | 4 ++--
 package/python-aiorwlock/python-aiorwlock.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aiorwlock/python-aiorwlock.hash b/package/python-aiorwlock/python-aiorwlock.hash
index 6ba5269c16..b68839dc21 100644
--- a/package/python-aiorwlock/python-aiorwlock.hash
+++ b/package/python-aiorwlock/python-aiorwlock.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiorwlock/json
-md5  094d8676f4fa812ab35225e3737edbc8  aiorwlock-1.5.0.tar.gz
-sha256  b529da24da659bdedcf68faf216595bde00db228c905197ac554773620e7fd2f  aiorwlock-1.5.0.tar.gz
+md5  10074451350706f9e4150d6ee497a6db  aiorwlock-1.5.1.tar.gz
+sha256  2729c77ec736c8d85ec305aa3827a50394fd8c6d823f4404d301cc8c59a4b7f5  aiorwlock-1.5.1.tar.gz
 # Locally computed sha256 checksums
 sha256  fa99ee9d7727194a9f8994c67d1948dc42e8e00ab809fd4a47acfae119d11403  LICENSE
diff --git a/package/python-aiorwlock/python-aiorwlock.mk b/package/python-aiorwlock/python-aiorwlock.mk
index 7f41b50442..fbb6e6ff86 100644
--- a/package/python-aiorwlock/python-aiorwlock.mk
+++ b/package/python-aiorwlock/python-aiorwlock.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIORWLOCK_VERSION = 1.5.0
+PYTHON_AIORWLOCK_VERSION = 1.5.1
 PYTHON_AIORWLOCK_SOURCE = aiorwlock-$(PYTHON_AIORWLOCK_VERSION).tar.gz
-PYTHON_AIORWLOCK_SITE = https://files.pythonhosted.org/packages/c5/bf/d1ddcd676be027a963b3b01fdf9915daf4590b4dfd03bf1c8c2858aac7e3
+PYTHON_AIORWLOCK_SITE = https://files.pythonhosted.org/packages/6b/65/316cdc82c1b92953235ced1c71a3763f0cd9273c3bec5db60bdb5ad59bfe
 PYTHON_AIORWLOCK_SETUP_TYPE = poetry
 PYTHON_AIORWLOCK_LICENSE = Apache-2.0
 PYTHON_AIORWLOCK_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
