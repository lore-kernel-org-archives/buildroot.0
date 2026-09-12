Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D74FC79FB6
	for <buildroot@archiver.kernel.org>; Sat, 12 Sep 2026 11:16:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E0FA980E8A;
	Sat, 12 Sep 2026 11:16:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CZhwtxV1fPsV; Sat, 12 Sep 2026 11:16:10 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org E7D9A80E84
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789211770;
	b=YuJdlYtw8TCtHy8qLe2Xx+pxN4M5vLOMA6kiKn847VFT2QIW5lT1tEHVlPLI6v35GuvJ
	 mZJSvYY+BPS0ZpftJWwC7paJNhhwa5ejndvZh4uGpvWJ3cGY5jh0GKqk6RT2LGcTbs15p
	 FpdeC6eTqAVxlfCeL8d5YbZR8LY285w3W0fOMJfPewh9Ngn1AWfz5JY9tismcXhES1pS9
	 4AAcOhmswKbK3iuwQPDl/rtoiB1J40D+U+HsoJn7WdOoSajFCp+ukFkP8piMoCd5ZyQNH
	 ggoNfCTDkwOdh6QsdvRzHBg6C8OSuV33/ahAgx9+r/EBc3OSDUwVf1c95IlCrtt8ZNA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789211770;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=Xr+/BEy8wwh+3pyLGJDcJ/k4MpplylB+GXbkGKt28ZM=;
	b=gJYqgTctwYplUwmn0i+BiZwBjJNrmnMTGh/R7uTMfxUamn0ss7df3a6sNbNKCY4J0/zJ
	 FM16/XqtSJ3HDj0ZKoiJIxxPf90VLAa+Owy9bknk6UF9LHmfGD1ne9krUf4acgrOdQxn2
	 rN9P8yrLTW7uQKabINGL/WyGmzhr1JjNaQp692Xm7UjVhRXwLjVAsSC3ybDucR+juKtmO
	 tC5jzBEdIyKSPgnYtypZ2SoxFX6TbchCmrMwZvYCQ8goYROtCDrUwp752mhYgUPkRUTwP
	 yzn/cIjogdaYPNmYLu8hT52VMTqsoyedrbRz5e9/Ix3J9DCXC1LijS1PKdeOK0xmpmw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789211770;
	bh=Xr+/BEy8wwh+3pyLGJDcJ/k4MpplylB+GXbkGKt28ZM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=e1NAs1rrIS73FREY2J3DyL9OvIftvn1qxemLSkXrcFpBcA6zjAJWahoJW18w+EErs
	 uUJRqD4BF6sK7C+p1IN8aHb5Ql1R/zNP9oyTkHDxXi0mUNjpL0+un5CO2Wr4OVK4aC
	 VZVV85mVAM0Bfc6r0+s3S1MTbM8eknS8czNd6Y8ng3Fl8OD4z1bIlTinJEdcpjWPyJ
	 B9k45ZSx+FrVVYUOHx4ORl59HAj6JeuT8y0FiaJlwNi/nvrHpFi4L8ZB+h60rXh11B
	 aIS/84wZXugDBtsTdccR6TSdB7cFzwi1yLnl3l9URZSinaE7FFuNfRjabKa6+0CR8f
	 l+BrUjlc3pSUA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E7D9A80E84;
	Sat, 12 Sep 2026 11:16:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 11A2732F
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 11:16:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EC5914009D
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 11:16:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bIU_HNbiNItZ for <buildroot@buildroot.org>;
 Sat, 12 Sep 2026 11:16:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 832C140068
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789211767;
 b=p7RLND4GgRTazdhIl7EcCUuww/WXvgM62W9gTKvhEEgX62PJQDKar7xTvkHHAMFi1xTr
 fZOXlV5302hqncdUCdN0ML4APMbnXmaLOZsJySDd/YesniuJHqXDNlAXIwulERaoR7718
 qPn+PF3yV2KGGDNFuGN1zqewZfyjOCYl4yWhGXcSa0mTmO1mie3lNO2FVlt0+HvvotHTm
 7UmvIRSuZm2yGIbbuSF7iIjTQ9sHHyGRUrvAoKGNemWq+yaZUEhYRddgUK40gtJloO+sY
 pfCQsclkkKiF+Iy/VDrnFET5bt/m1j/XzjIgA8t5918r43qAQLlWBdSh/yhrxyYoKfg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789211767;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=451Ay72zQKOvy/IaqOY4I7Z/4ZzoYxrpuvLIJ92h1eg=;
 b=KYaNjhkK7hrthibCm47bMGXBQaa68BH3E7LP336zug+HBAfavWaO9SauUl/quJIwRbjL
 yrwb03o+YYYbFB7CMxmjf1sEeArNllkQ2fcYa3k9XcTsJcM6K/BAII+Nb8RxBfmupf0E3
 8ha/Js9L7w/xMr5MFG63Q2NkNIKIiyVGJaTuXsV7oGfFaGObMKDRnCM92OqhoQtRJKBsV
 rpgmPh5Hh+mGmxFlndT+TW7yRqshToIyzcjbFPfLa3PVAXI2ydeSJGq04i6DQ4DY4xX//
 tlzKjQx44cwyqvjGf48CxFU8mqDMSjGjV+clp/BkUHMxA6nQIQWhUIVpjpa57sNN6Zg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=aPCrJPFm; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::14"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 832C140068
 for <buildroot@buildroot.org>; Sat, 12 Sep 2026 11:16:07 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 4F5B760129;
 Sat, 12 Sep 2026 13:16:03 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 12 Sep 2026 13:16:03 +0200
MIME-Version: 1.0
Date: Sat, 12 Sep 2026 13:16:03 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Eric Le Bihan <eric.le.bihan.dev@free.fr>
In-Reply-To: <20260904162622.118490-1-bernd@kuhls.net>
References: <20260904162622.118490-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.19
Message-ID: <586ff9f85fbedeacd5a4ed27040dc8ae@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/meson: bump version to 1.12.0
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

On 04/09/2026 18:26, Bernd Kuhls wrote:
> https://mesonbuild.com/Release-notes-for-1-12-0.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
