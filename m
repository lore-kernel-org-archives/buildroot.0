Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6CD3C61DBD
	for <buildroot@archiver.kernel.org>; Fri, 28 Aug 2026 09:35:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63D596070F;
	Fri, 28 Aug 2026 09:35:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3LD-Moae0HXI; Fri, 28 Aug 2026 09:35:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787909732;
	bh=Vh04I6xNu2WR/MAknlvhFrTivGQwWdsNWiRy5sAdSmI=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=pD0NTBiY05Pno4URVKFgXJJ3I8Fu2G4UKO/GhQdPfY7/upC0kPUFRfScBSBrnETRh
	 JVYHxfibo1iwkSF4Sh83JEHj/T5HeuO8tuFjLiUI1HVJruGJSfkprNbSc2UUQRmf2Q
	 1HJeDz9sXgLnilXdTuT15q6wTTqKWLneZYm3C6OhdPIQHCosPXwgg1VlFLEW8+6N47
	 MNafGeSjxZUkzDfZSHYuiKMkDa1YUqntFDes2RIMNbzqQ5ShOIjuKWcP1/ImwuJBL6
	 pHdBfduXl2YX0vHjfErr45aMoTDT8SgWwkDmseo4mlQSxQR12cdP3lO6Gtm7PrXZ/o
	 OFw5vzdioZ5IQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8936D606CB;
	Fri, 28 Aug 2026 09:35:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id BA74023E
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 09:35:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A0F9F80EA3
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 09:35:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8y0yjQAk2Rf1 for <buildroot@buildroot.org>;
 Fri, 28 Aug 2026 09:35:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 93A5680EA2
 for <buildroot@buildroot.org>; Fri, 28 Aug 2026 09:35:29 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 84E8060134;
 Fri, 28 Aug 2026 11:35:26 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 28 Aug 2026 11:35:26 +0200
MIME-Version: 1.0
Date: Fri, 28 Aug 2026 11:35:26 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260827081626.1018466-1-thomas.petazzoni@bootlin.com>
References: <20260827081626.1018466-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.18
Message-ID: <a133e2db4d8f6dc6405a1907705a07aa@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH v2] package/fluidsynth: fix
 download-while-configure since 2.5.7 bump
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 27/08/2026 10:16, Thomas Petazzoni via buildroot wrote:
> Since commit
> 566bdcb97f5706aa08f40a88e4728e4a0bed8257 ("package/fluidsynth:
> security bump to version 2.5.7"), fluidsynth tries to download some
> "gcem" code during its configure step, which not only violates
> Buildroot's policies, but also breaks the build if network is not
> available during the build.
> 
> To fix this, we add an EXTRA_DOWNLOADS to grab gcem and extract it at
> the right place. Some minor fix (submitted upstream) is needed to
> ensure the FindGCEM.cmake logic properly finds that gcem is already in
> the source tree.
> 
> Fixes:
> 
>   
> https://autobuild.buildroot.net/results/048df28f6ab97a16731e62d7f56c6eba565cda63/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks for catching this issue!

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
