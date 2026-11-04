Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1272C606A31B
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 17:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=TmyCTvNG
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D93D980BE0;
	Wed,  4 Nov 2026 17:24:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n266YCfn7uR4; Wed,  4 Nov 2026 17:24:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 145C680BBD
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793813050;
	b=NAIO8R49qDsPVvpms9bUQcuE3p9bb8U2PPSPqDoRBQKz09cRFJCBVxtxEenRDUaJ5NnX
	 5PCeev+FmVKuxw5+KJkca6gQL8cx4munpHckN++upAEbIptCnDVW1oBAKbCTmr3/Kb9m1
	 yUlIC0vQSvrZ6oOD+ATzcDpU5tSdZS62xt6gUWmEICmI1pyVrvuoFTtp2dJ2iuhGjd0lR
	 0JzU1rAGQVyPzKdpOhj7tGKvhHFKWOWynFknMroKm//6zMOwTEmjLQpn4bgVEYgobnF3E
	 XJ44HpzJiGNEvyHbDfcxVmXxXLzRE2nZow1yyDpfhBrqeq+A5GDiBpI9Kq+AvzuCGtg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793813050;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=Rn9sN3G5oaDvO/UsqvMJ0W0BscBC/mTuFRl7vo1AYMw=;
	b=bFZ3E0HrsT0FMkuIV5LucbVzK8Z8TNp6Utxs5kkN9MMQxzuaqsNtC+Hai8T/Wdd9OO98
	 WzNappsHVPSRJRPUqzLu+iKn++F3V8psrm1lO8XDT/3ZlpkHMulK60hIK1bZwk/LUkenO
	 dSNK7ZE4rgFHpf3SMWm6lgikcUWCzOQrWinXIdv8tOJJ5tBlzyvYZSKp51CSHP505I4vy
	 7ilXvCxSRlM1SL25bW3WxDpe2RiS6cetjcEnfeBoTlTVpyOj9xC71vCQTm7KfgEiSyxrP
	 MmGiZJXTuggsQ8NMPrLAIaDJ4D1PBXbhJc2om9f/IutmbwCT+tCA/yGQk8DvvhH3irA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793813050;
	bh=Rn9sN3G5oaDvO/UsqvMJ0W0BscBC/mTuFRl7vo1AYMw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=TmyCTvNGXXivXb3p9DPHNxtoOPF6SfwDmoAyCUG+jWIsCDZaZa8F6xH71ZqNP7RVO
	 vpDyhv33qXuFBLMjeh5EzRAYuL6Ob4xOKzbqT/GtaWbbZZSEpDFaO84CLFzhDXD8Ms
	 TgqfG3xFcWf3zLTixD2qwgmuTB8/Zic6t5LJxlXbiWrLWAkCkqYWrMwiKhqac2MZA6
	 Z6esjTv5ak/n3t38J9E7BtS0jIQ1X89K4BvODh3/O2/Ab2KrQemkBjGzq9M4YSCNv6
	 61PKztAQsTbenkyP5VdFoAPAJ31S5Wmp4M/vQmze5cJXhTOfBK90NynI7CV06+l+2D
	 31RKk6ozQYeyg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 145C680BBD;
	Wed,  4 Nov 2026 17:24:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C06FFA10
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 17:24:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B15EE40211
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 17:24:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l9r_g6Spwv0i for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 17:24:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org BAC2F40062
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BAC2F40062
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 17:24:07 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.4])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 7305A60134;
 Wed,  4 Nov 2026 18:24:03 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Wed, 04 Nov 2026 18:24:03 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Wed, 04 Nov 2026 18:24:03 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Mikhail Boiko <mikhailboiko85@gmail.com>
In-Reply-To: <20261103070457.5964-1-bernd@kuhls.net>
References: <20261103070457.5964-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.20
Message-ID: <584aa713717886bf5b2f218b69016b90@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/libfribidi: security bump
 version to 1.0.18
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
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 03/11/2026 08:04, Bernd Kuhls wrote:
> https://github.com/fribidi/fribidi/releases/tag/v1.0.18
> 
> This release contains "Security and robustness fixes".
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
