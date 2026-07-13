Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11396C43458
	for <buildroot@archiver.kernel.org>; Mon, 13 Jul 2026 15:57:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA0DA40949;
	Mon, 13 Jul 2026 15:57:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tOi9bqtQf1D9; Mon, 13 Jul 2026 15:57:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9AC3C40953
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783958237;
	bh=JTeD3BiGEfswQczrC8AThld7ab1XgniDf4NFaZKsmGY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=JzTa0mVRDE4gV7/whvfUs5rlA59Xi1F7EihRoRg46F/6AxJKloXqrVERQ6gQIvjqn
	 tDhoHXlr5+Mb9/DCGxnpoxvVHMyKhLoXajsFEoqu1KRx20K6w9s7U5cjaEKxkj0jD+
	 W89WG4bfVWrgPN0KVM6P8JC1CRKppkJg2r5iKFsoGO7kPgJWuStFhWu7PwBuBm/KI8
	 V1qU0nVQfsDJ96GjgVSS4D1dHpjP5BJGNJdjvv3/MCjc9ZMRt6wcSoDAuS6aQ8XBQH
	 mg3d4a+jJ0bpc4JWABKMlq3Fb+DXQybXzR21pyiI9uub1Yb8bnlYil3Pkdt2E/DhHD
	 jL1U9il637uKg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9AC3C40953;
	Mon, 13 Jul 2026 15:57:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E18732EE
 for <buildroot@buildroot.org>; Mon, 13 Jul 2026 15:57:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C7A6B401CB
 for <buildroot@buildroot.org>; Mon, 13 Jul 2026 15:57:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9vLE64CIMunX for <buildroot@buildroot.org>;
 Mon, 13 Jul 2026 15:57:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 154C5401F2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 154C5401F2
 for <buildroot@buildroot.org>; Mon, 13 Jul 2026 15:57:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B7443887DD; Mon, 13 Jul 2026 15:56:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 13 Jul 2026 17:45:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 07ee6534146c4db4ff1ed098bbd75d89a47f9a83
X-Git-Newrev: e51d66866eb834d0afc8cfdd0e38c78482ef98df
X-Patchwork-Hint: ignore
Message-Id: <20260713155641.B7443887DD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/transmission: bump version to 4.1.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e51d66866eb834d0afc8cfdd0e38c78482ef98df
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/transmission/transmission/releases/tag/4.1.3

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/transmission/transmission.hash | 2 +-
 package/transmission/transmission.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/transmission/transmission.hash b/package/transmission/transmission.hash
index 45a3863dca..0e81ec8ec1 100644
--- a/package/transmission/transmission.hash
+++ b/package/transmission/transmission.hash
@@ -1,4 +1,4 @@
 # From https://transmissionbt.com/download
-sha256  4c6070bdfae264a629cb2b0f1eaf567cb9c6208f9218aa446c0aee883eb0f1fc  transmission-4.1.2.tar.xz
+sha256  ce7d2d8b101f7eb54bc3cf0bc55f52f7ebd4a25fa48e00bdca9a7e0fc02617da  transmission-4.1.3.tar.xz
 # Locally calculated
 sha256  9715b55d11caa499d34a6e23498c766fe1ece4ace57777553313e27d688dee78  COPYING
diff --git a/package/transmission/transmission.mk b/package/transmission/transmission.mk
index c811dcd6e5..0f5ee5d6ac 100644
--- a/package/transmission/transmission.mk
+++ b/package/transmission/transmission.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TRANSMISSION_VERSION = 4.1.2
+TRANSMISSION_VERSION = 4.1.3
 TRANSMISSION_SOURCE = transmission-$(TRANSMISSION_VERSION).tar.xz
 TRANSMISSION_SITE = https://github.com/transmission/transmission/releases/download/$(TRANSMISSION_VERSION)
 TRANSMISSION_DEPENDENCIES = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
