Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD568C98318
	for <buildroot@archiver.kernel.org>; Sat, 26 Sep 2026 10:45:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7750B812FD;
	Sat, 26 Sep 2026 10:45:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p0LIAhz-J7sH; Sat, 26 Sep 2026 10:45:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org AC86A812E3
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790419540;
	b=fNZN6egZ8E1V30xRoVYnaZW3+jixiTQGvsnJolJe5nf4jTv++wKpGSumG+bSYOVVXZuJ
	 NQQuV0y7arwR93bIcFKqB1B66321f+Tf4RDHBjtekXQNAOBSvEAp30OP+3MtM1UmaIFeM
	 8coQZIFbiwvo6CkF1aLnCO6Oi0zxuEruX1OMm5zsPsvr3cbwH+YjBC9/50YbdRp0ZekXN
	 kb5H3Q8gwui1Ff/2lbH2qpLLbSLGaSTWQRl+0Y5VLAdziyYtFdMnXyGd03rrvWJIcvVXb
	 f2FHk8MU72Rikfy39615cixID1xxMSj4oBGP8WxUeY9Mf7rWvVX9jSU+KGhpHgqNkzw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790419540;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=ngfKRhns8iZpqStSRIGKuVkjVkAGCak16lzmud2KBq4=;
	b=mLxlKjr27e2l/r/g5b5cBOE4K3fuO3bzFbxLJCjw37T4w6aX6eG7mT/J24eduWKn4Tdp
	 Jr9VmlMJDiRe3TFIbJsFJY2Xwl2dfxGtzF4aCVA42uJmhW4rR9NyE8LIU1p2owQepi0Zl
	 doDJxnXpCNoPnyy/SUPr2pzPeXQ6vmpKX+wNwo3PuQYYhBzmgZverM6EFXLOkHuVZvB8j
	 nKC4H2pfEi/Jb4vqmYFAPc2ZmjoAQEJu9lmmyL4Ijx03F2ipO2agpMOwQ9Zndm9Uxkpas
	 h+o6jIOVBzswlyQ7unXc8pI/G+060H3VLl3aHp+8TYVr0JxU2NXB3UvOBz4ARPKhyJw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790419540;
	bh=ngfKRhns8iZpqStSRIGKuVkjVkAGCak16lzmud2KBq4=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=lqHX8cND9ezfg9ky60fNdYRa8q+R+vdMcu+6aQ7TKbXlpJ9zMkQ6Sd0JLorDPfXYf
	 PkLbZtJqR4I/CcaqNf6szB5wq4jQPiEuL6Op2wm47BhUfEu9KswuWDO8GV2lsITBGu
	 /XvPQcSZyNZ3tyc4FzT9icv7qXdMF3ZeY/rC8IhKCLb0X77RfOwXiCFI8RJes888dH
	 ps2iY9tPKg/KV8ZTdVcd6ygXPIf7Qj/GgmeN+kRoDnq/5y3pcZejPSNrDbVROGzElT
	 /mPTwIZs2usgPdj29fgwlj9i+66bjfKRHAT8nF5xVkT8liodP14fTaFQlzVjgnm4aY
	 GryuQU3pm3Ktg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC86A812E3;
	Sat, 26 Sep 2026 10:45:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CFC4F329
 for <buildroot@buildroot.org>; Sat, 26 Sep 2026 10:45:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C115E812E3
 for <buildroot@buildroot.org>; Sat, 26 Sep 2026 10:45:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2M6GL_T0ABXt for <buildroot@buildroot.org>;
 Sat, 26 Sep 2026 10:45:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 8C53481296
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790419537;
 b=Xx1hUANRNFSaTlJtQ0O+fqneaj32ec5+GnIpAkfMmLfhRqa+Vkcr/UvnnkfP78IXkQBz
 feBKLuS4214ua01eg2pQ/DNmwEbZ+UY1o4xFRlrk/Wy1MJ90YDa/BXPJu8ijsd71wuq05
 Wj7aqneFQx64xDdqkoSXTouUBkSELqLk3KpxnviLBb542K23PS2FqzaWHktgRKO+QlkX9
 KiaeqO1YmNkbZvgfagqE2vpi4tzbR9taoSfccZj7b2wgtbUUGm3TnlktQPzlhY4etxt+S
 n/GixCK3bvZO4sj6H1yHvAmnC0Tl2TOCk8nILXamOlwPgY85n91ZSGeQFhCGbIaRBdA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790419537;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=7u3+8s59c/mWxzHK+jfzLuVr3W0DiCFJLGkLRzCAAP8=;
 b=ZVcUZsZU5PIPJBtYPyVmHM/gWX5tNeg0DWS0nyUkzmi3bSVX5whg6mU8X8X3jfixzNGL
 y5y1cC9mI16b8CUNO+TBYZ1CFhDQbv0qfK0X1TtugXlSxHpAI8PHdHUNBbczqKNWoJY5r
 N5txAci+BadfLxkuY4KN/QN5TRsVPVtXgxUMMC0PiV46b0RKvvDKkHvdCgfMWzu1jYGW1
 AO4utsfvooRv7iwOSIAg7MWpUPozceHwQ6YviM6MubVL9P8w6ITKePDkbL9aIfbl2wqbS
 6uf54gXKqG728AiD/lebAEwQk0UkhSBfPc5fSZFo/uCdvXoJuil9wDVpXJdhLBc8EFg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=ko2y2UTS; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::11"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8C53481296
 for <buildroot@buildroot.org>; Sat, 26 Sep 2026 10:45:36 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 121FD2003CC;
 Sat, 26 Sep 2026 12:45:32 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 26 Sep 2026 12:45:32 +0200
MIME-Version: 1.0
Date: Sat, 26 Sep 2026 12:45:32 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20260926093748.73670-1-bernd@kuhls.net>
References: <20260926093748.73670-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.19
Message-ID: <386a7adee4fc3de0c56dbcabf4685761@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/samba4: bump version to 4.25.0
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

On 26/09/2026 11:37, Bernd Kuhls wrote:
> https://www.samba.org/samba/history/samba-4.25.0.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
