Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 357C2606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 13:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=NFnKJc6y
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F319480F39;
	Sun,  1 Nov 2026 13:52:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vr0BUeyFOBRW; Sun,  1 Nov 2026 13:52:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 0C96080F3A
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793541169;
	b=VVBBEiFpjbV7gnEdDlIDTw52NwPiEpqDzeFeyLPbE4GqOFaQ/N83OcdChjpZ0yJHmF0V
	 JgvwkcbouojVhkyOaPvBcMvQFS8tPaEZagYvLV7LxExzzl7ENtAw4gFjGUXUViWZZqpfr
	 LPjAE/oRB8n5PXejX0W0+TjgjovhCbR3Ohp1xr0IA6lX7chTTynIr682utkzHbIgZCpTy
	 dAV9D33LfMCdj97eehyuP0IqE2QwmtQ+w44ilcM+pUPhvp9q3R7IabrGWO6b7iYHlfG0n
	 M/LlffYtvpS82IAK3puHICVhEzXHhdLjpGoacAnjV2Jxu7JwkOBkOQezGP34ULuK/Vg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793541169;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=tdODx2sC06wOKnwLyT5MTF9FbGehzJkiztlrE4hNNls=;
	b=N6tX4je+NSUdloMj0zQPV8ryF1pgAMwmLfjQ6IaVtXUsWtwg6IwD9cWhDlskFyjejeCG
	 tSZP7LOTReyHABPCiH/jpVURCt2UajOjJItQVxsk6yTjfJDIkvNnvpjCxzQkYF/M7N+ba
	 ZtI0kAHsjivVXNassi765XcobpGuZHDoDAWZnQxc9NGAUoN8lZ8KqD7OL9TfRQFLXEUdz
	 j55nQePmZ3IxijbOAvZP0Euu7pNfsKSZtAV5GZQ+7yKbbmZkGNrnnIOdh1+EwiTKY3fPq
	 Ky9w1nYl37c/2lAHKdYjvSCqJ8VoVTYJhU9JMcpYXlT+418bqdzrqVOhgdDIoqvnX5g==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793541169;
	bh=tdODx2sC06wOKnwLyT5MTF9FbGehzJkiztlrE4hNNls=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=NFnKJc6yNfqE4Ks01HqQcim0DZclxTDHak3Qif0+iTOUwNucUuAy/Ja4R9xG0JFKE
	 WxfDfK/zFozL+F2n/1KgVI8RHt1pdSqkTncQP/Ggs6mdzsJSD0PTf/+PNgRmyObHaH
	 f68J4EVZ7L3e6uNcIBeAFosZWRaoNIAQVsAJSPHlf5TwMqfY7c4PxbxivKcLsoHFlE
	 GJ3IBL58LCKI+h4xVYnv8/fH8RApG9hG05BfPKgjFBNsV7bN+/6lRQuBSslEvHVFuY
	 R8qCrxRxEJzFCl7d9ASDUCSMQX4ktAb1tXXu+67fObocr5cvMrvEouTLsp6Zsh0frh
	 cCn6Uf9XHGixA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C96080F3A;
	Sun,  1 Nov 2026 13:52:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DB9ED156
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 13:52:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C1713405FF
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 13:52:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FE3oQQqsgHTJ for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 13:52:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org C94D4405D8
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793541165;
 b=Tqed+haPMt22+7C9dTRDWDhNTQxtGufnrFKCoopPuuprCjaYezISLNmL6vMmXP04PiBg
 QxPpCUn/8uFfmtodIPx3ZoeQ9H1qlVMAj3ZwFD+BuQ58yJYFJ/PgVipQh/tWxwn6V8RdF
 yqtZFVXxAOfk+agb1Y2cI5rw7K4xBriBvc8mSHCgt6RjMSMa8fBQLXeX+GdtC3gYvkoYJ
 6mmu5a8Wauz73Mvd7D029A8nK3XmyaVFmfkF89mLi6cGSTW23amo8U/XllZ3W+2LbONpR
 VDLUKxfBQYbIt9WD/iHRlwYpAxKzln9lMzuHTpVXo6KG3M2LKj8vrv+Gb6Seknkto9Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793541165;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=vbPWFuY8pFMmaKxR3XTPwMaTXz3n83QcnQhNpj2E6Rw=;
 b=ZXh2jpPB0kY+Q4XT8TIQBRAMKsrXnp2PH4nye9LUsUUcdOTQXVAN71aK4dgHUtCCvCxV
 WNyjJn7k5refPHDSlxIdW/59SExvAz7WPC3/ICdvuhz4t3kKGkBga/u9G1JghLLozQj0G
 xB+KaJWmo5tPNwUCS/Na4acxSK8iwIgaq/Iai3dFmAe31fjqz7Fqq/zC/XiAFw5286Hpc
 76YgYoCs9NZ2/EREqqtxW//M6CkEbrNFvwnnpqAZmcYRvCz5UiYZXFL/u5gZ/5lUwwUkL
 zjKrllyUew9SLHuctch//gPsGe0Hw3RZDISinvu81KDxW5MgNTOOJFkHuE7OCUbP6cg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C94D4405D8
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 13:52:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F2CFE9D460; Sun,  1 Nov 2026 13:51:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 1 Nov 2026 12:50:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 377dee2baf89d9b41c35097a3eb128761097f5ad
X-Git-Newrev: bdfb817b1c97da7835e7ec60e5bed962e1c4c3b5
X-Patchwork-Hint: ignore
Message-Id: <20261101135115.F2CFE9D460@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/docker-cli: Fix go module version
 information
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/bdfb817b1c97da7835e7ec60e5bed962e1c4c3b5
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Apply the same change from docker-engine to the docker-cli.

Docker's own build system (hack/make/.binary) uses "-mod=vendor
-modfile=vendor.mod" flags, which are crucial for preserving module
dependency information. Adding these flags makes the previous vendoring
workaround obsolete for modern Docker versions.

Patch downloaded from
https://github.com/home-assistant/buildroot/commit/dba1173fb4cfb39624621f328fd2811f50a34513

Signed-off-by: Stefan Agner <stefan@agner.ch>
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/docker-cli/docker-cli.mk | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/package/docker-cli/docker-cli.mk b/package/docker-cli/docker-cli.mk
index 8ca74af7d0..216cf70b95 100644
--- a/package/docker-cli/docker-cli.mk
+++ b/package/docker-cli/docker-cli.mk
@@ -17,6 +17,7 @@ DOCKER_CLI_CPE_ID_PRODUCT = docker
 
 DOCKER_CLI_TAGS = autogen
 DOCKER_CLI_BUILD_TARGETS = cmd/docker
+DOCKER_CLI_BUILD_OPTS += -mod=vendor -modfile=vendor.mod
 DOCKER_CLI_GOMOD = github.com/docker/cli
 
 DOCKER_CLI_LDFLAGS = \
@@ -29,13 +30,4 @@ DOCKER_CLI_TAGS += osusergo netgo
 DOCKER_CLI_GO_ENV = CGO_ENABLED=no
 endif
 
-# create the go.mod file with language version go1.19
-# remove the conflicting vendor/modules.txt
-# https://github.com/moby/moby/issues/44618#issuecomment-1343565705
-define DOCKER_CLI_FIX_VENDORING
-	printf "module $(DOCKER_CLI_GOMOD)\n\ngo 1.19\n" > $(@D)/go.mod
-	rm -f $(@D)/vendor/modules.txt
-endef
-DOCKER_CLI_POST_EXTRACT_HOOKS += DOCKER_CLI_FIX_VENDORING
-
 $(eval $(golang-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
