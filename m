Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0401606A321
	for <buildroot@archiver.kernel.org>; Mon,  9 Nov 2026 11:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=GbQNQMt5;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=g4IuoHfO
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B85C480E3E;
	Mon,  9 Nov 2026 11:00:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q_WSqr-d3O9n; Mon,  9 Nov 2026 11:00:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7F2D980E4A
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794222037;
	b=domQU1YK7OPDkXGnK4uLoPjaEKj2WZAiXo7iCR5M2VBMCwJ8lRUyC/xtuG9JZjOItlii
	 fKKRUU/7micuwf3RfhH1fCZ7FeRHezbNN24arEp+NpWDSNqtLAA9Z4GlhiMIKPv5FuLmN
	 S5+vvSB2Ym2mEe44QvvyIG7Iu3B0zd6kbJaCUIBkur4sHeB5anVhjhGrGvkuUWXSfm5aB
	 DYDaTQGh/aJxNhkvfSoq4nD7H621A3ImPt9g4xfuhgwHgOfRAB+VJOQI4sYDXvldfBCc0
	 97QvgbQrz1S6XIdBeeGXfxn8jwUIpC8+hFhGitaPLQ/KtYG4LZq4MCkABPmN8CrLZqA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794222037;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 X-CMAE-Envelope:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=2DOZZsJEU1uovkZzeDkJVbAdphcuTrpccxHUbkswwPM=;
	b=JF/ZGMFGGhTMLkXVlPMC5lqCLUXlNpXIx1oged/TmRUTZ2AOZzgZ2XzVyOA/n2optRzg
	 oY7LhEEOx7TOolt7dl2HCo26jeTXABQa6oReGqyQYoCfmKNNdaFF4P6rJze22A8AyDPPw
	 yGOQkG39QlesiA8b2jOCZ7TG9uYT/MN2oD0OjbZqZU0pX9Qm/bDokB33i+LVMsSnZkSLX
	 VmTNXBfbJHcA1uWDA2wT2MGPK4+N1K7VI0k6GuLMfrZ89RjjjlJGqLIRsqILJeC4Z8K6X
	 bbPdDrKaoKrHWESrQHSG69axou42Bi7rlAhaPk6OYfnEio6nNavj68yMZ1HTcy8MH4A==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794222037;
	bh=2DOZZsJEU1uovkZzeDkJVbAdphcuTrpccxHUbkswwPM=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GbQNQMt5SLKNFn5dtA6i6QcLhniYSmA+EdD4daVGbmcfnmi2AOkCLHGj+TB2d90t7
	 OnPz5jCkhXdDV4QAHUQ+uUJwX2P/hQDgGOQf7Ideh2HSk4FRZaMVIF+hByLN27Z+Vl
	 gsob5tIL09E0Cx5W9zOWhDXOgMK8/G3DHrMeH6pGwSoodL3LCrVUGNnHMFhPhD2+kN
	 r2bflOCl5RYY47SMTAoC0EFq6spohHlqXFACP/MJnP0FMNd54EDMoWraI2RI9K4kWK
	 Kw5ohLfWHp3emBI2K+4rm1H2Lp+u/CAwk44X40gI7IplzQZDiSUuctOudY+aHAmqWM
	 BKm8DEq+3uWgA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F2D980E4A;
	Mon,  9 Nov 2026 11:00:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 227E6932
 for <buildroot@buildroot.org>; Mon,  9 Nov 2026 11:00:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 08284400BE
 for <buildroot@buildroot.org>; Mon,  9 Nov 2026 11:00:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3FajAeqL_rbI for <buildroot@buildroot.org>;
 Mon,  9 Nov 2026 11:00:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 190B440095
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip=62.149.158.102
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.102;
 helo=smtpcmd02102.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=g4IuoHfO
Received: from smtpcmd02102.aruba.it (smtpcmd02102.aruba.it [62.149.158.102])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 190B440095
 for <buildroot@buildroot.org>; Mon,  9 Nov 2026 11:00:33 +0000 (UTC)
