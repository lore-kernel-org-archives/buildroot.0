Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14DA6F483E7
	for <buildroot@archiver.kernel.org>; Mon, 23 Mar 2026 19:48:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE89C82265;
	Mon, 23 Mar 2026 19:48:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QhFskffVLdBX; Mon, 23 Mar 2026 19:48:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 19516822EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774295299;
	bh=OC5e8TM/8oTE1KVHsQWuCDDgDrNP+siWlA3D/ji48bU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=AQdApkxhaj0YcKXC/d9nMBRzOiFCbKJs1tI+DLpewkaQsbUCJDd8XcyZ50YX7Uhl7
	 w61+JSfS0XhK+KY4udvEOOW3R+dUQICGbaGEUO//uPrYJAzbjGMC6uU36Gr52PpgG/
	 aiCeZluWUwiKgqb2HFF6Q+xnqp33XyUGPUT/ImXLSQ4OTSM/BWlNBcplFMnkP2zf9A
	 sd6yuD4b/BftJB/b8ZzA1HwYS1DAmU11mX6raT2FAotndhLOcFec2JE3CRL5zb2WDu
	 uHhE0bUL1IdimosgdOAV0YT1XvA/LZDNFgGtsH8aVIOvwKxnGtp4LRycast6fJ0UM2
	 idPq7YinQrl/Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 19516822EC;
	Mon, 23 Mar 2026 19:48:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 80D7AF4
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6D3194027F
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sRkW5Itwegnw for <buildroot@buildroot.org>;
 Mon, 23 Mar 2026 19:47:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B2EE84007D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B2EE84007D
 for <buildroot@buildroot.org>; Mon, 23 Mar 2026 19:47:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6AC2E84CF1; Mon, 23 Mar 2026 19:47:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 23 Mar 2026 20:26:56 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8b3d346bd4fb533c76edfc88485dcb9d0f7efaf3
X-Git-Newrev: 20c3eb6eb68432c37d5db69963be266b7f2d23f7
X-Patchwork-Hint: ignore
Message-Id: <20260323194746.6AC2E84CF1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libwebsockets: bump version to
 4.5.7
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/20c3eb6eb68432c37d5db69963be266b7f2d23f7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Changelog:
https://github.com/warmcat/libwebsockets/blob/v4.5.7/changelog

Signed-off-by: Vincent Cruz <mooz@blockos.org>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libwebsockets/libwebsockets.hash | 2 +-
 package/libwebsockets/libwebsockets.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libwebsockets/libwebsockets.hash b/package/libwebsockets/libwebsockets.hash
index 1466c8d9a2..6d708135d5 100644
--- a/package/libwebsockets/libwebsockets.hash
+++ b/package/libwebsockets/libwebsockets.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  472e6cfa77b6f80ff2cc176bc59f6cb2856df7e30e8f31afcbd1fc94ffd2f828  libwebsockets-4.4.1.tar.gz
+sha256  d08df7634da0a377a4e077400ed6b2d1d25cf0b239e89397cd39432c5eb437ac  libwebsockets-4.5.7.tar.gz
 sha256  6ff2868dd9d9e251de27574342663f4773a8c2f954128899eb6f3c2ba9d9a245  LICENSE
diff --git a/package/libwebsockets/libwebsockets.mk b/package/libwebsockets/libwebsockets.mk
index 2d3395c5dd..3c7e778ccc 100644
--- a/package/libwebsockets/libwebsockets.mk
+++ b/package/libwebsockets/libwebsockets.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBWEBSOCKETS_VERSION = 4.4.1
+LIBWEBSOCKETS_VERSION = 4.5.7
 LIBWEBSOCKETS_SITE = $(call github,warmcat,libwebsockets,v$(LIBWEBSOCKETS_VERSION))
 LIBWEBSOCKETS_LICENSE = MIT with exceptions
 LIBWEBSOCKETS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
