Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAF5A606A31C
	for <buildroot@archiver.kernel.org>; Fri, 27 Nov 2026 16:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=LakoxvVI;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202611250045 header.b=eDJy8xK1
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 98BCA60748;
	Fri, 27 Nov 2026 16:46:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LNpMehkhywyB; Fri, 27 Nov 2026 16:46:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 65E0C60A54
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795798004;
	b=cfYzj2k8NTCq3pKwYnu0mfGvtiKDg60HDKEFAkoJinEo9823+K6sZA0GBEUfx5/U60oz
	 dgl1Di1DHwaaYdAiy9ebHUaXZyp8tuahkmNGFno1UdGCHitZhN+njSEf9U+81Zm5JK6/S
	 0DAXVpBh2+3YdGzGbEeBLa7igDf+hJJmiT0e1ubCvAZK4BdD6kDNwMXPfK7GYBi7iI/UB
	 4cMSYUpgDpV2BPBuDqFUlbMwzPeIqC1GSAuisSCpKxjkmZbDGskBcI5OQ4Ow7afiZzoFy
	 BgQmBBx//DKQi4O+E2gxGpMCN/quVclKBqg7y1A7m5cDPNSMpYMEseuuCc/dzY6n/AQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795798004;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=RPxg0UP9gf1pFStMZpmd+12wcF8iobzvGmk2iGjQWrw=;
	b=NYLLCBvuRTnJaHsCAzNd7imx8xHTFT0WC3X0jwMcLAtu09LoUW+uD3VcfIFjY6CABX91
	 Sza7N0+QGa0TH4iqB8JJ2FQiV7vClcJ+JWMRuSADIK7xY3zdbTwXuDFRFgdQBiR65hBsD
	 zMzR79U2Q0zqW3wod64Jd03//0WEaDR0h8CQV8ycBMX07yLqw7bWqdSLYKPX3jDCnOKkC
	 p73qNRRRTFVaFYdDihWB4/POXwKR6NQBKOrHEnF0SVY70+Qfq05fC2peJwr29FwwdYOle
	 LX/Y+UYcXk6i3XZPJMObShJz1TfmRi5ag+KF4RcVIi95Dw022vp408NsX32eh4SCQzg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795798004;
	bh=RPxg0UP9gf1pFStMZpmd+12wcF8iobzvGmk2iGjQWrw=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=LakoxvVIuUqFMcAUgXqVSqAKRfDr2bfxgjOLC/mJSR2vC72K51+8p+7TpU6o7gSsL
	 /CdVy+jUedGLEMxvIPyAHIVMJsS6sjwEhv7D4NbqKPlOZr+dbLWB5t3gjk/JQqjOuZ
	 Bi3WH72OY9Ax/wNptpLPdLA3HnAgU2QSUtBhwA4mCPg8mGNlemKS0kLfyRiDt1sjJK
	 ZB+QCbMmHluAcCopFUcxcNs2HsTBh2aHmbBd53utz5qfmSZX2yQ1Vn/SRiS7P+L7Xi
	 RDIu0VKb58cUwjfGguwkiFhKWMDT6J4BTrY2Jw+fHPG4hdFzftw+Ue6/iHcgC6/ZcZ
	 SUWNWLZUeLMJQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 65E0C60A54;
	Fri, 27 Nov 2026 16:46:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id BA38D26D
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 16:46:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AB0AC40623
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 16:46:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sm5QrI63K7je for <buildroot@buildroot.org>;
 Fri, 27 Nov 2026 16:46:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 6DCF2405CE
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202611250045 header.b=eDJy8xK1
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6DCF2405CE
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 16:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202611250045; t=1795797999;
 bh=4ukIlZu3xjVH85JkBNmw7zYbI5P4hiKNyFRnTh85KkM=;
 h=From:To:Cc:Subject:Date:From;
 b=eDJy8xK1UrTiilgHdox5JKCNwzA5DVcVKOFALKbRQBTtwFsNdVuLW8UB/F5f0+aRa
 Ug17HU8x3+bk8wBTZFpnRkfh11JeEF+X8rU+prBtwr4xnt+/5LLJgaioCK2yAMVaGt
 CEZtMxCUwn/axOjeUATDBhYY9x6hbCq/mVjYr9qiHdiD0CCMhCHoUc2DpaXAILx7bm
 QGaoMRfo2ohsYc063HikZZeOMs0MieTKVrJyaA90KCbhB5JGJwf+ZWX0PhvP6rUYch
 1Cwgjkkn4k7dqNT+JOAlTgxQGvYv1HVNyzUengpeWpbtz8TcqdYHn1x+QSPUHZ0Ykw
 6TOxFqN33Yzqg==
