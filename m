Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CF5DC433F5
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 19:31:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2CAB4290F;
	Fri,  7 Jan 2022 19:31:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ogSMoHvj__gg; Fri,  7 Jan 2022 19:31:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A763428E0;
	Fri,  7 Jan 2022 19:31:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F1A6E1BF5DC
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 19:31:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EB48040192
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 19:31:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6cYw2wl6hWIM for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 19:31:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CDF5140002
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 19:31:26 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id o30so4623257wms.4
 for <buildroot@buildroot.org>; Fri, 07 Jan 2022 11:31:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=h3ljPGF9QTVkr8oZ3INp2swi5CrWia69i5tIHaI3l3Q=;
 b=k9QeduCNRuwDhIvJ95xLM7Pcm88WpwTH7CfjvRwr1lfy5kTLIHab+j5J0nqiWgduqN
 2p33U51tIZm2QSxdIFiK5KWHgoNdNqqqeu+RnsFdlbuwnbhwV8dGBtZtyaA02CYP4bXl
 X5zPb2k8mDTBpRNB4v3QAEl5kJQdi8yRGraEwXmYlcyM8Kn9oyewyCtdpAvn+4ioISSB
 C3eak0rYE6WHBsWKFkELkqBbTUhm97ELrL2ZMjWuIIQXljHCAp22GYpMbQdcneEpyuIN
 6kHjSBBkugx30zz91Wly0ubrbSmt/FuOQt7dSU9fvY/Hcm1+5HcrCJ2fXA5dAYNzLwrv
 XIkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=h3ljPGF9QTVkr8oZ3INp2swi5CrWia69i5tIHaI3l3Q=;
 b=jv08vqJkm4TiiHGcHYpdHEXpEGA68Wv0Rh5udu16YBGnhCNyvVbzIYa0rpJYDivUej
 7QTaES+U4oq47j9EQZa1p3uui+qsxikbnBcxVQzw7va1Y5z8oEO3yWfCBlr5SlQwPcO+
 EncrmnJDPM6uozhqJOOmjSco49GYdzkFAQG2zDDM03BoujvtOxluVbGfluDoB08rT8rC
 r7z5s3j9C5SWzsdH3iBp0bzaNbCST+6LXRp++rM0OAR+4fA8MEajELDO/RkYVZTJFppd
 b/bPzuDCxv/1JG1/lySxPHaYyp1im2CmrVyI7fRO1Xh5fy0iXQDknXvR+G1uRgbe6AdV
 3AeA==
X-Gm-Message-State: AOAM533z8j3HXW3IgKTQ8B8QbozMUli1GCjc4LGQFTdKgviVQnIOrQVA
 dceyc4jn6pRuof7EiI66/Ce6U1q55WU=
X-Google-Smtp-Source: ABdhPJymbLCap7n58LAn1XWsncLfNvY88wuJtWR4V2Ha9D0tyEyIN6ZJBukuCAjH55RHlthdSmAMDw==
X-Received: by 2002:a7b:c407:: with SMTP id k7mr10878625wmi.179.1641583884793; 
 Fri, 07 Jan 2022 11:31:24 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id y15sm1616035wmi.40.2022.01.07.11.31.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 11:31:24 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  7 Jan 2022 20:29:52 +0100
Message-Id: <20220107192952.1277336-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/mbuffer: bump to version 20211018
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Mircea Gliga <gliga.mircea@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mbuffer/mbuffer.hash | 4 ++--
 package/mbuffer/mbuffer.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/mbuffer/mbuffer.hash b/package/mbuffer/mbuffer.hash
index 7c200d543e..bab568d1d8 100644
--- a/package/mbuffer/mbuffer.hash
+++ b/package/mbuffer/mbuffer.hash
@@ -1,8 +1,8 @@
 # From http://www.maier-komor.de/mbuffer.html
-md5  4e4712db5fbd4e71bfbfa2c145c6c646  mbuffer-20210328.tgz
+md5  b6787260112e3ac416c0febdb097caa8  mbuffer-20211018.tgz
 
 # Locally computed after checking signature upstream
-sha256  51b5b8d8488991a55fe1dfce90130f9e47bc1ce286ba03b4f628c04b784fdc5d  mbuffer-20210328.tgz
+sha256  e240c1e4e4ac14c28be8c660ec47d44ce16b1e8ec92aa907ad13004ffd5db6e3  mbuffer-20211018.tgz
 
 # Hash for license file
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE
diff --git a/package/mbuffer/mbuffer.mk b/package/mbuffer/mbuffer.mk
index c7c4456651..bbf27579f1 100644
--- a/package/mbuffer/mbuffer.mk
+++ b/package/mbuffer/mbuffer.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MBUFFER_VERSION = 20210328
+MBUFFER_VERSION = 20211018
 MBUFFER_SOURCE = mbuffer-$(MBUFFER_VERSION).tgz
 MBUFFER_SITE = http://www.maier-komor.de/software/mbuffer
 MBUFFER_LICENSE = GPL-3.0+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
