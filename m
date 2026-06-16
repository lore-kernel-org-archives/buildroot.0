Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69A22CD98E4
	for <buildroot@archiver.kernel.org>; Tue, 16 Jun 2026 16:52:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A8B342CD2;
	Tue, 16 Jun 2026 16:52:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N8TD-mahWc1V; Tue, 16 Jun 2026 16:52:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F2C6542C63
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781628727;
	bh=BRgP3Sc/cNwOPN5XGfjFRQ+K/dAy9XwL6D8xYaxzo7Q=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=O5/RNPauRIlJuT4eviFoxoJN0T8A+ZhqbIMraYAG/acLyuy6tRmULU8tAYiAPnL+T
	 3tj+F/F1XlzWcIVbfsk9jyJWXxvHYnyytkvsGW2DCdrNgpKeThFaaYcOjRgzksjgUL
	 4X/lUNpMyedZ89XhDrkoVp8fxiYeatPLB7nV89g441Q8HJl1OweS6KgJFu+SeskWdZ
	 phlxg1IRwF+NSH2gVH7zTGp7xGBldXQC8XOFIYDBlmlVYSfDxrNPpJf7f9nP5pvbOA
	 +uMoDdstrbGtgemGzKDvhXK8UCRndrmpefEJ8ipDFLH9Usdi7Fz8L14ElS9vsk7Ul4
	 36z5Cp0KspTbQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F2C6542C63;
	Tue, 16 Jun 2026 16:52:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7A6D1169
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 16:52:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6CD708524A
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 16:52:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sv0Oy6WlJ-d8 for <buildroot@buildroot.org>;
 Tue, 16 Jun 2026 16:52:04 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 45EC385244
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 45EC385244
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 45EC385244
 for <buildroot@buildroot.org>; Tue, 16 Jun 2026 16:52:03 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id E1D78780502;
 Tue, 16 Jun 2026 18:51:58 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 16 Jun 2026 18:51:58 +0200
MIME-Version: 1.0
Date: Tue, 16 Jun 2026 18:51:58 +0200
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Giulio Benetti
 <giulio.benetti@benettiengineering.com>, Romain Naour
 <romain.naour@gmail.com>
In-Reply-To: <20260616071602.1201697-1-bernd@kuhls.net>
References: <20260616071602.1201697-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.16
Message-ID: <62fe7c5813529bf2c3455ade05d92d71@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1781628722;
 bh=Sy7CkEvEg8m5/r3MyBKkCgl9NRgv+jkRD2mFMDjf2uo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ftFqXpwqJLNhqnIvsRfce6eIY82eQLIwCQDpweZ0WT3tK1jLCsuEBYXbKc3NmXHhN
 AlCH9NSphsyG/7jdr3FhNDKvXw0VY3AjvLvT/eenhgarQ7q5QadBsSeULHdyjbz9Xs
 82rIJJQiogTsjdvMTmrxhaJhPzOtWAB2aEmaWBrSoVqZEzh2DR1lIO5IrWK3MEC7co
 5hTDMEIyiOaFbj2Mlq24gppm+r6t9FaAy9dTEDSBlF4P+voRI1uzrXK4ssMm1Y9F9q
 baDFXH34C1oXoGoezTuREcNtT5/lL7bdVEbs+EurQE+nIRA8v0KWbWzrmeJVxDTRLO
 xI2VqS+LVX/ug==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ftFqXpwq
Subject: Re: [Buildroot] [PATCH 1/1] package/binutils: bump version to 2.46.1
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

On 16/06/2026 09:16, Bernd Kuhls wrote:
> https://sourceware.org/pipermail/binutils/2026-June/149568.html
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
