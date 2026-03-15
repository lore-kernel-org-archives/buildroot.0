Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73DAAF3027F
	for <buildroot@archiver.kernel.org>; Sun, 15 Mar 2026 22:18:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4982F612EC;
	Sun, 15 Mar 2026 22:18:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s9QsPLuDL-xd; Sun, 15 Mar 2026 22:18:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC6AB610AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773613133;
	bh=Fv31J6H05r4ZGsKmXjPNeAmU8YfLz8l20zgQwxwugUg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=nxZFHv0VPLjN6ZoDApV1hPYlaSaMMW3c4caYzV/jGtomIEDKlaHT41EMiwlkwKCGF
	 N3/EyRkTE3zF32to0I83RaSbmSUcytOSt2SLVLG/01r9ZJJqcQdsvJyntIXo1nVTaQ
	 +ymCtvCwv4Ty0YzpHPGrgY8TJd+MeGp07JKAfKLHGHUVfuyzES/RHSzalr9MK8kzUv
	 UExXLh/jwCvv1P/hkEWYCbl03gwXF1tAY8I19RfEVHDeB/d+HBA6oH7XoRSWhBbWRX
	 wOTzTSJxgKUl59m5g5HhC74ZPJVvuBF5ZmaByp0Z37UtUi16PxPCqIq1+v0lVc01z5
	 LV4gIuLTtQgdQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC6AB610AC;
	Sun, 15 Mar 2026 22:18:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1707F357
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C921040AB4
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NtP9ZNzXNG6j for <buildroot@buildroot.org>;
 Sun, 15 Mar 2026 22:18:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F733408CD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7F733408CD
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B4E508285B; Sun, 15 Mar 2026 22:18:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Mar 2026 16:21:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bdacb1a48389f4ee41facb56c941e3ca50f6c431
X-Git-Newrev: 44c2393af96bc29cd2a7a9c28ab334925760c7c3
X-Patchwork-Hint: ignore
Message-Id: <20260315221800.B4E508285B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-apispec: bump version to
 6.10.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/44c2393af96bc29cd2a7a9c28ab334925760c7c3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/marshmallow-code/apispec/blob/6.10.0/CHANGELOG.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-apispec/python-apispec.hash | 4 ++--
 package/python-apispec/python-apispec.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-apispec/python-apispec.hash b/package/python-apispec/python-apispec.hash
index 45571f4c53..cd3a0c8aaf 100644
--- a/package/python-apispec/python-apispec.hash
+++ b/package/python-apispec/python-apispec.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/apispec/json
-md5  ccd10389ca94fe9acc7ff542b9bf1fa2  apispec-6.9.0.tar.gz
-sha256  7a38ce7c3eedc7771e6e33295afdd8c4b0acdd9865b483f8cf6cc369c93e8d1e  apispec-6.9.0.tar.gz
+md5  847fa44044377f3e52bf15abc471fe8c  apispec-6.10.0.tar.gz
+sha256  0a888555cd4aa5fb7176041be15684154fd8961055e1672e703abf737e8761bf  apispec-6.10.0.tar.gz
 # Locally computed sha256 checksums
 sha256  f345555ff39d6b573342781a6346a5202a8f14bce424fee41f910c6c5379cc7d  LICENSE
diff --git a/package/python-apispec/python-apispec.mk b/package/python-apispec/python-apispec.mk
index 2cc8bc2304..ddbb211244 100644
--- a/package/python-apispec/python-apispec.mk
+++ b/package/python-apispec/python-apispec.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_APISPEC_VERSION = 6.9.0
+PYTHON_APISPEC_VERSION = 6.10.0
 PYTHON_APISPEC_SOURCE = apispec-$(PYTHON_APISPEC_VERSION).tar.gz
-PYTHON_APISPEC_SITE = https://files.pythonhosted.org/packages/02/ad/30cd449f3a0cf213dd13d9af7ba869214d8c66d517939964d3f490307e46
+PYTHON_APISPEC_SITE = https://files.pythonhosted.org/packages/4a/f1/1f5a9332df3ecd90cc5ab69bc58a4174b8ba2ac1720c4c26b01d20751bf5
 PYTHON_APISPEC_SETUP_TYPE = flit
 PYTHON_APISPEC_LICENSE = MIT
 PYTHON_APISPEC_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
