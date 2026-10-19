Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D87EDCCF2DA
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 08:38:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9760A403EE;
	Mon, 19 Oct 2026 08:38:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GbYD9_8fjPUA; Mon, 19 Oct 2026 08:38:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org BE74040381
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792399125;
	b=fmqzEe1Hr8LDpUjplyRLw5If+ZOJuAcOdVWoMKyr/i3WPO3v/TJ6smuNEBl5CuDzqiLB
	 OzDry7YL2nk91sYMG5pMhs+qNdCN4hCOOevmbG4vwohjYk2rB/5jMQVBb3cwRpvbXInrs
	 I62TaKUj3+cdfiCmLYZruNZmoBaivU2nzzhrF0X/8tyy2C3T8YgM1JqaBGE1JXavbuGvb
	 00y/s8ToggcHYpGIkObOBURzQs7GQRo2IcCHHnwfQQdDGM723RY/odoesQX5MeQLXdFSP
	 s+d9xpQm5ZMmVj+GMktB6A+bqK62vfncISkrZdeZ1d20rWFSMv4S4dk88sHjfrElmRw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792399125;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Date:To:Cc:Message-ID:References:MIME-Version:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=0PDViDCABBsP3qydJHw7JomRDQxWyTaW6oJLif/mjJk=;
	b=WcpUHX24oUJ/fwO5/S9NN1xO7s3cf9UlK87K0eQeOyXBNm4Y7RCeIGvS0tIbBNYR2yCQ
	 vPbQTWQi3e5bPZjPLvpCKvs6xtq1HJGSvEwW3pzXqk2w5kTqpi/4jjCAePelgkGC+cUHe
	 65yTSwL9Hx4HHHxKTyGiav0M72cbEzVIkPPO8mWRYXmeYE8G1IdbWtKwWojjMdSRXOx3O
	 PYn5IJx6kXkr48VdFLLf0+su4CoeoqnGbVNmicKhWcGO9sEHRcBt5pPbd5FgPrpaiv891
	 DCkXMpCLkxxDnGMT4D4Ifyob8WwRq5qv2CxlLsSBQArub25sfD/JtDX63cF+V3An4uw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792399125;
	bh=0PDViDCABBsP3qydJHw7JomRDQxWyTaW6oJLif/mjJk=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=UenqC1hgilFmYkjZ5wWIfNEgl8RlOqu45Ib8YHyh+cyOLqsQVtGWT/fVc1kSV5uSM
	 4gCE7KoSWSsyCyZP3wdXIEkb/fi/mdRf3GSRxR/qVQ5vdNhiXms2jVeae/dTuP+ZHn
	 5aDXAPQwmTAQJX+R2XuFGvwQ9WDBkkK+qF2fhmeTa3LnrDkXtYmtqfIen8CRDS69zA
	 jgpO6Z/GowW1Jigbdw+9JiI22rknXvbjgnwx6b5yfwnIPu6feT1Z3P0Dqw/hIK6BDG
	 3pq40wCcdz7YgEOmDiO7XgXtsPB8IVBrp0PxpB3qn58iaeGQWh9X4DpLLv6h8fUcuJ
	 ur4THu0EwFuMA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE74040381;
	Mon, 19 Oct 2026 08:38:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DCF9263
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 08:38:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E7F1E40308
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 08:38:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TPR39u0Jircb for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 08:38:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org A6FB640702
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792399122;
 b=F0OeKIcugMycdGkNK4Gha46vpxd1/1UqGBczb0jFfGsdDWsO66pVyaYuQO723VXYCm5m
 l7C09oN/BuWiqVfTouShJa9BVWQKDtc5C631I2TeETLWvzwA5V1JFGrMYtoRP1K46ZOro
 a4w8a+REPB+YHVoN7g7SQJFRXXXveX/f5lVFIqXX3ZG9p3vRn+zrNXaargKQDqtx/6dD5
 Bnqhz/3j0KkET1cRs09aIlQd0OWeU+Pd20oXhe1KFQpRgreH9G6yW36KckKFZEBd47/IH
 RVN5b2y9lKfmAcrniSMJ423LZJF/e3U/EkW7pftHJ8GbL7mNjgJbon1awk1F6pC+oIg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792399122;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:Date:From:To:
 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
 bh=aaGfyPhbuvThO422lqC1A8z9L5OWPAHJWk4Ft6q0CEo=;
 b=S1+uSNBG/AcJpy2m1viY3BKN941la25HgGHXCTCdaG3/eNGfxbnrCg3PnSByzGk5VC0p
 6liBtXN1zZ+laCRCPiFuUq6YIn8P5nCuFaObUjPCq5SYvADrdZ1e+B3K0Bt9IWaqhJlne
 axSZhD4RfD5BbsaHwV2h2qI3NFaomY0SVFgJ5hYAF+xhSLYySO/HKeSY8mmZcwQ4pgKFU
 +NG/a6utVo2J5Psl5hzpSggHDJI29n8pkOG+HbgSbJ7NBmuy2GEHO59yrzpDiFPn9LMA4
 doRRzxa/fYLeNWsxc6UTrLKmvQZ2MP5UKTWYIpc0PrIM3xaFtlDbAu7ci1fg88jclmg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=AGcSOfwS; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A6FB640702
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 08:38:41 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 0F20E4E4128C
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 08:38:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id CE71760763;
 Mon, 19 Oct 2026 08:38:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A3AEA10328429; 
 Mon, 19 Oct 2026 10:38:36 +0200 (CEST)
Date: Mon, 19 Oct 2026 10:38:35 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
Message-ID: <atXW3FrSq1S21G3T@windsurf>
References: <20261018182507.536698-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261018182507.536698-1-james.hilliard1@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
Subject: Re: [Buildroot] [PATCH] package/python-cachetools: bump to version
 7.2.3
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, Oct 18, 2026 at 12:24:41PM -0600, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

The following patches have been applied:

3deac2f6d4ea2ac7dc5b4f8ce61cfede745386f4 package/python-cachetools: bump to version 7.2.3
4557cd6597076c7fc1d76c430b252b09f1cb895e package/python-chardet: bump to version 7.7.0
2b8779b40573a5df82249a781649d1a0e32ef899 package/python-fastapi: bump to version 0.146.0
23730639b96ce91562202476c79f536661cd3cf4 package/python-filelock: bump to version 4.2.2
7462a6a7536f4cff74d4280ddeaf623245a66a4e package/python-httpcore2: bump to version 2.14.0
52fc29ad9256db1bd5a71c50b09fe1d0b6f3e5c3 package/python-httpx2: bump to version 2.14.0
fbf4c4f0c4ed103866d00339093aa8abf08f77ff package/python-paramiko: bump to version 5.1.0
a6c5f4bf2e9794733ade18262712396000f9ae1c package/python-sqlalchemy: bump to version 2.1.5
05a6a2cf3aa8ac119b7e5b61dbf550cbae0a066c package/python-starlette: bump to version 1.9.0
2107d22b592616eb8f571536d0e34a16f5dc14eb package/python-texttable: bump to version 1.7.2

Thanks a lot!

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
