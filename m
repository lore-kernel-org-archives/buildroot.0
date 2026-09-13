Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24344C88E65
	for <buildroot@archiver.kernel.org>; Sun, 13 Sep 2026 15:14:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D897C80DCB;
	Sun, 13 Sep 2026 15:14:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id waGuRygHA3g6; Sun, 13 Sep 2026 15:14:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org B006280D49
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789312481;
	b=emdXZ39M+096XVEsTCpkQEHlFxkdxIJP3Klw9BwlGyruF9m7kLvr9R+o+L6eslqbl9qa
	 wX2bEKBtZ/Nl56TkorwAPZFgb8qasFTpn0WVs2HyrGLtVU4ZO6IZoCJvgIGw7HGl0c3SZ
	 eOeOypfb/xfVc/RFic5CwXnylrSxvkAGbm3oV2XrflF+Iq+H3RfmYMZ2DnXlQyvpNO1lh
	 xaRIgpHGlqD9vuFQk9dzFdl9RVCo74uurXOVJ4Fi+cJz1vVEcKGrh10i0JDCrea5TMJ1F
	 K33cmkc9m16FR64aLMOtzHxNEKetVv0UQzVL5RzUvVpQydXPs+/eC9KsoeIPDhsuQwg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789312481;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=IINwHCFZP/d4PY4+aUnYonnGp5bvBrVbiAVeglozlWY=;
	b=OY18g06ymRekpBSaxPhZnW3OC88O50SgyWFiYJSr0meUdS8N5WTNgulLTKYLLkl2BwjP
	 vrQO2CApb6l2gg+WaF8VUCVhh42OjFWz009N3wxSBfjjan+q+DJCKFvcFmbcl5wMNju5k
	 XjDKCUt4hEoCYhp9FVdX7nUwOkp7INs6tCXlMhCaUKRIDiWKOHjrZj+hmerT2pjcgrn9T
	 aODLHQWGv+XE7QhSM5uGlUBCXLgMwHGC3NM4sL2ImV7dFcReRW1hgaB/FM0FHsNGoTWhR
	 da8xe7wcomPbDVAn0MfDVJ5PdH7mxYlJqjldCQ6EaIUb/UVIf9is7k0dC29OdlhFJhQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789312481;
	bh=IINwHCFZP/d4PY4+aUnYonnGp5bvBrVbiAVeglozlWY=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=iY9nz2mhOXlLe/plqRwSv53tNFVB9DIPge1BZEim6Vje5M6uWN2WClyYbeU+TuhkZ
	 qqX5pEPbLOgkhE9WndvSM6fWz21CtBzdaL8HL+TO7jUFOUsXAGBG2PaZJt3JQbwl9J
	 UW0zBLu98wPloONP508U0FMTUcLdRDC2t+DnHIMyGntNeOOCLfUa5vQLKOdlOlJhed
	 UUoiF4kdNrnJiya0FpDwXfXeJaWspDYP8ZmMhSMi3n8ch7TDfVG++6B2vaj3zniDnq
	 Q0kEohxx+7P02ddJ/+/NRd4g9xzLiuqBQq5aq+SMSrAv1h2dhqeL4ulmkO0XrRNJLn
	 XzBmIR3E23QsQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B006280D49;
	Sun, 13 Sep 2026 15:14:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1062D224
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 15:14:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 02293605D9
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 15:14:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HDUICMELQVv0 for <buildroot@buildroot.org>;
 Sun, 13 Sep 2026 15:14:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org E452F605D5
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789312479;
 b=hrPrEEZ6unw68cwVqxCwIGsa9DAqzplugMseavNd3M3ANSl0t2pF/0zMW7qBNDU1sjym
 XNvnMDwZNIy1SZV8xWM6dp8B7g0YMj408h0cn6dqrLY75i+oCexX39+oSpv5ogjH5kM2E
 Yd76IFvwB6Hvt/giA6sWPM/fNB3txC/cAO46I2wt6KxbBqcn/B50k49/rpj1M+QbruL25
 O2cY3OGYvzN13uazd13cMqj/ZExullo5zm8pxplO7JsGuRrDGAT2vx6Cba/L9PgO3pY89
 beGxu5II3K+Kwy5eUxJzswkwzQi5bsHzmRJ0Ybn/Mpuv6eDA/HLJyMsi5WfZvPvjReA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789312479;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=QBpWyefTATW5YOad7UWPFcd6KIEdpu8FZlChP8oCYMs=;
 b=mPnRCD6DP9gf6ulld/bz8AVeZa+yGiai9x+VqxD9ERTBtkKppY03sFUElMQhnaTU1KuX
 W2GcV6mYRkyYTDCZQha3Sqb4iJ/CbVZm8B+rlt7FN9p+6JoscMYxVh0TNrQZXfeOpAWaZ
 tqdg7uox5eNg+0dB+gU/wPrJWI6WUVJN8xqjG/Ht7LkGWSfaJZkQPl8vp/yOJ1Y8idi9s
 KHdfsK1mpYVSyBVSWf6koAdy62ujyO8w0OochUJDHL4iAAedbm3scjOJS+l9EDplT94qr
 eBg2056KyeRGiDNmayZDgatu1+ulwxeMKpd/G9NkedyNeOFn7aRLDh39pF9dQv5Yd0Q==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Rvrtn5Fz; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::12"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E452F605D5
 for <buildroot@buildroot.org>; Sun, 13 Sep 2026 15:14:38 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id EBD6613F8C8;
 Sun, 13 Sep 2026 17:14:30 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 13 Sep 2026 17:14:30 +0200
MIME-Version: 1.0
Date: Sun, 13 Sep 2026 17:14:30 +0200
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Jean Burgat <jeanburgat33@gmail.com>, James
 Hilliard <james.hilliard1@gmail.com>, Adrian Perez de Castro
 <aperez@igalia.com>
In-Reply-To: <20260913120101.1646000-1-thomas.petazzoni@bootlin.com>
References: <20260913120101.1646000-1-thomas.petazzoni@bootlin.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <f7c0bb1b3cb4e902dd76af2ec869b192@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH] package/hidapi: propagate dependencies of
 libgudev
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

On 13/09/2026 14:01, Thomas Petazzoni via buildroot wrote:
> Since hidapi was introduced in commit
> 6267f34afdd06ad848bbf7a2975cb279132b6ba0, it forgot to propagate some
> dependencies of libgudev (which existed back then). Initially libgudev
> was only needed when BR2_INIT_SYSTEMD=y, but still the dependencies
> were not propagated for the systemd case.
> 
> Anyway, since e739dd5a11f5b2bd9648a45623bc174adae42b6e, libgudev is a
> mandatory dependency of hidapi, independently from the selected init
> system.
> 
> We make sure to propagate all dependencies of libgudev to hidapi, and
> propagate them to the reverse dependencies of hidapi.
> 
> Fixes: 6267f34afdd06ad848bbf7a2975cb279132b6ba0 ("hidapi: new package")
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
