Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A3E1C433F5
	for <buildroot@archiver.kernel.org>; Tue, 21 Dec 2021 13:03:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E560F40914;
	Tue, 21 Dec 2021 13:03:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nmu1WfNVhOfX; Tue, 21 Dec 2021 13:03:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 473B34043D;
	Tue, 21 Dec 2021 13:03:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 50ABC1BF5E9
 for <buildroot@lists.busybox.net>; Tue, 21 Dec 2021 13:03:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3F024823CB
 for <buildroot@lists.busybox.net>; Tue, 21 Dec 2021 13:03:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rFboENtKAr1X for <buildroot@lists.busybox.net>;
 Tue, 21 Dec 2021 13:03:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 51075823C0
 for <buildroot@buildroot.org>; Tue, 21 Dec 2021 13:03:15 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 j140-20020a1c2392000000b003399ae48f58so1641200wmj.5
 for <buildroot@buildroot.org>; Tue, 21 Dec 2021 05:03:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OLrY9FaiGKh2rFOx2TrVFrWnmEWI8VNHk4OuaHs4HSQ=;
 b=hwchnAvT0UmNF57nYvj0E6Jl4C+w2JMJbnIcZhmMtGPJPOeiAyFVOQ0lJPWZ4ThxW2
 PPZF2eh1c6SE8IvFRfmjSCfeiR34vcPa0MuoI1yR0wsXqXm4M0Xl1Psb4PzxgClBPtWH
 pOe0iSAdKcFHaDnbzyJcVxGKtthC0taOsKc+ZRWcUpVPlkn3HO2XrR3fs7E3dO6cwHQQ
 FHhFbm9AN0PkcnEKSqFgAr21i1yh6RblugSMGweUMM6BLF12LjIYUmui3A35PaOKl1iX
 FbxAl+mJOxzrD5S0o1ZYvYu5BKgfbjYeGUIG3dy0lnKXIt758oUETtqXlXX4Gadpy1+S
 ZmEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OLrY9FaiGKh2rFOx2TrVFrWnmEWI8VNHk4OuaHs4HSQ=;
 b=4F0+Vpvt8uh3DSe2samdYw2cRYydwWjWRDnFO9MIm0Fdy76IuuzkfqVaOmky/Owyk9
 5XvGmUUv2O3F30pUKgTIY3KbAqM9EcIdH+4Dj1wQM+kJpcIW6+FxvHC6FLgDf36X8vu6
 VL8LhBJe0sQT9an98psX+t/fvdPDK5f1/yk63B2OMFUNb4OUbxMKb2sw+wYAUPs3InL+
 63jdxD5qGV3jc5Z2X1gcCxAqjrnGxZ1y/CBbHZf7KpBGt0SXn3neewSpwhTgd8kFmPfL
 IdCU7MfCSi9pBtPsznxUGz5CZ0vOZVcFZEiz7DfxLxRZtxXCYJhnQrbqITHxlnQ/CEQk
 xzkw==
X-Gm-Message-State: AOAM533Le2O9Gqdof9j6HpTxJWG1zVt9MBFX21MlSyDNFUnjkdLXnI05
 NS/s4xITcVzlX10XmoTigqRDD8gV0wGxuQ==
X-Google-Smtp-Source: ABdhPJxvzHOma3NxayM6xoGboY6xUCoj1HEWA1qe7R2S30aghPiPLYUyooRw05EzbY5n3MXMZdYSUg==
X-Received: by 2002:a7b:c30e:: with SMTP id k14mr2704379wmj.156.1640091793482; 
 Tue, 21 Dec 2021 05:03:13 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id c8sm2730566wmq.34.2021.12.21.05.03.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Dec 2021 05:03:13 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 21 Dec 2021 14:02:37 +0100
Message-Id: <20211221130237.94142-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libnpupnp: bump to version 4.1.5
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
index 8451812eb7..9ebfd13379 100644
--- a/package/libnpupnp/libnpupnp.hash
+++ b/package/libnpupnp/libnpupnp.hash
@@ -1,5 +1,5 @@
-# Hash from: http://www.lesbonscomptes.com/upmpdcli/downloads/libnpupnp-4.1.4.tar.gz.sha256
-sha256  03506f02546e3b3d31b389e046c4691f020b82d315426ce79f1e2b1eb7958656  libnpupnp-4.1.4.tar.gz
+# Hash from: http://www.lesbonscomptes.com/upmpdcli/downloads/libnpupnp-4.1.5.tar.gz.sha256
+sha256  566f5895376a14aa87997de7ce3454595646613d1d0af34d05c31f6d9fe884a9  libnpupnp-4.1.5.tar.gz
 
 # Hash for license file:
 sha256  c8b99423cad48bb44e2cf52a496361404290865eac259a82da6d1e4331ececb3  COPYING
diff --git a/package/libnpupnp/libnpupnp.mk b/package/libnpupnp/libnpupnp.mk
index 6c6fa2f149..03ac01c915 100644
--- a/package/libnpupnp/libnpupnp.mk
+++ b/package/libnpupnp/libnpupnp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNPUPNP_VERSION = 4.1.4
+LIBNPUPNP_VERSION = 4.1.5
 LIBNPUPNP_SITE = http://www.lesbonscomptes.com/upmpdcli/downloads
 LIBNPUPNP_LICENSE = BSD-3-Clause
 LIBNPUPNP_LICENSE_FILES = COPYING
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
