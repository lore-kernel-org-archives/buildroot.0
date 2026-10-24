Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BD47606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 21:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=QG2fQ/OT
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0B8166062A;
	Sat, 24 Oct 2026 21:16:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RhilDkZM7lbX; Sat, 24 Oct 2026 21:16:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2827F6061F
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792876604;
	b=CTbFBUigP7Ec5Bpiw0Elv4nmJV6kj8TE2xiFaHkvKJsVtCpByFbrIIpnB4EGsR+KLQbD
	 BZbc520etSxuRSUR7bJJrUHD8Zt9442ZYKfZxbkCe4cAVauAeap0L4xqNel8+G906Q1jK
	 ErS2M77ZOHjQuyHX6tzRkbk1WfMG5/3hm90O8wAx7ao8eSY9ig/JTd5c8d6ecWb+OXWlu
	 18nQzHdknUaYbaUDEH5VI/uGGwUjnRMfYun3dOpI/8eqKKfId5Lkdc2EEdhuqGXPC6y7t
	 KLQMn3ccve3rZFJHXa6E7mRJG+6nH27Zp/dJqVUfP+kY00JviOBYl2tttxLG7CXkthA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792876604;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=MWlD8MIbtwtGfl9FLdFQ18E0n65NA8ukjXf+OPBumfI=;
	b=jd67mLYQbK1FXU3oByLcj848Dw+6nC3duednyz48VJhWWxZLqrWo3dMHd8PFaKTcyIV/
	 CDn0AVeBSETce8/gN95WLem4hMoBqMrkTwYExxOkWssRvIuGjl1FbtlXfjLbgyPQCYA3e
	 tmCFL8nDhRsSPcg6gzrNOxrunRHKRBWJQfLdqbuBY93DAUFmSfsWyYi8rXOI+YjjxtIcN
	 J+xvvla6C2T/4N1Tfj1bIbPbGW/kG3jwXuZwD5TsjicRTnMtEwuZOrOtmrCCtKmopO38X
	 BrEox9SrE0wnP//gYGs7rv+Pnc8azVQKGU8W9wQub/+ck/HB0TY131zfEfUUUg8TFcg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792876604;
	bh=MWlD8MIbtwtGfl9FLdFQ18E0n65NA8ukjXf+OPBumfI=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=QG2fQ/OTUx7QRs6BWE4ayVggNOI+i62Q+AHiHURR7oOh6ZmpqiiYAIWBF1eWsqVRK
	 G3Vr8HYdcrSLjXsIL+3q//5ztuR4GqYCTj+eEO14dzrEaWyBPxxbVPt8DLEvCGDuza
	 E7NjHPxJb0CtQSDtDlHQw8ET69P1M7va4cFiVulUzDCNqDTZcb+52gHRyKVqS7MjYj
	 ImQyjo187xYR9YIIOQ3E+s8VIl2JTb+T8IzoRi74251SAWbm5otZyvf2EMy78IyrlC
	 jTqwwUsxIhmLwgEbsf4sltIT0+k4xf0k3ORFscVfiLSk1/VnTbUTEFRixM4OXWyI9h
	 n7NBepdtb9dKA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2827F6061F;
	Sat, 24 Oct 2026 21:16:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 980432F5
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:16:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7D63D6061F
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:16:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BF3Rv68RP0UV for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 21:16:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 24EE560606
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792876602;
 b=Bt94RBRPdp/DqAY4gCND+0ipcEJInnaqJn/0j1mCTo3XwApsXvOQnYf2x+7uMmDnwTrN
 cv/R+ct7pwR5s2DoBNDoi4rysA3W9OiMCYQeJxT0+RuDlrIGJnvwfJth86cfOFc7pAEJV
 MdlfTZu02lfD/qeckRXLfOCy2CgpcrAD3wGRtiRAYFsDTrHKZbjqyRZviFF73EOcPHRaW
 lAs+USFVJF40wk5yA7KSONxoBeQFuxbpsYAt/KQbii4+Um60XMCZaCK1cbqvaHRYv62dC
 edyRHOSLJffZfKpO3QIXscnKHUZa0ZGCAvkmNjTkbBgcd/Yjw34JCh+bXZO490GbTFg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792876602;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=3l+q0JhRwhp1lDiNaRdG6+Cq45Lrx09PtiKAVun9huo=;
 b=VvRFd3cQo0gSV8XAjOwiKJmTen+Lu5F9T0GJJAsP8kraQ9tcsgJEFQwz29s5CUQ9rWyJ
 UMtwfHLGLtvIeeNw9rsEptVHT7Dekn/vE+wl05+EcI2RO/jx2ByFIeaIyuaj1tbylzuhg
 mH4B72VzHqMoEtNrrE8c2Z/RFkbSj+BFbhU6EFdpKjWjvQrqG4lL462o46Lf5c9WjuS8v
 IFPeOsn8/HHpwXNQESraOVbnq7V/7D3mB/JYeUo7u79JVT0Cn/gaUUHgcEPkarzfYa9B4
 ElzFjelu3xYBzQDFr5cJSIXWAt+nSoS6u7CB53e4bERAynMkBlxJuVGbeTZVrjQg1/A==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=2tTsekZi; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 24EE560606
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:16:41 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 2C5C71A131B
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 21:16:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 0148960769;
 Sat, 24 Oct 2026 21:16:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 305C710328DD2; 
 Sat, 24 Oct 2026 23:16:38 +0200 (CEST)
Date: Sat, 24 Oct 2026 23:16:38 +0200
To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: buildroot@buildroot.org
Message-ID: <at0gCbhfnKkq6NtS@windsurf>
References: <20261024161704.4144810-1-yegorslists@googlemail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261024161704.4144810-1-yegorslists@googlemail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/ebtables: fix arm64 build with
 kernel headers >= 7.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Oct 24, 2026 at 06:17:04PM +0200, Yegor Yefremov via buildroot wrote:
> With kernel headers 7.3, ebtables fails to build on arm64:
> 
>   [...]/sysroot/usr/include/asm/sigcontext.h:81:9: error: unknown type name '__u128'; did you mean '__u32'?
> 
> Linux 7.3 changed arm64's asm/sigcontext.h to use the __u128 type from
> linux/types.h. ebtables bundles an old copy of linux/types.h, lacking
> __u128, which shadows the one from the kernel headers.
> 
> Backport the upstream commit dropping the bundled copy. ebtables only
> needs __be16 and __be32 from it, which all supported kernel headers
> provide.
> 
> This issue has been present since commit b216661a73f7
> ("{toolchain, linux-headers}: add support for 7.3 headers"), which made
> 7.3 the latest kernel headers version. It only affects master, no
> release or maintenance branch has 7.3 headers.
> 
> Fixes: b216661a73f7b8e21290a1bc9033e7f9b5fb230e ("{toolchain, linux-headers}: add support for 7.3 headers")
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>

And is the "opposite" still working, i.e building with really old
kernel headers? Maybe they lack something that the bundled copy had,
and it was the reason for this bundled copy in the first place?

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
