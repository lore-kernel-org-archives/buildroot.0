Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B533E60A260C
	for <buildroot@archiver.kernel.org>; Mon, 26 Oct 2026 09:42:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=StyRF7QL;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=cTlG0aw1
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8FE5F4060E;
	Mon, 26 Oct 2026 09:42:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Va-UWqYFvPyu; Mon, 26 Oct 2026 09:42:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 9EC2A4061F
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793007757;
	b=g/l1GODDPsrHWWRhU1ewkec6lOrsjUy2a1qGnS5ZNAjH04g6vHDwdJXwv5qpGrIu3SL+
	 leRMk0wPRsaQxN/mjj03kTTGZNBpQkntqdy5rmXcg5Bag9V7xzXC7y2mrSbfv8TUUd1SU
	 3MJWjj5temj2sLEamFehHU7KpJjp5vJntpAMEep2eO/KxgEJ6finc5f2HYzFbY6t4ZqiC
	 SyDTkCNSSjno9HOY2rekUbhPAS7Co7ozCzDJtNebvD+JkuO655ECVAFaoxR7mzlHgLSRr
	 0g7ZZ1xZfYq/93gB1yaXj+GrvyHxd6kOyPeehPJPfcGNK9h9/uYYn1wsAbDBf/ppPZA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793007757;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=eC2BaC/15e7nhJbuy/CoQFBMgO0XHtLqS8TR4XUo/Yw=;
	b=JLtx8Y16myqYLqotZnlUhhYwCnmyyiMcL1C8fDf3ZTF8pjjUzEZwzXJdRvY+pdG4Pv2B
	 mibHMM/DA1y12yombZk/B3RcS28YHai/3EVgPJVDxzWNWufkW3iZ0vnyHEnDgsjCJcdWd
	 uz/lE2Q8KzFq+2z4X1LA4OSfDgBrctgx/DiO8TdbvnRADktsv766r4DEF/ly6UaINbpFG
	 FBY3CP/2AnYV8U+u55udGPflP0ORqCTZ7zIIiXfnxSqM+8KtFn5+7fNHc5xcm8SfSneVY
	 1JJh2m5Sf/KI4mdQ6bGRmsnUvBZRE+9ArHbik38gGWC/8GL08S9U/KXWb2UK3q/3XpA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793007757;
	bh=eC2BaC/15e7nhJbuy/CoQFBMgO0XHtLqS8TR4XUo/Yw=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=StyRF7QL0wo0y9cAZrkOskerwKlIKfgNQqh0hGlMxKG9IrkWj6r3iUEFFdudwWrRH
	 cLAX13Vkss7gWWcI0XAWWIVnTBXUcYnHSQsZJg1Jq5YIsds4pJwgm35pMNFE1xmnWa
	 2lAoDZGYUvw/iXomSmriW9Yn3Zq3bdHHOZfzi9jylXh+s87/nzapBSBO5Z0icFzYSw
	 mpDHMG496O6YleNRhHB3X2viZs0OCALUEHAhavxDX1Gy8ELLhXD9rPV+X0sevTamZM
	 pkHMx/ASAMQwxGRz/TiSEVzFTsQOLOrHcSIXpRKMKuSy++m/5A3Ky08TzjAiNrWQcK
	 qd4ww7UkF4eSg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9EC2A4061F;
	Mon, 26 Oct 2026 09:42:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 608163D9
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 09:42:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 465F580DE9
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 09:42:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cHqpNYcK6xF4 for <buildroot@buildroot.org>;
 Mon, 26 Oct 2026 09:42:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3A51F80DA4
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::32a"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793007755;
 b=DrISHxsTl2veo99VIew7uAQ+XFInXwzMIbRdfDeWGRmbSGLpT2ZL93mUE0nhgfvjcygf
 qzHvtHTGb2c/69tV5icBW2bQebl9TWVzLt6Ihdqpl/0c3yYlhi7n4frYJ4dtr+Q8ZdbUW
 bjmACxp+7R0gt5gIn6OEcZwyWPZnW8CzjwldYQQSqZaLPjoySU+up5mn6SVcMrGWG9RNZ
 i20FU3MDGLtoDZW26GIWuSBDEXF/TqupKcZChCkJZTw7R7cLlfQ7d/O94xTC2FeQCePkS
 PxQvAtSsvv+ohwrasujveFhMNpulVa22ppVabZsgL2cu/2XSqHGDdbO/KSDCIHmU/bQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793007755;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=JDeiSNQ5+B41ddcDMHvGcJBbu4J/iLTA8Tu9l3dxo9o=;
 b=mtL4slUvTgSE692zhQ1FVvGAoIyq0FKGl9Gi4uGQVDejJYZQBO8LRG2/mz4kU8yByAPB
 X9H5t8t86eqvdJEpz6SY+OFD2WjEoLCliR1TKILvm5dsmvQ4HU8RA5zrWCezWKYnuwe4f
 19zaluIU33v5qTcL9OKIQOar+lFSRxcM2cA3Yu4EYGOCiKtOqbxhOcByZ+RxiVFQVg6/z
 fcNpKBdodLW3fgB56OCd3c8qFc+XLxdn7NDEzb2TDYCiCVe+gbKhOk+cUGtTdxsHI2Fc0
 N343wbq3zp6Q4PxIW/GuO4ZFIKrZKZqkj4ZuXWi+wDSMdCrjZBp5qCYnTUxqSV36rfw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=cTlG0aw1; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32a"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=francois.perrad.86@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=cTlG0aw1
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3A51F80DA4
 for <buildroot@busybox.net>; Mon, 26 Oct 2026 09:42:34 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-4a549cd7fd2so8602785e9.0
 for <buildroot@busybox.net>; Mon, 26 Oct 2026 02:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1793007753; x=1793612553; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=JDeiSNQ5+B41ddcDMHvGcJBbu4J/iLTA8Tu9l3dxo9o=;
 b=cTlG0aw1BE5DceMXMFMFNpvu6xiR+tmR46jVlymcE1P32vrPUXKF5Kal6b0u8x5FGy
 Kou36oWUC5LIAAgGW9NBcAJ0+MKmNaWYDfAJpUBJpkVbGfcFmMHQsFh1IbYBC5dNvtBu
 A+gDq93vkNSwyVUXTQ+cRbLW9pL4WJ6Vg4c944Y5KVszTTNaQbc3dLNKxY8nRuZgma5z
 3gnQi5URAWAw9SB9K8k07s1gIW6ncGFlyskJ5Imi57P1mcydh9IeDLY66B+ZNti3A5kw
 GXsSJ7pQyMbPY7rxTPUOOjsjaHWZfB8rnWr/k2p+ClcmrMhl7th10XF17mscgSHKV8WS
 RhCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793007753; x=1793612553;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=JDeiSNQ5+B41ddcDMHvGcJBbu4J/iLTA8Tu9l3dxo9o=;
 b=mQ/SuGPcq+kgK1VFti7n9Daf/DwDw3ZBxtP43KQL3aY1TBd8KwIiorgSF3Y85edKD4
 s4gZ2uNTTDcQ9TFZaFUewFpoQ2No9tDLEBVxoQn883qZqUbfb8Otyl35Uf9U3SOydt5N
 pUNcCn6gYNea7z8+UPI74jlz6jYREvDK80hvBP5dyc2lsuUh9EOv58zXtgNKuPPBczBc
 7KptRJN2NM8MH0hGzV5m3QhoXz2wStPoh87QEsPyW1nQM3n1lPsW4uBlbqNnTDxuju6Y
 MGqyfOsH2RIIRWpc7Fgn2pO1rZg1bOkqgbkPrmSA+sBWMx8nDRPmlRoKDCgTfPzN6qUW
 glFQ==
