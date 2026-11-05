Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04312606A328
	for <buildroot@archiver.kernel.org>; Thu,  5 Nov 2026 21:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=sJk0Mt9o;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=n1eo3Rba
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB639408DE;
	Thu,  5 Nov 2026 21:54:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ME4rbf2JNDiO; Thu,  5 Nov 2026 21:54:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C7060408E3
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793915688;
	b=Govy93YxmgmvgbQ3G3qSoiTJiFjrNxaW5mPoXwIXvIhSRhF2W17ClEkDNxuF1N0jjULT
	 U0V/DwodjDRf/eNp1JWEZiJZ2xwVicKS+B7JZzRpEVTMrr7FAzPrOu5bHrmNpWbwjJr79
	 q4s0P0AjnexqP0HZdT4imV1XgjY6a0j0Vw12LiQUnp7HZWS4c/2lVbO2Odu5g2/FTTvyj
	 cwMMGMtLQcSDkPegCW8A2m03uA/v0/T5ArRnoIA9gm5RvQG3iNQOLSEo831DCV62id5HJ
	 J4sPk/5sv1zDh82nkqdCQdte85ZjhCGBb1tz2gHAvgXhfnE3adtrATF1J234KQvM3FQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793915688;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Rr/+ds0mJQIeHoBQj2iLELhYo0s9C0eZ8k42RNi1OvY=;
	b=l9jRCfkrxFMyYs9bBJp5wdQ4K+Ada/frUJJC8YrmsYrwBXod09OArAiHY3F2Wq5YLHbC
	 rGWgtn7Q7ejC1kCVeHq8r4XRAhTYaTbApIGegPMXTonu5lo6xSdy3OwvdM2z4RUCDvS7M
	 dJycSHTDgZoyGcMEcCwUOeoy3ovXs0N2+MXEwnI/1CS+5iha2tn4pL9QXKg7FJu3gVHoQ
	 25a4kEdZPA/HRwK2fDqSAxb+yDFZgNTXnTGNTQVMjOTDHpa4rmxK+wUvFVVm1izKiwHFw
	 HGhj/XjgrU9aaW9i12tmNpjeN0BVFoirGatrvBItCfM0SFbu4o7iIwYTNCdHUq7XAlg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793915688;
	bh=Rr/+ds0mJQIeHoBQj2iLELhYo0s9C0eZ8k42RNi1OvY=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=sJk0Mt9ofblTeYrBweyDatv3xAAErrEq5wcxmx3hrOkCXykwP3Kjx7IcBwQ9yCz6y
	 AExkRp0fDGtnknsoozb2xvV6INKwY/cesQ5ucdghL6IReQAjqeqKFw2ZJFW80C2wdU
	 6HloXJA/aJxa/GmJgeM6ZTfesCWMcH0lJEwUuXHpppOshQNQ3aTAmlEJ6ARPfLv22l
	 URSHZ9vCPRV3f/ix9ZIxjQbCBb4vkOukjXBzRLSmom0tlmsJrTfbLESHKUQzRj3E6s
	 IYxLlE9G+rOqtVRr4IUG2SkFxPXkC5XToNA8P8zaq2SKvZ0n9O1yWBHaJ4c+hP9dvn
	 i737HCTS0Ci3w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C7060408E3;
	Thu,  5 Nov 2026 21:54:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 59999B7E
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 21:54:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3F6D46085F
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 21:54:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Nc12EC5UbhE5 for <buildroot@buildroot.org>;
 Thu,  5 Nov 2026 21:54:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B0BDA6085B
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=n1eo3Rba
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B0BDA6085B
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 21:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1793915680;
 bh=fLrVUdIl5njQKN5ELe7oFDiVi2P7E6pTLA0S3LBVX6I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=n1eo3RbaPTGngxPbYDFyvljNMSstbFOIaOCV2v+kQW7BR898G9y56EN/iqp+SGzk/
 6m8nMkF5JM03oCFWc3CXrd6fZaUV6PU+FD/tWtyT5W1CNhgvsj/PzfgDSgnssbxraK
 dgypdo3pLsopXoInR6PiolXFy1xnNSGK0ZN/uftgj1SmUCy7WQrHbBYsSRObp0RC5r
 c7W/BUIf2ZZzRHjz/UyFKOqHpSuM1WHWmzRwEE1uFtgRJxAuBcei/ZGplKDuKV0cUu
 EJurQy2ARADFnE4QhmGAYxYtkCuIoc07oCZUPS5UE83ZVZex1oSm5uW9YWw3U37n1r
 EFurOovlgHjXg==
