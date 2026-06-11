Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 722FECD8C9D
	for <buildroot@archiver.kernel.org>; Thu, 11 Jun 2026 20:52:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3BBB5822BA;
	Thu, 11 Jun 2026 20:52:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1cddsnbzSnYw; Thu, 11 Jun 2026 20:52:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6421280EB8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781211149;
	bh=U8RKTnSPrQJAatOkJT/NWLIyZMO7wsDfq3yP9qhZUFU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=ZHBXEKgyoSXygJuqejNHTI7xXxrnR3gcGEmHRBSzK0q2r2v/GFqLJvx7RlazqeQJS
	 cRANjztyawbuZ0hC4oA8fDoShHsOg68OqnP8O+Hl12HqQpmOO52oefXaI73C8Ql+Kp
	 8cr3ebh5yN8bRD8A9axfo6+AgBA98l8hp6MrSMtSxf+44yQ3tepG/KGH/nDRWnXSGY
	 dL96wWHpyIdDkgyuoct4dlAqp84bQzmkk0oJ37lZO7iwxW2Tr5CGFOhfm65Dcj8Lsv
	 NWBLrwx7do+zq+UqWZp5roe0k4ajqIvsKv5wAEn45+ov3cd3bTfap4zhV6vFICWT4H
	 0IortFuvXZ+Cg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6421280EB8;
	Thu, 11 Jun 2026 20:52:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 66BFCF4
 for <buildroot@buildroot.org>; Thu, 11 Jun 2026 20:52:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 482CC80EB8
 for <buildroot@buildroot.org>; Thu, 11 Jun 2026 20:52:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AMZXImAbSV88 for <buildroot@buildroot.org>;
 Thu, 11 Jun 2026 20:52:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 42A5680E69
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 42A5680E69
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 42A5680E69
 for <buildroot@buildroot.org>; Thu, 11 Jun 2026 20:52:25 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 55C09B00548;
 Thu, 11 Jun 2026 22:52:22 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 11 Jun 2026 22:52:22 +0200
MIME-Version: 1.0
Date: Thu, 11 Jun 2026 22:52:22 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260608182656.1213082-1-dario.binacchi@amarulasolutions.com>
References: <20260608182656.1213082-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.16
Message-ID: <f79d7e178ff1ebb5475d936234324b82@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1781211143;
 bh=78d5VxJ15qQjPfxQh8ruieero0YK4NM/ruhGDE37vpE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=RZ2RMlvQOP7iwCNdwvP4PFzvxr/YnhUJFZT21Z4A+gWtkUIdEHE2rB83LBARiqx0y
 sqobBn9uEmUuCw5qO3K7gKyy+AtQgUj7ckwr/qVzY6N5xEYp36Qx9k9ZgXVQdt4GVa
 WA+GeqGYSFV4x2QBUriUtA5C1/ybK0H6wF3sDPExPHe0LNJYVLccu8/fnR6SBvZpwo
 9CpabNGbftmZESiygl2KiHNvGdSN5/8O01WWGBmMic3f34xOZZwrNHeiFNQVE8t9eX
 0UBtCObshrCYh07iw5gZt3uFHSBdXat+5DFmkgcg3OB/tenVteGURMix3nQ81qm+6z
 O+zCP/Blj07Ig==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=RZ2RMlvQ
Subject: Re: [Buildroot] [PATCH next] package/less: bump to version 704
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

On 08/06/2026 20:26, Dario Binacchi wrote:
> For change log, see:
> https://www.greenwoodsoftware.com/less/news.704.html
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
