Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D91EC624DB
	for <buildroot@archiver.kernel.org>; Sat,  5 Sep 2026 08:12:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6834C81195;
	Sat,  5 Sep 2026 08:12:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1IOmhhMyidOn; Sat,  5 Sep 2026 08:12:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 987CD8112F
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788595963;
	b=VV2DPpQQEB89un5crVcMEDjkHLD9sJbzKL655zDXKsz8uYGCg1mODF3WT2rdOPJqsJWS
	 X1VtpX2q04zTG0mV2oP5jM+4Ck+VkdAmnqgP/OeiFOcqVwzNz8zmpPM9kZ1LS/8NJ7Rs9
	 Vy0Lk1cXVnuOW0Rn6hdhyHG9iCOurx6i9MRBaiCFIMkLvfVELMgqE1ztV+RCa18+dJZmH
	 9zJFrDYPl7j55Uivpeo1+0TovNGzP5VHlF5nRNbbKxO0NxE+kA14d9tj/sxESBlxVezyC
	 h+v3pQOyhG1gAxER85egnZtssr4Gz7vt6dT3ku306rCseN1PgTo634qXMa+XUd4clQg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788595963;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=5RisPYP4BVssbwO5J75SPLsavpxwtcnaJieEmeNRK3Q=;
	b=nM+FpxwaEbbVQxK1kvvARdATS3ZzJbtvQbeni7Hu9dDMQeGAML8zPEGa1/vC7KnVW0PM
	 I43u1XAcGE+gEoyaU7DSgXW3ap2fGndheA1H54kU2y0BWet1UaSs9KOvHgm/BrcC0bcUc
	 C9YUKt9KlGiaKcMDIN67ly1qdJC4YnXGuYJ2cqp1iPVcsxCGEV/rzC0u3C6ryH8qcfObO
	 jsAuHwWqvW9XZC5aZb2S82nbcaR2GbRfgQvOoWbeCYyOpTHD22L8Wn21y4xdDCxVO9rL1
	 3euP20znWnQ+hwd1Udb5hVz3U1RQFdBHHIPHcBapnvbUIesWp1KzBXCQ5fW/bkBlQlw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jwGCjlx8;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788595963;
	bh=5RisPYP4BVssbwO5J75SPLsavpxwtcnaJieEmeNRK3Q=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=TEVgBQZ+1IM+Ill5yZ0lnZoMUzO5+EhXhivZdotbgS6EnzpGHsfFR9x2ge/AEHC+q
	 tIO37msvY2ysIC4SlESRCRvBB20SQZ4Yu0hIZfcczjofIHiznTtkIADFwkrdtRsEGG
	 bNPRu80GS85rSBRf0t/ebr6eGAwpfcDtUkDp3VpTA4n1HEWCUij4v5pVo9VO6njJyj
	 SzSiU4aOCTvOxTuwquQqHMmqAzA8BWZNdQ96qwy0zXgGMr7m6aru50DWM4adyIlJHO
	 RDCZzb6w1jSjdomo644Jh/GmAj/Gd+Nme+RuanAmRaKKkrGV4WiZx/m1SvwtTisgCd
	 u7OMuSCJcAJfg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 987CD8112F;
	Sat,  5 Sep 2026 08:12:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 921CF9CF
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 08:12:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8F6AA81188
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 08:12:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T28gVo1guOrr for <buildroot@buildroot.org>;
 Sat,  5 Sep 2026 08:12:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 9AE7481175
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::42c"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788595954;
 b=Xv7sQ9MIOOepS3PigKNMbh7irZYQG7rPHx14h544DYjsVzOO87igcvD7ou6vrUV0rWqs
 UFnHPqcxYllLAlUO8Ohd8aMQpUAPFXOzhcoAMJivBTyuhyoy3QEodxsoiMV2mTsR5oD9e
 HdSlkkYIT3TS3SmYsIvTuIsft07jU0Tcd4RatGVl2540vKKtQkgKlB59Qlbzggzxi8/nP
 qBZioa4Ksr5tduauUBlzz/LmdI/CjhAmfHdd42NPBWd7xnKkrh85RpEnmRNpDUNGIp0TE
 tLPR1+Y4rtrogtYxiBmFTrDD/qPnUEdFbDSYQ6COdC98ingiqTC78w3SyaaVQhJrybA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788595954;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=CyK/aGHc4t/QJmBr5GI4KHeBW5RHnp7bQNDlEBYyOAQ=;
 b=UeZsmO/w/PDQn9fsOI+ofLUWDgQN1vnMeyCOl8hhgf3foWW5IEOkIr3ZErwr6saHO8su
 HKW3INCispG0X4WfHrk0HehGJPRnipuhz+EtZUC+FeJIqN84X/bABt968+UExZ3hDRmLV
 biD0clKvDHX5Ez/1QyLFBpqwVdrEVe6kaKg0C9W0pPqL3B5ox/xS20wH3pR11UmjGoBYK
 oNFt22V6BPJyWdeABe87Z8PfmCyQCtmOrWOOXi4QJsAMjg8rPJtdhVcVKgHfyI2CAFUcy
 ytbsVMC00Rr8iRgoxYlMPMM/sSdPYou7SWAU9D8s0IkCSuHcgoANf7RKu92VBEKZAYg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=jwGCjlx8; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::42c"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=francois.perrad.86@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=jwGCjlx8
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9AE7481175
 for <buildroot@busybox.net>; Sat,  5 Sep 2026 08:12:32 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-484392e3d33so1175736f8f.2
 for <buildroot@busybox.net>; Sat, 05 Sep 2026 01:12:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1788595950; x=1789200750; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=CyK/aGHc4t/QJmBr5GI4KHeBW5RHnp7bQNDlEBYyOAQ=;
 b=jwGCjlx872idgodxeWQqx5TgVs3e2pu9ddF5rcIy37YrSOYlGDtXmreYf1JpqB5Lmk
 1hYn12e4Xcx76U30OMRi3qTA2eASvtJNRHb+lDDzuTpDJRFsAAhjQ19vd82HYoNrrNX8
 u6uo0JDJuevbjpDFUsf7+rFDui5Enua+9csQFuck8Q+gaAhOW9OrEqvILu3jJyg8YS4t
 hVXVorinLChXj6Og1eqVB9JkGnKMRhqtSqN4m4JXBoFSK8pfVuJ6rErsWFHx4K2hKzbC
 asvqIYk8rLTMmIWUBKbfpkVU6M2WHH06oj63hc/EVL6W53k2I+Ie1J3yQXZOYloH366r
 6OgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1788595950; x=1789200750;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=CyK/aGHc4t/QJmBr5GI4KHeBW5RHnp7bQNDlEBYyOAQ=;
 b=GmElfjUY/rH8tdqNKGFRfGFwIvGZFT7PCbHbDuiTyJM9yq7XE3bf+MROMiQAw4r2CA
 WFhrHDCfOiPm1OmHwm0jqBys7nhjLm9/X6+jJe8pl9ij+ZKayXs9qJ4YAWsogujsNrUb
 YNGZvMdO6dPYe6joRb9WdxgtLaCn8OxanGm+sG2yDybljOCOnQHFfDU8V6EbqYQmamVg
 VY9IrQ05ZlHVGzqlefr6auwUZxf9FqXh9Jib9xOlwR5nMi3fV6KBEVxUrfpwzHHzlLwZ
 GBrJCVPDE2Sf+FeFgiWZv1Ku58D0W1Pag5qNCavua9HGfI3uZvLwVnHl2lug1s8HJ4Ot
 7Fgw==
