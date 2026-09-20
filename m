Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6214C982D8
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 15:00:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9911060C0E;
	Sun, 20 Sep 2026 15:00:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jePh4XuYQ0W2; Sun, 20 Sep 2026 15:00:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org C629760BC1
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789916400;
	b=ju60+/B3OdKMARKKNYLFKRa5cnOaMtV1djw4z+7nYq/CLECguwplQfNWNQ+qhNrXfGk6
	 LJf7S6zaw6xrze/FvnUY33BejrfCJXYslmWT2voe7hHgI1wsVF0sY4iCZt1+nD2uZFn9J
	 XcZ+8XHt04vhcsFDqqPwAWDEafzkZ6GlW3VY2cTXRgJcCEbOQI0TMNlKLmiHzQU8ZIIa5
	 mnfjbZ3iEK0LSVRYGnAZOnLuKx6hB05pTVgNppkeKq4ui+USKGwAYavRDyrTUBg56xtW5
	 oU9OMAUPFLBWUj4yeW6QKyjS1Hak/gzcBN70qtQAV5N9+2EesPvNyGFcfUbcVSodoKw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789916400;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=RJlRLLS/5HzXQ2Jek/MFa8xgMTkuI/1LtKzz8zE/lDs=;
	b=hV3lbtsGU6aBE/obZScG4D7oCmrebzIcI/oGSWx3TwykdqcymKzYGZegiJscuJjp9l4P
	 9jdfzVKhR3fQJAoXzlyjXnVQXg+/ZrLY+rDQnxU2UbESyZirvJTGvwOjhKfKvx7mdPrc9
	 aY1yhJEfnal85ciH8jpUKqJ/mH0AygOR9nfjws169mCkfCh31Rki/sKOFYz3GGR8eQqVj
	 ndu6UKEQ/bhSSBGgvphmixpnKxrqKKsfmMfBbyzWce6ujWCV54zKHWgqiSsPoeHuElcZD
	 G1nOOgiezs6SR2tOubqm35fNzcAddY40L4Fn3BsEB09pvLC//cl9pMvbJGDuFLcU5jw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789916400;
	bh=RJlRLLS/5HzXQ2Jek/MFa8xgMTkuI/1LtKzz8zE/lDs=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=hL6yXDZ+9b0+RUk3+wWJs5ua/cPX0TbllqgV1st1mi93qraC2c9tqNIcl5vpf5yGe
	 ecKyVVOt7xlCTvZ7nReI+7X08fLPNYGZAsxB4L45e9PSAhb1uEJH5HhS0a7ABOhi34
	 KLRkKCtxqbBMLi2RX2ORs7YcyFrTWjVCPkBgNv6Ld0Dx3bbtaHfHHd+iX2fTCwcLuP
	 oPVZITX/Plc9a7vfBZu5a5h9zBSh28bNho99Z3zYgUTCaQF+Z6DASfwK7GNF3dTTMu
	 rufKzssKXqrncgry2hF/Gm7Pax6xlfzTJ8inwjyfh6Nvx/uNVo08CYXJMTGQoBkMKl
	 8d7/z4miFpcbg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C629760BC1;
	Sun, 20 Sep 2026 15:00:00 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3D0F83DD
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:59:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2EE8260BC1
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:59:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rjd5PUr4krWz for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 14:59:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 9D86460759
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789916398;
 b=ptLDjAh+XXszPpruXOSiOg0W9gxhwgZed/HSM/7f5ujA11+hT5yL+5bAltZ/lbHvsHS1
 rW0d1kbrvO1WE/Lg2nsE7IOzeaPU24ubmoiW4MsmTh1GhKeM5P1fQ21PIm7e5EV38lPpm
 0lIaPQvqtSbSwoBZXSrcNVlBIAKqcywtiy8O2oxCyn5ssLF7it3Vkvb/N1kywHM6n0arK
 5pSiwEL7MFtL9H76vog/gSBeD1X1WdzxVVMH2Epc0M1o/gDps+JTM3CWj9kcNox0dcABs
 7C8V5lpeGinM3hk6OZkIAVxlhZE1efX5BAyNyE+1ypSbTiwJ3lVWYR3S6Yik4X3ZzIg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789916398;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=ZVajgj0UhYf2Z5qaj+mWgCUo9452nI7En2zLYDs1at0=;
 b=lmHgmJwlTeDQLGAO6GMQkCGHpcsFPozYHCCEMyEhP8cM9jzCZv7j6ROfUU/Dbf61YdV1
 jMazSKDyJoZTPRPJ2WGxZ8gqjJLZ9JonL1fG5AlaupO0HBD4dNNQe9mOZBmM3Opb0b2Mq
 nkTuQCPXrbXjT5uYgor2321at74H9AjBbYdcC4FrZBHDYs/LopoeONLxpKu4n1DLD5GEb
 HtwlU+i+yzmH5yOFirBDdOZ3aQCvVHD4rHG5EvDKrkut7IUdw8MITPvNHc+5e1QvVNO5A
 W0QrKI+/zOxa1EGHC9rhbfBfC+VqXZ7hQIdoOImPbXhNcRfy7GYLl6jSaB3vUlxSetA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Ar7HqtGI; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::14"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9D86460759
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:59:56 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id 2652260128;
 Sun, 20 Sep 2026 16:59:53 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 20 Sep 2026 16:59:53 +0200
MIME-Version: 1.0
Date: Sun, 20 Sep 2026 16:59:53 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260920144428.3009612-16-bernd@kuhls.net>
References: <20260920144428.3009612-1-bernd@kuhls.net>
 <20260920144428.3009612-16-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.19
Message-ID: <a5e14cd03657d534c4fe5aba7e1b837a@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH v4 15/66] package/qt6: security bump version
 to 6.11.2
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

On 20/09/2026 16:43, Bernd Kuhls wrote:
> https://code.qt.io/cgit/qt/qtreleasenotes.git/about/qt/6.11.2/release-note.md
> 
> Security fixes:
> CVE-2026-16762 in qtbase
> CVE-2026-19248 in qtbase
> CVE-2026-13326 in qtconnectivity
> CVE-2026-8168 in qtsvg
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

I applied this patch only from the series to master, thanks.

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
