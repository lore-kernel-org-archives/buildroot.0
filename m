Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D093CA6004
	for <buildroot@archiver.kernel.org>; Sat, 10 Oct 2026 12:19:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6044B40961;
	Sat, 10 Oct 2026 12:19:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id waP0AOVADxLn; Sat, 10 Oct 2026 12:19:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 873DA407B7
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791634757;
	b=WPloVeMEiGdgK7cociy1a3Zt2hCJyFJihRT7zfCinyitDOtRAqptByowEucxIZqw9qIw
	 Y7jMBuy0BTlgzPlx7gqDxJCskjZicFY9SwxBIxQYjMUC8ceITLFmT1QKAWWvUR1WOgCUy
	 tFApcC8KW7ZpExZMmpe2AboUikpaRf72n5E0oaC206E9mqfbiAET7sctWksoZemweCI5P
	 K/It7H48/SgYhEFhp7OGHk44Z/8UCZLCMHzy/ms9MvnATi7RHne9ZNnUX2zrgeJ6O/ye2
	 AbqYycFpDxne9VUw2ve5TDFrCuXoh1LsAM8oej6wcWZ7OrO9Ghn/EVJUITluDZh+vbg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791634757;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=sOSEMmJss/RitPdpL50923Y2JFgU8uyUzFUp/LryaH0=;
	b=pPWl/Lrg83rsgeKKX6pTUZAyysV3p6C4rnwreRjROwaNzFpHRATl5sviYzvbULbMqExx
	 fJdTeQ03a0hUm1q9BL8lxpVA7rfYhxKxvmFkPjUQzcss+MNy0tv1W2kGC7bFDXAsLMmFj
	 SMunbTNL0IZKEsTFeY2RR7cKEtegcUCv2zVb30N2008JiRI9barWi8tbV3DUZZ8ge7kFL
	 +zt9dJyXEXkc7jmRc+JhxCh1QP9hNqjN9S3OqCY1tVlRI6E4dRUSIIYlR2XTj3CO9wB+D
	 yMPzkC0C0rdc0hOvyH8Pc/9FWEo+8KFzadzdmve9GHq4wR+pEVnnM/VFtUc5z6pfSWw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791634757;
	bh=sOSEMmJss/RitPdpL50923Y2JFgU8uyUzFUp/LryaH0=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=HLsGJuaQRCv4msW3gQCCc40NUg4itgvx3E4+zb9FvkfIdbM82GhAar9KdZxIPmbFb
	 jb/VByKSguvSdpxWb8XBUtVjEPgyVEsRDg29FbbiQtGPQu2Ue6pD4+lBJMkAu6e7YC
	 VRvu/zCdP6s2n+uyiLnWwCkdm28KZL4u5geosjqNo3nGr2EM9hNxJ5Uk0vCUp/U1/C
	 7JMNw2AqZFQQUlAjKt5WxW+O+2LIX/NJVjjcC7g8zwwuWFv6di1CGUchKSfBUIHISO
	 ZXQrV/WEJ2JuWatekKrii89kq3TQgJJoR6l72FfRmihA4WABI4H6nSgFoXPvkleurU
	 31ouM61pFq9zg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 873DA407B7;
	Sat, 10 Oct 2026 12:19:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A87D41DE
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 12:19:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8EBF960601
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 12:19:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ay-StQJ6hVYH for <buildroot@buildroot.org>;
 Sat, 10 Oct 2026 12:19:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 977FC605F1
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791634754;
 b=ZeyE5ykPklSBC/GNFoeXllIcWqDA2WgdHMu9Zd8+QEvd8A4XvhAvrw5OwPHKfguPjoe8
 9nZXkuuvFRBf9V9hK56wIJZY/a07vkPhfJIL+DmCzCpKSwju+oBQRbXUrLA07a/GCGGnD
 aRvCRdph4jWvd9E/NAtXBMk6c7N5IoWbBV/DPJgfFq7OYOLPtOxIjO4JQEXDwFdFvsRHh
 PpJfyPJY50es5COq+FLSPrzEAB1tvJ9a9ZqIdOXkJBzeJD6U7hXs/EuS3KzPonLlQXZ/s
 h/e8hsEPYRwmYWHdPgZcPc6ez/hV8mMDLrqLN0UEMS6MSqNsWJYoQIdTW9+bB0wx+qQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791634754;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=BSc+34qm6mMZh5k7nE2CSKvM9IwzF4bc/75GnicSRLg=;
 b=jslG5Ye4hyPdyT0cLvGHP/XuvxGkjUqBloPL4v+raf+pMjpbYSwjj0IP61rE4Vz8FxIx
 igkXvI/yaXLKTqudGPvFve1NGkjL6rHw1DKCaDu385/dqTjx6BM8XUlgqwJRK+d+vPHhI
 x9Nkbg7Zph5jMNqjXqYoQwnJAlNLyxpOc+g0VKzHNaxdwiSqgonCWaTGb7vzpD1A0THO6
 KaEdzSZR6jt2QaRRi9iRswWTw8ejRBOgkamk/sfEg99951PkRd89j3sH4XWbuOO3Iojlo
 W+d2B7P5DdsS1O6tETOgzJV5QGxmEYaiPLNApjAaJta2qi8Xz2MW9Z80qWgCcZCeulw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=M8baqXBH; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::13"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 977FC605F1
 for <buildroot@buildroot.org>; Sat, 10 Oct 2026 12:19:14 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id E743319F5AF;
 Sat, 10 Oct 2026 14:19:10 +0200 (CEST)
Received: from 2001-1aeb-401-dd00-38bd-f619-d5ce-575f.ip6.tmcz.cz
 (2001:1aeb:401:dd00:38bd:f619:d5ce:575f)
 via 2001-1aeb-401-dd00-38bd-f619-d5ce-575f.ip6.tmcz.cz
 (2001:1aeb:401:dd00:38bd:f619:d5ce:575f) by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 10 Oct 2026 14:19:10 +0200
MIME-Version: 1.0
Date: Sat, 10 Oct 2026 14:19:10 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261003224447.744966-8-james.hilliard1@gmail.com>
References: <20261003224447.744966-8-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.19
Message-ID: <866a23c6ed15f57558159a57d2b11bfc@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pysmi: bump to version
 2.0.0
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

On 04/10/2026 00:44, James Hilliard wrote:
> Update license hash due to copyright year update:
> https://github.com/lextudio/pysmi/commit/170fccec8ca124c581cb0f9cb5d07c41da98b5e4
> 
> Add the python-lark runtime dependency.
> 
> Drop the no longer required python-ply dependency.
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
