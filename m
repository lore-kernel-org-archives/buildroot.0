Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47746EB64DD
	for <buildroot@archiver.kernel.org>; Tue,  1 Aug 2023 22:37:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E0D268188D;
	Tue,  1 Aug 2023 22:37:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E0D268188D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7PJscNM-bH3E; Tue,  1 Aug 2023 22:37:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 28A7581F47;
	Tue,  1 Aug 2023 22:37:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 28A7581F47
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 11A731BF476
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 22:37:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 23AA181E57
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 22:37:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 23AA181E57
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mgzXeZzv2Tig for <buildroot@lists.busybox.net>;
 Tue,  1 Aug 2023 22:37:47 +0000 (UTC)
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2C26C81E63
 for <buildroot@buildroot.org>; Tue,  1 Aug 2023 22:37:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2C26C81E63
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-3178dd81ac4so4642848f8f.3
 for <buildroot@buildroot.org>; Tue, 01 Aug 2023 15:37:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690929465; x=1691534265;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+H4KXuWweMRFMlUZ/fq7lI7vkjLsZtPFn0nkcWfCosM=;
 b=F4S8Dvz7iRQiug03/X5koGFJK6Hy9t/ybl/FY9YLBdABWbyJxQBtl3wzfpOO2h0r7q
 kh3XZzhsgYlsUt0R11zqLhzLMIZ3+2rITOtloOhc8RHPYiPMLPGw+WR1ywhE6wIvy5m+
 MxJF256B1m15Ka+HcQo+GelGEh0wg1Uv5JDIzrMnNFdA4exiVkQfHAahXZ414VskpjTc
 2NaA+bcqdXH7R2xUJ689Rcrvd0VDJiMmD5t1kPl/fkyRAS/ZOJRucMgfbOQ6ZLBsNgVF
 M0OOgTN5EYUZ8q6MPcdkFzm7CcimcSB6M62v0C81I0GGsEYywqvWLCHAyz/dLt3kURs3
 D73Q==
X-Gm-Message-State: ABy/qLYJvZK7tITpNCH+8jCzwLlVSyaCZ+wUZz2Wnk5IyP4j9SyrWKr4
 Vcjg7+Mxg8Ro1/BBrG1xk9+fe/Ydj2I=
X-Google-Smtp-Source: APBJJlHTrulAR1Awu6NeIS3cVG1cIDphEqiQLVh+V03KlWQ6FDGcz1eCtPR0vd5zTGnyRd9G3mhrUQ==
X-Received: by 2002:adf:f143:0:b0:314:362d:6d7b with SMTP id
 y3-20020adff143000000b00314362d6d7bmr3091301wro.19.1690929464923; 
 Tue, 01 Aug 2023 15:37:44 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e00eeca726b991c1980.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:eeca:726b:991c:1980])
 by smtp.gmail.com with ESMTPSA id
 d14-20020adff2ce000000b003176053506fsm13464522wrp.99.2023.08.01.15.37.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Aug 2023 15:37:44 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  2 Aug 2023 00:37:41 +0200
Message-ID: <20230801223741.367162-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690929465; x=1691534265;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+H4KXuWweMRFMlUZ/fq7lI7vkjLsZtPFn0nkcWfCosM=;
 b=l/OjXfgvb8dTbcoeguwABl8Ks9HMoR3dsXCxOc1Av6aUjClBP8tZUfdNQNQDhis75j
 pR375VSkMwpbYh20nLAWny0i8l2sOGF66kh+FZkjsOIrK7QERK1j15wZ28xIE5QraP5j
 X0moGpKk6yGGklir6u7/EN3JTNsh9DM41NpaYHTKI88/A5aJ3/ubsS86gWIO7/AflOhS
 X+ZNIPn7XcPYDNpp8PAC1d3d5XNeYhIYvRn85aXP31zhVkFe88SVaMxd9GQkM70BboXD
 9KfeFtxNymeS4leUHypsQiB47oUHrnyyP1IrlBERZ9A/Y+AH3/MgcOCeIEANhVtezKXJ
 41Lg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=l/OjXfgv
Subject: [Buildroot] [PATCH] package/luvi: bump 2.14
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

lua-openssl (0.7.8-0) bundled in luvi 2.13 fail to build with openssl-3.x

test-output/TestLuvi/build/luvi-2.13.0/deps/lua-openssl/src/lbn.c:28:27: error: expected ')' before 'SHLIB_VERSION_NUMBER'
   28 |       "based on OpenSSL " SHLIB_VERSION_NUMBER
      |                           ^~~~~~~~~~~~~~~~~~~~

Luvi 2.14 include an lua-openssl update to 0.8.2-0 fixing TestLuvi.

See:
https://github.com/luvit/luvi/releases/tag/v2.14.0

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/4768561386

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/luvi/luvi.hash | 2 +-
 package/luvi/luvi.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/luvi/luvi.hash b/package/luvi/luvi.hash
index 9621ef4d03..3518a2dc85 100644
--- a/package/luvi/luvi.hash
+++ b/package/luvi/luvi.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  da25c74a30a3fe2fc75e9797a6fa0717ebb05ceb7e6ccb61301f80c7dd436b73  luvi-src-v2.13.0.tar.gz
+sha256  4be4468d01657100967a9c696f503aa3c30de6f23af39050c1aae909fbf0aaf2  luvi-src-v2.14.0.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/luvi/luvi.mk b/package/luvi/luvi.mk
index 5266281ffc..4a8072dee5 100644
--- a/package/luvi/luvi.mk
+++ b/package/luvi/luvi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUVI_VERSION = 2.13.0
+LUVI_VERSION = 2.14.0
 LUVI_SOURCE = luvi-src-v$(LUVI_VERSION).tar.gz
 LUVI_SITE = https://github.com/luvit/luvi/releases/download/v$(LUVI_VERSION)
 LUVI_LICENSE = Apache-2.0
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
