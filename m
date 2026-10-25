Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A658606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 12:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=h2DynauU
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 036D260F45;
	Sun, 25 Oct 2026 12:00:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 59t6AWrxTdPZ; Sun, 25 Oct 2026 12:00:22 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 95AAC60F38
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792929614;
	b=SUAXNeep0+vJCm1L/HqNsSzLSiJzk0sy1yJdtKFBoKtojuW5+uyOBM2lZo03TQ0GzzqI
	 wsnqlL2JXuzH4bjW8iI5VXpT5IJWmRMusuWcDYBpQiaiVlsiDqT2An0qq7KMK+dRoIJsu
	 Xceh9QfftF2QC65zjeUrcIprdDnOo9ohTUNJzU7l7YpUfeH5oM4idzBYaX2NXxhOifRDC
	 j3OkAF/MIwQdqgqWP/cQYzyH6fawMyS4vPep2gTguTy3K3xl+hMZWkyyj6BQfEY64Lnpu
	 R8XXRyjgrlr0TLtrFIQgxSiy/6qFHo2UUEFo3Q8nqg5JeMIrQ0zr+/PaMLMUwwiSM6g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792929614;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=HU/Yop0kzYYKRp17j2tND/TGoUERedHEaBuTurj9v/0=;
	b=jy/JQKwp/DmrdPn/uUs+suz3getoa/XlIzxzZ3+0Ac617OI0cp+enCjTsjBV5lgeJsUs
	 Pjz6SWULE4ZYv3nl5hlKdnUFDKjaf9Tv02ZVxEx6StaHMj/m4/V0m7J7mVS4NMo5/grcn
	 ykgmWVcI7mmVWwTQ4F6VpC7MrXwIeu4fDE3CpW12A41TCHHQw/9WSd0RW4AuANTbP8cgA
	 1GrHWLpmaFun2Pt6gQz37z+0QTxQZ01tpnGesHRD8Fl0qtnhtXUtf//souvbFZP6OZetP
	 Qt6cn4OrQdY1dmxq6efgAUur72M014P8NzvO2llfLxDEsY1qS65qcg8N4UJn9HmCOEQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792929614;
	bh=HU/Yop0kzYYKRp17j2tND/TGoUERedHEaBuTurj9v/0=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=h2DynauUHtDb9ZBqVEs4w4csw+pd8M5+l9otWxyfFiakRDNqGdb3OdS68XV0minOM
	 PNeeJ6i2pjShZmfDQOqk/ZcZJ7OzBvUtnfxlJtXh3ip/ZNt2M18BSBjZhsHRwsppq4
	 VCWDr+0oW2IV7pbsykRJdcXkOmp5Pnzm3ueqmoulWCCHlQgrwjZja1cuM4n/eRJs02
	 IWDPfg71PDWEOA2omG37FJ54cTzHUnxknIoxU+7YG1Yf41hSfGknOw5DV1kWPfE1+J
	 3uukMJMDTTBxoZVDof0yIYyGGUnFr5ZkVfG+NxzHkP1l0oRD4O0fBqek2TnY3qRK/2
	 5w4hgR7EgiW/A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 95AAC60F38;
	Sun, 25 Oct 2026 12:00:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3D35D356
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 12:00:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 23AA081701
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 12:00:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AG8b9qi-6jN6 for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 12:00:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 828AD81693
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792929603;
 b=M/ZdfvKQNwKWFtEV+S+JTkU40F+ZEs9wv3+d5vcywwnU6+Vbh2Fy+yvREfP/jRa2p3a9
 8A97+wM0dzmXKY4ko9iKW4HIETkdmE6lg2Tl7CH0o8lIlBxHnT86h0fidoLS1AOsE6HJi
 OJlafP6cywfKrZLMfLvLbrw3KieWzCQXxpBRcFhpURRbFW2+Vv9eTDoNtixEuh1fl28Vm
 iyShCicTcvkYijCPnVGZ0C8x8o0Bv6wnbFxp8obi+3xvf5X3V9Wg/xpKdsBlddRHi0vgf
 Qo4UmT4KMhd1Fhmyd6MwMno2si1BRs9ASzUoTqVmgKf42x+7lJxCZ53pfObws9NW83g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792929603;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=cqzYpXpCQCLvO2jUEfuNFquXJm6oX/beHaV7AvkgSJk=;
 b=YEMnzUGMKjrpE/vFrWj6yfCgQx4jYYdGDhqE6EbFpGiZbsfrWZTdNaj61iEFFOFTDHwl
 ifKqhBE1BYBkdVpYgxjR8VaQvPT9hMxF24tJMzIWS6EoSFVcJQYlsp8a8jQNFNxTKIFJp
 2PxuyREsgS4DlvTztVf9V2/ZdTAtrtDt6yxry6THSW9OzFx7FTMKv2jaykrrbwIM/bnmH
 Mw5dhfLVz5hmDkeLRha5/iHA4ijtXhu4WJxqsP57ahNuTMV8EVo7y5Yg5aK6cov4a+CjY
 kzeZlSxMxw7z0CQIQAJXFdPu+/Ei0HHttJyVeC9v7Jm+LAOAQp2EnFx6ofSDgDqZ4Wg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=R+S2Segn; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::14"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 828AD81693
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 12:00:02 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 8634A5FFA3;
 Sun, 25 Oct 2026 12:59:59 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Sun, 25 Oct 2026 12:59:59 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sun, 25 Oct 2026 12:59:59 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261024190415.2070548-1-james.hilliard1@gmail.com>
References: <20261024190415.2070548-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <1824726be3cf420d4f21f40d3fabf117@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/python-wcwidth: bump to version
 0.9.4
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 24/10/2026 21:04, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
