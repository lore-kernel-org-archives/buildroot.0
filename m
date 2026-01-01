Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0EB6EED630
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 17:52:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D6E5C406A3;
	Thu,  1 Jan 2026 17:52:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QnPJ0Fdt-P5E; Thu,  1 Jan 2026 17:52:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A6C2D403CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767289940;
	bh=syM2Gaho5hsVSMNmwRj66oFHoRcQ/1UQYIYXeY+Cf/I=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=R5XUXoHTXfxH0ou+VnGWHnNDObZv5BgV0PNN3hum5NQyDQEH2rOcy8YJOdx/aF9OA
	 jiiEjSn3e7lk6eSTZhbcRnNfNgGV/vzlPU54c/7FJ3QhhfqOMv9WHqHBpFLuSHab/x
	 ZAacwEH1sBxaR8zKPe2I37VI8V9e6cB4m8+MnaI2zhGQU5qxCypSK3eRuNr85FYBQX
	 E8SQxL5A6jseMDlrwfhWDmx7IboLkWiPj2hy7KIAYHx35xlMqoGprT88pujArdv6PM
	 uokNltwXvfZ7e/69RqFKlYCOgh6BZLHgv20nUx8sKI2lOSQaTJL7kOXJ+r4rpYPuZx
	 ibfpTHSC4dRHg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A6C2D403CC;
	Thu,  1 Jan 2026 17:52:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9DC3D19D
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 17:52:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8333760686
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 17:52:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AKgjWqsirP68 for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 17:52:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::11;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9F59F60685
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F59F60685
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9F59F60685
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 17:52:18 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 651922003C1;
 Thu,  1 Jan 2026 18:52:13 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 01 Jan 2026 18:52:13 +0100
MIME-Version: 1.0
Date: Thu, 01 Jan 2026 18:52:13 +0100
To: Pierre-Yves Kerbrat <pkerbrat@free.fr>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20260101163545.1848514-1-pkerbrat@free.fr>
References: <20260101163545.1848514-1-pkerbrat@free.fr>
User-Agent: Webmail Free/1.6.12
Message-ID: <3770756d1a056a56d2869b55a6f51bf7@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1767289935;
 bh=BRVVlz/p27i4WjTZWEd8VsVr/GjTCJ4gLYW38gmh3MU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ElijtjW4I7FG3CJqIrDV8kp83MLRfhas5nyMKJA5FApjiQLZQOmrGoyEyRJJMTZkf
 gluKYt5qlJ6qK5d8gnXl2s98vqk0sGP0Zh0d70zl7eupmZo8wliZgiQMPtaMkeh1RX
 PD0Ajk6GtaBwD2Qg6qM1zXFm2732kpTJFqUSiXh3p4NrBZRJJW0tD3djN3Po5KXTbN
 fzUlEyRimjgSYdrDYxTFDgLOkdIZD8z68lJbhzSFjaHoDhIwWpSxuGcOAkX+KkJtQq
 TIV1ntYO7kiWjVU9U7hHXHPP5ErS/0raKu8ctHADo7vhng59v2oe8FIEnFeiPbzoq5
 HqLP41yZrdJXA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ElijtjW4
Subject: Re: [Buildroot] [PATCH] package/stress-ng: bump to 0.20.00
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

On 01/01/2026 17:35, Pierre-Yves Kerbrat via buildroot wrote:
> Removed unnecessary patch after merge of
> https://github.com/ColinIanKing/stress-ng/commit/05353c7a9d0439e250f82ef9fc5643149811bb24
> 
> Changelog:
> https://github.com/ColinIanKing/stress-ng/releases/tag/V0.20.00
> 
> Signed-off-by: Pierre-Yves Kerbrat <pkerbrat@free.fr>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
