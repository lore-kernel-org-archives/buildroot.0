Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15A1606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 13:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=gcEIVLzb
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C84860A70;
	Sat, 24 Oct 2026 13:50:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id emDcq5-b6pac; Sat, 24 Oct 2026 13:50:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 726F56073C
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792849806;
	b=QlXdEx3lAVnjhC5S1mW7qgGkRowW4ecGKaxQCY+hLAtrTLjGi74bBpcK176egDNaUgEk
	 PywmWxC5/aCfK50LoQeVt5NIPG9fXv0YNk10+2DF6t6n8hEHyIjvcQpMVdcz9EcHoKrFc
	 O4KqtRGaOOmVMJLfj5vYY3rTTc9A1OHRfITulpYL4SSCP5o/2ta31Fo3VsKIDpEwNHwsQ
	 fM0twa6xDLfZRV2soZhUnsZ1VmzCtTEwdqHwcgQgp2pFw/cDlQTq5byZ0Sjo5y0ggZTuP
	 QscdhwU3/9mU2J+/Eo/ZOkXBshFVnzsvYzdJBKYgQvpGSIwBakE8FTHLSOUW46fXwRQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792849806;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=2cl2Md2segWaJqhtFCKXdjIRvbSwv8Sb23G8cDg5TfA=;
	b=R9IM/xS6346DhZQTpOuu1m34rP0n+O4DdLr6waDEdO8/G0Xwz39Z47WrrcniC/SLxi/j
	 sj2r807067Mpf3Yo9gf2ekwDfhEBQR2BHeJpWuXV+RkuJlrf6+uzJfjCYncIFodGumPEK
	 v483biFVLo+6DJwHfU+MZAwD8KJkMeSA8HM7rDttytTTAenTgfJN7kT5eq6tXrnsMvSA7
	 fiWRBCCclQqr+4uRxnaWLYFBkC7mn/+ObdMGsi66Cw8SBAjIRTU08/5fRoc7xM5K1hRxX
	 Qnc8aU7XjxUG/c584cklIJqkk6i2wAReLR2JAgS2Zgw2lok7FtCftnzhgLMB5xznv7A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792849806;
	bh=2cl2Md2segWaJqhtFCKXdjIRvbSwv8Sb23G8cDg5TfA=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=gcEIVLzbueJYZca1EvWo5sMpHcLiZSeGLlMpRgrrMofzFNnrTc1nEmGLFEfTRBo8Q
	 n9FPVfSYR+pXzm4/PhPVB5Xv4pKUeMuKd/iPIWevvvoXYJb+AO+tbE7xugpNJ9Bz6+
	 +5WGrx3NH//Rto8nnoOm810bIhhLz+8qmantwrspNqukV49G9a48OLsD+b8rFx3JWv
	 i6DqBuNRTIrc5vrk4Cb3tYI8o9bXPHvjVwoaxxgTnuDhYwRyyrQWyRccVeVtjmxMM/
	 JcQvJ7C/Wggb+DgjTflm8EiN1EwLNBbD0ZbqzwEl3MC9gRTURjoItAn2isavt4WTKv
	 WFWJxLkxAgxxw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 726F56073C;
	Sat, 24 Oct 2026 13:50:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 76563380
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 13:50:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6813340820
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 13:50:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1_9s4lFtTUsF for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 13:50:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 922EA407FF
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792849804;
 b=e3h4ucK74dAriMl7qPp1kpx5G00qNQvl6a3+5VrCegYuQYw8XTx6ba2cgDzzbkbJOaAG
 IbErQKe7RM/ZkSJrlDZsdESfVCJkQ3l4n/SJOSvpob4rVpkdm9UFI83ezK5vRC+oDfLtg
 565NVHBLe63BeKAzyEl3NY6ndkwQtTUVG9hoIE0zak2pF1KtJoHf6HjMvvzn/4/Wv7ZWR
 8LfQEnZEOlbtSjz+tWUahLzbVuQsYQ5qtBNSaZpP9U9o9WdLRs07q/cDmrRGY4zxTwG/o
 YUs24lgxPEHCfl3gVY0+qnQ/PjTLF4Ui+KQ9GFHcHQMlDtTNK26ZEvVX87oduSz6mfw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792849804;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=Cu+8PwXxdinxwY/+lbIJAIwUlDErLa12w8+SD7rp8pM=;
 b=e4MbcnwAst58u1J4six29b5vfD24eLyR+1R84Ndse0twEfp/6cmTxXfIVwXoyOVP7sZ3
 UaIQUxAUQkHZPQajjspYn8+LCsV8frbGPmAsgLa0vIG/yn7lo/6UREPM0/1cZupP3FHko
 uLh/LYrz1nCEGGcQTzeTcyk597O1hKoWZJc4VEmKOuWxjYQHhviFxrL342c/JvUCG/swL
 cqa3StMvfINmqjBrfHBR32faprvh9ZBMaW7CulB9cqWGQmIhQ8lqngl+l9NlHLJuc0aHV
 QRqtKegMb+J5NPpGgu/KlOyzRdKqjfBkKbNKzIL0MmZwwfP+aiKryjrEW+LIP3TYMMA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=free.fr;
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b="X/cX3ssY"; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::13"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 922EA407FF
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 13:50:01 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 2684D19F5A5;
 Sat, 24 Oct 2026 15:49:59 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 via
 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr with HTTP (HTTP/1.0
 POST); Sat, 24 Oct 2026 15:49:59 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Date: Sat, 24 Oct 2026 15:49:59 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20261023184442.930656-1-james.hilliard1@gmail.com>
References: <20261023184442.930656-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.20
Message-ID: <b7ad3c6b0640630fcc244f15ceb9595d@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/python-xlsxwriter: bump to
 version 3.3.0
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
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 23/10/2026 20:44, James Hilliard wrote:
> Update the license hash for a copyright year update:
> https://github.com/jmcnamara/XlsxWriter/commit/fc6fd01016d6d71fb7048e135027e56b41d10d06
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