X-Gm-Message-State: AFq9FYK9KVSCfPC15MrWDQgzWa5zaCqabgr7CobU1XiZLgkLDrnWhJTm
 T+NuXJMcyNp+p099bN3pAkjPPOaNi7DOJWfi67ZBUJDsm1Ht3ivvZ+oC+Xxy4g==
X-Gm-Gg: AYBFou0ucUBNoDMONvygHfCnL32nY6hhgs5YK4ZMgNTtzDMQ1Z1/Ket9vj9jwun19Su
 TpU6MEVZbyVXfCP3ZSdN8mFP4+M05mHD8DICJHhDYoPowqtM1ODrucpqfBQ7J3bn4vNHFxUD3a0
 BXqB2XnBmayFK9X9rfU2N1N53MvGCUcvpKAYtwRqfyxxjbOyRV/6jZNYZcQOfuGibn+K4Tj3lHU
 bcpN5rJPAKFLB5DBigEVQRsjFb4rjJ6yGb+hPncSGPr2u8O40eGpQUVp4IF6YbibTcEApKKyhJ+
 L+32xRgu8JDZXSLV8X+rbNNk26FLzFudI8H36YGey2tgfbovoSdTJbTIIFrTevOhD0TEgGnw7Lm
 YSc7eqNESy9dccS+0CYz+csrLEcwuF7EF/iqJ8SAhznBirpc4XGwmmMY2K/7GqXYtCtFYwaX5VV
 Pm0STjtNEzL78+cYk6DcIrAXtHHeS/T/QfbO2D076rV0qRYfoGi4XGJKxoqYuhghBZwYLsbyXNY
 cwEAORDw1gChosmQTWL5BLH7Il+/raVsJ79eoBHYAiF/zg6ZQaLmASa96eMLYG23k9L0+1lVZjI
 X6Fh4IGV9pFKDzRr9bbVQhZ+xrEv0Xe2
X-Received: by 2002:a05:600c:8581:b0:4a3:5da2:38ae with SMTP id
 5b1f17b1804b1-4a35da23c55mr77982905e9.14.1793007752446; 
 Mon, 26 Oct 2026 02:42:32 -0700 (PDT)
Received: from vm-2404.. (51.186.66.37.rev.sfr.net. [37.66.186.51])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3ece13aasm14286875f8f.58.2026.10.26.02.42.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2026 02:42:32 -0700 (PDT)
From: Francois Perrad <francois.perrad.86@gmail.com>
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad.86@gmail.com>
Date: Mon, 26 Oct 2026 10:15:17 +0100
Message-ID: <20261026091518.278320-1-francois.perrad.86@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2] package/luv: bump to version 1.53.0
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
---
 package/luv/luv.hash | 2 +-
 package/luv/luv.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/luv/luv.hash b/package/luv/luv.hash
index 779046e65..ce4bcd325 100644
--- a/package/luv/luv.hash
+++ b/package/luv/luv.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  3e6eb820a3aee034f85f9cce9bd77b5d42f34d128a1ccec877adf28c913577c7  luv-1.52.1-0.tar.gz
+sha256  fccabc7bb37fcc3b84ab258a19a862c55f67abc2059af0a744a1ae64119dfc6c  luv-1.53.0-0.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/luv/luv.mk b/package/luv/luv.mk
index 3d79bab16..2b742d44e 100644
--- a/package/luv/luv.mk
+++ b/package/luv/luv.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUV_VERSION = 1.52.1-0
+LUV_VERSION = 1.53.0-0
 LUV_SITE = https://github.com/luvit/luv/releases/download/$(LUV_VERSION)
 LUV_LICENSE = Apache-2.0
 LUV_LICENSE_FILES = LICENSE.txt
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
