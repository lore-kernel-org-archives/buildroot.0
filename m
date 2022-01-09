Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 275EEC433EF
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 11:33:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D0AAE60B50;
	Sun,  9 Jan 2022 11:33:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pg5MQgO3XLI0; Sun,  9 Jan 2022 11:33:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 26D3F60B4E;
	Sun,  9 Jan 2022 11:33:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 045CA1BF370
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 11:33:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F106C4034A
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 11:33:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FxWvPi4rcQ10 for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 11:33:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0E38240348
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 11:33:04 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id t28so14454216wrb.4
 for <buildroot@buildroot.org>; Sun, 09 Jan 2022 03:33:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=M1Iloj0K1+q6WgbKuJQ4heGdnxbOplfeNsPsFW2BExA=;
 b=Q0JkbbHYfnlYgaj9tuCU8bUNovcE+UXFlxXEzMH2g52Yx83ublROIKHeDUcD1JdF79
 VKkKdFG1dLWkFU5jeSiiMGlT9GBzjzqFkrROdU2W5AwGgVOoJ2L5MLedq44RUIiaWXwd
 Sm8fBFT2P5+tEfOltI1+QeLUmXRHhSYTC8C4FY4BQ0uAohtMF36MEvfUc8EVuL+gQzIY
 Kxpm6D7fXR1S8sBNHxSsImvSITW1MbhVznz/m+LVaEWSStAcrfgPcrn8Ibv1g9mdB6SH
 6ej6faosckJVtj084xHj/Dg5KHR/cW8C3B8aHNchKlJNebhayTHDDB2VE16uK0VdsFst
 oF2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=M1Iloj0K1+q6WgbKuJQ4heGdnxbOplfeNsPsFW2BExA=;
 b=QWMcLuAG4Nwh2Ohsnk8KKr609mDX9SWO88c1YtdW3Uk5A1HnqLZTKNe1AdPxOZER4O
 3299QHkRRDaJ5HAYMV1Ca1vzokJSZm6PfWRrhubWTLW7UZazo4HwM7CC97fh1CfTRmof
 gcbHZF416FcQwvECGfl6B+Z3uKqIgV/SJwF0EQxh/RRpZMaAHH+pKavUhDTN9aXWeM1q
 GUQ7r7kj3030wgPDbnuIQbx3DEu8PylaVgxvlTkSOIYAEtesyPv33kvLTG8046KneIdv
 3Qu/sLOY3EJ7raDPcW17ZFzpkobHIK+QFmgMk3uVPXjd5xSk0BqDbU5tyfRFg7Ws2ARd
 f0kA==
X-Gm-Message-State: AOAM532Me91NCA9PeM2oDvXfMWYvgr21RkXDcmUHt3f2jK+zql6B8ge2
 KUL8dD6X/8L8Hn9J+SDSB8by0brEXOI=
X-Google-Smtp-Source: ABdhPJySz53Sm9sXT7xIxQEu/UYvD9ODVZ6+wK1GiVKE9jV4XNj3nb9mgqQpBsXOgWRrvIEiSQVCrg==
X-Received: by 2002:a5d:468f:: with SMTP id u15mr13805091wrq.402.1641727983121; 
 Sun, 09 Jan 2022 03:33:03 -0800 (PST)
Received: from gilles-Gazelle-Professional.. (138.23.87.79.rev.sfr.net.
 [79.87.23.138])
 by smtp.gmail.com with ESMTPSA id az25sm3802139wmb.26.2022.01.09.03.33.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 03:33:02 -0800 (PST)
From: Gilles Talis <gilles.talis@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  9 Jan 2022 12:32:23 +0100
Message-Id: <20220109113223.755567-1-gilles.talis@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/libolm: bump to version 3.2.9
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
Cc: Gilles Talis <gilles.talis@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 package/libolm/libolm.hash | 2 +-
 package/libolm/libolm.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libolm/libolm.hash b/package/libolm/libolm.hash
index 80210a2e5f..044bb24f06 100644
--- a/package/libolm/libolm.hash
+++ b/package/libolm/libolm.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  9b61bd9182bb0ae0c5a800a8b0496b69600a0a22e3a21fce0aad119d2b1c99ae  olm-3.2.6.tar.gz
+sha256  614c0e4dc4721f57e56c3385bd8def2f71c6631f928a480efd0b4bd8e5435df9  olm-3.2.9.tar.gz
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE
diff --git a/package/libolm/libolm.mk b/package/libolm/libolm.mk
index 0049fb6001..607e50702f 100644
--- a/package/libolm/libolm.mk
+++ b/package/libolm/libolm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBOLM_VERSION = 3.2.6
+LIBOLM_VERSION = 3.2.9
 LIBOLM_SOURCE = olm-$(LIBOLM_VERSION).tar.gz
 LIBOLM_SITE = https://gitlab.matrix.org/matrix-org/olm/-/archive/$(LIBOLM_VERSION)
 LIBOLM_LICENSE = Apache-2.0
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
