Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A93ED597B0
	for <buildroot@archiver.kernel.org>; Wed, 13 Nov 2024 16:49:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1636F40605;
	Wed, 13 Nov 2024 16:49:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lpqlVeYaWGf5; Wed, 13 Nov 2024 16:49:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B1ADD40621
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1ADD40621;
	Wed, 13 Nov 2024 16:49:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BEA97E2E
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 16:49:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 58E3240B32
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 16:48:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AzJ9VA0HPv1j for <buildroot@buildroot.org>;
 Wed, 13 Nov 2024 16:48:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 64D4C40B7E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 64D4C40B7E
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 16:48:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 61C6286308; Wed, 13 Nov 2024 16:48:56 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 13 Nov 2024 17:46:18 +0100
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: 046ba99e91c7be63a4997ac17ace9a0daee6e1b4
X-Git-Newrev: b4b4522e6353fa08be380837bedd41c75c92608c
X-Patchwork-Hint: ignore
Message-Id: <20241113164856.61C6286308@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] package/nghttp2: security
 bump to 1.64.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=b4b4522e6353fa08be380837bedd41c75c92608c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

Changelog:
* https://github.com/nghttp2/nghttp2/releases/tag/v1.59.0
* https://github.com/nghttp2/nghttp2/releases/tag/v1.60.0
* https://github.com/nghttp2/nghttp2/releases/tag/v1.61.0
* https://github.com/nghttp2/nghttp2/releases/tag/v1.62.0
* https://github.com/nghttp2/nghttp2/releases/tag/v1.63.0
* https://github.com/nghttp2/nghttp2/releases/tag/v1.64.0

Fixes: CVE-2024-28182 [1] - Reading unbounded number of HTTP/2
        CONTINUATION frames to cause excessive CPU usage

[1] https://github.com/nghttp2/nghttp2/security/advisories/GHSA-x6x3-gv8h-m57q

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 55d48e866e471e0b704f3ae56300cca6e87d7559)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nghttp2/nghttp2.hash | 2 +-
 package/nghttp2/nghttp2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nghttp2/nghttp2.hash b/package/nghttp2/nghttp2.hash
index dddf6fe1bd..4b60d6d143 100644
--- a/package/nghttp2/nghttp2.hash
+++ b/package/nghttp2/nghttp2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  4a68a3040da92fd9872c056d0f6b0cd60de8410de10b578f8ade9ecc14d297e0  nghttp2-1.58.0.tar.xz
+sha256  88bb94c9e4fd1c499967f83dece36a78122af7d5fb40da2019c56b9ccc6eb9dd  nghttp2-1.64.0.tar.xz
 sha256  6b94f3abc1aabd0c72a7c7d92a77f79dda7c8a0cb3df839a97890b4116a2de2a  COPYING
diff --git a/package/nghttp2/nghttp2.mk b/package/nghttp2/nghttp2.mk
index 7a05e38fa9..98f837e28e 100644
--- a/package/nghttp2/nghttp2.mk
+++ b/package/nghttp2/nghttp2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NGHTTP2_VERSION = 1.58.0
+NGHTTP2_VERSION = 1.64.0
 NGHTTP2_SOURCE =  nghttp2-$(NGHTTP2_VERSION).tar.xz
 NGHTTP2_SITE = https://github.com/nghttp2/nghttp2/releases/download/v$(NGHTTP2_VERSION)
 NGHTTP2_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
