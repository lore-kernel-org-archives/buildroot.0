Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93C01D5B86E
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 21:10:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 55F8C60F04;
	Mon, 15 Dec 2025 21:10:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jiF39EzhcwY2; Mon, 15 Dec 2025 21:10:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5F22F60F08
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765833003;
	bh=cDhDaMdCaXfTFTB1hwYJdKKuxRzX+q/VnOolUgQOesk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Gfg6NZrsHtjr0mHHTpVaYTCjVQM/HkeA3bhCkMDStZ/2mqauY0nHWkSYdgcccTfUM
	 6GPWLWcwJxpwPcrHGmJ59j6VPuXu9hVy/TM2PaI6cA8Hq4C0Ww1FYCzzzn5V/BjP11
	 AXtcPby3RJB6bEk+h2/0SorsZaEZ3tCyjHCI41R1FgsvcDILTCnosN3dcFXSN2+kAM
	 mN5XqIiF+5hfE2fWrM4At0J9EzTPpy1Mqobn3bkSLYRirf/AO7NSfwUO75OwLpdwgf
	 x2DjzTGUcxDpZf6gKl809S2fAjPbh+hs9QT/j2XaxxAgkwoDmBOqYRWKGhOt9d71pM
	 C0sYLv4ibLjGw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5F22F60F08;
	Mon, 15 Dec 2025 21:10:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 99FF6151
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 21:10:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8864A81006
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 21:10:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xSi0J5XKpHEI for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 21:10:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 914AB80F6A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 914AB80F6A
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 21:10:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8E41886FB0; Mon, 15 Dec 2025 21:10:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Dec 2025 20:35:26 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8dde5a279ea97e24bf26af110a774b9fc698eb60
X-Git-Newrev: 44a77efb3e05fcf88aeb700ba7be8c819f09b766
X-Patchwork-Hint: ignore
Message-Id: <20251215211000.8E41886FB0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-markdown: bump version to
 3.10
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

commit: https://git.buildroot.net/buildroot/commit/?id=44a77efb3e05fcf88aeb700ba7be8c819f09b766
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://python-markdown.github.io/changelog/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-markdown/python-markdown.hash | 4 ++--
 package/python-markdown/python-markdown.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-markdown/python-markdown.hash b/package/python-markdown/python-markdown.hash
index 25725b3c8e..4aa4ff7c1c 100644
--- a/package/python-markdown/python-markdown.hash
+++ b/package/python-markdown/python-markdown.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/markdown/json
-md5  46aaa9fe3d42144f185368e819b7e720  markdown-3.9.tar.gz
-sha256  d2900fe1782bd33bdbbd56859defef70c2e78fc46668f8eb9df3128138f2cb6a  markdown-3.9.tar.gz
+md5  357bb6397bf50ee1b15f2de751a8e44f  markdown-3.10.tar.gz
+sha256  37062d4f2aa4b2b6b32aefb80faa300f82cc790cb949a35b8caede34f2b68c0e  markdown-3.10.tar.gz
 # Locally computed sha256 checksums
 sha256  7ba4eb6d10b32b2d11dce13821340351cdbbb30ba8ccc67841db2ffd86e79aca  LICENSE.md
diff --git a/package/python-markdown/python-markdown.mk b/package/python-markdown/python-markdown.mk
index 6fcdd6b830..2dc699c22f 100644
--- a/package/python-markdown/python-markdown.mk
+++ b/package/python-markdown/python-markdown.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MARKDOWN_VERSION = 3.9
+PYTHON_MARKDOWN_VERSION = 3.10
 PYTHON_MARKDOWN_SOURCE = markdown-$(PYTHON_MARKDOWN_VERSION).tar.gz
-PYTHON_MARKDOWN_SITE = https://files.pythonhosted.org/packages/8d/37/02347f6d6d8279247a5837082ebc26fc0d5aaeaf75aa013fcbb433c777ab
+PYTHON_MARKDOWN_SITE = https://files.pythonhosted.org/packages/7d/ab/7dd27d9d863b3376fcf23a5a13cb5d024aed1db46f963f1b5735ae43b3be
 PYTHON_MARKDOWN_LICENSE = BSD-3-Clause
 PYTHON_MARKDOWN_LICENSE_FILES = LICENSE.md
 PYTHON_MARKDOWN_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
