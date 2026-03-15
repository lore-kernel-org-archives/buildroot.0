Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EF02F3028C
	for <buildroot@archiver.kernel.org>; Sun, 15 Mar 2026 22:19:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 32963613E8;
	Sun, 15 Mar 2026 22:19:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WgcnSwT1QA8e; Sun, 15 Mar 2026 22:19:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 189476132B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773613170;
	bh=Xy2GNouBfaBYnEh4pnnkSSlY5xzMn/gPpa14tNOxU5A=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=KeHFnxAcPAyGLF9RU8D6AsVx/AzjLAzQmCtsmt7yE/WbT1Bp5DV75YkCZH5PjXRR5
	 YjgNC3yYpQUqqb/a7TqNEHKlAjJLlJRCm7CqZ/HZC46QT9VusYiMl8VzI3cfq8AguS
	 ugcDg9mIjUN0rzvIXfonigr9sZqaFIli3VkabcLY/0oCuu7xYMyYd3rgGbPJXmo84H
	 15hZbY9TnbhgNBdSOO8XsbjO1e0eNGCIn8cpzMBhy4A50a19274frcd/DR82NwiWQU
	 5OKLTl/OWcHmRarmykKWGKrqz8cUwczRVzBUj8DQQjc2hksDziCRZimFefDbQ9R1fI
	 oRVA4buWUJPUw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 189476132B;
	Sun, 15 Mar 2026 22:19:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 114B4357
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 16597610C2
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dYfCWPkwwV-Y for <buildroot@buildroot.org>;
 Sun, 15 Mar 2026 22:18:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D13761087
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9D13761087
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DE7A785C3A; Sun, 15 Mar 2026 22:18:03 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Mar 2026 21:34:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a7ace0430270b339fb837dbaf2fc5e29dc07dd45
X-Git-Newrev: 7c30b1e522988ffe5d4b300b2447f912b83558ad
X-Patchwork-Hint: ignore
Message-Id: <20260315221803.DE7A785C3A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-sdbus-modemmanager: bump
 version to 1.0.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7c30b1e522988ffe5d4b300b2447f912b83558ad
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/zhanglongqi/python-sdbus-modemmanager/blob/master/changelog.md

Upstream switched to poetry:
https://github.com/zhanglongqi/python-sdbus-modemmanager/commit/0d8ae7217841ab1bc12282076f766f94415573f5

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-sdbus-modemmanager/python-sdbus-modemmanager.hash | 4 ++--
 package/python-sdbus-modemmanager/python-sdbus-modemmanager.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-sdbus-modemmanager/python-sdbus-modemmanager.hash b/package/python-sdbus-modemmanager/python-sdbus-modemmanager.hash
index 980568cb0d..3833864bd8 100644
--- a/package/python-sdbus-modemmanager/python-sdbus-modemmanager.hash
+++ b/package/python-sdbus-modemmanager/python-sdbus-modemmanager.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sdbus-modemmanager/json
-md5  720d59e444d84d77c184bc73844cfebd  sdbus_modemmanager-1.0.2.tar.gz
-sha256  80ed83a158eeb8d9b0e0c1e5110c5f71307df87523245e4d0e79ebe200932fc6  sdbus_modemmanager-1.0.2.tar.gz
+md5  d75c065dd08ce96e37db0858af0dd44f  sdbus_modemmanager-1.0.3.tar.gz
+sha256  8fd5509de6ce363019667a14267ebce99f2b67849d1d7ee72d0228611ac1ba0a  sdbus_modemmanager-1.0.3.tar.gz
 # Locally computed sha256 checksums
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LESSER
diff --git a/package/python-sdbus-modemmanager/python-sdbus-modemmanager.mk b/package/python-sdbus-modemmanager/python-sdbus-modemmanager.mk
index 2821453270..62d128b264 100644
--- a/package/python-sdbus-modemmanager/python-sdbus-modemmanager.mk
+++ b/package/python-sdbus-modemmanager/python-sdbus-modemmanager.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_SDBUS_MODEMMANAGER_VERSION = 1.0.2
+PYTHON_SDBUS_MODEMMANAGER_VERSION = 1.0.3
 PYTHON_SDBUS_MODEMMANAGER_SOURCE = sdbus_modemmanager-$(PYTHON_SDBUS_MODEMMANAGER_VERSION).tar.gz
-PYTHON_SDBUS_MODEMMANAGER_SITE = https://files.pythonhosted.org/packages/af/99/a17942d9abda13ad1f27f39e900e39852a6215b70e30b682b777dfeff818
-PYTHON_SDBUS_MODEMMANAGER_SETUP_TYPE = setuptools
+PYTHON_SDBUS_MODEMMANAGER_SITE = https://files.pythonhosted.org/packages/38/2c/d66aa7f981df1d654bf70942964a4ca24cf930815fe7d656e1979c44a33a
+PYTHON_SDBUS_MODEMMANAGER_SETUP_TYPE = poetry
 PYTHON_SDBUS_MODEMMANAGER_LICENSE = LGPL-2.1+
 PYTHON_SDBUS_MODEMMANAGER_LICENSE_FILES = COPYING.LESSER
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
