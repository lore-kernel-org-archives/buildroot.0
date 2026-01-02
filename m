Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77899FA3758
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 22:01:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 469B240851;
	Fri,  2 Jan 2026 22:01:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZkwrFA4UZUXI; Fri,  2 Jan 2026 22:01:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7D55D401B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767391274;
	bh=BQv+M2iTPf9BskQX76gd7BVlLGT/mHCWgdtRBTgFFRU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=IABE/cafU6TN7exn1YbJS8vekYdppZdmAHjdk9mjU2dX0tAtMKJtNqNjofzU0xtS8
	 7MEJkH5UljhTSLHkcZX3/SyFlxHenkCMPTo1Pc/0ycNvDK7NucenrqnuC0fqtT9Ven
	 qlzix/Px5y23YM566E1k5FcTHachCyuPDE/gio012+6iICCmIZUk7R2FKJE1SdVilX
	 jokRhRB9AtdisLyV6LJkMmAkklfHeCJUq+8sHkzCIQdiVGpJfTZ2FGTvFL2F58n34s
	 igMsIJuPcp5WLSSR0CllGjy10JtxnmDJXQGQqnSqiJYR143C9LaJggHCndI+pMO78A
	 rD11QjUi4adKQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D55D401B9;
	Fri,  2 Jan 2026 22:01:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5F37219D
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:01:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 438D540072
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:01:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nKqWTSLgnRxM for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 22:01:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8D5B54009C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8D5B54009C
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 22:01:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7EF4B81738; Fri,  2 Jan 2026 22:01:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 Jan 2026 23:00:04 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d492ff7912c20626c190d5b455edb7777058e3fc
X-Git-Newrev: ec9a136c22ffcf173cd0fca2af2ff1afbc072266
X-Patchwork-Hint: ignore
Message-Id: <20260102220105.7EF4B81738@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-libusb1: bump to version
 3.3.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=ec9a136c22ffcf173cd0fca2af2ff1afbc072266
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-libusb1/python-libusb1.hash | 4 ++--
 package/python-libusb1/python-libusb1.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-libusb1/python-libusb1.hash b/package/python-libusb1/python-libusb1.hash
index cf270a2d3d..a933e98416 100644
--- a/package/python-libusb1/python-libusb1.hash
+++ b/package/python-libusb1/python-libusb1.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/libusb1/json
-md5  617502b66841e601c28c668c20c1d843  libusb1-3.2.0.tar.gz
-sha256  a11a6095e718cd49418a96329314da271cca6be7b4317a142724523371ac8961  libusb1-3.2.0.tar.gz
+md5  f4973afe56c872eb2b8e7a930f566bb4  libusb1-3.3.1.tar.gz
+sha256  3951d360f2daf0e0eacf839e15d2d1d2f4f5e7830231eb3188eeffef2dd17bad  libusb1-3.3.1.tar.gz
 # Locally computed sha256 checksums
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LESSER
diff --git a/package/python-libusb1/python-libusb1.mk b/package/python-libusb1/python-libusb1.mk
index 7d68377f51..10a727a7a9 100644
--- a/package/python-libusb1/python-libusb1.mk
+++ b/package/python-libusb1/python-libusb1.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_LIBUSB1_VERSION = 3.2.0
+PYTHON_LIBUSB1_VERSION = 3.3.1
 PYTHON_LIBUSB1_SOURCE = libusb1-$(PYTHON_LIBUSB1_VERSION).tar.gz
-PYTHON_LIBUSB1_SITE = https://files.pythonhosted.org/packages/d9/b7/9e833af6cb52fa2aece1c6a1378667ca0172bead14f63ffccc3cb9862df3
+PYTHON_LIBUSB1_SITE = https://files.pythonhosted.org/packages/a2/7f/c59ad56d1bca8fa4321d1bb77ba4687775751a4deceec14943a44da18ca0
 PYTHON_LIBUSB1_SETUP_TYPE = setuptools
 PYTHON_LIBUSB1_LICENSE = LGPL-2.1+
 PYTHON_LIBUSB1_LICENSE_FILES = COPYING.LESSER
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
