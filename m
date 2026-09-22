Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39CC5C98307
	for <buildroot@archiver.kernel.org>; Tue, 22 Sep 2026 16:55:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD3E980E8B;
	Tue, 22 Sep 2026 16:55:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r7lJQ1YhWffi; Tue, 22 Sep 2026 16:55:49 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 186DE80E8D
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1790096149;
	b=EmjLBU2paRBWX16jAZtyX6Te5RNPAv95ljVsNdnmjvEt+nqoJ4eltgMSdNosHKwhGipj
	 cJM58tVimY3RMmpuTS5qLVdPs33bJIV7w2trbjcQxgkSRM4t/nXmPqGdgofRrxhN/PLnR
	 PkVuWYLO617XEd6y1Rs2vDZ3HBi2SGKZA+njzoVwYQDff8aSJkzlmKP7Uuq/+xzFNmSmR
	 VBxz55c5ezW1rvoVXO5crjHfy+14wGUSgZBWeKMX3XX09K78UYeUK3HXsj3p89zAkSJGO
	 /iB5UURaGouqrjJcIdcpZf7/cRo4JXYo8G/8NRX+DJTHP8oXZOomFnD+fupSZYNuUoQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1790096149;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:MIME-Version:Date:To:Cc:In-Reply-To:References:User-Agent:
	 Message-ID:X-Sender:Subject:X-BeenThere:X-Mailman-Version:Precedence:
	 List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:Content-Transfer-Encoding:Content-Type:
	 Errors-To:Sender;
	bh=8qMp2ja2iEbWZ/k5nwTrTkSv1ieF7h7Mq96oEqBLtDQ=;
	b=M8kEkSqIwPIkGzwoPTN7I3cbViR2s6Aory8LrrPQ36l6lJ976mFp0ReBeyrSh+J1/h7t
	 GIum2qX7Kp42cu45GluxR01C3yELBFEq0VcuAhdO1WCRk9w1HCuNJOTmGWPRFGIIkpme/
	 x1AxR5444xuxVZ0BJFjmF3z3hUtGNInil2IwXDuv3kJCl9dZ4oz9XuIMCRZvTtk1NOsBX
	 tTwoT0uNmuX4u8WW1YZtmtVUB+wZ/lFfZZzuKD7xx20/3BjgXJnUkBJRuae93TRSAWTTR
	 eX3MVUA8R2xgItv6O082YSq7nO9KPJBoqoIhFl1rBj1fp9irwUrB/ke7C+lt2mqm/wg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1790096149;
	bh=8qMp2ja2iEbWZ/k5nwTrTkSv1ieF7h7Mq96oEqBLtDQ=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=JiCpRDlVbepMsn0kEgbyZr9taxdEgSNY9+D2f+Aqp6wbUrIK0zpaepuCInIbwlRnf
	 msnkED9I3b4bqZxWUZ7vSKiEomojY3kumlqokWbXQnluiIw5SjHsf1dkhsoumTBGcZ
	 Kp0N5HQ8kinqTp2cN4ZOGxIR8mLYVJFV8w8Ti87X94gw/w8/umA+Z3RHND/gl5qBNR
	 PJcNol7i7dBcxkqTSuSvKZbCMvm/6VIkohg1PNTnXrmM5jOwSQq7sXcmSUjkqUaFyo
	 q85LZmzoKz+LaV4zw28KmTKRn/Flepa5oRAnYgHRrUgjygoRMDSZ6Kh/SwzlFelvBG
	 izF3ensiWB+jA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 186DE80E8D;
	Tue, 22 Sep 2026 16:55:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id AE38E352
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 16:55:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9380E80E8D
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 16:55:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gHDuCNbl25Er for <buildroot@buildroot.org>;
 Tue, 22 Sep 2026 16:55:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 9B13580E8B
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1790096146;
 b=RtIkOmL39gkOmcWjSr3TcTEY4GTEOR2nzcZf2gyxQrEsZjcsufkoi5kQXKlvIQwoCilH
 0RcSI9pk7aBs+JmAi6Wt0Mq5orI4rPcSHIJLSAkzG5O7ZEy1a3tehe0U42c2GYXvFNXGk
 zd3Wd/TF/VPH7rpUjzz7l0WrOiARyXDw7Ov2zowke+6DV7aP6zNhpYqxtyoN8lYY9G9xU
 WXDE5Wr4T0zE4KMnJDHa4xEezhmFA0L/zBIze8q+Pt6NSDhc1dDLyIUp2QhgXVp3opMTg
 ZMX3hCBTjQZEzVPzh7+W3opYC6OkkTxxZY7s4kZwsNSBAuZeylMvZP28WsX98i8KMmQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1790096146;
 h=Received-SPF:Received:DKIM-Signature:Received:MIME-Version:Date:From:
 To:Cc:Subject:In-Reply-To:References:User-Agent:Message-ID:X-Sender:
 Content-Type:Content-Transfer-Encoding;
 bh=1ZL5Rz//7YJ6NSBJv3apkAr81jsbLd4SvDxUU2RXlC4=;
 b=b6ihzt3+6Pzt+B+EET+h5SdHsITGqPMWEfF++KokJORua2ShpV4myaR4Tn/Dkf0ompPv
 cgf5QW2zLxz6TUkOd/JvmbnYQBYkwiN7fmZiiO+tav/tcQ+PFRM0JwFrn/P5olZT59EJq
 NIdyeQU/1Fw17NtyCdekyreulT4iDI2dXcuTiwIGbyZMkzKDLtFL998zfjloK4tzaryum
 7iijzAA7A6+ZdqKkE1HEik6Zp7C+9wd3uHDsOEy+vXCOEvmky3ohPoFKrvHCTnCgj4lFR
 RzgyVQGpBLttyOYMk9QIGHpQsdN072DZpC9RFmMdctwcAX/O/TdGZBK8ypMqiBVDb2g==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=free.fr; 
 dkim=pass header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=MdsateKU; 
 arc=none smtp.remote-ip="2a01:e0c:1:1599::13"
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9B13580E8B
 for <buildroot@buildroot.org>; Tue, 22 Sep 2026 16:55:46 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id CEF9719F576;
 Tue, 22 Sep 2026 18:55:41 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 22 Sep 2026 18:55:41 +0200
