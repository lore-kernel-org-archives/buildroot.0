Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 645E7CD3426
	for <buildroot@archiver.kernel.org>; Sun,  3 May 2026 14:50:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3806C8423D;
	Sun,  3 May 2026 14:50:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7cgMTnSFCSuk; Sun,  3 May 2026 14:50:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 49E9084241
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777819836;
	bh=Zooyr5a84DRMsuWAKjYpy7xZFI0loZzX2gHkvPUI4ts=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=fxth5O0YTffa8nPJz/4HYimrcPaqvwyhJwtR2jqlAMc2mzaFAT5sMBq/py4PVx6me
	 SjS7/4OLK+o/00Pcop/Q6zwYXrWvtg05ma3GXp4ikOooREzocR13Kjg3G9G7ANfbX3
	 PzZlK5pBzI0l9+4EUHeW72T18ibGoqGnY033ZFcWLmZscS9rJEI6h/16GAPOwSTwc6
	 UyM/jPomAtPMmKF08Ewrt/FcV/Du6faf0Zy2McM74PZxnPfeOO+X/zz/P67dLP2cfw
	 gua2PsPlbjR2UZw0cnZDZ3n68AmEBmXLVqxHgan4NjWphm/OEdNjVv/eky6B/zUgui
	 oN7bz++EVu67Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 49E9084241;
	Sun,  3 May 2026 14:50:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1BA97392
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0DD6D61273
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pvzf5jSqYptC for <buildroot@buildroot.org>;
 Sun,  3 May 2026 14:50:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 04E1961263
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 04E1961263
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C10BF83FC1; Sun,  3 May 2026 14:50:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 3 May 2026 16:48:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4662c679e72724b5d56c49d0b8d63edecd7b6ef9
X-Git-Newrev: c7cbf6bd2bf7625ca479b23af4f1d6ba2072c615
X-Patchwork-Hint: ignore
Message-Id: <20260503145024.C10BF83FC1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-click: bump version to 8.3.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c7cbf6bd2bf7625ca479b23af4f1d6ba2072c615
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://click.palletsprojects.com/en/stable/changes/#version-8-3-3

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-click/python-click.hash | 4 ++--
 package/python-click/python-click.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-click/python-click.hash b/package/python-click/python-click.hash
index 84eafea3b7..f203312073 100644
--- a/package/python-click/python-click.hash
+++ b/package/python-click/python-click.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/click/json
-md5  5f89d725a424b101607ec40927f78773  click-8.3.1.tar.gz
-sha256  12ff4785d337a1bb490bb7e9c2b1ee5da3112e94a8622f26a6c77f5d2fc6842a  click-8.3.1.tar.gz
+md5  7ac811bcb2bdd53ae85afe7e7f9224c2  click-8.3.3.tar.gz
+sha256  398329ad4837b2ff7cbe1dd166a4c0f8900c3ca3a218de04466f38f6497f18a2  click-8.3.3.tar.gz
 # Locally computed sha256 checksums
 sha256  9a8ad106a394e853bfe21f42f4e72d592819a22805d991b5f3275029292b658d  LICENSE.txt
diff --git a/package/python-click/python-click.mk b/package/python-click/python-click.mk
index 8a4f99e9a1..6f63a4df8f 100644
--- a/package/python-click/python-click.mk
+++ b/package/python-click/python-click.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CLICK_VERSION = 8.3.1
+PYTHON_CLICK_VERSION = 8.3.3
 PYTHON_CLICK_SOURCE = click-$(PYTHON_CLICK_VERSION).tar.gz
-PYTHON_CLICK_SITE = https://files.pythonhosted.org/packages/3d/fa/656b739db8587d7b5dfa22e22ed02566950fbfbcdc20311993483657a5c0
+PYTHON_CLICK_SITE = https://files.pythonhosted.org/packages/bb/63/f9e1ea081ce35720d8b92acde70daaedace594dc93b693c869e0d5910718
 PYTHON_CLICK_SETUP_TYPE = flit
 PYTHON_CLICK_LICENSE = BSD-3-Clause
 PYTHON_CLICK_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
