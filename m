Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A783CD98CE
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 16:34:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4F1CB80DFD;
	Fri, 12 Jun 2026 16:34:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yS7UISmZtnpB; Fri, 12 Jun 2026 16:34:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3728280D56
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781282072;
	bh=Ie2tlRfPy7SHTAw4fdWuu4qOJ6jGZLyXmMPZ5iBIwsU=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=Uv0jvbrXhSn7FuyWqjLGpXdD8GYOMwg6YInXdXfkusqQVjurXnypJjtWMeO1GP17h
	 Ed/fh98aRD/gjou2j3jqtxJuyk9wtVRTn1pl8sHH1XZcJFN1vQ8wSn/9rkObOl/etq
	 Mal0NKh0osCBkNtuATjxo2DmmYwWqu+eWdZuCKv7hEEWCwnsRKb93VM9BIbR0+X4BD
	 6Tnb2piA31zBR193eyRqU/meXPBSBWQUIb3GB6TNhie6FzdbjL6rvCjzh5l846F/pE
	 kNGalJCorNQtHYbYMEtE/kiKRdKgQv9kIBanrWhldjhFs0jDaTm/7oglhr1QRUmoqG
	 P/CkCMNi6r/Aw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3728280D56;
	Fri, 12 Jun 2026 16:34:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9375812F
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 16:34:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8530240717
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 16:34:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MoFHfU8z_ZZf for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 16:34:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7FB6A4070C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7FB6A4070C
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7FB6A4070C
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 16:34:29 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 781CC780505;
 Fri, 12 Jun 2026 18:34:25 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 12 Jun 2026 18:34:25 +0200
MIME-Version: 1.0
Date: Fri, 12 Jun 2026 18:34:25 +0200
To: Michael Nosthoff <buildroot@heine.tech>
Cc: buildroot@buildroot.org, Sergey Bobrenok <bobrofon@gmail.com>
In-Reply-To: <20260608074258.279114-2-buildroot@heine.tech>
References: <20260608074258.279114-2-buildroot@heine.tech>
User-Agent: Webmail Free/1.6.16
Message-ID: <1b43e885928e0a193ff5af01c643fc26@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1781282067;
 bh=/e04OgRbJKpThJ5rVmYy8ksVr6Namo5jkEJ9dQonPco=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=LNsMUP/TCmlEhQrrx3Px36Pd4wEISJSReq1el8f7HXFthdQA7NpNbHkN6tXdGTc7/
 UC46JfUGQsVjXpj85Yo7zxlTxdtZXbW/dXqO9I5cuul+6Py9atezNgJ9+loxDFeZyv
 rX1Qu01cpPys1ddOm+GCE47SrToH3hZXJSV1iFerg1TfwIr+aIY8MOFIF4Ne1QW0Yz
 fvjKytBPP/owCODkAJOaN/smffc+kwugnGGPm6I9pxV2Bvc1nXsk6sTm1FNRV4Xxib
 4rVVe+LqpV9ifVtiCzUYgSrtzSYh6aQLbNPwXjaq+8oL7y0VWTG+smhuhEAUdNIbFf
 eG2ZYpTeIbIZA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=LNsMUP/T
Subject: Re: [Buildroot] [PATCH next] package/sdbus-cpp: bump to version
 2.3.1
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

On 08/06/2026 09:42, Michael Nosthoff via buildroot wrote:
> fixes an ABI break in 2.3.0
> 
> changelog:
> https://github.com/Kistler-Group/sdbus-cpp/releases/tag/v2.3.1
> 
> Signed-off-by: Michael Nosthoff <buildroot@heine.tech>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
