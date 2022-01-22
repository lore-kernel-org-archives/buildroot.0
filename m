Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34428C433F5
	for <buildroot@archiver.kernel.org>; Sat, 22 Jan 2022 22:13:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C6C3A408E6;
	Sat, 22 Jan 2022 22:13:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ag4vYpeCd-ET; Sat, 22 Jan 2022 22:13:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1126B4033B;
	Sat, 22 Jan 2022 22:13:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0E66D1BF59F
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 22:13:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F177060B54
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 22:13:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D-JGGHKDPpKs for <buildroot@lists.busybox.net>;
 Sat, 22 Jan 2022 22:13:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 18FB360AB2
 for <buildroot@buildroot.org>; Sat, 22 Jan 2022 22:13:30 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id v6so6520872wra.8
 for <buildroot@buildroot.org>; Sat, 22 Jan 2022 14:13:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jrFBSq1fUrVkiAAwO9idNo7wF8aR/HEgBsGOL4UEtaQ=;
 b=EsMGwbyRcgxf3snlYpgWQBMBdN4qMCF5gUJbVG3vj1jv7d+DIuM4SSMEOA0JItFlUB
 jf6XyrulC40ffZ/mbnXRwMU8sMkAvKEjzfBXJqLwDYYfPHdeie4m05o9oJTT1ZEpFVdc
 JVacwWGGnl+da7gwpqeqvrI3uvzjsZpzSYUXIvGFTGfRZ50e3bBG0k2wX8D49bhWYylf
 AzUIGucGCXzzj6LTMiMDPsGDIdkKOQcsdTmHaeT+45M9PGepKTHuArFT5LfnPT3uWWsH
 ZNCaTZobCV9Ta2pn8W05W7QeWpHZ+n9lMaFhfvsZyeUBWhuujKx1unva7F9Hpm+PdzcC
 hvpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jrFBSq1fUrVkiAAwO9idNo7wF8aR/HEgBsGOL4UEtaQ=;
 b=3UlwHZ5jXSEgEpvJVCDnZn6jSiTXeI8HS0kYhS7ltjWEngde1n16UzRz30wA1KZKuM
 d+TSdXSceFRfU4j6fzb6oo947di+eKlBEkGw5b4hRwBwQDA/Ec1SW8ob1tBgL6Eid37k
 LRO/6U9X9QmsfDM+U13Ccy1QnKOMleaLgOQGLnxINokqbvQ5DlBPYZhqCua825mFxkFO
 V1NRAuWFyjF0EqdFXCuma0We3jHmCLag7I5+g5unruyqFyUFSaBKRDwpLWfZjvGLJ9M0
 Uy4gzaY69zXvpFQDCqXtfSUtNiGClzlETVCfctAqZbBxpjKx5FLD7AgRd3xVsf7w3uln
 wK7A==
X-Gm-Message-State: AOAM53396hWrjHCmHvDZzHOtcspaUgUcBNLuBCs04NhNT1FpocJrb8cf
 x8JaI5lbi2DoYR0nsfrLHrJ6IDnUYh8=
X-Google-Smtp-Source: ABdhPJxdNJu9dDXpMuYV5Uj+cXeXFCZnEdf0lU5S0zM4Gz/cEGAUSYeAvxB3DS0CuvovFok8uUu+IA==
X-Received: by 2002:adf:bb52:: with SMTP id x18mr8948100wrg.319.1642889609255; 
 Sat, 22 Jan 2022 14:13:29 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id k16sm9764006wrc.35.2022.01.22.14.13.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Jan 2022 14:13:28 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 22 Jan 2022 23:11:51 +0100
Message-Id: <20220122221151.298957-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/ksmbd-tools: bump to version 3.4.4
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

This bump will fix build failure with libkrb5 raised since the addition
of the package in commit 6be9913a7eeead7cdac804afc127791ba4b0e69e:

management/spnego.c:25:10: fatal error: spnego_mech.h: No such file or directory
   25 | #include "spnego_mech.h"
      |          ^~~~~~~~~~~~~~~

https://github.com/cifsd-team/ksmbd-tools/releases/tag/3.4.4

Fixes:
 - http://autobuild.buildroot.org/results/b4c3dba395327ab6ae28337efb962c99b2d5b922

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/ksmbd-tools/ksmbd-tools.hash | 2 +-
 package/ksmbd-tools/ksmbd-tools.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ksmbd-tools/ksmbd-tools.hash b/package/ksmbd-tools/ksmbd-tools.hash
index ad507bfdb2..d146f36a0e 100644
--- a/package/ksmbd-tools/ksmbd-tools.hash
+++ b/package/ksmbd-tools/ksmbd-tools.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  bd7218ebfeaa0d6a73c0a4beb9ea506228cd5695c1f8d3f9a9064e2346d52f0a  ksmbd-tools-3.4.3.tar.gz
+sha256  f42aec21515e34305bc07e1ce2c4926c87ea7bc8a675ca6d0a453f6b6be34e2b  ksmbd-tools-3.4.4.tar.gz
 sha256  576540abf5e95029ad4ad90e32071385a5e95b2c30708c706116f3eb87b9a3de  COPYING
diff --git a/package/ksmbd-tools/ksmbd-tools.mk b/package/ksmbd-tools/ksmbd-tools.mk
index b3ffc3e768..b08845b581 100644
--- a/package/ksmbd-tools/ksmbd-tools.mk
+++ b/package/ksmbd-tools/ksmbd-tools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-KSMBD_TOOLS_VERSION = 3.4.3
+KSMBD_TOOLS_VERSION = 3.4.4
 KSMBD_TOOLS_SITE = https://github.com/cifsd-team/ksmbd-tools/releases/download/$(KSMBD_TOOLS_VERSION)
 KSMBD_TOOLS_LICENSE = GPL-2.0+
 KSMBD_TOOLS_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
