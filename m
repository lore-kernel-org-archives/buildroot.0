Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFF8DC43458
	for <buildroot@archiver.kernel.org>; Tue,  7 Jul 2026 04:08:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 866AD406E2;
	Tue,  7 Jul 2026 04:08:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uuhmlw-DRKRu; Tue,  7 Jul 2026 04:08:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A379C406CB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783397334;
	bh=hkmO8fzUJBrKGs5s5Vuco+E8wAwTMih0KRS3bw84DQM=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=WcGtzFPaM3331AP9RFdkRKH71brOxI8256vujpWrlBuvU0kDsE2oSO4ogi383BXLM
	 de5i9zXIt1xiKGUNn/97ckNCZstmqWpPD8cbOpp9JgwV9RJl1vwr4h85kzP5cnscI5
	 TP1OwKcZAyXd13dhJAXkIdIIWi2L3RQyZXJ4LlGPBPkEoABgvPHMHsVENmfbeV6nqI
	 bcicGYLA8Q0Lbnaus2tIQZH/9wZ7lzAq3U+mKPNIk3XPjwsAn98QxXTZsZrWaiwUBb
	 o3y3dHftdgLlJjJ839bZvXdX4JdYrgeGfZyJp4KlZGrYGCVnQncbCc7Uqa2n27+loO
	 KfkF0fu1Sov2g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A379C406CB;
	Tue,  7 Jul 2026 04:08:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 162F6315
 for <buildroot@buildroot.org>; Tue,  7 Jul 2026 04:08:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 13C55406F1
 for <buildroot@buildroot.org>; Tue,  7 Jul 2026 04:08:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BGNbDwy5WA8R for <buildroot@buildroot.org>;
 Tue,  7 Jul 2026 04:08:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::102a; helo=mail-pj1-x102a.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5F882404C1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F882404C1
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5F882404C1
 for <buildroot@buildroot.org>; Tue,  7 Jul 2026 04:08:53 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-381216921aaso3363999a91.1
 for <buildroot@buildroot.org>; Mon, 06 Jul 2026 21:08:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1783397332; x=1784002132;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=cy4LalnFoZjJhr5PnPnournUvbx2RqQa5stzgdnK2H0=;
 b=g9PFIgDiEAB6v5hhKROS0HojWNzHXmnMtw5ALy2JMnplCOePe2ZNCSHGld2mEKSK1Y
 fXejlSA+ghcKrL4ApGEdYuaQ34dYM4i5uXdiFbjPnZbN7BPOP/+JOZJEkJH5Ra4acw6+
 g39ZLXCYbIeVjt7pm+JGNU4/pludP2sb1HNuxqhEmSijjGOZkYI/Hi3hdjPRZGSMBCVs
 SC+Js7xlE7f1VMCZxUP8eJrj0VtU5k0eT5ymgD/fNrKlQiiN946jPKHXuvKUc86xr9OG
 PY+dylqTjGxBRnJBT4xvw3kXw3o8i+1W2+GAfMKZS3SZZM2BABZpFt1FxqaWCoHCdiHf
 0Fbg==
X-Gm-Message-State: AOJu0YxezcygwpWr70/a0JvGFEPSoMzMplEoKcOEiR7j8QcxuzQX5V5G
 5DOWr2Nwthk66jknB/OdEaTOYVPewFudXVSlwKkb/wQ+EWLXu9kR39buZ8s+sPwI
X-Gm-Gg: AfdE7cmATJkpeO94Gx/n7dFXpptDSl4VtGcWkSpr9dtCZqApQwWwlKtk4q+QoiGoEll
 o0OV+AGzuqZyOc5FjnF2c0Od8xcM4C3MvccvosEUy+qStlR0MIZkke5xaP6ryXRqXW/IXYDBSO+
 BwRwzMGzdsZ0gAIUKPIkQvizxJ2NhUbEQdhl88rR9MwvST9VX0GW51Ob5lKI/njeetP2a+ADOz/
 US2Rz9FAqcn6CI6CssM96Uz0h40loqTfH5Knbi97PiaAWFDYAUk2H6GI4++lIiCZVKCWYVpmktS
 lkvk2w57BLOgL6Lw+VVOR0pnkCEKrCL0he6vWdsrBKukOm0CCv1I/ZoKty8W1y58WXqqw6udB5Q
 Z3NhU8v0qafokFJuNQLbgcy7nv7+WB6pFyHvudzDQl6Yij0DkYkNEQuYP5zfsnSP/mM4HBUWWWA
 mk8l8FeuzfjPcheP4NrZJ6TVWUF5cVekvCSA98zccTIs2RBc8wpd9RE2+wq8dtfvOO5QcpeG80y
 A==
