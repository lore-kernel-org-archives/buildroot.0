Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42EF4606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 10:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=AiYqr8Lj;
	dkim=temperror header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256 header.s=2022 header.b=Gu+pg3G2
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 19E9C811DC;
	Fri, 23 Oct 2026 10:14:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5XjZY96dZFym; Fri, 23 Oct 2026 10:14:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 24F8C80EE8
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792750450;
	b=sAF3mWKbFCnS/XOatsz4ozR+CXtx9Tb48VwQNY+fR9nFDCfkgmwgsNcNQGTY7F6GkD04
	 7tbx2nVQ+rG+eSdpH9wHPvtpDwr5y+h7D/t7+iLIxE9MUoUXM1h/Vu+SMp77t1LUk7Jxd
	 48DAMa2dj4CWKlVWzU6sj7QssB5ExKDOAoNHWp90YGst2Dz2gJ+jGral9V58K+TLTEdUs
	 mDtPwaepecuImT5GUA/ulhi1mFbjqDjFnRa33V5lh2smooxt2Oar7d4GNDEY7kXpaZuw9
	 zY4eUqYMDV5xiVHC+gwAUcKtsBasZQ6zFhAgDyjNagORLSmPlRrwndTgwV6WtnX3Wmw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792750450;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:Received:Date:From:To:Message-ID:MIME-Version:
	 Content-Disposition:X-Operating-System:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=1wXmKNKabUrqr8j1IGhhvGG/QD9KJCcn6ZUYOYn1r8Y=;
	b=cBLwYb0zb2tsxyLmAdolSUO9mV9Z17HAenhnuOx6juAANzSbrT8rpjfIfWdNaJdc4G+u
	 SZPLBg/HeeMuAZKHrvC3kRapTZcCsLqSm+5YmzTkK6Lj3v+S28MOVtr2S9c47G3KHyPXQ
	 517pwYAqCyOC6x8u+ToyLyZdTftGGNSzDufkaBX7L5cn7mYTPD52Af3S0DH7bLu5OW5gi
	 52gMlxNlFL2eg3bnFCx1Q3ccRfYE5qrwRDrFaoQXiT/gAWkUT9XwCbIpO+0L2QkWEWK/Z
	 +niorI8l4Uf/Y5+FErmK8/wCxYlnMnFeiCWI3e10VdLaS+GuD0uom7guCG7uzXjYsNg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	dmarc=none header.from=openadk.org;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792750450;
	bh=1wXmKNKabUrqr8j1IGhhvGG/QD9KJCcn6ZUYOYn1r8Y=;
	h=Date:From:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=AiYqr8LjI/ZZm21f7/bPcw3S622VT8vSwy0NVpk0D/ce7jVcWV46Ksz9oZGM3fcV4
	 iX/LTy+IaCKfhLd6UfCsakQlt3tyFJHPLRn2eqirDB/LA56+Cu8IHsy/AQEV6JLPdL
	 v2cMchSgz3HxGJbeXJv5DNk2f93G1xe3QmRB+84KIskd5jm87vWt99lleZCeNZTKTx
	 sfAtzuTZqF588R5Q1oOyV+EbfP8YGncIn+7mHRCgqMaqvjzK7QUvWWmKPHtYF2dpml
	 AP0XsFM+ezOjLy4Rpood+peMbazSiDoMgnISb/acjIanYUMrs9eRQKXqr23X+yNzPc
	 yShWBM5PZh04Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 24F8C80EE8;
	Fri, 23 Oct 2026 10:14:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 857AC49D
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 10:14:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6B9A580D8B
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 10:14:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zouvZkX97Eqt for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 10:14:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7971780D49
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=89.238.66.15
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792750447;
 b=cxvaNNdFGRL6NBEPE6z3fTi0AKlqX+PcWKbFsPoAEUmo3x9l0ZsqQwgaEy2YBGOmKevM
 BxcKy9gZWxQfNkhNEbSjdKXjoJJSxKBMhAQR9/u4GrzC7Re7R+Jjj33Mw8kYIsimqh3J2
 a9dCGghE39mclGL52dTyrAesaTOYUxxbwgrYBJdsVtn9xkp/utY41gjVhxZJeGVI0QGij
 DqBFZC+DRQyTW4yAkpagfiRus/ZchUMnFsxt4SRgLdSypLW3XScIJFl8LhFLn8bTNUgFw
 /TZf4rfaNMkfdv0KPb59SI2wA4fvoiLXCBIlqezXErGo1JlzMRLhszcoMCbcBrdTLTQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792750447;
 h=Received-SPF:DKIM-Signature:Received:Date:From:To:Subject:Message-ID:
 MIME-Version:Content-Type:Content-Disposition:X-Operating-System;
 bh=TxsMBFY797SG0CMokKTcTNvhqHG6Klmf6BmZJ+WqsLE=;
 b=H9Roo67vVJpOMJzAYEsOgGY3UeIbwVrurlj1VlTvEoBcYIlp00knYHk/YB/YR+5v7viq
 HVS7c9GsJKoD5SxO96h3V3p8wSkq3v/IyXfjYwdYKVBdHYXrQ8ZMJiye8X2b4znWQjVE+
 38sFbBPkK0jUPRtM1fWAjkERiyowEGHbvvEnYHNkZv2BLvjuDg9FLPO6jtiuSG7xrAzhl
 Lv2uFsQRoWJKjFp8+ldhYqmIBE6rP0e5X4zqV0AWbmyy8LhNyD9+dQqVY9JUSYfXtRnoj
 sJ2Gqu2qT3wLjgnlM6NqL7RXNtjywPnMCGjfk9jUvnHj0V9iEYayuitplbMxfwb4RIA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=none header.from=openadk.org;
 arc=none smtp.remote-ip=89.238.66.15
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none) header.from=openadk.org
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7971780D49
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 10:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=openadk.org; s=2022;
 t=1792750445; bh=vdEkoz2f2sZTmyqcN+ToA35cEhChsNynxVgIG6X2cKo=;
 h=Date:From:To:Subject:From;
 b=Gu+pg3G2k3r2WrS5hY6UT/R7tUIsDGcBDcyM5haEnt3V2/FGXl0OR6udaU8ohF9wA
 ZyRVxQZ/TOmw6Mi7h3zqB/6vcflUopuOJDiBSNLJ57ZEVRC+YXIglLjfnJOKRhjDdg
 pJ3Ov0il/FkAWDgCmppEPOCk8F3y1V7fYWXs3LBB1laXEIQJWbzAtezpSmrh7QgkPH
 wQ2fK+l/vqSiG3j8Ur9FzXp9IuCuXcVGu3G+hm2gtajl135iTEMiOpGoERN6BwXB95
 lYF4ax0QEhCX5pUz1KrobpRVla8JZDy0iaO+5JXHUEcV44xNRL++I25IWGCbKKKY3Y
 97J2m+nNpgnSQ==
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 01CD031E0B1A; Fri, 23 Oct 2026 12:14:04 +0200 (CEST)
Date: Fri, 23 Oct 2026 12:14:04 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <atszbCAPmBF48hYm@waldemar-brodkorb.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 6.12.107+deb13-amd64 x86_64
Subject: [Buildroot] [PATCH 2/2] package/chawan: add arch mapping for
 BR2_powerpc64le
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

chawan architectures are different to Buildroot ones, so
add another mapping for powerpc64le toolchain.

Fixes:
 - https://autobuild.buildroot.org/results/553aca94416bcafabfe23d34d6907bdb9ebb84c3

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/chawan/chawan.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/chawan/chawan.mk b/package/chawan/chawan.mk
index cfaad13ac5..bef4816af8 100644
--- a/package/chawan/chawan.mk
+++ b/package/chawan/chawan.mk
@@ -16,6 +16,8 @@ ifeq ($(BR2_aarch64),y)
 CHAWAN_TARGET_ARCH = arm64
 else ifeq ($(BR2_i386),y)
 CHAWAN_TARGET_ARCH = i386
+else ifeq ($(BR2_powerpc64le),y)
+CHAWAN_TARGET_ARCH = powerpc64el
 else ifeq ($(BR2_x86_64),y)
 CHAWAN_TARGET_ARCH = amd64
 else
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