X-KAS-Sym: v3:f51bdf72230551df:oBFdRS2G8zfHBKRj6bG8Ba8AHJg7PXKupIQoU300YtD6J
 tzNbxyL69nUvBs0dh9dS989O1obLAFF6Hdf4ZLvvNkOyCHBtxzmxbHsHJBRDGOBayWkDMwH9NDD
 LQePK7osGqt2/g/FFH5/ja14WOBlEiEsA65gV8U/TFcLU/BUSQIV5BGXWlamtlPQFlpjMtWmzeN
 hO4BFtEMIEZ9r0iQ7LMNU5Z2+bNVKkVtYsbJxkV5wyr6okmE94aIwxIuLG+ZI4v+xmGRMuJdvmn
 pPNBFV2kRJ65+8CckieQVnIGJcS8hhT5jSeM+ux2U5EJdmruwawqxEhHVVwh5kCcKPfGu7DQ==:
 V0etQtcVn8tqYPgyLnURtpMjtTsVXdrdPg7CpVsMqLW/5P9eBZwcBdjmQ4R5SSVKPpAasEYpcJl
 B1g2ON5HrNOTLr8jxC3lF/L8r3z9yJE76K1bt5uM0cg3tH4R1CWAKzEBwP3C4D2LrsdZzVaRKmQ
 xTJdi9JbXqaEMJnCtOcyeUdO1iaZuYUdMmS2d3PnjKkGMr2iJc9PItzCeQHSCvUhwBhP8fjItfG
 r0frJMRrIeN9w0mC2vNN06pCdbeeVpPVuvG/Ne2HaNSxSbifd6yofWwvXu1sVARlRPNstg3z0Wd
 E++JNKuGIraIOIhCD9tHXqSRgFf0jI9QAGhXofVT8qpTLvKfjT1MHZH82DXyqkcu49+3yb7dhXM
 3atGks4BuUro8r8FZWy2ebnBAWrgf7uY5ruwm/uKz0CSAg34io9NkqESiwuTip0mGGn0M93WFJy
 gkFjicCx4/TvnXMVSGHOOprCz0fkvhMdN5Et0yt/lThyNglRGvTFwCUEU87S83tYHITZpDQ7I1F
 3x4jt36/j6bjv/cmOOBOLBv0OtnibObDhX/i7/UnOgH9RI2Zy24LHFmgS/nQdHi013iVk3wnfe8
 RVTzhyLK
Received: from fli4l.lan.fli4l (p54a1b33d.dip0.t-ipconnect.de [84.161.179.61])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B16F8A4C38FF;
 Thu,  5 Nov 2026 22:54:40 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:36894)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xP5Ps-0000000041R-2NcJ;
 Thu, 05 Nov 2026 21:54:40 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu,  5 Nov 2026 22:54:39 +0100
Message-ID: <20261105215440.1613885-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261105215440.1613885-1-bernd@kuhls.net>
References: <20261105215440.1613885-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH 2/3] package/docker-engine: bump version to
 29.9.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

https://github.com/moby/moby/releases/tag/docker-v29.9.3

Fixes CVE-2026-116587, CVE-2026-116591, CVE-2026-115538,
CVE-2026-115539, GHSA-2fqp-xg6f-v7gj & GHSA-w26x-xg27-7qjc.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/docker-engine/docker-engine.hash | 2 +-
 package/docker-engine/docker-engine.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-engine/docker-engine.hash b/package/docker-engine/docker-engine.hash
index 6a4931a648..bfc184bb75 100644
--- a/package/docker-engine/docker-engine.hash
+++ b/package/docker-engine/docker-engine.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  d7ce182528eb4c182f3884a7a83b7652ffcbc59b21d3d302050564ff949a9689  docker-engine-29.9.2-go2.tar.gz
+sha256  cd6ce54e46ac19f5dd0b5226a9b292965ba542bc16bdf9edbbca946da8930b15  docker-engine-29.9.3-go2.tar.gz
 sha256  7c87873291f289713ac5df48b1f2010eb6963752bbd6b530416ab99fc37914a8  LICENSE
diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index c6edbaf6db..a8fa808032 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_ENGINE_VERSION = 29.9.2
+DOCKER_ENGINE_VERSION = 29.9.3
 DOCKER_ENGINE_SITE = $(call github,moby,moby,docker-v$(DOCKER_ENGINE_VERSION))
 
 DOCKER_ENGINE_LICENSE = Apache-2.0
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
