Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 147D1CD6E5D
	for <buildroot@archiver.kernel.org>; Sun, 31 May 2026 13:42:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3250960F77;
	Sun, 31 May 2026 13:42:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xqIS0gQsIg8U; Sun, 31 May 2026 13:42:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9FA4B60F3F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780234931;
	bh=TJK+FMfuDtXuAphml/89Gejt4fycn1h5KLpfypheIK0=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=lXeEyVbeLnO762YyF6sr8IDH6pBpKffMSQ+CQncuLwWbCp7CzmD8vYO7Be8HHUuJ7
	 bsX8u4FLfD74nfOfdracI0/Nrr6XS+Z7ApLMZjH4fYEmu4u/nviBbmtbO8Q25uqO8t
	 cY/HIlL2EBZwjs3h7SXtuPtymRMVYQmGmTfX5tKUjZs+b1g+QqlNT+4ifLIiazJ3pp
	 bKfok4vdCVHhGcfdrCrDgJofb4cHLZHLfi+cOd5DS0Xd3VxeNnKMaJ1Yxj01Ehr/WT
	 D0O+uj67lLKczPZhPCFTZ/VvPQXMoWWt5JN7WZ0WV8s0lResOx+XVNw6p1cagRhoWd
	 Tg+angVbA0Isw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9FA4B60F3F;
	Sun, 31 May 2026 13:42:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9D6522AA
 for <buildroot@buildroot.org>; Sun, 31 May 2026 13:42:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 83AED60F3F
 for <buildroot@buildroot.org>; Sun, 31 May 2026 13:42:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p7kDGPn4zrGU for <buildroot@buildroot.org>;
 Sun, 31 May 2026 13:42:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 89C6E60F31
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 89C6E60F31
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 89C6E60F31
 for <buildroot@buildroot.org>; Sun, 31 May 2026 13:42:09 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id A01D319F5B2;
 Sun, 31 May 2026 15:42:05 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 31 May 2026 15:42:05 +0200
MIME-Version: 1.0
Date: Sun, 31 May 2026 15:42:05 +0200
To: Romain Naour <romain.naour@smile.fr>
Cc: buildroot@buildroot.org
In-Reply-To: <20260531132533.643062-1-romain.naour@smile.fr>
References: <20260531132533.643062-1-romain.naour@smile.fr>
User-Agent: Webmail Free/1.6.14
Message-ID: <45b8abd905065ef9a3f43ec8fa00027f@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1780234926;
 bh=gfTfTty2vOGUgocvV365El5jYHO7CeDcw0RDb3k+XWQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=XFaChva2IA1VcL9TbdW8/6YiuvDgkY+G9AL59J2M3F0pYttWUYg3/9o5TMiKX/fkZ
 xrzUA32nujwQEr4cbvsTSZystukCdvEbffpc/GaqBlYECkdZAPiPxCXSpEuws374RK
 fi5Ul4cgXeucpBcpkgFsWxX4U+KDew6M4bg4Ris9T93mrnTz40tSY01g/KZILd/2D9
 5ibvhECAIQHxtVijrDQ5w0Y6IT63w4E+yRnBCOATU6sQAdxBJjGB8Ls/ThKHl8hgRb
 qhvv/s15ZU1A4ORdsQU7bXV28EGunc0c9R7ucEYjhdh1Rv8bbVkfhcWopJeOUry5M/
 1n9LoL5Q0S64A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=XFaChva2
Subject: Re: [Buildroot] [PATCH] support/testing: TestPppd: force the
 baudrate for pppd
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

On 31/05/2026 15:25, Romain Naour via buildroot wrote:
> Since the ARM AArch64 toolchain toolchain bump [1], the TestPppd fail
> at runtime since ttyppp0 and ttyppp1 interfaces were not created
> properly:
> 
>     pppd[87]: pppd 2.5.2 started by root, uid 0
>     pppd[87]: Baud rate for /dev/ttyppp1 is 0; need explicit baud rate
> 
> The new toolchain uses glibc 2.42 that include a rework in termios
> "implement arbitrary and split speeds in termios" to support BOTHER
> [2]. This rework seems to conflict with pppd workaround [3] introduced
> when BOTHER was not supported in Glibc.
> 
> Fix this by setting the baudrate on pppd command line (we already set
> this baudrate on socat command line).
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/14607335920 
> (TestPppd)
> 
> [1] 8d413d61792724877bfd886fe3ba519fb5259566
> [2] 
> https://sourceware.org/git/?p=glibc.git;a=commit;h=5cf101a85aae0d703cdd8ed7b25fe288e41fdacb
> [3] 
> https://github.com/ppp-project/ppp/commit/d65f6713c8514b016629b87d44d5154d70776f7b
> 
> Fix-suggested-by: Julien Olivain <ju.o@free.fr>
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
