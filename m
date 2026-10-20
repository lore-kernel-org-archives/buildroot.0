Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3AD0606A322
	for <buildroot@archiver.kernel.org>; Tue, 20 Oct 2026 21:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=StnwR/It
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B946E80CE8;
	Tue, 20 Oct 2026 21:18:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iRWC-68NQOUH; Tue, 20 Oct 2026 21:18:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org BDA5080DE3
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792531092;
	b=Ksec3OGP2BVmnaYXWzb8t6QXCBhKUEQPURZaHtZb1MBe/xIToQG/aa8NsvL0uE/nY5JK
	 J1x52WFfPFvH0QWcSv7I36vBIkKc4f9X+mD96dEDqkm7oXxTxXZbdRwl0gPeTXM4DLvVs
	 D/+hGf5yWkO0JTWPvCC1pvlEqMx/pJbD1L02Rvm/maAOdDxbQ4qbh7C/kZEFwaH8cqMCy
	 fECZV2m3m6eXr5iJrCv01BHqs++pcTZWLwrwdpAdpp7dfsxmRYpjBZDU5ZbA9Gy/gtpWh
	 tKa3iqK+0YjXLwuBWpnuP54W/neYTG+ghrwHhZFZQ71WlZg9HWe9I4B8/hdgVpwN2IA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792531092;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=s4+h/n117fxWu1MqTtzHuV6cgvL5naNWVD2Z3DbHJU4=;
	b=OV04r2SauEqo+z/2xkdUx0TWqKJn36mj3uPR5pORbu6yIqSHj5+c4vRQCl4E1qsgW/io
	 QhfgMA+xqPFgePMnnl0IrTh8NhFBGOlDzyWeaVm0sRx8oCbiPtsyvoonFMRZQY6iA4jSR
	 RS/dnDXSFVSOCwHKmTPwCHd7Th404LM2QbFO2sOeNNAKeUUkNcwkONw1szMJXdIP1RLeD
	 2Znslmx1U7EOH+z7Ovr9KHtT8Yupp3+qN++z7z9KQCWBYD9sA88sdDf4hjviQ28vcmA0i
	 bZ1xTj+nF/dxmv1wUm5QLf4yXqkpOBmjejeeI0ttK+fg8I2WYH7/gNZvuLKZgf63n7w==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792531092;
	bh=s4+h/n117fxWu1MqTtzHuV6cgvL5naNWVD2Z3DbHJU4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=StnwR/IteSrlkWfh5ecCdTG+iS+puqoMVQm933VKveucBAytLL8rBfq2gtFDQzEN/
	 C/xlg9hmX80DbX2Zw94p6ONdXs7wdyOZGBmW4C+YyBhrDEJQTSpEbLJfNlfSP2Fi9T
	 6oJGtmoU2xK2lcRko6IBHGdWJgz+S3EwlECGeYC47qdaVhGGGaBcDYjbqPFUl2YKlv
	 OuaIS/sJklu4teiMLrDAit8/6sHGgFQ4Aenp7V5u9d81q0g95kJ8PoNs505KYYfnP2
	 MZm3mc/DQDMv6RsYgGeS1S7EO7PI/XTJFgYzFnjkW7wU8TCAwzJo7evzwJ++akBAhb
	 KeiagPss61keA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BDA5080DE3;
	Tue, 20 Oct 2026 21:18:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 660763A8
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 21:18:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4C443407BC
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 21:18:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OG48qd2AY5cK for <buildroot@buildroot.org>;
 Tue, 20 Oct 2026 21:18:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 7F393407C1
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792531090;
 b=LX0UAOerpQwSRGJywctyGHsdzpITe9aBXJXiFDI0YG/2O0frU1xYFeqWeEkr2VU7rllg
 W/tJkGbZ8eUo9eGNQnf/4Dq9MPCeHto2yVyGo/7el1yocuK+XXnJDmjIs9cFlHc7bED19
 6cXhTHOXxA9a6/kMsLI0T9FMZ2Xf+rnNLSU91Cqnu1RF2ZfKjyKg9yKX25hDmYZiETOwd
 ql3cdaB5r7Lfkijl9Xp55LGL9BkReoxy6izkCRQANxGMHK3qbBPXqtb5B1grrvFjrQX9c
 g6oCriabgv3eOjZCrB5ni66Pkpz8mehhGFQzmqmMgZTjwjLNtuc/amsQ8jBaKXO837g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792531090;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=WZYOyl1jcpOof/w050DfhQb90Aqj3WnMUep59EmgbjI=;
 b=eL0GmH/lgMIRhE5FTMIT2LOo961rYXUTVnfJu5Qv1xIYyWKSBZG72NHONSaIBdrHBlHZ
 gUd8tuNilgBKN3/vBcManMJRdtV/GHjgnBTAxLpbmGKFb479gUcLHvqrbW9tV7ilWukl0
 YgUo7lt3TtpbwvNkX2cYwgJVjN08ur3vSTm0wG5LtKTaQBVJyPvN12wyfsFtUiz3Z32XO
 jhPP7fSrmYRJ9dqMiHvhiTrf1PvU8eQkoJ7Yt5leu7eu6BSB+j/CsobD+94Y7d7TDUplQ
 IIl5W6qANHjJNMLP7sFzV/WIKf1JCZc38PnKAzVYtPo9EdYpqtMVIchChcl8y/Bhb5w==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7F393407C1
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 21:18:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E8EAB999AB; Tue, 20 Oct 2026 21:16:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 20 Oct 2026 23:03:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d6a3f70beeac58b7ac3748a0fd3ea0b2b79e1182
X-Git-Newrev: 84a940ebe1cca7c6df49062a8e9c250fe9221867
X-Patchwork-Hint: ignore
Message-Id: <20261020211645.E8EAB999AB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-golang.mk: use golang
 toolchain default GOPROXY
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/84a940ebe1cca7c6df49062a8e9c250fe9221867
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

This change sets the default GOPROXY value to match Go's built-in
default of "https://proxy.golang.org,direct" which provides several
benefits:

- Avoid package breakages due to missing module sources
- Better alignment with upstream Go toolchain defaults
- Faster downloads via the proxy compared to direct Git clones
- Maintains reproducible builds through Go's module checksum validation

The default value from the toolchain can be read with "go env GOPROXY"

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-golang.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
index ffd50adecc..26da7be71b 100644
--- a/package/pkg-golang.mk
+++ b/package/pkg-golang.mk
@@ -101,7 +101,7 @@ $(2)_POST_PATCH_HOOKS += $(2)_GEN_GOMOD
 $(2)_DOWNLOAD_POST_PROCESS = go
 $(2)_DL_ENV += \
 	$$(HOST_GO_COMMON_ENV) \
-	GOPROXY=direct \
+	GOPROXY="https://proxy.golang.org,direct" \
 	$$($(2)_GO_ENV)
 
 # If building in a sub directory, do the vendoring in there
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
