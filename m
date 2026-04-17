Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0B05F8DFCE
	for <buildroot@archiver.kernel.org>; Fri, 17 Apr 2026 08:23:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E45B40C6A;
	Fri, 17 Apr 2026 08:23:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 64g85mS0_R7D; Fri, 17 Apr 2026 08:23:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 94C3040C72
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776414222;
	bh=NDyFm8j/mJzv/1iCk2Eol+U2P8h7lxvsoiLfjnODG1w=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=NlUQSbM/c2SIFwvElERTjdjQ4AcWzlZs139xpCdb/GzchPgf7HUKZYXOTMQawlVHx
	 jREmRRnmuXCQSn80Cl4Eqe/Aik8jTLxdFS6yUWw40d6hJQtN5TtD73Q01hCdjUxTYI
	 byYsgIVLTfkvlZVX7aTJpVhCJgXmy6v58c8u+Pj970NxywXl4nwlPlTC5npTSlh1Kw
	 Kb2dQYrMhnT9+wRnRjHpOUt9qNHsW0nVmqBsZmqlJNAQkJUbTWOhjn+Ui/BxRVwCzB
	 4aE5xWLoiNSj/KRV77QSHBarU3FJg/ZYnJ+I0LQqRoIToSR/R7fVcGCnTjepbUHjNA
	 YP8/GYADockyg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 94C3040C72;
	Fri, 17 Apr 2026 08:23:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A5A87396
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 08:23:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9771A813AB
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 08:23:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VIa3CheSHnNa for <buildroot@buildroot.org>;
 Fri, 17 Apr 2026 08:23:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8F65E813AA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F65E813AA
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8F65E813AA
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 08:23:40 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id
 d9443c01a7336-2b24fcc2b5dso2646165ad.1
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 01:23:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776414219; x=1777019019;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hQVv8KgOLoIQStvGZSPaTHZzTvzY1F8L1+2AeCWMgro=;
 b=N6gGAvs/HGb0BLLhZSLs4njT1ozbi6U87ilLwMMJaRCwWaXb17NQ1Iy9nS6JFk29vh
 FieC/znQQXAeZ2vhcVgV/9h/Jac2W/uMR710oViO1Vse28lrri3Y4V4fxYfnwwoB08Bf
 3nbfLkRGO+PH5xT9dP+YK8FsEIjS6OB6WHOJdYqWuWmHQvs2LzPrtWQ+ZZj55LN/86Ba
 QVurYbDCN5ED3TESXYJjbMWy+QPa5NzYAa1mMSvE7Hz15Qb3cyshMiLsOQbALiOzE3c8
 fjeGEGl7fXeHYswHo3zdIReBB/GBxn8r1J/GvxzUjMgq5szE5ubsqzxqEEnJ1yZLXONh
 Ya+w==
X-Gm-Message-State: AOJu0YxA8ttYrwQKnQ7zS6gQMbSY2ZB5JKJknXTEpHtDBOhKMM9X9Agi
 Rh1NAIrBp+X8rRyxBKzTf+nmoHnQPPtpqku19hp7yBqFWB13OlqrWSodPaL7zQ==
X-Gm-Gg: AeBDieu2ek2G2fRa65DkLUipOsyTkoIPMlecdQhf/haKgt42vCwONynDOCFNqIvZPzS
 SETHjBfFEGIntvOjxC3scYDuooHt7vTEcWU2xKGWZTX0juixpPfJaWXP1Ee1T78h6SXKCC/3hPV
 kKg78BGa1oNgWlUBL6mwFuRoQ9SxN5rLS66M4/EwIanVaHbqCq7HKRpPymeMT/uj0Fst4a5JBXX
 4z+rclrJVZCAF84e2X6/rtxIkh0O6KuAphc191IevCdjEXXy55RJMXjjJNqGnYYDxRYk8cYQok7
 +WpYgLxXNentUoD4VbXVSodvaO8GqjFDAyBL/1urJLtNLUZEX5xYwkikb+1XBMR9pcrF2sCucW+
 tMUtNDjy6NbkkPD6NxWk8Cd4Gj4Huy1B5kFBe2jX1zt4A1/mxUvIn6LRrKcLG88Q9bd7sXderBS
 c/qzx/Zimgtg+yaL1hapt58lhkBkQtB9tJ/byvsGAJxoZZHA==