X-Received: by 2002:a17:90b:1dc4:b0:381:2684:519c with SMTP id
 98e67ed59e1d1-38756508836mr3527932a91.6.1783397332447; 
 Mon, 06 Jul 2026 21:08:52 -0700 (PDT)
Received: from kadvm.. (ip72-203-121-181.oc.oc.cox.net. [72.203.121.181])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-311747f598dsm3372636eec.6.2026.07.06.21.08.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2026 21:08:51 -0700 (PDT)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Cc: Akhilesh Nema <nemaakhilesh@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Vladimir Oltean <olteanv@gmail.com>
Date: Mon,  6 Jul 2026 21:05:40 -0700
Message-Id: <20260707040544.108052-5-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260707040544.108052-1-nemaakhilesh@gmail.com>
References: <20260707040544.108052-1-nemaakhilesh@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1783397332; x=1784002132; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cy4LalnFoZjJhr5PnPnournUvbx2RqQa5stzgdnK2H0=;
 b=X4lsGY5rmJppms0qB2ICZURkr6imtjNwjvsFXFNkxd64bYuo3QiMf4HkFx3G23GzcY
 tIzdo6tbwgFDIxVGXoNYBVoDRHebHkAqRKjQuiaDEOc2BPJTbbT+cQYaCh02wmVBE/PL
 Enz/qrh9pW7TBMQEM4MefSWitGPEG9DfeNFB58DhV2snrKCDA8ot/eT2wT2z7uhg1slK
 2sOGXyFG4azQWZG3r7ziDl8xMIweXb8oPgQlEk2Z+QQiVS3pPJQA4LoEEaXu4QoZTmfR
 BYM6ZFKLTBmM5aLAymNrpM5UEEQL1A54xLXykSHtX+IfprIEC5kXcle4jNyp48EO6N7Q
 Opdg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=X4lsGY5r
Subject: [Buildroot] [PATCH 5/9] package/qoriq-ddr-phy-binary: bump version
 to lf-6.18.20-2.0.0
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

Changelog:
https://github.com/nxp-qoriq/ddr-phy-binary/compare/lf-6.12.34-2.1.0...lf-6.18.20-2.0.0

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
 package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.hash | 2 +-
 package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.hash b/package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.hash
index 6ae08a3152..942c654766 100644
--- a/package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.hash
+++ b/package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  d5a5a9b7f25295e9e41c8e7c18a1986d1b59ebe519113ed6b45ede51639da92f  qoriq-ddr-phy-binary-lf-6.12.34-2.1.0.tar.gz
+sha256  d5a5a9b7f25295e9e41c8e7c18a1986d1b59ebe519113ed6b45ede51639da92f  qoriq-ddr-phy-binary-lf-6.18.20-2.0.0.tar.gz
 sha256  e7e5f4949f7ac9f9a5d4d68b8f835f3ddc93ad47b594a11de699d90b9175413f  NXP-Binary-EULA.txt
diff --git a/package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.mk b/package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.mk
index 04cedbbe00..3c39b36362 100644
--- a/package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.mk
+++ b/package/qoriq-ddr-phy-binary/qoriq-ddr-phy-binary.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-QORIQ_DDR_PHY_BINARY_VERSION = lf-6.12.34-2.1.0
+QORIQ_DDR_PHY_BINARY_VERSION = lf-6.18.20-2.0.0
 QORIQ_DDR_PHY_BINARY_SITE = $(call github,nxp-qoriq,ddr-phy-binary,$(QORIQ_DDR_PHY_BINARY_VERSION))
 QORIQ_DDR_PHY_BINARY_LICENSE = NXP Binary EULA
 QORIQ_DDR_PHY_BINARY_LICENSE_FILES = NXP-Binary-EULA.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
