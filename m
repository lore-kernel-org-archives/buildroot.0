Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37EABE7BDA4
	for <buildroot@archiver.kernel.org>; Mon, 16 Feb 2026 11:48:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 52BAB80CFE;
	Mon, 16 Feb 2026 11:48:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aIc_6Xs3FAQ8; Mon, 16 Feb 2026 11:48:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E2F883546
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771242506;
	bh=eeXOMdPF11KVQb8h/rxbGJ98u69GDSK+61soVTpWWLM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=TxYvFs5ZSbSRirzXPyqhk9wuCbFcrTanxTIf7NmIa8CjDf2cTyFXjU5V/dVAAN6Hp
	 Ul8oYB0gx09CJ533tJs/p5ESLK97dvolItiA3dchHYFm9EoMR62qqN4/5WBVWJvHM8
	 uP5eJw6w/zco0KYgha2iKSEpFHJLGjUOIys26+Fzc2K4TfAWnI2mnd2F5Bjifv3CGj
	 O7CT5j1G+Nmw2mAqqSC5dxjro5W/6AQBs/X8RG4nRJK0FvKvu1xQc2X44HhslgloqZ
	 IEyOBKsi3GqkWt4kJ0k+7k5McJfXAFrEvOmTzzHUNenLXV34WYQcKA9sJNjJJod+dp
	 uCTeqlL4rnYZw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E2F883546;
	Mon, 16 Feb 2026 11:48:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6F1E5395
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 11:48:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 608F640B88
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 11:48:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I1l1Ne1rKTdu for <buildroot@buildroot.org>;
 Mon, 16 Feb 2026 11:48:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3EFA340B7B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3EFA340B7B
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 11:48:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2271586ED2; Mon, 16 Feb 2026 11:48:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 16 Feb 2026 11:54:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4142783e10fbf7225088cb26494e99dab8dd542a
X-Git-Newrev: 8340535bb354b580c63d81d791dbeea705ed873f
X-Patchwork-Hint: ignore
Message-Id: <20260216114823.2271586ED2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-textual: bump to version
 7.5.0
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8340535bb354b580c63d81d791dbeea705ed873f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Changes:
https://github.com/Textualize/textual/releases/tag/v7.0.1
https://github.com/Textualize/textual/releases/tag/v7.0.2
https://github.com/Textualize/textual/releases/tag/v7.0.3
https://github.com/Textualize/textual/releases/tag/v7.1.0
https://github.com/Textualize/textual/releases/tag/v7.2.0
https://github.com/Textualize/textual/releases/tag/v7.3.0
https://github.com/Textualize/textual/releases/tag/v7.4.0
https://github.com/Textualize/textual/releases/tag/v7.5.0

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-textual/python-textual.hash | 4 ++--
 package/python-textual/python-textual.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-textual/python-textual.hash b/package/python-textual/python-textual.hash
index 7a9c2d403e..68f996aeec 100644
--- a/package/python-textual/python-textual.hash
+++ b/package/python-textual/python-textual.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/textual/json
-md5  e8d6a911d150acdf7b46dc30a1a1d94d  textual-7.0.0.tar.gz
-sha256  617638a2be74fb7507aff3ea6ec9374148be02e5a7bb1d02396d1d557b66c0a9  textual-7.0.0.tar.gz
+md5  88b5c60f9713a6cc3b5cf625c4f5efe3  textual-7.5.0.tar.gz
+sha256  c730cba1e3d704e8f1ca915b6a3af01451e3bca380114baacf6abf87e9dac8b6  textual-7.5.0.tar.gz
 # Locally computed sha256 checksums
 sha256  94f290a762376dfdb7768e42070618b0abfd2a2799eab1b1c097816c3a39eb57  LICENSE
diff --git a/package/python-textual/python-textual.mk b/package/python-textual/python-textual.mk
index 77187b3102..93881f6d02 100644
--- a/package/python-textual/python-textual.mk
+++ b/package/python-textual/python-textual.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TEXTUAL_VERSION = 7.0.0
+PYTHON_TEXTUAL_VERSION = 7.5.0
 PYTHON_TEXTUAL_SOURCE = textual-$(PYTHON_TEXTUAL_VERSION).tar.gz
-PYTHON_TEXTUAL_SITE = https://files.pythonhosted.org/packages/d4/9c/ebc9ca1f95366bef4c0e8360f4a77400d47a79aeecc08747de1990ef8bdc
+PYTHON_TEXTUAL_SITE = https://files.pythonhosted.org/packages/9f/38/7d169a765993efde5095c70a668bf4f5831bb7ac099e932f2783e9b71abf
 PYTHON_TEXTUAL_SETUP_TYPE = poetry
 PYTHON_TEXTUAL_LICENSE = MIT
 PYTHON_TEXTUAL_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
