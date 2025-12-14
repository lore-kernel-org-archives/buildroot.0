Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42FBDD59D99
	for <buildroot@archiver.kernel.org>; Sun, 14 Dec 2025 17:48:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0ADAF816FE;
	Sun, 14 Dec 2025 17:48:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KJhPgs62KFNV; Sun, 14 Dec 2025 17:48:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2CF5581702
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765734496;
	bh=frdES7BNazNyEds86f4N+fNMlik+lRLJ46iRoQuVNvc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qNdvf0hH8felIJRAkU78wQgpx4RaU84hoP6wQ2SPQoSSnCw8LWScMdIEDmsZRWduF
	 GAQrh141x4/R+b7d02bDiYyryfFARIEBqPqAIgRAkW/Mt44gwwaR709/9UmAt51ZYT
	 oIpqjUdTe8SNOOTBYOn7k9NwgLBGS/klzmgibHR/51NbP+uO/ebq2O0giNVyuwrq/R
	 DZsnApcKiLdeUTGtRbUGmC+4FbCpmu+HcgaVx3K7wixntCmFSSWhaNl5j/ws/+ituo
	 kgpndM1DPUP7NxhXqu2N4nKSRCuS1fDtmsdNcSocpKVkiPF8kjCuziA2uIZtg4ynxz
	 gRj9qOLEjC9jg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2CF5581702;
	Sun, 14 Dec 2025 17:48:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 45E9B2D0
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 17:48:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 57DCF406CB
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 17:47:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qivxna_ZG-me for <buildroot@buildroot.org>;
 Sun, 14 Dec 2025 17:47:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4B878406D4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4B878406D4
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 17:47:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4B45A86E93; Sun, 14 Dec 2025 17:47:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 14 Dec 2025 18:47:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b7a1da1548f73f8e51f7b984cd8669070ce8bf89
X-Git-Newrev: bc9568d588d389a5dc09c053ba0a7a62ffcdfbb3
X-Patchwork-Hint: ignore
Message-Id: <20251214174743.4B45A86E93@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-maturin: bump version to
 1.10.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=bc9568d588d389a5dc09c053ba0a7a62ffcdfbb3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog: https://github.com/PyO3/maturin/blob/v1.10.2/Changelog.md

Fixes build with python 3.14.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-maturin/python-maturin.hash | 2 +-
 package/python-maturin/python-maturin.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-maturin/python-maturin.hash b/package/python-maturin/python-maturin.hash
index f439f5d9b9..b530d93b49 100644
--- a/package/python-maturin/python-maturin.hash
+++ b/package/python-maturin/python-maturin.hash
@@ -1,5 +1,5 @@
 # Locally calculated after vendoring
-sha256  32ed28b14691d95daf862ec78cc26fcf01ce55eafd4b22b0c27c02f8d4530806  python-maturin-1.9.4-cargo4.tar.gz
+sha256  d50215b4a1ed4261f6de56413a954c14dfbc7f3481f176fe64ee078dd6a9a052  python-maturin-1.10.2-cargo4.tar.gz
 # Locally computed sha256 checksums
 sha256  a60eea817514531668d7e00765731449fe14d059d3249e0bc93b36de45f759f2  license-apache
 sha256  ea7882c559733766ad08343bde1d1ec80a4967c03a738fb8e0058ef6289f7b7c  license-mit
diff --git a/package/python-maturin/python-maturin.mk b/package/python-maturin/python-maturin.mk
index aab4ccef6f..e4d91a6545 100644
--- a/package/python-maturin/python-maturin.mk
+++ b/package/python-maturin/python-maturin.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MATURIN_VERSION = 1.9.4
+PYTHON_MATURIN_VERSION = 1.10.2
 PYTHON_MATURIN_SOURCE_PYPI = maturin-$(PYTHON_MATURIN_VERSION).tar.gz
-PYTHON_MATURIN_SITE_PYPI = https://files.pythonhosted.org/packages/13/7c/b11b870fc4fd84de2099906314ce45488ae17be32ff5493519a6cddc518a
+PYTHON_MATURIN_SITE_PYPI = https://files.pythonhosted.org/packages/02/44/c593afce7d418ae6016b955c978055232359ad28c707a9ac6643fc60512d
 PYTHON_MATURIN_SITE = $(PYTHON_MATURIN_SITE_PYPI)/$(PYTHON_MATURIN_SOURCE_PYPI)?buildroot-path=filename
 PYTHON_MATURIN_SETUP_TYPE = setuptools-rust
 PYTHON_MATURIN_LICENSE = Apache-2.0 or MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
