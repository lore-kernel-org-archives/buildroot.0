Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 462DB606A33A
	for <buildroot@archiver.kernel.org>; Wed, 11 Nov 2026 15:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=HJjF3I7t
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 568D5811F1;
	Wed, 11 Nov 2026 15:11:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mpvtxx9a4vrn; Wed, 11 Nov 2026 15:11:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 5E76B811DE
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794409913;
	b=WYGoewH9BAkraW18lC9oetyWefOIdAHqjH9JrAJ4gacqYXgffPAA9AWN6OSMry30e+u8
	 27cMdgShThmYwvki//h7wB5uveFg3yrYmQTrIHRYmEEuNEpeV23rMx0QH70oCLNHFf8jC
	 Lc4mpZIvZpYlyi54IPkHhl3B48d09/4aYGVSl6IGTMz1vHnKOVPaLXwSnybctW+oX5U6N
	 xuF/YrwikSmV/d7JLW74yyhTXMh5QIN6U6MyFznAB+kcphe1YS9xJy51i7ESFX8B0+VyV
	 ACX25e5xOYoO/xz+WEI1ppLAdB7oAeTdQGRKW7BJwZ7IsxmGOqLzkiIvFFGtKC2aWgA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794409913;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-Id:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=DozMiJkonjZ30VJs3c0uqm8UDQx90gzaRJW5iiPBSUI=;
	b=OIgTcuXg7HQuFI9uguZWqGKHPNpcTQHRguQNtesyv+kTGeH4qKwIw8bS4qjchilIknJ0
	 FcK360pMIeLmn2L773l+fYfY0w153g9JRU12njo38Ls4CkUKS0avtTjpe/5D1Qn/75KSb
	 i0wO2EBec/G0qlhMc3yfrP6x3AGpTHTisOVbqqN7a0ZXwBOy4wu9UhhxPrTMyD6YvB87V
	 I2LoxsLS1FJhaOyYopQALzxNyh4HC1jQ45+0616IZ7wxDHWNrKymS0GAIabM0+TpEGmSf
	 rj3GwQRm4qgAZsLhRI/LO6BvzXoxQ4qlFh2ndZwSYqUOMtZh7m9D3RdO5aqCx3/RsGA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794409913;
	bh=DozMiJkonjZ30VJs3c0uqm8UDQx90gzaRJW5iiPBSUI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HJjF3I7twS+0Ydk8K+V/7I2spLH9QmSfD4l3O5kL0VqjVpNbTaMtKSjBO0lLC4f1c
	 Xqn+uLlu5QpNmxC2m4RJ8Vi4yAyNpKr3JfjpuXdYylDeXGFM9fvlmWoLAq63t47/Gb
	 yonCUcabA8TB7SXf79uJ6H2IxlCzhu1a8d1uN+8ioe8RM6UtHarTpsZVCve10gDQ9Q
	 Wfl6t5hbnZ3nxsRHZHbkvTtBr/FUw7+z5k1UGDI0qJsu0R2mrelz/eD1nHQjmQIA8R
	 bWzwfNoCFH15E4f9Wy0KM3W5E2+yofhgqWSyczl3iTJh+W1ztZvBt4Ye7Igy9P97C6
	 yV6ajiOQZfx1w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E76B811DE;
	Wed, 11 Nov 2026 15:11:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 99D3931F
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 15:11:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 758BC403B9
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 15:11:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bg--5cTOG1aP for <buildroot@buildroot.org>;
 Wed, 11 Nov 2026 15:11:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 74F5C403A8
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 74F5C403A8
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 15:11:49 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-c247f6687dcso537762766b.2
 for <buildroot@buildroot.org>; Wed, 11 Nov 2026 07:11:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794409908; x=1795014708;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=S0M0KlSHLCKR9r/NpcL/lpvpv9ECCwDwzHL+NP6zMV4=;
 b=RrvwYsMd+eLfglGhYrFDUwuz0XJubqCowmxI+e4LlhXR0hE9UvzXh53csXT2GGXcoJ
 vzp4axu5JItdDhQQhmfKPhtYskOYYt0qyMEa/WxL9aK18wB+DHDS3v7DOC14CfywKGw9
 FvTZUFLO/89p/A4HENq+kVnTTzL2A5kcWWCQTXPr+bf+FYiZCBe/t3bR36/H/TabINYZ
 WTHzrDR7kqOunMPX02ZpTjHuDNA6SxI2DwS9Bx14bR9bFl25FZXVFE55y+rfXbjQyk16
 u88fG4Yim3xbauqmp92/mPPSBO/tdKIaob0EOf9yy6qcFtf7+/iSh4r8qsY49djWD5oA
 zKhQ==
