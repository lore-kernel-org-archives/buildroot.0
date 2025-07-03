Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12EECC83030
	for <buildroot@archiver.kernel.org>; Thu,  3 Jul 2025 19:55:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C986A83C9C;
	Thu,  3 Jul 2025 19:54:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zmgRAL-yBn-W; Thu,  3 Jul 2025 19:54:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 39CE0810DA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 39CE0810DA;
	Thu,  3 Jul 2025 19:54:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 84C48193
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 19:54:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 766FC40571
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 19:54:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sUDqInKpD0Ag for <buildroot@buildroot.org>;
 Thu,  3 Jul 2025 19:54:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A672940590
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A672940590
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A672940590
 for <buildroot@buildroot.org>; Thu,  3 Jul 2025 19:54:56 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 9475D78052E;
 Thu,  3 Jul 2025 21:54:52 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 03 Jul 2025 21:54:52 +0200
MIME-Version: 1.0
Date: Thu, 03 Jul 2025 21:54:52 +0200
To: Thomas Perale <thomas.perale@mind.be>
Cc: buildroot@buildroot.org, Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
In-Reply-To: <20250703182831.4027280-1-thomas.perale@mind.be>
References: <20250703182831.4027280-1-thomas.perale@mind.be>
User-Agent: Webmail Free/1.6.11
Message-ID: <2772f91992a9b4ca8ca2a31744ff3a08@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1751572494;
 bh=lIfsuWJo3JUmKqZJ+on2prN/Mvq8UcfXefoO1smZz4I=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=HAl8HEVF1p3YNx1saCNjkPTDQDB9RSBIw++nk9DIp9DNSi0uQmEXm1xqf4gRSrv9r
 yqXgS9l9heouCTLUAiPPc+MFjqsAm5QS/MKsqJmG60c9f7QTgVZ9vBnS6w6GpMwx9q
 EA4ALPzceknwJNZYogTDX2KWb00/QM4Y85unPCUibvjuX3+XJXvznE715cQPAxSoWf
 pyJ56fBGWScZqX+GlkGdwPO4Us/KaCaOxAWPyL0Ngq8+hvBm5N1c15dt5QcC52dOuE
 ZMH0obaa4WjKGnWUO/8uG8f2QLNe7I/Gbgpnlu8+srST7H7OztxT6vpovf7/EfN1LM
 iFjDC/6mSHY+Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=HAl8HEVF
Subject: Re: [Buildroot] [PATCH] package/cpp-httplib: add CPE identifier
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

On 03/07/2025 20:28, Thomas Perale via buildroot wrote:
> The cpe:2.3:a:cpp-httplib_project:cpp-httplib:*:*:*:*:*:*:*:* is valid
> for this package.
> 
> See 
> https://nvd.nist.gov/products/cpe/detail/955012E0-158A-4637-99DE-37520A12BB7D
> 
> Signed-off-by: Thomas Perale <thomas.perale@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
