Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CEA7CCA490
	for <buildroot@archiver.kernel.org>; Sun, 18 Oct 2026 19:42:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2721C60606;
	Sun, 18 Oct 2026 19:42:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id R1BemwcdEwpT; Sun, 18 Oct 2026 19:42:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 40C1860613
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792352535;
	b=b5NHI8NAfvqQjp2WdN3/f8tY37UrPIpGYiKAQ1i6Ak6X6z9/MBNTfvRYM/mB9wF+h6VR
	 CVt2jymZzzr4AiB4QdMe2dhMbdZTZPJvjJQLfce11N53x0rDVfwKdzHcYfsb+WD7dIwEr
	 bBU5otETmbacbzJ4Y7XnDtg0+dC4zL2QSVbTT2d9up6X/6dusQmEMvoM/FgOBzv1bjidT
	 CsJQHjjavfVwy2ZA3xtg3XHEEuASrtboHIHY8gZ1jTOKhJ0Lyguw4p23M8W4GyLv/QXMY
	 /FpmhzOBYEs6I9fYeC/raiVF+2Fh2Ysg0Bz+wOWrFXemnd06Y+1gHakiPvI0FlLBzcg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792352535;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=337d4ko3uY/uaH/U4JHyMAV0EoPxpadyF53uxLS59eY=;
	b=RkF0tlytbj4BZ8bpPGrTehIKcljT/A/qd9RYK9DRtZzDTTWCjPaG+DH1F6HH4lDURgnR
	 eGfB5Em/AyuR+7MiZqPOzmIYEU7ltL+4SNvAxLX8Eks0171gQpuvDEr84G9KN+mZemoJu
	 6SrjM1KwfjgmP19k6QJc1aF9wuPs1dDzAqUudwIbVWYd2UYY1/KP9Tc8JdJSZD7y5ItVN
	 BMs+zYwh88m32vAlllL8U/OxQ7EH+LSRpCAEdgKddoFnSo0IE6mnStfsu0QPA6AbhT6jo
	 5wlZseFEUT1iDLZVtZAMoW+JLR40LNnnkM8C75kOAT6VYkGi1ba7hDGf2MPejfAICjw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792352535;
	bh=337d4ko3uY/uaH/U4JHyMAV0EoPxpadyF53uxLS59eY=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Mf+/twx+dHhGEdZ9whNVkyyfWv8dBdGONCWYvJrz1GUl2bO5bAfz3WDQW3XviNNM4
	 018q2wYlEkjXxK07pTOBiAqlX8D+ACbM1Y/6P2f3dBWrjzy9Me4fUFB5UR1paEPGYN
	 WX3+1Ys7s4hYV+9lkQ35kGqhP7LJuzg+fMD8RaOfrw+T/HQBHysLs/B9dFKENfZN4A
	 MpoONpdBMU8wb/toyMliEwVX72sYg60YqOzWD0Z0NBZvW0LNlAbeTpiQHhVF5pf1Rw
	 mSJiouU03GUCvaRORVyHLuZ+a64wsQ6mkbohxT5qU2iZZer3R7NZI542Y+PWe5sN3v
	 Is2fOuDYXoJXw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 40C1860613;
	Sun, 18 Oct 2026 19:42:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 01FE7255
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 19:42:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DC4C340068
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 19:42:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B0ha217u5wzB for <buildroot@buildroot.org>;
 Sun, 18 Oct 2026 19:42:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 17BFF40049
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792352532;
 b=pUA2dy3F15TDMffLPu6XKhTo+eUrDwmk1zyVCFQy8ailAXfdSBiYV4wRvmjgWAFE2ghI
 2ts9WcX3A2DYJxOiy1d/r1m5i+PFXQ49Un87D4uuhVCx8S0D7oH+EYGIUdgVXa6Tn06zb
 FCLNB3eP79/F/ef32chFDkdeY8QSGrvvj0XlDYfZPpo4RI2fSTS+4bh+7St6BDrIrW36X
 m2E1CzUrTR4wc4J2Y5cO15SdfjAlpbAjp6zTu6U1+Sq7altQtKvEb+V3Mx/rvp/82g7lw
 6Qzh4hiGbmYxsVx78zk3NyNbj+YSKF27LCTP7nNSw70Ttai4GlS2DIc36i72OnedFDQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792352532;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=g9281Alp1Kx4rG+Bhuw9T9SDxg9JhTvnyoahZtV5T4I=;
 b=SLLYjm+qO4S/BddryWeXGo5827f6fmes1qLoP1/SWFyE0CK+uggZChq7s0JBBEVscOF8
 ZaVl7ujUBbxX75eBvDTxhqpi23xwZmLSbx+ie3Fjx+3ob9g3QcGNWnkVYm3NOWQvwkXOA
 SEwvMzxvok3vwO0GI9yNbnxgoAxbqv+19KM7Rtw3xbyC0jP+t/l8XGK+D6mmUtjJuga6A
 ZYymINZzrVbGf28b+yPomw1TSbfRb61onlkqjd9oNuTEeupXWEX96Fx2pU2TOVzNiip4U
 4yNJaY2iv1cWkDlcoULEImCyoTo6Eb7rfqkx9X90JSaxlVc+jwu284hTZe1SRrOR7sA==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=SYvbYcbP; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::12"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::12;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 17BFF40049
 for <buildroot@buildroot.org>; Sun, 18 Oct 2026 19:42:11 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 5113213F88D;
 Sun, 18 Oct 2026 21:42:08 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 18 Oct 2026 21:42:08 +0200
MIME-Version: 1.0
Date: Sun, 18 Oct 2026 21:42:08 +0200
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org
In-Reply-To: <20261018143816.1780525-1-fiona.klute@gmx.de>
References: <20261018143816.1780525-1-fiona.klute@gmx.de>
User-Agent: Webmail Free/1.6.19
Message-ID: <fd61b8a7e3049b23e467702b12fcdb25@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/2] support/config-fragments/autobuild: use
 HTTPS for custom toolchain downloads
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

On 18/10/2026 16:38, Fiona Klute via buildroot wrote:
> Both autobuild.buildroot.org and toolchains.bootlin.com support HTTPS,
> and even redirect from HTTP to HTTPS. Use HTTPS directly to prevent
> manipulation along the way.
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
