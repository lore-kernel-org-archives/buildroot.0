Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DEADD4337D
	for <buildroot@archiver.kernel.org>; Fri, 12 Dec 2025 07:57:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0624583DA3;
	Fri, 12 Dec 2025 07:57:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yroen0RRSr44; Fri, 12 Dec 2025 07:57:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5383C83DCE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765526246;
	bh=ITVpGq3QR+zXPl0V0mdfYc5jgNuEi/KsqVAKpotNybA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=cq5SMfdaN2iQk2fZoNpaImgkLMKPrYDIJ5oshlGx3WQt+ZfM5L1v/eQrPC7i/vyHX
	 sTQxITdFo3vepDitHeDSxpvrPWnRhqnhlyoJo4vBmuOeSOS5nMeJautse4Wzi8RunG
	 3DsC7QmWxU1HdsqUkTWN77nblonM4bvLk9egMbcQr/YdXQ/RkhQee1RaV4Sz7Rip6R
	 XmvHsWE8LBbe7YMMSGLx5/H/+5aWuxtwtWNR0IYvZbK/Kt6S3ULnUqWK4LebmP55Gu
	 WwplOmTV7dBHMwv1UImiexZ97vcpA6gKlOSPkN4cqHneyabquw4sw7DaqTcNqUVZuX
	 2DGzAUYMhSabA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5383C83DCE;
	Fri, 12 Dec 2025 07:57:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id F1AB2E7
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:56:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7618F41156
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YJZ4-euL8tJv for <buildroot@buildroot.org>;
 Fri, 12 Dec 2025 07:55:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8483541136
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8483541136
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 837DF86C93; Fri, 12 Dec 2025 07:55:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 28 Nov 2025 19:38:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e4ddb6a8923e7e8e3ccf699ce6d842c1e5cfa609
X-Git-Newrev: f0a632df16b1515c003d12f009495ca8f3d1c12f
X-Patchwork-Hint: ignore
Message-Id: <20251212075535.837DF86C93@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-idna: bump to 3.11
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

commit: https://git.buildroot.net/buildroot/commit/?id=f0a632df16b1515c003d12f009495ca8f3d1c12f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changes: https://github.com/kjd/idna/blob/v3.11/HISTORY.rst

LICENSE.md hash changes due to copyright year update in:
https://github.com/kjd/idna/commit/17f30a644563860262436a552d99e3ab0c505da4

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-idna/python-idna.hash | 6 +++---
 package/python-idna/python-idna.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-idna/python-idna.hash b/package/python-idna/python-idna.hash
index fbf571f806..188f290f41 100644
--- a/package/python-idna/python-idna.hash
+++ b/package/python-idna/python-idna.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/idna/json
-md5  28448b00665099117b6daa9887812cc4  idna-3.10.tar.gz
-sha256  12f65c9b470abda6dc35cf8e63cc574b1c52b11df2c86030af0ac09b01b13ea9  idna-3.10.tar.gz
+md5  9a9c33db960e0d35cc5b257c37dabeff  idna-3.11.tar.gz
+sha256  795dafcc9c04ed0c1fb032c2aa73654d8e8c5023a7df64a53f39190ada629902  idna-3.11.tar.gz
 # Locally computed sha256 checksums
-sha256  a59f0b0ef3635874109a4461ca44ff7a70d50696e814767bfaf721d4c9b0db0f  LICENSE.md
+sha256  b7a336abf3b04e180ec065cdd16e705d079e1cc7a14f910aa6e9187f36b9cd87  LICENSE.md
diff --git a/package/python-idna/python-idna.mk b/package/python-idna/python-idna.mk
index c7b7f6ad00..2b654a480c 100644
--- a/package/python-idna/python-idna.mk
+++ b/package/python-idna/python-idna.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_IDNA_VERSION = 3.10
+PYTHON_IDNA_VERSION = 3.11
 PYTHON_IDNA_SOURCE = idna-$(PYTHON_IDNA_VERSION).tar.gz
-PYTHON_IDNA_SITE = https://files.pythonhosted.org/packages/f1/70/7703c29685631f5a7590aa73f1f1d3fa9a380e654b86af429e0934a32f7d
+PYTHON_IDNA_SITE = https://files.pythonhosted.org/packages/6f/6d/0703ccc57f3a7233505399edb88de3cbd678da106337b9fcde432b65ed60
 PYTHON_IDNA_LICENSE = BSD-3-Clause
 PYTHON_IDNA_LICENSE_FILES = LICENSE.md
 PYTHON_IDNA_SETUP_TYPE = flit
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
