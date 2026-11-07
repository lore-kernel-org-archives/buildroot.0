Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE8E606A32C
	for <buildroot@archiver.kernel.org>; Sat,  7 Nov 2026 11:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=gYkUdc4w
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BCE934078D;
	Sat,  7 Nov 2026 11:03:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UY5yfkP5waHa; Sat,  7 Nov 2026 11:03:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org EE43D40786
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794049400;
	b=oYpuYC/UGlUfAQ5xU3WIFE8ZeoiJ520bVwF48ZHpU/bsvHYEpUJfMXLQlxvdCI0Wmwcv
	 VNUGloCUtP1rWVWywutbB7kfuX7y3CVNMjRnElVUVWDv2gBGz5V1C5R6cWVrYUCoawbdC
	 aJOysou4vzYNKvOLwDvid1QhtYUGRfZl1EoLjMgTXqo8osSoCXqbAKv9uvkDPoNNO4MAC
	 imabZ2KRbNKIC3D4oN49CZ5CBrKIAfRUti9hEtW9S1Yfdc5UZVhNlf5sx1Jq74zqs5S1T
	 UWv//HccWek2yXILJNS/dksFDQZ+sne4rTkr44OUCiKEtL8vwHiNgpMCmiatMjHNuAA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794049400;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=0MX84cVuE/4exxScjuh220s+g/5OEdRzUm5MIgY8wKc=;
	b=MyUdlfKInCYj1YMNjmWiKrRc6lTmWXIuV+1SUP++iKxO4L+sq9iXXm62a6GBmEuM+pws
	 tKXZIct2C2CNnG2QTFw1EUB0SN1ui45ju6kqIVvXvrQcbbzb4tou8DXbicTLDaVfl6cBf
	 ZqZlComNi76p4V3t2vinZRcez1/xZUtEifMdWiXtqYWZSijOzq/vS/b8Z3PHPDla0WkFN
	 U/ZVuOGHIoJToJW6RKXrIdLWVp3EzfSPU7efLhBE22WPredNyw9ZXCD9r8KKqdN3IIaAe
	 WLa7YCAaLO5Ggx2RV+XWCBCk8IWgwi8kanMvtferD2akzolOu7jtt4OpvHww7GbOgNw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794049400;
	bh=0MX84cVuE/4exxScjuh220s+g/5OEdRzUm5MIgY8wKc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=gYkUdc4wXTEEeLUunCFTAFZDcv+joTsdPs4g6dm/WfGsOrlPPXKdQ4Af65cmdJGGI
	 IBY3nACypbMLYhIbbYkEKkbQC8zICWqtrnjClRZWXbcCiwhkE5d9T4/g0xLo5kyiMF
	 ttqCN22GEBYiFeXHkim7ljY2BsmnqG+HfgrhBUo7CO+Owvp3yw4VA/lnv/kzywAbwX
	 Icfj2zIwb6Qou8nD+AefVTMPZthkwfqsv3Y0X6RN6Nb31FUZzPI9GjAfu4EVIBF47B
	 IRFqWmgmTfVx7IgJPmbpPOgxKcUiBtRxn6hKA7WkKh/A+WHHkuH9blg102z+Gy/xy7
	 BHYoSGsp8QghA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE43D40786;
	Sat,  7 Nov 2026 11:03:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A403132A
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 11:03:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 95C50400B3
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 11:03:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 02PPWmvlVUPK for <buildroot@buildroot.org>;
 Sat,  7 Nov 2026 11:03:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org C54524008C
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C54524008C
 for <buildroot@buildroot.org>; Sat,  7 Nov 2026 11:03:17 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 8BEA37803A2;
 Sat,  7 Nov 2026 12:03:14 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Sat, 07 Nov 2026 12:03:14 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sat, 07 Nov 2026 12:03:14 +0100
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org
In-Reply-To: <20261107011221.2064497-1-fiona.klute@gmx.de>
References: <20261107011221.2064497-1-fiona.klute@gmx.de>
User-Agent: Webmail Free/1.6.20
Message-ID: <d2d5f6c8395f7a19ae5c9e85319b85e9@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] {linux, linux-headers}: bump 7.3.x,
 6.18.x 6.12.x, 6.6.x, 6.1.x, 5.15.x, 5.10.x, series
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
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 07/11/2026 02:12, Fiona Klute via buildroot wrote:
> Update the latest kernel releases to:
>  - 7.3.1 -> 7.3.3
>  - 6.18.60 -> 6.18.62
>  - 6.12.115 -> 6.12.116
>  - 6.6.161 -> 6.6.162
>  - 6.1.191 -> 6.1.192
>  - 5.15.224 -> 5.15.225
>  - 5.10.273 -> 5.10.274
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