Received: from localhost.localdomain ([151.95.84.63])
 by Aruba SMTP with ESMTPSA
 id QN70xyyuV7fl5QN70xs5ud; Mon, 09 Nov 2026 12:00:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1794222030; bh=YU60uXDeNsPjdhFSj7lOz2PAT9++6MgyiwTXfGRnOZY=;
 h=From:To:Subject:Date:MIME-Version;
 b=g4IuoHfOE7BxoV5TDMQ/VkUyhNo0jg4YFw3kvaLFG7SQ9v4m1orLLgj2qK0g0J/JO
 DG0thiO6z3dzVTFPeEfR5jPzqkA9xo87xwu0NF4ELjl1h94LtK88g6/b18rbHbQe9V
 YREZyG7B0CVeZbkKI6XO+p9MGadncaKKvL9ggdJlLmJewFW5tH50sU8IGB5PvsHn1n
 s2LXK69LNPKNmKStwWrCSniov2emqZJKRyAZw1tgMND/BQAluRaWrdX8v2+FL6f2/q
 FEuyb8LP3fbqZI3c4hyb4vwtuDr7qeC7awIoANG/d/qfwDSoIIILSl2im9RDA7CQ3R
 J2E4F5a+eEx2w==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Christian Stewart <christian@aperture.us>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Mon,  9 Nov 2026 12:00:29 +0100
Message-ID: <20261109110029.1306930-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfLOZPxfWY0cDUx1sX7fVgxbiYPWAW0RS5HYDVn0LysG/n7X0jC57koVpgVp4Wib8RaayHnMd/O8NqloKYOJr2oFXtkkmhJdM49QAL/KkdPKBjCTPP2uT
 GgmgD/U4lDO1JjnwKdO/mzsUkfDFkqbkmC7kGhdy0SUoHIZgTx1DLCe6ldHGhJLbvBwlj0q0i2ZawDXrz+kXbvgrMaVYqz6tSNCq+yM46RVcRHuz3lke9jfl
 3W6LpWchRJOYLvajPws9U3jTRNBmvNxDaRtE/UvoPHezOEeoKCIrAbS0rAjWLQYnX5kkLsVgxIf0VB86FzpiPA==
Subject: [Buildroot] [PATCH] package/rtl8821au: bump to version 2025-12-13
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This commit allows to build with Linux up to version 7.3.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/rtl8821au/rtl8821au.hash | 2 +-
 package/rtl8821au/rtl8821au.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8821au/rtl8821au.hash b/package/rtl8821au/rtl8821au.hash
index ca5f9f15df..0eeb72288a 100644
--- a/package/rtl8821au/rtl8821au.hash
+++ b/package/rtl8821au/rtl8821au.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  1d9f87c7a30d54f67cb09e98a436565ba9c64a28feca95205f66212d8833836c  rtl8821au-bb26b6b06c47b79c17426ef186f44a608dbed7a0.tar.gz
+sha256  866b642868faf6844f7e2c7f83f05f965355eacb51c7d07e24ab6ed9df22bbc4  rtl8821au-3eee07cb78dd0bc9a89b7fe383e467403efb3b97.tar.gz
 sha256  640d90f6ee401241ff62834d0d1b33f83049e99b8bfdfa04ed1b0a1635dde3e7  LICENSE
diff --git a/package/rtl8821au/rtl8821au.mk b/package/rtl8821au/rtl8821au.mk
index 4e7aee4204..7c5a3dfa50 100644
--- a/package/rtl8821au/rtl8821au.mk
+++ b/package/rtl8821au/rtl8821au.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8821AU_VERSION = bb26b6b06c47b79c17426ef186f44a608dbed7a0
+RTL8821AU_VERSION = 3eee07cb78dd0bc9a89b7fe383e467403efb3b97
 RTL8821AU_SITE = $(call github,benetti-engineering,rtl8821au,$(RTL8821AU_VERSION))
 RTL8821AU_LICENSE = GPL-2.0
 RTL8821AU_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
