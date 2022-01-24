Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9520C433EF
	for <buildroot@archiver.kernel.org>; Mon, 24 Jan 2022 22:40:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6B0894063A;
	Mon, 24 Jan 2022 22:40:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yrK3xXDmOSJD; Mon, 24 Jan 2022 22:40:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 742344024B;
	Mon, 24 Jan 2022 22:40:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 36DB01BF3EC
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 22:39:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 32DCE415CA
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 22:39:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sh0Nog-d7vcM for <buildroot@lists.busybox.net>;
 Mon, 24 Jan 2022 22:39:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3DFEC4159E
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 22:39:58 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id w11so4190824wra.4
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 14:39:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=H7iTylFX9Cs+EWVFY7zvmB3RsqBQm0b6GIkiSPpSFQw=;
 b=qzToGPfoHfAK2KyGJaT30sOdS3kW+gvhmOpe7qTLx9ObZXcQqvIcdTTd1mhUMejBa9
 ucOYGS61uvq5pq8WrL0wv+tEldyhYiQHJouyhA9a1XwloCwKf4RPBtTQN2mLsZSzZnQz
 n6z24E3r7UGCqjzSfdXGjW3CbKPhwjll7rLcKUhLpC2Ffnzj0RRRUtlk7RKhUEvYSRa4
 UhLVr8AtLx43M9hvO1y6jhy1MBBii+8sY02z480C/RLa850z7Wdet0nvBbDR5YV5CY1B
 EGRzpkh/gNowqHWclIACrg2ktZh8gLwUHvzHdvZcVleA1oaJoCvq/HrFPQAuPGUiSl45
 16qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=H7iTylFX9Cs+EWVFY7zvmB3RsqBQm0b6GIkiSPpSFQw=;
 b=kmpeK6K1V2+tzdEIB64ZPbqs+9REx/epSTSMds1oUW805L79oUYBb+s4k/7BZlDSg0
 j5xmqMma8q+kVFFBADiJ+eLOBbN9GuXfn0tQdW5PToHaOPN+O1GmIeiT5U80JkxyP2iQ
 M0PpyEyXUGXhxHoGKIPcR2M4uk+QSr5BF0azmLSyYnjcK0WD3VKZ8FRz2E6OwGR9/RJG
 ApI3NFrjKRvpf6HTtlZb6wPggtxSU89bRYAaOLMVC5MwTi87/4XaVCqmpDLKuZ80HH2L
 Y+QkeO6D8U7LQr3knpZhpjvkz4Ku9qgE3Srl08QcHBmRJ3PyCe54l0f5fQAb4zxl25WP
 sqTg==
X-Gm-Message-State: AOAM530ekLF3HUPwTk9tcOf7JrxzivjLvD4PypnkF9CNyXJ0YQrbiRsH
 Qd39rwqBPa/gIZJpr1hNVLSzBcSSWiQ=
X-Google-Smtp-Source: ABdhPJxSGBdq/ELzIijIgyVh+2Fb9jlG2plPUopkX6tiSzFzEel5nCOBB2jiHcpYb7zp1A/ZfyJEZA==
X-Received: by 2002:a5d:6dac:: with SMTP id u12mr15802617wrs.466.1643063996305; 
 Mon, 24 Jan 2022 14:39:56 -0800 (PST)
Received: from kali.home (lfbn-ren-1-1338-205.w86-229.abo.wanadoo.fr.
 [86.229.185.205])
 by smtp.gmail.com with ESMTPSA id a26sm538175wmb.37.2022.01.24.14.39.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 14:39:55 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 24 Jan 2022 23:38:06 +0100
Message-Id: <20220124223806.2720164-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libnpupnp: bump to version 4.2.1
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

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libnpupnp/libnpupnp.hash | 4 ++--
 package/libnpupnp/libnpupnp.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnpupnp/libnpupnp.hash b/package/libnpupnp/libnpupnp.hash
index 9ebfd13379..276bf93c99 100644
--- a/package/libnpupnp/libnpupnp.hash
+++ b/package/libnpupnp/libnpupnp.hash
@@ -1,5 +1,5 @@
-# Hash from: http://www.lesbonscomptes.com/upmpdcli/downloads/libnpupnp-4.1.5.tar.gz.sha256
-sha256  566f5895376a14aa87997de7ce3454595646613d1d0af34d05c31f6d9fe884a9  libnpupnp-4.1.5.tar.gz
+# Hash from: http://www.lesbonscomptes.com/upmpdcli/downloads/libnpupnp-4.2.1.tar.gz.sha256
+sha256  e0e59eb2d3d024e827050428e0e7eb228355912a38c85eb30bfeb2f0926eca4c  libnpupnp-4.2.1.tar.gz
 
 # Hash for license file:
 sha256  c8b99423cad48bb44e2cf52a496361404290865eac259a82da6d1e4331ececb3  COPYING
diff --git a/package/libnpupnp/libnpupnp.mk b/package/libnpupnp/libnpupnp.mk
index 03ac01c915..09bfa34b87 100644
--- a/package/libnpupnp/libnpupnp.mk
+++ b/package/libnpupnp/libnpupnp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNPUPNP_VERSION = 4.1.5
+LIBNPUPNP_VERSION = 4.2.1
 LIBNPUPNP_SITE = http://www.lesbonscomptes.com/upmpdcli/downloads
 LIBNPUPNP_LICENSE = BSD-3-Clause
 LIBNPUPNP_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