X-Gm-Message-State: AFuF++kBlwJ6RLCDNf4egV7AHo2xCXwRz5dPSUPYW/hRLhJ/62grrMPz
 tl1ioUIQg/2F/meuzWP11/k0qBXHQJjEO3Cmv6P0iauvaCx8Q1OGqdtVELhZUQ==
X-Gm-Gg: AYBFou164vUSuDImYN+OiAGJGgDBrR3LFpP00FdozNqJ5Z1eBtap6oudm1RYjUNHLKz
 xHSVsPwaupjCZSgzynR6EzqCc/HOdnN0q1BQ2VmKzYBd1umI8VjxrwraWyRKYEzJM8YxfECGdrI
 y7TI37FtJMKIKsmSk6eq2VfxANzSahQCuVdvnpu4eP7NJAK1vxl5ZCqcc/ByP7x0swZltWMFW5c
 0PGpx36e41xiUFOrf2iu9WNzFgLa4AErFHmRKM1yvuj3ii7eOvixvi1Oonlj1Y0OznL6rsvZ7qI
 lIujOW0m8ouRbwvuCBO9iDnPIp4H22W7mTPzjiZkfuU3zKmbKoWacGO8M5lyNxNfqKybPLvpHCM
 kdeIpJ3j3mefB1GDQjYPAQhppxuQBb5cSbe9xUFW2KIidfl8HmeFrpVZSJj48PoKJ5Whdkt39zQ
 SAeISwmu/JZo5XDQAvAD9lrkAPK9QGspJ8N7m4KMOXW9nzO4bcLD/bt5Z3zkVHVUhftVDC3zyIl
 n9QyI8CX05ObrWLN9WXRV0JVrCfAg==
