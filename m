Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8074D5B86D
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 21:39:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ADA2F40B22;
	Mon, 15 Dec 2025 21:39:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ShAQWlu5y5-v; Mon, 15 Dec 2025 21:39:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA93A40B2D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765834749;
	bh=MXdCFUVIefu0ZSW4hihyKdfQk34gGLAJDHIkTLuX6IA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=px/qxeGJ/gVuwpBos53UJRQX0DFt9Fct8EXsQ2h0T+jgUrC6uCvw+L1qXUhZs0QPA
	 K5x8iN6ng+EDCHsCPvlW3RLFAaPZUXOQbnbK2wc2D0eDYf8MzBAS7bPEjA/Yijd0RG
	 FleTLEt6iODOs9gbloPblee+BG4cUdq2GRxef7bNzkFhQcfq7DR60gqy+cTVGSQ2as
	 +tzmuDdJpX/8pdqY8vhsOb2qLP79TV5yM+So+2onBKL5Xpp4pLyDwMZsNpqSuFZTUF
	 I5VMbXTCwGgcoUYmHdmWUKjL+qYGOOTKPGnfCor0iqf2r7P7mQhXFob0uIWNNfh3j2
	 Ygrr8W61zPUCQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA93A40B2D;
	Mon, 15 Dec 2025 21:39:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0C6FD117
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 21:38:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D01E840AE5
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 21:38:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YZWJn958Lu6x for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 21:38:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF22E40AE7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EF22E40AE7
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 21:38:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EE05986FC3; Mon, 15 Dec 2025 21:38:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Dec 2025 22:37:29 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fe0ef39d1f30e4bb40dbfcae62b3bcc9a4a2ba9f
X-Git-Newrev: 0a4d77768cb281739669ab88044bf5ca7537dc78
X-Patchwork-Hint: ignore
Message-Id: <20251215213844.EE05986FC3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-segno: bump version to 1.6.6
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

commit: https://git.buildroot.net/buildroot/commit/?id=0a4d77768cb281739669ab88044bf5ca7537dc78
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/heuer/segno/blob/1.6.6/CHANGES.rst

Updated license hash due to copyright year bump:
https://github.com/heuer/segno/commit/780296986b9b5c7934667935c8d654d0a7e97262

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-segno/python-segno.hash | 6 +++---
 package/python-segno/python-segno.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-segno/python-segno.hash b/package/python-segno/python-segno.hash
index a467b663e8..ce1e9b8691 100644
--- a/package/python-segno/python-segno.hash
+++ b/package/python-segno/python-segno.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/segno/json
-md5  3835036bcf44667eb0a155107ed1ac67  segno-1.6.1.tar.gz
-sha256  f23da78b059251c36e210d0cf5bfb1a9ec1604ae6e9f3d42f9a7c16d306d847e  segno-1.6.1.tar.gz
+md5  088bb1d2ec7f279e91cd3a8936ef7d3d  segno-1.6.6.tar.gz
+sha256  e60933afc4b52137d323a4434c8340e0ce1e58cec71439e46680d4db188f11b3  segno-1.6.6.tar.gz
 # Locally computed sha256 checksums
-sha256  720b7b93e4e80374be9aee88c650a468ae6a6b6471ce4581058dedce23d3cf9d  LICENSE
+sha256  de6c85fccf5d52902aa13dfe2dc6d2a2a106fc3419ed438f3460f0d4b76a6935  LICENSE
diff --git a/package/python-segno/python-segno.mk b/package/python-segno/python-segno.mk
index 03efcb5c0f..f1fc76945f 100644
--- a/package/python-segno/python-segno.mk
+++ b/package/python-segno/python-segno.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SEGNO_VERSION = 1.6.1
+PYTHON_SEGNO_VERSION = 1.6.6
 PYTHON_SEGNO_SOURCE = segno-$(PYTHON_SEGNO_VERSION).tar.gz
-PYTHON_SEGNO_SITE = https://files.pythonhosted.org/packages/5d/74/3896e205306a1b43d6b88326e5838572d97b4b74df8c9cd11acfcd9db503
+PYTHON_SEGNO_SITE = https://files.pythonhosted.org/packages/1c/2e/b396f750c53f570055bf5a9fc1ace09bed2dff013c73b7afec5702a581ba
 PYTHON_SEGNO_SETUP_TYPE = flit
 PYTHON_SEGNO_LICENSE = BSD-3-Clause
 PYTHON_SEGNO_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