X-KAS-Sym: v3:f51bdf72230551df:cOkZzaRF/SojIxRVO0VMCzZWmuetw6gE2ZHqPF9/2+c8i
 6cGHwsvLB6d/jdvyvDdNk3bw0b1oz6GaMgXU0ihFl4ptrDnsEAcye+KIWYdUPuWO4eMahIKIlRc
 i9dDLCLmD9o1vA4vmoWDqJoEw0dYLHAjfAMVC259iCxNHM6V+des913qM3UdOAT2ZKuDwV3VaXI
 zgGEaQOzFpCdn3PU9i19CWihwUKWbyDD4a0xm3DPoSCUs1568h/KTby33S0NH4Rw9IOKsehlico
 rlGsP8m9oLgjJllNENhZXypxICNUnSnU6cShE+SmxndDcyj/6QzVnKaQQefxUa1W8IunCUDA==:
 3g+9FZHPv0jw0R9fqCNB6I3hWBS4a3y8V8RtOsp6EQ9QxSiGUhpyA4jvN8J7INxmQAVTmrCw2Lk
 f+zWMh0n92NE1zqdmvmaNTkT//rwP2DwqmmrnOW/gC8T6uaXCh2obnco0MshSuz+BI3/jXewCYP
 w0bgBYyIh2RVN9EJ0phuf4dgtWTgSj+29V9KDxsSP5liNsqa+rMzAcb2BA6EPWRQfkCsTvbasLO
 d15Q1NGhkYeZ8i4+YatCcUKgsqcd2xQw/MGU1MDlfxbXwLeCIB7qYrAiQuwxauH1jGyPrm3SiEO
 fv9rHgPKQD3Hx77U46yJ+qnaWjjRfXTdP80s6Hio4vF+4C0Wdjs3I2nt3vErRmjEOp5k2rvTgD3
 yIZmmTHHeITdLudwxetaxafhYw8nec/hSFMIr4X8ClsfohEuc1WfortNn5DaeqEeE1TIk45yIbf
 4F6L0I9BZCiB5Z/mhu3i/+1PcvRUolFeYaAi/DEUGGpKXqrAW9rk2KtYaiUCRDBIq5DFVLrlJtN
 bQ+4xztb+tjkPwJcxfKfVufL1NlPwyQkAKgj9S5H+j0FoO8p665j/LYFPET2LunkT1vSaY6Kw+m
 lufC
Received: from fli4l.lan.fli4l (p54a1bf23.dip0.t-ipconnect.de [84.161.191.35])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 15FFCA4C4F19;
 Fri, 27 Nov 2026 17:46:39 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:33266)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.2)
 (envelope-from <bernd@kuhls.net>) id 1xWz5q-000000001DF-2aUV;
 Fri, 27 Nov 2026 16:46:38 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Fri, 27 Nov 2026 17:46:38 +0100
Message-ID: <20261127164638.3676415-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH 1/1] package/exim: security bump version to
 4.100.2
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
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

https://lists.exim.org/lurker/message/20261125.130455.f06c6601.en.html

Fixes GCVE-25-2026-11-82-1.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Gitlab pipelines passed:
https://gitlab.com/bkuhls/buildroot/-/commits/ed53e148cdd81f39e9cd2b4b10d3b45d50f6d92c

 package/exim/exim.hash | 4 ++--
 package/exim/exim.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/exim/exim.hash b/package/exim/exim.hash
index 49036ecb1e..bff206a903 100644
--- a/package/exim/exim.hash
+++ b/package/exim/exim.hash
@@ -1,6 +1,6 @@
 # From https://ftp.exim.org/pub/exim/exim4/00-sha256sums.txt
-sha256  e9fb41f6724a5b136d64c9d19dbc5f26494af879a3e7e3190f91639eaa79fa0d  exim-4.100.1.tar.xz
+sha256  04c9958bf15e7e3d518fb55f8b343cba4789447212bc699a9be2b1d11c1016f6  exim-4.100.2.tar.xz
 # From https://ftp.exim.org/pub/exim/exim4/00-sha512sums.txt
-sha512  42b7d59bca187e0e8b3cd85d97ff40fe8de9d807fb12ce38749c30056c92689ce98b09874aec06f1d83fde806fe6193312a98681b56c8baff1acfcf91244bbab  exim-4.100.1.tar.xz
+sha512  2c51c952dc873497bc33387299d016da5f46a504374426cff1ce3a79975bd8e2036d2ba800f8fa1cf619ebe242deed33c6b10a4a7ec2fc502d748703d9820de6  exim-4.100.2.tar.xz
 # Locally calculated
 sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  LICENCE
diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index c52428a800..b8f1698a74 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXIM_VERSION = 4.100.1
+EXIM_VERSION = 4.100.2
 EXIM_SOURCE = exim-$(EXIM_VERSION).tar.xz
 EXIM_SITE = https://ftp.exim.org/pub/exim/exim4
 EXIM_LICENSE = GPL-2.0+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
