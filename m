Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B54A606A327
	for <buildroot@archiver.kernel.org>; Mon, 26 Oct 2026 20:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=PmZNjvIS
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E7E73809C1;
	Mon, 26 Oct 2026 20:23:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9Ywo6Cm0fmVg; Mon, 26 Oct 2026 20:23:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 191C380993
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793046229;
	b=pR853MX4j5TPBx8fcB/RcZtBwXgrKVAjMBy4kwzX5PFZnSEhstx+ZdLzxvD1HlUHeGvu
	 5jAY2834tSs/NwkNr3n7wcmT1a/TMZFsqCtEReALYWCADs6FpDQHGRMh9A8VUab5MYLez
	 9Ytp/gt53wMWf1cOyX0tqeXd/USMuZ7L20iQyykXwhAcb2ds2ho6jEw5njCt3qC3RiqG7
	 SIowonr4zXodWTw8crEGtKA98/g2fN0qfaXA80HHAv7nyiF4F5E9jnJGzj/7SVQN78Zif
	 EFsNvm6vPpJ1A+pcpZPBvrc3vfBFYPKRWE5aBKm8gDDDlh6hXM+TlNJfiT+EvCalQ9w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793046229;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=RYjps+o9f8mcifBTlwc/dlljvpXi2atJcO8DVnElRq8=;
	b=WZgQh9jF8QOrid0DNQsLr1IywjYgEmvyiTAMomyaedWnK26u/f0dKbTpxW5P9jL8xmIZ
	 2OUJ4lCNZM+eRtAFBQKukuxy8F4iNvLmHckgMxTLy8mrDxjbi0fsB61s/W6E8BgiqVob6
	 mHB6QKLbou8OrxRloA8EMBIsxreTGSFLOa7/1RV6SfRyO+4GTqDl5yUaBwNBg4KxkYfM+
	 En4rn5M7B7K5eF/P4xlVUWEZGUcgMeXjH2daa/RXV9YqGN7IbyYcyVjINspoLaMKbho47
	 0PmzTKRMeV/FW7QMfukHy+MXFJfksjVMWDuFOnR9ZSf2SYcYCLltqD5tOKv/xqbmNfA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793046229;
	bh=RYjps+o9f8mcifBTlwc/dlljvpXi2atJcO8DVnElRq8=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=PmZNjvISJw0kliPQ0LwaRb58UX5AuRfD5NLCpsQNIixYMa7QM3em2FmqTWS9JEKjQ
	 si+vPmXVv5LgJ+be+E/KYlG3GeFC8avTpjC76sckCJUoSKOH7u8aOELodxt0OAfiHd
	 M10XQMQTt9/bNvPbeLR4Ebjd6RVEacnvESnfb4Dj2eAQaBK3BOhUKwihSh3AXON511
	 W8trW495LO8bn3VuK15GsEBHgdsqUeL/pz4r79NxHe0N5hSnRaKCVc5wlpmHIoUQA3
	 DEMbiucc0saebftqXFRWXr4Rlm1U8P68UWjuSk/TmjNlwHQyazLHWTacn+VwrG84cD
	 7A0qB50FN0lCA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 191C380993;
	Mon, 26 Oct 2026 20:23:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0A2474BC
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 20:23:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EFF1280993
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 20:23:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7bSiGB48fNsl for <buildroot@buildroot.org>;
 Mon, 26 Oct 2026 20:23:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 0A5C980981
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793046226;
 b=q0ocgSmFsAbLlFvjPcpGDRHanzAdpaTzh+gzXdcQFRLwnF7RdzEJpUP94+3EIAXdTlVG
 N/FJ2/aCUmxT8aq9rxn/7UUhIsDICjiAejiv9vSmjC4xbvD/Rwh7fHr9o7EVapQIwKJdA
 cAlReWMN6OIp8h7OsViG3G1ak6B/gUjlHqvgMlpbYzq89urwpJPLZ5C+R/aIlMcjk6YML
 n0fD3gsiTMe49A945YnboioRCi+/59wsE1wmtnwTds2tDxtTOBXKQ2npMMg3TX+zcvcGK
 CSmqc6qjTuhWiH9GxJlYfjW19JTkM2RrzzziXXeRi2z2sqd1GMhWHxA/fQWhB9ebW7w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793046226;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=Am9gPSMI5UwwFpCVWWnzE/1P8lp8YY1ReaUI6D6kcTw=;
 b=Btodlf9Rk6pUZA8zBbdZajcBRyrHUvNJNLazsJWKgOaFDmqYd9vv7jvgVnWMJzpR8+4H
 NScc6JKog4beAzJDnFxOjI/Kk74WNR2WSl6DK8W4tZAKhEw4ZH8YSDFXCt++bBY4oCtIF
 s9GUnL5mUMNbCFHmJ3s2TAJXn56aQVY9PmiV5lnomUdPrUqJoMJZMwiQ+F6+gasFdJp5Y
 BEPtGBxrdY69koFfAW9IRcCHZCq7aBGuEaWQq36m3di8XdOb4IphQ/3BUhBOMP0dhWQKz
 AW39hlINehRK0zSa/fQovLr4FZK/EFssnvh8pMn8sTXF5WRcz0fGUFJyRvLr5utw1+g==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b="TrgmN5/N"; 
 arc=none smtp.remote-ip=212.27.42.2
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0A5C980981
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 20:23:45 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 828D72003C8;
 Mon, 26 Oct 2026 21:23:42 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Mon, 26 Oct 2026 21:23:42 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Mon, 26 Oct 2026 21:23:42 +0100
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261026114017.1124466-1-yegorslists@googlemail.com>
References: <20261026114017.1124466-1-yegorslists@googlemail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <a02431ef3187cc29626609f92b261cc1@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/libxmlb: bump version to 0.3.29
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
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 26/10/2026 12:40, Yegor Yefremov via buildroot wrote:
> Release notes:
> https://github.com/hughsie/libxmlb/releases/tag/0.3.28
> https://github.com/hughsie/libxmlb/releases/tag/0.3.29
> 
> These releases bring query speedups and fixes for reloading a silo.
> 
> The zstd option no longer accepts the deprecated true/false values,
> but we already use enabled/disabled.
> 
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