X-Received: by 2002:a05:6000:25fc:b0:47f:e886:6dff with SMTP id
 ffacd0b85a97d-48587087196mr14106562f8f.4.1788595950187; 
 Sat, 05 Sep 2026 01:12:30 -0700 (PDT)
Received: from vm-2404.. (51.186.66.37.rev.sfr.net. [37.66.186.51])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4858e239862sm6358295f8f.9.2026.09.05.01.12.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Sep 2026 01:12:29 -0700 (PDT)
From: Francois Perrad <francois.perrad.86@gmail.com>
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad.86@gmail.com>
Date: Fri,  4 Sep 2026 20:59:17 +0200
Message-ID: <20260904185921.587878-9-francois.perrad.86@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260904185921.587878-1-francois.perrad.86@gmail.com>
References: <20260904185921.587878-1-francois.perrad.86@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 09/12] package/luadbi-sqlite3: bump to version
 0.7.5
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

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
---
 package/luadbi-sqlite3/luadbi-sqlite3.hash | 2 +-
 package/luadbi-sqlite3/luadbi-sqlite3.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/luadbi-sqlite3/luadbi-sqlite3.hash b/package/luadbi-sqlite3/luadbi-sqlite3.hash
index 96f083dcb..2f8f44810 100644
--- a/package/luadbi-sqlite3/luadbi-sqlite3.hash
+++ b/package/luadbi-sqlite3/luadbi-sqlite3.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256  ab4b0b47614aa26c143da0e164476779bfdd406d263e0c4184a97d59f0430cdf  luadbi-sqlite3-0.7.3-1.src.rock
+sha256  a9a5ceedd4dd8b8e3556f16b868141ec540350efff61793043fb2a6ea55d19e8  luadbi-sqlite3-0.7.5-1.src.rock
 sha256  988d73cc2e56f972e8177091e084855fc2904d0fafcfe5c4e02864f25ce2b928  luadbi/COPYING
diff --git a/package/luadbi-sqlite3/luadbi-sqlite3.mk b/package/luadbi-sqlite3/luadbi-sqlite3.mk
index ea0167160..474cf39bb 100644
--- a/package/luadbi-sqlite3/luadbi-sqlite3.mk
+++ b/package/luadbi-sqlite3/luadbi-sqlite3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUADBI_SQLITE3_VERSION = 0.7.3-1
+LUADBI_SQLITE3_VERSION = 0.7.5-1
 LUADBI_SQLITE3_SUBDIR = luadbi
 LUADBI_SQLITE3_LICENSE = MIT
 LUADBI_SQLITE3_LICENSE_FILES = $(LUADBI_SQLITE3_SUBDIR)/COPYING
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
