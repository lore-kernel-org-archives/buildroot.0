Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F71BCA9EC1
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 20:49:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 19E0A606DA;
	Sat, 10 Oct 2026 20:49:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9CTd9Q87IYWQ; Sat, 10 Oct 2026 20:49:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 4508F606E3
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791665353;
	b=dGlaGp/ZjJS84lZdJCDPWNzRi3h10osukCtEHihdAy1fpBYUt5c59QT38WH3iTmUp6Xp
	 uTmPx22pLIRwCqtUm7VWOFjcewXPMyXloQwViTRb4FTZ4pHAV0OgihDwQggZMFg3De6ZV
	 ZdQAutTh6A5AzXxWlrIpv5MzAASZAKA+Fzwhel83tx5PpkcxZydRulgjuhiZlDop2pre6
	 id0KD24uzhqilHktkQmr0juziCEJ97/akJ1bTFd3apwcDbjPRhx+FIbgJ8GLqdyhZiRVA
	 cYNmeg6nG0OBPDxA71xcTvD51h8KP+yqOOY7wigsE5WDWUjSq4RMgkmxAh2qLorEcMQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791665353;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=6hrrV1gt5Z+8QFy2rWuM+JPvAYwnZQ4K62HcJ1mcE48=;
	b=Q7eoofML4lgStoH7MaSLyoV2lLfCbOPQ19ajPLkJq/x8PKUAU7yLGJPlLUJznBTT7dBq
	 QjaWsS2Paz/nAP5lFuMs7H/rxDXeNQ7YEzQ5GeqklIjjcPhEyVzoj0+kR9/tNZr3EEfIP
	 K9lYqsPQIGH3w0QHUwD8wtBbPIlcTfGoxKG5U12Hmminz+S7dooPWwsyBiVKPpMCCmxHU
	 0EJEM2Zg27PMOtfvdfqX5Hl73THIYi6cyur2egJJoYfvrAeAQSKNoXsZGih6ZcvFo/YiE
	 RfTNeJOQzLiAr6Z+MU2L61h0IIPT6WZYngCwdxXv4D/Yx3ZAAlfEad50YglLW7tqehw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791665353;
	bh=6hrrV1gt5Z+8QFy2rWuM+JPvAYwnZQ4K62HcJ1mcE48=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=oJOrwhywULhw9SE6A1VX5WqJK4fgK73uPxGoEXoUdIA34y7yHTpQ/7ktx+c1pSZ7z
	 NkWOP2j1Eqi5A13AcpYJZDno3lgbNdNJR1CsGE3qCdva1VFaDkV70bpoxgnjcB2elj
	 vYQ7bTOAnL4jDI/PNOfaui38Wht9vq3xkbDjbF8GIJJKY6hNt5mpTWWZtW1l1eJ7e1
	 8n4uqeKSXyovvYc9AoHGZjt7YTEN1tEk6gmhvIR2RdU5siOquHZFrn3rHui4Knx+Q1
	 Kt0KUk0ooHeaoKoZGCaEaMr6Jrn4iEvaqOwa0JDccMGHUDFNngzkzf/5a666EiilsN
	 IOaQV8gI3+OwA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4508F606E3;
	Sat, 10 Oct 2026 20:49:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C7822156
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 20:49:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C482340877
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 20:49:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Vr2Ud5dg9aT1 for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 20:49:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 432D9407FE
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791665350;
 b=N3ccS3lSRkQCdJxPUnV4cmTpdr8FMyA7HL5gfRvOSIjwaszNZm03aV11g24tM/KtbgrR
 WLO1isPKdhav++6Wve68MlPVNdyh+5ZbpL91Ft4aqMIksZGX+Y9abr1NjRmHELFOhA3L4
 w/EQd+7wenNXBp8jYJ8CLJA5YYtP0c4LZy+YJdrPZKhT9DTSDuVLXw52qNY3iCNLyYdGn
 2vLpSnD81YLrcecQUP8XR7rJ2CBA5X2Po5BrpLj8vDPL1rPDqb9rg8eW5W702AdaWJMFu
 ftkqk4uo+h3m9mPZmloVAJ/BkdDBadCWybJRbUqWKsOvnzm1RlTgmZs4K2VqtCqoEWQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791665350;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=C3z4WE3rOGJmpAjPC31un7dSL32PtSGNv+kgTB/vyDY=;
 b=q89IjlxC1wLfuJrokRinlyYhTXyiaflE9lJPRmuXu2OtFeksGFomLIK3863WSBRkRIqL
 DPMsImJR0Ea9a1+tnvG5cSWMZc3nJ/5PHckeRSI5sntiDwxtYdl43RZaWG7UDOEYJyJG6
 kSuKx/UidKADlwoPmNiCARkM8kRJdFIQraDw54zRGRfs1DMBRQxZQGZwtuXRBeq9TDlU/
 ORolXDQXGCM4W+S/nGPLNkCm+TxzagVhQh5oBvwfrrGFOVAma9awGmLa+6iuUwLYjdeG7
 V14OR0IQHDG40c6kJbNn9ZXdYClaen+p9jRTYwGA94aHoNLq+Rm4xQEyLQilZOR/MVw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=ZAxTC2iH; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::12"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 432D9407FE
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 20:49:09 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 0022F13F861;
 Sat, 10 Oct 2026 22:49:04 +0200 (CEST)
Received: from 2001-1aeb-401-dd00-38bd-f619-d5ce-575f.ip6.tmcz.cz
 (2001:1aeb:401:dd00:38bd:f619:d5ce:575f)
 via 2001-1aeb-401-dd00-38bd-f619-d5ce-575f.ip6.tmcz.cz
 (2001:1aeb:401:dd00:38bd:f619:d5ce:575f) by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 10 Oct 2026 22:49:04 +0200
MIME-Version: 1.0
Date: Sat, 10 Oct 2026 22:49:04 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20261002200944.3853721-1-james.hilliard1@gmail.com>
References: <20261002200944.3853721-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <0bdfb7ee5e1e792e92e5a8cd90a7a9bc@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/python-serialx: new package
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

On 02/10/2026 22:09, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
