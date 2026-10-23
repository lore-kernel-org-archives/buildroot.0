Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 934C0606A31B
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 10:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=J99cbC88;
	dkim=temperror header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256 header.s=2022 header.b=QgyQMNe8
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 631AC40921;
	Fri, 23 Oct 2026 10:13:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XFgqBszXYcHi; Fri, 23 Oct 2026 10:13:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 8D77940927
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792750397;
	b=pa6ZqCKnzSGC8d8wVjYtIqCbs0U0SG64J8G62j9lGd8/kTcNfMgfGFbz8MFkUck9xB1f
	 cqVSm7zICfxpA0MPB2FyMCYlASUM+2WGaM89AAw+6zMZobH2tVJMZRMdmokyPoqhnkYDT
	 D5QevfPEKrrI5X9Gm4gsEbbVQyaY2bxLngb0GX/EdPgtYnknS36AXnpLyy2FivUaoDJd5
	 vOfZrUwNitbtaiTkv+Yy9HWYJDIrHshEu7SBwjVZRaNBd6IxPCm9G89Dy0fKCpOgvjG0F
	 5kf2JyB8/oPDumlabLEBBOEc4c1xVRNz0LhrOw/A8DfuDn0gOaqnPTAHhAVpSscf1uw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792750397;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Date:From:To:Message-ID:MIME-Version:
	 Content-Disposition:X-Operating-System:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=aHk0YMQQa8VeRgtXQh9YJeYg9OvZe8m9ho70W/LCf7c=;
	b=IIFH+52mcFsKqZSBmX+5Tmhr9UpzEJlD0BLTN5EFGwNfpwt/LY9LW/POUOyJjV26N4vx
	 fzayQpBYC8v6bDTPrIqOam6knHjFWDSsfmornkU+ca4w26X3q6FLXRYVhXMR62+lDeiAy
	 JQTkmGiz/JltGENp1E4710c4Lg+NYcpwyCNkLK2qvEpmhs5fMajbQEBX0xjI15mJacht5
	 GlFxc0Pnyr4SZaR0r3I7dDLdQl/dllgc5eJtkb7A+wqEswtsDjy94fT/F/Bdk6s8naEnf
	 8PxP2FpTR4j5kkM8/i1dJYPyWEPSWN1bXaVpKoIixuE9eETQL1+asNquTa7+5XFTp+w==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792750397;
	bh=aHk0YMQQa8VeRgtXQh9YJeYg9OvZe8m9ho70W/LCf7c=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=J99cbC880nrnxW+ZX5LQuB5kkzo4/eDIbsI/WHj2pnHFjiNHpUDiQTyGRd60AJ6RO
	 h+q9k5cUuTLty2LCwhNKblGlDgWXMMqxHiwXWkeUfR8UTF/74GiFZ+V4x0qTLFLzhN
	 LhYHxIi732gz/wDTr7puy6zpNW29SrBvwvgqfnndBryAK5q89DrhhpjpoZl+PeAlEu
	 MOyAxWZhTlorvCOX2zgmV9FRuBNFtAmwgaLpOkXHVsTRsIY6BS4hFhl7RqPqdYUaoX
	 HyPVfb6Yurd7KO6eBmZLv9CjLiRzwbEm/t5bE8cyO3gTfTFdX6c1CzrCTM/bGKE1tu
	 32K/wZEp5R2Gg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D77940927;
	Fri, 23 Oct 2026 10:13:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2389849D
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 10:13:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 15342811C1
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 10:13:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lXmt4BuAQydl for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 10:13:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 33D32811AD
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=89.238.66.15
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792750395;
 b=TyTttDP2NFt1MuJtYtSe4hfL0mBmldsDGnt4yDRLGuzQTCNg3pOVBS0kp/wVvBFFyRws
 ReJbt0ry93awsgSgnXUOBEBhdm+uTnC1dJL7zJsDUTggaxaGZHF9kDabBTsQs5tcazquJ
 Y1wtP5J9QSDp9u/7Eb9hZ4qX15BN5RyynkZjIE/d82G5G2VBSpMEeNdHEQ9fmW2otavYX
 5tp1/hxKVj/G+DCIWC0f+/WKBvcEfj91ULsFOsbFjcpAka6PBvmn14+mUThwf3NZ+rCN0
 PFuiaHy+HP2+Ztz7IPXwuXYuVwrr5Bb8+IRvVVmdQjK9UtPUqBB10TnNbftqqA6Sqww==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792750395;
 h=Received-SPF:DKIM-Signature:Received:Date:From:To:Subject:Message-ID:
 MIME-Version:Content-Type:Content-Disposition:X-Operating-System;
 bh=8xdwok6Vs/itktNB99y37411eZrIgiaVbgKE+cgDyPA=;
 b=IxIB2sosV83ZUB2C6k/fVemTBFUkez8dHuYF27vpLxo5mLatRRYfqSUVk8N5fv9ahQ3s
 IANQU21tJ3f5JIR4Y7sEymCTasTPNTu3CDpSxnX5b1Rj0zSlGvsZT/PVRl/pWdS1LxV+P
 ayNGM3+JxAlDJJitFABW69MVs/oUagAxVkXqym2bU20I1B30sInSq1r8TjjuYnsrq5WyA
 8JNxE7GkaZzh5VpYL3Yz31flb5RimiZZ/xBqrvsMfpd2wjBOKStOElS36u+lRrBYHJGQ5
 13bs1lHG321IiBb2tqW22jryFmSuQEZK0XVB18+hP7W+3NY0S0pCxfdpgvYR+6LiXKQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=none header.from=openadk.org;
 arc=none smtp.remote-ip=89.238.66.15
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=openadk.org
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 33D32811AD
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 10:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=openadk.org; s=2022;
 t=1792750392; bh=rDLB7DMsvNNLHNmjEH5kQDWOdd3kr94fbutCN0A3JRE=;
 h=Date:From:To:Subject:From;
 b=QgyQMNe83w94cJD2/hGMeshp4ZdzTEdVYIQ+tBU6bguCZYqnGbT/FOtihxZcQWuXJ
 FRhFCGTAPOVShsPFDjs31PhsfrdqP7/u9LzVO6/H6NJ88b7SaR3c78gH7zFIzaUjAI
 ex3jy81QkTdPt81HZilg2qqEtaiMb0qgetkA/pt1ClYMTveT1XZJJ6Eu03coj+2mIj
 ksIWPU1P9ZwjDCAejGOYE6S1J5gVVdrNIfBFpYEtQK9VB5DVOhq8g2OiczNFc+lObv
 +W+rAsoRi805t4o3ZkkYncNayt799b8k81HHR2sh8qxx+MknEhbAP35rhx9NUrvzSm
 Qyy/MhGHN6g4Q==
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 6F0A731E0B1A; Fri, 23 Oct 2026 12:13:12 +0200 (CEST)
Date: Fri, 23 Oct 2026 12:13:12 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <atszOGixD1EGrTxG@waldemar-brodkorb.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 6.12.107+deb13-amd64 x86_64
Subject: [Buildroot] [PATCH 1/2] package/chawan: add arch mapping for
 BR2_i386
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

chawan architectures are different to Buildroot ones, so
add another mapping for f.e. i686 toolchain.

Fixes:
 - https://autobuild.buildroot.org/results/16888bbe55bc290733c79a8cdd0517f5f4df2a30

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/chawan/chawan.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/chawan/chawan.mk b/package/chawan/chawan.mk
index 9f36d300e6..cfaad13ac5 100644
--- a/package/chawan/chawan.mk
+++ b/package/chawan/chawan.mk
@@ -14,6 +14,8 @@ CHAWAN_DEPENDENCIES = brotli host-nim libssh2 openssl
 
 ifeq ($(BR2_aarch64),y)
 CHAWAN_TARGET_ARCH = arm64
+else ifeq ($(BR2_i386),y)
+CHAWAN_TARGET_ARCH = i386
 else ifeq ($(BR2_x86_64),y)
 CHAWAN_TARGET_ARCH = amd64
 else
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