X-Received: by 2002:a17:903:2b90:b0:2b2:5258:a23d with SMTP id
 d9443c01a7336-2b5f9ed1458mr11214725ad.14.1776414219403; 
 Fri, 17 Apr 2026 01:23:39 -0700 (PDT)
Received: from fedora ([152.58.163.125]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2b5fab208d4sm13207065ad.55.2026.04.17.01.23.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Apr 2026 01:23:38 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Fri, 17 Apr 2026 13:53:18 +0530
Message-ID: <20260417082319.60457-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776414219; x=1777019019; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hQVv8KgOLoIQStvGZSPaTHZzTvzY1F8L1+2AeCWMgro=;
 b=bOvyMI7S17ZY3r27VCT6gG/ajptWnayjWNOd8NFKKaJ/2DLYxUvaNhdB9UnugFRC3Y
 SU6NByN0rt5HgUUBGetH4JZqNmk/ZeZN5a61XfQ1JlcKykGiPvA0rlmUSagKTPKBhRwI
 JU4z63ajKTrGzaFMzbcd3zNHMRiM1JUJ/frCdl0Zh61ewlLHA3x5x3CegsPujjSzTYwu
 4zwD6FI75FGnDy6BK6hNUhd4LiLDf6hYgRrcW8vN33vM15FUauqYeF/wVzigYYaAdjhk
 yHd2SFUzBGeEd/v9r7vw4OlrfPyVnUy09tJhCekLJaX4rl5h1ZAmQ//HOf5q3xj5RQ1h
 ybKw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=bOvyMI7S
Subject: [Buildroot] [PATCH] package/pv: bump to version 1.10.5
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changes in 1.10.5:
- Fix --bits option rate calculation and --gauge compatibility
- Security: ignore TMP/TMPDIR, improve memory safety
- Fix terminal state garbling on exit with --cursor
- Improve ETA calculation across suspend/resume
- Better --watchfd and --line-mode handling
- Address issues found by security audit tools

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 DEVELOPERS         | 1 +
 package/pv/pv.hash | 2 +-
 package/pv/pv.mk   | 2 +-
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index b20cf7d93c..eba91f10a6 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3063,6 +3063,7 @@ F:	package/wolfssl/
 N:	Shubham Chakraborty <chakrabortyshubham66@gmail.com>
 F:	package/ccache/
 F:	package/hyperfine/
+F:	package/pv/
 
 N:	Simon Dawson <spdawson@gmail.com>
 F:	boot/at91bootstrap3/
diff --git a/package/pv/pv.hash b/package/pv/pv.hash
index 76595904d4..4ddce35f89 100644
--- a/package/pv/pv.hash
+++ b/package/pv/pv.hash
@@ -1,7 +1,7 @@
 # Locally calculated after checking pgp signature
 # using key: D8FF44A79CC8A61EF694FA7EB883E01314DA8E84
 # from: https://codeberg.org/a-j-wood.gpg
-sha256  aa1630c79af6960a8922ffa64d2c3e7f87486da21fcb57e277824294fd266742  pv-1.10.3.tar.gz
+sha256  ab21b4f8662280646b6a02e1b9f096790918f89c952bbe0d06fef75d3b52fb15  pv-1.10.5.tar.gz
 
 # Hash for license file
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  docs/COPYING
diff --git a/package/pv/pv.mk b/package/pv/pv.mk
index 41a7280f6f..efe305cf6e 100644
--- a/package/pv/pv.mk
+++ b/package/pv/pv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PV_VERSION = 1.10.3
+PV_VERSION = 1.10.5
 PV_SITE = https://www.ivarch.com/programs/sources
 PV_LICENSE = GPL-3.0+
 PV_LICENSE_FILES = docs/COPYING
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
