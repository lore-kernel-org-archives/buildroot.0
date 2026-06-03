Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23EF9CD6E55
	for <buildroot@archiver.kernel.org>; Wed,  3 Jun 2026 21:55:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BDCD861BBD;
	Wed,  3 Jun 2026 21:55:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IZlFTgK6szoG; Wed,  3 Jun 2026 21:55:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE5A961BC8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780523714;
	bh=sP3FfZ0wJYF0AZAB10/HOcJ77Hs7Y2FeABKPU/mG2UM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=YA9kOZQf/Y+9JSB8qvOytgDvIq1ulCO+Zx4y1kmfxMAA3wPkuMcv6N/gLbhM8CAhi
	 +wdlgt1qmB6zhBA+V3gnCCTlAy8PF8wHAIDsolI3qAhJRPz5DG1thgs+4wHhUlQWAT
	 zhFEMFtBarCXJveJGEEQtFJpDlBNgYvbFY6R0lfiQb9qhq00UiQHfHwbRbBl1pED4M
	 G7PRkYrLozBbXnj6E4SMJB0+uKVUAEU8wNqxdcK6E/B33ElAEXMGiZ4G5dD8z01Y+Q
	 ve0qwQm5Si2wEHy5tnbrhKprILY3gC2lWAR0YUlfH8tgjByLEKWDIjbNVjUB0whVL9
	 fsStqBCmq1axw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE5A961BC8;
	Wed,  3 Jun 2026 21:55:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 67CBCDE
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 21:55:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 58DB142849
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 21:55:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qMmV7x6N0n18 for <buildroot@buildroot.org>;
 Wed,  3 Jun 2026 21:55:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A078742279
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A078742279
 for <buildroot@buildroot.org>; Wed,  3 Jun 2026 21:55:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8415C879C6; Wed,  3 Jun 2026 21:54:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 3 Jun 2026 23:03:46 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 720343782503cf9e1e12a7dc37373513289498c0
X-Git-Newrev: 6c1dd49656c26a960eb95ccf6fe686ee46eafa91
X-Patchwork-Hint: ignore
Message-Id: <20260603215457.8415C879C6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/spirv-{headers,
 tools}: bump to version 1.4.350.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6c1dd49656c26a960eb95ccf6fe686ee46eafa91
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

https://github.com/KhronosGroup/SPIRV-Tools/blob/vulkan-sdk-1.4.350.0/CHANGES

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/spirv-headers/spirv-headers.hash | 2 +-
 package/spirv-headers/spirv-headers.mk   | 2 +-
 package/spirv-tools/spirv-tools.hash     | 2 +-
 package/spirv-tools/spirv-tools.mk       | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/spirv-headers/spirv-headers.hash b/package/spirv-headers/spirv-headers.hash
index 2ddd887076..1d0057fb60 100644
--- a/package/spirv-headers/spirv-headers.hash
+++ b/package/spirv-headers/spirv-headers.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  cab0a654c4917e16367483296b44cdb1d614e3120c721beafcd37e3a8580486c  spirv-headers-1.4.341.0.tar.gz
+sha256  9905d9341f20388adb852c77dd982f2c4d539fd68e6c1f1bcebf034715f2d1d5  spirv-headers-1.4.350.0.tar.gz
 sha256  ea43b1de38a6f90c488800d66dec1ed671e68cda530266bc96951fb5b6307613  LICENSE
diff --git a/package/spirv-headers/spirv-headers.mk b/package/spirv-headers/spirv-headers.mk
index 413f7c3586..87c4eb1888 100644
--- a/package/spirv-headers/spirv-headers.mk
+++ b/package/spirv-headers/spirv-headers.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Keep in sync with spirv-tools version
-SPIRV_HEADERS_VERSION = 1.4.341.0
+SPIRV_HEADERS_VERSION = 1.4.350.0
 SPIRV_HEADERS_SITE = $(call github,KhronosGroup,SPIRV-Headers,vulkan-sdk-$(SPIRV_HEADERS_VERSION))
 SPIRV_HEADERS_LICENSE = MIT
 SPIRV_HEADERS_LICENSE_FILES = LICENSE
diff --git a/package/spirv-tools/spirv-tools.hash b/package/spirv-tools/spirv-tools.hash
index 37f8046545..9b7133016a 100644
--- a/package/spirv-tools/spirv-tools.hash
+++ b/package/spirv-tools/spirv-tools.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  15bfb678138cdf9cd1480dfb952547bbb66b763a735b6d5582578572f5c2e6f9  spirv-tools-1.4.341.0.tar.gz
+sha256  446b288fe76d3f31bbf9a405d62b97020ac0f135edb0ed5dbdf1136c488138f5  spirv-tools-1.4.350.0.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/spirv-tools/spirv-tools.mk b/package/spirv-tools/spirv-tools.mk
index af3cc659f5..c9735d7ecd 100644
--- a/package/spirv-tools/spirv-tools.mk
+++ b/package/spirv-tools/spirv-tools.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # Keep in sync with spirv-headers version
-SPIRV_TOOLS_VERSION = 1.4.341.0
+SPIRV_TOOLS_VERSION = 1.4.350.0
 SPIRV_TOOLS_SITE = $(call github,KhronosGroup,SPIRV-Tools,vulkan-sdk-$(SPIRV_TOOLS_VERSION))
 SPIRV_TOOLS_LICENSE = Apache-2.0
 SPIRV_TOOLS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
