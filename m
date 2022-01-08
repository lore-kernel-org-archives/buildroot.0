Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77C5CC433F5
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 18:34:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F4C340880;
	Sat,  8 Jan 2022 18:34:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dt74gFoMMJhd; Sat,  8 Jan 2022 18:34:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9125140872;
	Sat,  8 Jan 2022 18:34:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 303AE1BF593
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 18:34:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1AB2740872
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 18:34:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h0wbqqIPTV9P for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 18:34:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9619240761
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 18:34:00 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id k30so411660wrd.9
 for <buildroot@buildroot.org>; Sat, 08 Jan 2022 10:34:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rphaAwUW73qqphM8VhUA4W9BPXbUHf1ixYqX/qZtGSY=;
 b=lTk/XWe6JiEpYHh+pbFmvjSQ4y1Eahi0kwgc854jqcvlikSL06ikDpVHPcyl+K/gAL
 7a7m6aOfnEnPQFalF2H3vuluWcPnN5eO+1XG4iMfBwy4oJijQr+evhK15cBKbeJkKhfZ
 gfg3OfLqLhGIkqz3Th6zbN6sQCy/1gtbH7DrpLzwRYrkL0aBLHltUsZ7NjnqYjWzDySO
 xDZy2z1kGh9yopYXCnwtaTntzz00id17jraMmO1hTlFo0z9bNLDpxQ3sJ5D8dWVxYZPn
 IhnMlMsLKoC4SU5uRG0klfJJuSD3Q0BYnidIdxHRfiUID7Aa0jjK9X3X/hX3qEJ5/G/2
 QdnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rphaAwUW73qqphM8VhUA4W9BPXbUHf1ixYqX/qZtGSY=;
 b=lEE5ilUUXQ5JQ3nILc+r3NbYJXZwrJ8X1ifAPWji77jUI4SeB2WkpsmESC2DCJ2Z0Q
 y6E5YZaADivUJ8s5eMnn0mNZmTDPzj/5dK1Pw2IU5h+XGVO7x5yxa28sivU/jSRm16vL
 pNLvBKQ8R9Y1EMp274LcbRVPR8VNtnRzohFOpONlsYKIK+I1Sv1MfT5xGRz1hKaqYRui
 OnvS1XV4LOnfvAJGBER3mJpPsYkWT+i9yyO2QVu9HLBpnu7aSAfplKQooqyEjsYDQyqB
 Dbs3/U6YW7P54UGN2ZiwUtqLdllFFhvGLrLjYVt+kdIuB0orUlsaeZBWPT3XhmYcwUg3
 Cd5w==
X-Gm-Message-State: AOAM533S5OIoSJbTyNXDJM8PVGftkO7eoybH1/LTiR0ErVqnZd5hQJ7u
 xN29Ynn3ipoB3eOVuhUj18z4aWgirBE=
X-Google-Smtp-Source: ABdhPJwg6yr4bzXiqD27HoFz8ct80ie5kyQwN4wZqRH8Vssl3FuXdy8L5WUwyijs/ykXQFEyJapK6w==
X-Received: by 2002:a5d:6a48:: with SMTP id t8mr7574293wrw.654.1641666838816; 
 Sat, 08 Jan 2022 10:33:58 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id r19sm1377043wmh.42.2022.01.08.10.33.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Jan 2022 10:33:58 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  8 Jan 2022 19:32:41 +0100
Message-Id: <20220108183241.3051683-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/squid: bump to version 5.3
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

5.x is the latest stable version, 4.x is provided for archival purpose
only and is not intended for general use in new installations.

http://www.squid-cache.org/Versions/v5/squid-5.3-RELEASENOTES.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/squid/squid.hash | 8 ++++----
 package/squid/squid.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/squid/squid.hash b/package/squid/squid.hash
index b1a8feb78e..e18ed8961e 100644
--- a/package/squid/squid.hash
+++ b/package/squid/squid.hash
@@ -1,6 +1,6 @@
-# From http://www.squid-cache.org/Versions/v4/squid-4.17.tar.xz.asc
-md5  47b94b2d27516f1764c9d5dc1b9645e5  squid-4.17.tar.xz
-sha1  f6bd15fabbd67b53a831fe9f67de3279868036c1  squid-4.17.tar.xz
+# From http://www.squid-cache.org/Versions/v5/squid-5.3.tar.xz.asc
+md5  9249f30169ab6600e53b4f9b8129b3b0  squid-5.3.tar.xz
+sha1  d3a8310c725616fa7565d60f3bf8fdf5fa20b15a  squid-5.3.tar.xz
 # Locally calculated
-sha256  cb928ac08c7c86b151b1c8f827abe1a84d83181a2a86e0d512286163e1e31418  squid-4.17.tar.xz
+sha256  45178588df1311ded41ebadd632840c4d93a8d7f5f60e38e74acf2f1ae2f1715  squid-5.3.tar.xz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/squid/squid.mk b/package/squid/squid.mk
index a30a87e20d..3847fb49dc 100644
--- a/package/squid/squid.mk
+++ b/package/squid/squid.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-SQUID_VERSION = 4.17
+SQUID_VERSION = 5.3
 SQUID_SOURCE = squid-$(SQUID_VERSION).tar.xz
-SQUID_SITE = http://www.squid-cache.org/Versions/v4
+SQUID_SITE = http://www.squid-cache.org/Versions/v5
 SQUID_LICENSE = GPL-2.0+
 SQUID_LICENSE_FILES = COPYING
 SQUID_CPE_ID_VENDOR = squid-cache
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