X-Gm-Message-State: APuU4Z8OVWk1rlGgMfUNZ1SUtxuDe7HrdpYBakyEyaZXEYLCMORZniF4
 CbtfJJ3AqMM/yURlkp12bD6AWq0OJ/GrjMG1xvMXTt5hKo/WZy4qZADE9z08uA==
X-Gm-Gg: AYBFou16YUvUCQiEc0GsMUw4mkw0LGMOYBzwwzAsARNTojBo3GRRtdoUPMHzB5jFMCS
 yjGCux1whn01IifYgUGTMpEqEItFALemIV/W/LGyWo6t7rYKZTzAgH74EMGo9OI0e1+ktRQ/Yv7
 kiRyBGZNJnJhT324hwiOkhgUgN/EwwmjUL377V1hB6sBe4+IIF1J/HmoWXvLeRx2rC1HBS1BtZ3
 w25YSNxZ5ApLDmxvobYdw04utmE/tMhw6AD8pWKE9Zq3U4y6rcSAokSED6UfH2oDSGTx8U//Cdb
 dxR4UllUuwSNh9eoNzHPdfPBYW+lZ/ux1lN9zcu9Bk4kTmQ9BaB8Ja9zPAYtCDmdDzjecyWw6ts
 YzW5mSGzzIBYoUVVboKF9VbFzXPMwOc+wzMDivuTCx8vHvo2tg+REMxuxobtdENVKZFuc5i4SVO
 R+OQtHWV2LtM6hfK3hgdMgZ8yOaW6Fk5IXm9/su8IACjFc2KqbqTlvCkiY68pG03rgKwBwjqkU3
 UDJBlgFmceEBoorLdeSK+p57ZU/9/SNLUV2y8WFAluANwOWy+8C8RRNaIBkUvl3Vj6RTyjFdTf4
 q2xJ8KMmVyHz9crgpbWmcd/oUFTxio/aeRjG5tJOEVpHh1RXxp84ehWa+0KET7zIpnEtwJHqzhc
 /j7rPWJpC
X-Received: by 2002:a17:907:86aa:b0:c40:560a:461 with SMTP id
 a640c23a62f3a-c5066b7e53amr214402266b.33.1794409907452; 
 Wed, 11 Nov 2026 07:11:47 -0800 (PST)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c504a59437fsm241498166b.38.2026.11.11.07.11.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2026 07:11:47 -0800 (PST)
To: buildroot@buildroot.org
Date: Wed, 11 Nov 2026 16:11:46 +0100
Message-Id: <20261111151146.2078131-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/foot: bump version to 1.28.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

https://codeberg.org/dnkl/foot/src/tag/1.28.0/CHANGELOG.md

foot now requires xkbcommon >= 1.6.0; Buildroot provides 1.9.2.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/foot/foot.hash | 2 +-
 package/foot/foot.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/foot/foot.hash b/package/foot/foot.hash
index a95da3e6b8..6a2e2604b7 100644
--- a/package/foot/foot.hash
+++ b/package/foot/foot.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  043fc0d4ad609c1585837e0341dc2127f4077000589dea6a32aa8ab069946862  foot-1.26.0-git4.tar.gz
+sha256  71f80f7c9f2702d195f9c63a5799428d00b2877850e35125e1ce0173c857eade  foot-1.28.0-git4.tar.gz
 sha256  d534a23a31500a0ac958d9634b84f532bd73ff1aca1bb8f7debbcbebc16ff39a  LICENSE
diff --git a/package/foot/foot.mk b/package/foot/foot.mk
index b45a93a4a3..7fd7d8b296 100644
--- a/package/foot/foot.mk
+++ b/package/foot/foot.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FOOT_VERSION = 1.26.0
+FOOT_VERSION = 1.28.0
 FOOT_SITE = https://codeberg.org/dnkl/foot.git
 FOOT_SITE_METHOD = git
 FOOT_LICENSE = MIT
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
