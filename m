Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62678C433FE
	for <buildroot@archiver.kernel.org>; Mon, 24 Jan 2022 09:26:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B58640951;
	Mon, 24 Jan 2022 09:26:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hpeVLfpWP8Xg; Mon, 24 Jan 2022 09:26:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3EB1540966;
	Mon, 24 Jan 2022 09:26:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0314C1BF3DB
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 09:26:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E46F140951
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 09:26:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m9-3KFSOxlpQ for <buildroot@lists.busybox.net>;
 Mon, 24 Jan 2022 09:26:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1A3F440918
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 09:26:15 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id v17so13303766ilg.4
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 01:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=J5deQwZqj/sNtxl0WKbZcVZBkmriTBR6UMM971YMy/Y=;
 b=NP5k+lmZ3zQu+6c+0u+goxzFbHyj+DOM/Kgh2O6/wFT1WIGKZQJtLO+0LLR0akgKg5
 gN5kZRb15qZ74F07NB6tOf4nG25qT/hE8wXbHWF31qVQbECqalFjDqsNPQv3z1+VComy
 zpZ1anb1wZxpBsOKKQat9MZ0DeZ5WZyjcpeFOqhU5ugs4VTyOAwgdCW/Hx0NNv3BF9rQ
 V9AgYQIHNn57POteuwISG11APpKod1b7J9zxZr9rwV2STlMMYRjbwSgazoaEKvD6sNXN
 Y2mB+WfCRtrwZ9snN1LzRRdTs7PbcMcpYuMha33Hg4LlKRURO8WGQmfD6qnhnmXjBqHj
 sGig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=J5deQwZqj/sNtxl0WKbZcVZBkmriTBR6UMM971YMy/Y=;
 b=oJHH5aol/iyLs46wHWfdM5k8SbUAqmzo1EO5pJBqk4p/qw0Ri7t4yXQ1pDOiNLYLkF
 Mh3Vl2kUVdQkgzctI8zlY710Ul3N74oMyJWo7TYCyLwLnmWFkfuTWhRyfeQpl3brK4jz
 JIzWVGAsPaNCo5a/3KLVRLEeAk3n0CZ8fJxbewBmB+9vZJPVjbCwttUykV+PqSPM0nVF
 bVKWEcDyDf+z6lp+T1y2BAHA0p683K/HgsxBdD16gYDkE3L0E3S7j2B0TJk95zgtaUxr
 KVGMDgxHIDT7qDaZLbo+BD0yRs5m059mtITKS0VYBjfF7Z0tXZ73/TSGn2c6SckLf8dM
 p5nA==
X-Gm-Message-State: AOAM530nLRpiJZWGZA4oCNTo8j/hY0MmJt5g1e+DjfcJ0lGItO8iiicX
 2qYwB5MXSAmmZhMxO/nCO5kESboVxC8=
X-Google-Smtp-Source: ABdhPJyatFxem9Yo0EZspg72nLlzzVaebVS3O+woJmTfukdf5k5HPd0IcXXrHDa9kkzqGum2A2zQ8Q==
X-Received: by 2002:a05:6e02:1785:: with SMTP id
 y5mr7808437ilu.24.1643016374887; 
 Mon, 24 Jan 2022 01:26:14 -0800 (PST)
Received: from james-x399.localdomain (97-118-239-242.hlrn.qwest.net.
 [97.118.239.242])
 by smtp.gmail.com with ESMTPSA id k20sm6976563ilr.45.2022.01.24.01.26.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 01:26:14 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 24 Jan 2022 02:26:12 -0700
Message-Id: <20220124092612.4019025-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/network-manager: bump to version
 1.34.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

CONTRIBUTING.md hash changed due to various style updates and
additions.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/network-manager/network-manager.hash | 6 +++---
 package/network-manager/network-manager.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/network-manager/network-manager.hash b/package/network-manager/network-manager.hash
index b007a6e88e..d25f0e8194 100644
--- a/package/network-manager/network-manager.hash
+++ b/package/network-manager/network-manager.hash
@@ -1,6 +1,6 @@
-# From https://download.gnome.org/sources/NetworkManager/1.32/NetworkManager-1.32.12.sha256sum
-sha256  a8ab36a0a502fe73cd8e3bacb6585f97fbb94ebef79e276cdbaf11c33ff8f54b  NetworkManager-1.32.12.tar.xz
+# From https://download.gnome.org/sources/NetworkManager/1.34/NetworkManager-1.34.0.sha256sum
+sha256  819795d0899076204f5672421a58f1b1d9e393536ee87bb844b911e6243bf0bd  NetworkManager-1.34.0.tar.xz
 # Locally computed
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPL
-sha256  e70c2d84a038b972beff16d8662f35567709dff2d552220bd1af6014f6d2215d  CONTRIBUTING.md
+sha256  ad0abd8e90dd134cc5546f7a13eb4268707b77a5a1a5e3afe31dc4397a573a04  CONTRIBUTING.md
diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index 974320fce0..a90228992c 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-NETWORK_MANAGER_VERSION_MAJOR = 1.32
-NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).12
+NETWORK_MANAGER_VERSION_MAJOR = 1.34
+NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).0
 NETWORK_MANAGER_SOURCE = NetworkManager-$(NETWORK_MANAGER_VERSION).tar.xz
 NETWORK_MANAGER_SITE = https://download.gnome.org/sources/NetworkManager/$(NETWORK_MANAGER_VERSION_MAJOR)
 NETWORK_MANAGER_INSTALL_STAGING = YES
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
