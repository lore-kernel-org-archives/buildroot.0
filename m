Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C98DEC87FCF
	for <buildroot@archiver.kernel.org>; Mon,  4 Aug 2025 19:41:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 97EF2613B0;
	Mon,  4 Aug 2025 19:41:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id puavnwB0w3rp; Mon,  4 Aug 2025 19:41:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6506561374
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6506561374;
	Mon,  4 Aug 2025 19:41:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id E1DF1118
 for <buildroot@buildroot.org>; Mon,  4 Aug 2025 19:40:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BA17140FD7
 for <buildroot@buildroot.org>; Mon,  4 Aug 2025 19:40:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wavAjFsRbb89 for <buildroot@buildroot.org>;
 Mon,  4 Aug 2025 19:40:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8509540A25
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8509540A25
 for <buildroot@buildroot.org>; Mon,  4 Aug 2025 19:40:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7290986E7D; Mon,  4 Aug 2025 19:40:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 4 Aug 2025 21:33:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e6e930be67b7c4b760caebc2b44631933216db0c
X-Git-Newrev: d149e6003374f99bc27d51ee82a0eb386e3c0043
X-Patchwork-Hint: ignore
Message-Id: <20250804194052.7290986E7D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pillow: security bump to
 version 11.3.0
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d149e6003374f99bc27d51ee82a0eb386e3c0043
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
https://pillow.readthedocs.io/en/stable/releasenotes/11.3.0.html

Fixes the following security issues:
CVE 2025-48379

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-pillow/python-pillow.hash | 4 ++--
 package/python-pillow/python-pillow.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pillow/python-pillow.hash b/package/python-pillow/python-pillow.hash
index abc5a4bf2e..d9077daaf7 100644
--- a/package/python-pillow/python-pillow.hash
+++ b/package/python-pillow/python-pillow.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pillow/json
-md5  ede5dce0bbbeff02099e2e297919a82a  pillow-11.1.0.tar.gz
-sha256  368da70808b36d73b4b390a8ffac11069f8a5c85f29eff1f1b01bcf3ef5b2a20  pillow-11.1.0.tar.gz
+md5  9464f92bed3be9c68293cb399ec1ec1a  pillow-11.3.0.tar.gz
+sha256  3828ee7586cd0b2091b6209e5ad53e20d0649bbe87164a459d0676e035e8f523  pillow-11.3.0.tar.gz
 # Locally computed sha256 checksums
 sha256  17f240ae101143707e5e7303a5d800450d9ccc7475b463cedb555cefdb3c6ece  LICENSE
diff --git a/package/python-pillow/python-pillow.mk b/package/python-pillow/python-pillow.mk
index 1053bec5d6..80961b92a5 100644
--- a/package/python-pillow/python-pillow.mk
+++ b/package/python-pillow/python-pillow.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-PYTHON_PILLOW_VERSION = 11.1.0
-PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/f3/af/c097e544e7bd278333db77933e535098c259609c4eb3b85381109602fb5b
+PYTHON_PILLOW_VERSION = 11.3.0
+PYTHON_PILLOW_SITE = https://files.pythonhosted.org/packages/f3/0d/d0d6dea55cd152ce3d6767bb38a8fc10e33796ba4ba210cbab9354b6d238
 PYTHON_PILLOW_SOURCE = pillow-$(PYTHON_PILLOW_VERSION).tar.gz
 PYTHON_PILLOW_LICENSE = HPND
 PYTHON_PILLOW_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
