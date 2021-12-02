Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C6E7C433F5
	for <buildroot@archiver.kernel.org>; Thu,  2 Dec 2021 01:19:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E4F080FF7;
	Thu,  2 Dec 2021 01:19:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fMWz91yauvjM; Thu,  2 Dec 2021 01:19:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E7FF80F40;
	Thu,  2 Dec 2021 01:19:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A12FB1BF5DB
 for <buildroot@lists.busybox.net>; Thu,  2 Dec 2021 01:19:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9CF3740641
 for <buildroot@lists.busybox.net>; Thu,  2 Dec 2021 01:19:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wzvkgVbL3F9A for <buildroot@lists.busybox.net>;
 Thu,  2 Dec 2021 01:19:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D48434062F
 for <buildroot@buildroot.org>; Thu,  2 Dec 2021 01:19:24 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 n104-20020a9d2071000000b005799790cf0bso37864372ota.5
 for <buildroot@buildroot.org>; Wed, 01 Dec 2021 17:19:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ul6627hcWD0WfKX6YaGH3Gf2LkcLyX11pwOgRBDMc1s=;
 b=LjuvKKCs2FanzBh8ma9eSOadUUWA1ztyVOrCGwj9a1VFU5X/4XGBPFwpMfsyx2tsf3
 f+Ddk3hp+gOVKAjawwMDU4akmfL9GarrSwHibsklSkGb1s+uWl1+Hr8e/mwHFLJYcUZc
 D7srLENn0MI2pohGQcgMFWQogXrb6Fro7o0+Ht00O3VPDYfgscDYvrGIjDJ2Zn5w7/Qh
 Hd0PXInXsgduwLeWkV0bUlXmBtnjloCXN1Rc+xQw/lgbtpG6W5vTT1kgKlhGBl3eK+EC
 YD1pMAp8ARS7lgzH6q1FGadVM+VwSe2wLk+1sliE+ysMX5nQswun7vIVhum0XFA/+WNh
 4iTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ul6627hcWD0WfKX6YaGH3Gf2LkcLyX11pwOgRBDMc1s=;
 b=zc3CCvSSewpG9hjUf0O4gg7ty9emnWB/l2g4B/qVlnSdgs2cEosvZZNwgT70Z1+bJG
 xih39juRqBcWE5cGm9WoHQceXhOFoEa3Ul4o+Oh/Qas2FlSjy7vQwwykLzFOnmvDgMMp
 2Stk5qe/huMdus6BHfW18AEu8rxTdRR6pxzr1BCLOtEFD8MCI3OhaySfaNM+I63C1BVn
 jTCffA87j/zI2sf5oF1T+LDoUDeewFY+UwEEREi4LzrJybQ15qWGeoI1kv5uvUlk21oh
 UVZ7uaHZTyqNAn9YhRp70wnL+l3y3EPoK0nskT9oRHYHggqVmnSsMsNvJKm2gLghAjuU
 i6Qg==
X-Gm-Message-State: AOAM5327nawsc+21f2URp9Y4NiZy7kEFF0CHPnxvIAGebv5Cc0bAr82Q
 0zwUhgeTOqF3gpw/0OyqdMo1i9AhubE=
X-Google-Smtp-Source: ABdhPJxOTo/YI+mOlh72WtUSG9utdRxx8B/fmCRskwcq20kfUC+lhrgvUY0lig5HLN6UL0/xtatwZg==
X-Received: by 2002:a9d:4d10:: with SMTP id n16mr9102667otf.17.1638407963694; 
 Wed, 01 Dec 2021 17:19:23 -0800 (PST)
Received: from james-x399.localdomain (71-33-128-47.hlrn.qwest.net.
 [71.33.128.47])
 by smtp.gmail.com with ESMTPSA id o2sm824253oik.11.2021.12.01.17.19.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Dec 2021 17:19:23 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  1 Dec 2021 18:19:18 -0700
Message-Id: <20211202011919.2331133-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH/next v2 1/2] package/ell: bump to version 0.46
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Peter Seiderer <ps.report@gmx.net>, Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- Changelog (since 0.45, from [1]):

  ver 0.46:
    Fix issue with DHCP server when OPTION_ROUTER is not configured.
    Fix issue with DHCP obtained lease to retrieve it properly.

[1] https://git.kernel.org/pub/scm/libs/ell/ell.git/tree/ChangeLog

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/ell/ell.hash | 2 +-
 package/ell/ell.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ell/ell.hash b/package/ell/ell.hash
index 4bb2688c48..20b568dde4 100644
--- a/package/ell/ell.hash
+++ b/package/ell/ell.hash
@@ -1,5 +1,5 @@
 # From https://mirrors.edge.kernel.org/pub/linux/libs/ell/sha256sums.asc
-sha256  fedfcceee56eb63ab1eb98bf120a3cfbecee50bcd893874328c889f1b381e7d7  ell-0.45.tar.xz
+sha256  f4fc647eff32f622e21f8851ed0c8b7270f4800149c91be601754e22d82cbb4d  ell-0.46.tar.xz
 
 # License files
 sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING
diff --git a/package/ell/ell.mk b/package/ell/ell.mk
index 963fad4bae..4fad6e8d1b 100644
--- a/package/ell/ell.mk
+++ b/package/ell/ell.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ELL_VERSION = 0.45
+ELL_VERSION = 0.46
 ELL_SOURCE = ell-$(ELL_VERSION).tar.xz
 ELL_SITE = $(BR2_KERNEL_MIRROR)/linux/libs/ell
 ELL_LICENSE = LGPL-2.1+
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
