Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FAA1C04FF6
	for <buildroot@archiver.kernel.org>; Fri, 19 Apr 2024 21:32:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2756341AB2;
	Fri, 19 Apr 2024 21:32:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IxoNvO7ge_zn; Fri, 19 Apr 2024 21:32:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1021B41AEF
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1021B41AEF;
	Fri, 19 Apr 2024 21:32:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1AA0D1BF977
 for <buildroot@lists.busybox.net>; Fri, 19 Apr 2024 21:32:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 14A4C60A42
 for <buildroot@lists.busybox.net>; Fri, 19 Apr 2024 21:32:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CUb91qpG0gUH for <buildroot@lists.busybox.net>;
 Fri, 19 Apr 2024 21:32:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::236; helo=mail-lj1-x236.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 973A860737
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 973A860737
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 973A860737
 for <buildroot@buildroot.org>; Fri, 19 Apr 2024 21:32:31 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2d6ff0422a2so31630581fa.2
 for <buildroot@buildroot.org>; Fri, 19 Apr 2024 14:32:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713562349; x=1714167149;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bsp11k5RSBwND3eBlBT3u+QMzN+e8MVAwtez1k43L0M=;
 b=B2jyHiyGsfqTNxg9oNLts2ZFFLykP/J0P9pcDJqDgu8ilIgAfj0WFt17JC+jVcyTus
 FlbYZwcuCHB/J5rS8OW7bzew4AsI7ru4CaFo7j7igOMUPWHJ+S08/PcoOftWUpQnbgfD
 ncmZkMtinbFfLKPg0jACo78B63LWczD3NWm5axl7gQe874WhLmN+v0DVstEZ1hJoZdHy
 US51jnwBDGGVGRmu6wvYfsAqQB8IYX85aXEgm2ZepXFf7oXVCikVakJb8v2u4ZyX0swD
 98I0BEDU2tMIeu6I5WgiM5Rn3KHJczbV3YBezSatxePqr1PrRsbJJNSx8/rr9RbxRVZ4
 tPIA==
X-Gm-Message-State: AOJu0Ywnyl+s0PQ2IlMV4JfNL1fa4CFQgCuU1lpgIeTbmuyEESwPGu1Z
 XnGMFTLgFeMPW1BqRQKiBrgz40sRPxX/yc/o8R4jfThwhEv95py4MgdxaA==
X-Google-Smtp-Source: AGHT+IGWVUY7EaNDuaQH4L6DSlWRpz9F7YLjITow+Y8CXgrjc7+BduruNK8InPwQqKRK/a0GqKV7HQ==
X-Received: by 2002:a2e:a419:0:b0:2d8:144e:c464 with SMTP id
 p25-20020a2ea419000000b002d8144ec464mr2318076ljn.36.1713562348561; 
 Fri, 19 Apr 2024 14:32:28 -0700 (PDT)
Received: from localhost.localdomain ([212.22.152.70])
 by smtp.gmail.com with ESMTPSA id
 h25-20020a0564020e9900b0056bc0c44f02sm2529297eda.96.2024.04.19.14.32.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Apr 2024 14:32:27 -0700 (PDT)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 19 Apr 2024 23:32:16 +0200
Message-Id: <20240419213216.518041-3-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240419213216.518041-1-angelo.compagnucci@gmail.com>
References: <20240419213216.518041-1-angelo.compagnucci@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713562349; x=1714167149; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bsp11k5RSBwND3eBlBT3u+QMzN+e8MVAwtez1k43L0M=;
 b=LF65kQE1QKcjpohTVOk6T35Ooyi+kbE8YBHGJjVRLerQKiCb5UbMUum1upS6sWB3bm
 waBLrVFutPUG1zk/Qb4G7xZbULCvbyoV3p3B1QiGSS6UQxKZvt0V+YtHHSP95tOuzYmP
 mTiIyrJuFRrUHFtx8tSMnxqrWKqA1xJZux5NqfZep/zCI8TMvLjPKQGESOrqg4P2msFQ
 Jx7IvAqDeAjTw+HQUwnUVZZ442sxoCnXhrZ8H0r1XcX2Uq11UkDNpWYTrYwQKT9JRL3H
 +Hovn0ZE/7iIFgGDOIulw4d25N+nZCZMZBdy4pegT7QJDOEQHWgViJhC2AVOR7AQByIo
 iZxA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=LF65kQE1
Subject: [Buildroot] [PATCH 2/2] package/pkg-python: fix pep517 data files
 installation
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

When installing a wheel in pep517 compatibility mode, the pyinstaller.py is
invoked with the --data parameter which point to the directory in which data
files should be installed.
Actually the --data parameter points to the /usr subdirectory which is indeed
wrong cause it shall point to the root directory where the wheel will be
installed.
This fixes the problem of having configuration files installed in /usr/etc
instead of /etc.

Fixes:
http://autobuild.buildroot.net/results/36ac5278d19195a21c3d02d087965e08f49228ef

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
 package/pkg-python.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index 839f728e2f..4f9bee4b90 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -70,7 +70,7 @@ PKG_PYTHON_PEP517_INSTALL_TARGET_CMD = \
 	--purelib=$(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
 	--headers=$(TARGET_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR) \
 	--scripts=$(TARGET_DIR)/usr/bin \
-	--data=$(TARGET_DIR)/usr
+	--data=$(TARGET_DIR)
 
 PKG_PYTHON_PEP517_INSTALL_STAGING_CMD = \
 	$(TOPDIR)/support/scripts/pyinstaller.py \
@@ -79,7 +79,7 @@ PKG_PYTHON_PEP517_INSTALL_STAGING_CMD = \
 	--purelib=$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
 	--headers=$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR) \
 	--scripts=$(STAGING_DIR)/usr/bin \
-	--data=$(STAGING_DIR)/usr
+	--data=$(STAGING_DIR)
 
 PKG_PYTHON_PEP517_DEPENDENCIES = \
 	host-python-pypa-build \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
