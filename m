Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75A93CD343B
	for <buildroot@archiver.kernel.org>; Thu,  7 May 2026 07:16:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1FEA641096;
	Thu,  7 May 2026 07:16:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9w-DwpgrUdHo; Thu,  7 May 2026 07:16:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2EA4E41091
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778138171;
	bh=WXqu9Z4idijwuKCl0/vHBAUGe6kgIfOyEYt4rhCBsAQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=grEJFJSazpruNDrD7On86XnmjALPKT59yjRZZGQOHy1NipkukEe+skntW72dkQ1Hc
	 zpaYo9N1llux210JOgYS0xGDF30uvPr+lgPZ3uKK8/lyLEDfQLFD+82LS0wZ6r10jO
	 np7gcPaoZBrKsZnmEYIq4tkDfhhpSH5sTChioyqhlebaxJ6S+DpcHfmuvIJbDZ+Sog
	 qhtQIjX07m0K2FU4jmodegOXIkV0KTgVsTd83R3zSwNCZGPwZjrphLEc+S86tP6Mmz
	 G9hzNsjzDPBs5wupnvLJ0qEFwHD3x7q6C8SGvngNe6oSpJ2OJfOUyD+iutWjXVkO2h
	 VkLQbfRR1Q2/w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2EA4E41091;
	Thu,  7 May 2026 07:16:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 94F4B280
 for <buildroot@buildroot.org>; Thu,  7 May 2026 07:16:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7A37E83B7D
 for <buildroot@buildroot.org>; Thu,  7 May 2026 07:16:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nS3Pi2MjImdc for <buildroot@buildroot.org>;
 Thu,  7 May 2026 07:16:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=195.201.24.99;
 helo=mail.heine.tech; envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D214980F93
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D214980F93
Received: from mail.heine.tech (mail.heine.tech [195.201.24.99])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D214980F93
 for <buildroot@buildroot.org>; Thu,  7 May 2026 07:16:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 893A91814BF; Thu,  7 May 2026 09:16:03 +0200 (CEST)
To: buildroot@buildroot.org
Date: Thu,  7 May 2026 09:15:31 +0200
Message-ID: <20260507071539.1117087-2-buildroot@heine.tech>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=heine.tech; s=dkim; 
 t=1778138165; h=from:subject:date:message-id:to:cc:mime-version:
 content-transfer-encoding; bh=Fk2EVOg9w0/VZexzTw+ddBs7BX8oF033Ivu/wY1WVu0=;
 b=U48iEULGEVHtTpGT9SwllR4HSvNLXnqyLmdmKEgFHGzALFY2ToNxoLUeEeYIvHTrIvOZlU
 9Qu4nFmZhAOJKy0oDmBxssVNZ+CqKu19s+hs12+F2HFgl2YfBOQU1zyFSRaz5jTzSouuJS
 /SN7Ta3FZUAGtpZfJq4FrC9V0+T9UTQ=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=heine.tech
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=heine.tech header.i=@heine.tech header.a=rsa-sha256
 header.s=dkim header.b=U48iEULG
Subject: [Buildroot] [PATCH] mdio-tools: bump to version 1.3.2
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
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Cc: Robert Marko <robimarko@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

adds support for Microchip's paged PHYs.

Release Notes:
https://github.com/wkz/mdio-tools/releases/tag/1.3.2

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 package/mdio-tools/mdio-tools.hash | 2 +-
 package/mdio-tools/mdio-tools.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mdio-tools/mdio-tools.hash b/package/mdio-tools/mdio-tools.hash
index 19172e2cd6..c922fb43d0 100644
--- a/package/mdio-tools/mdio-tools.hash
+++ b/package/mdio-tools/mdio-tools.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  652353ba153fdd8b1d58ded4b90d0639536d705aa5923018e27ea0b78aa8e4fb  mdio-tools-1.3.1.tar.gz
+sha256  44bb2a15303763ed0fed0941a6f49a89377aa3e905ffcf6542f27da458664bb5  mdio-tools-1.3.2.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/mdio-tools/mdio-tools.mk b/package/mdio-tools/mdio-tools.mk
index e61f847e13..0225f910f9 100644
--- a/package/mdio-tools/mdio-tools.mk
+++ b/package/mdio-tools/mdio-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MDIO_TOOLS_VERSION = 1.3.1
+MDIO_TOOLS_VERSION = 1.3.2
 MDIO_TOOLS_SITE = https://github.com/wkz/mdio-tools/releases/download/$(MDIO_TOOLS_VERSION)
 MDIO_TOOLS_LICENSE = GPL-2.0
 MDIO_TOOLS_LICENSE_FILES = COPYING
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
