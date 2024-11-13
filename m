Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34981D597B0
	for <buildroot@archiver.kernel.org>; Wed, 13 Nov 2024 16:50:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F0A2860895;
	Wed, 13 Nov 2024 16:50:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CM6dT7NmQODp; Wed, 13 Nov 2024 16:50:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0501B60891
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0501B60891;
	Wed, 13 Nov 2024 16:50:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2C51EE2E
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 16:50:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2EAAE80567
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 16:50:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X21NAzhijEOl for <buildroot@buildroot.org>;
 Wed, 13 Nov 2024 16:50:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 52D41804EE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 52D41804EE
 for <buildroot@buildroot.org>; Wed, 13 Nov 2024 16:50:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 41C108631C; Wed, 13 Nov 2024 16:50:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 13 Nov 2024 17:26:22 +0100
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 4875dbed58837174780e3f7c6ec7ef419fdbe9fe
X-Git-Newrev: efd6528e308a48802de1a35ecde7d310080b6e05
X-Patchwork-Hint: ignore
Message-Id: <20241113165000.41C108631C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/nghttp2: security
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

commit: https://git.buildroot.net/buildroot/commit/?id=efd6528e308a48802de1a35ecde7d310080b6e05
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

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