MIME-Version: 1.0
Date: Tue, 22 Sep 2026 18:55:41 +0200
To: Fiona Klute <fiona.klute@gmx.de>
Cc: buildroot@buildroot.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
In-Reply-To: <20260921235239.3826789-1-fiona.klute@gmx.de>
References: <20260921235239.3826789-1-fiona.klute@gmx.de>
User-Agent: Webmail Free/1.6.19
Message-ID: <6d025596ab3d21a4716b1e162cabab38@free.fr>
X-Sender: ju.o@free.fr
Subject: Re: [Buildroot] [PATCH 1/1] package/kbd: fix static build with
 uClibc
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

On 22/09/2026 01:52, Fiona Klute via buildroot wrote:
> Since upstream commit 7fdd8debe37ae52812b77d82e08713bd62c607f4 [1]
> (included from release 2.9.0) libkbdfile unconditionally includes
> dlfcn.h. uClibc provides this header only if shared library support is
> enabled [2], so building kbd fails if BR2_TOOLCHAIN_BUILDROOT_UCLIBC=y
> and BR2_STATIC_LIBS=y (BR2_SHARED_STATIC_LIBS=y works).
> 
> The issue has been fixed upstream [3], backport the patch.
> 
> [1] 
> https://git.kernel.org/pub/scm/linux/kernel/git/legion/kbd.git/commit/?id=7fdd8debe37ae52812b77d82e08713bd62c607f4
> [2] 
> https://github.com/wbx-github/uclibc-ng/blob/v1.0.59/Makefile.in#L260
> [3] https://github.com/legionus/kbd/issues/159
> 
> Fixes: 930660890bf8b40d9bd55cd9e202e574b53d5d49
> Fixes: 
> https://autobuild.buildroot.org/results/872d12bf869717ae8aec9a2ed6295cf8f7e8b098/
> Fixes: 
> https://autobuild.buildroot.org/results/056b5fe4ca230989041a1ed166c1b509f8bb0908/
> 
> Signed-off-by: Fiona Klute <fiona.klute@gmx.de>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
