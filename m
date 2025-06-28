Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B629C7EE32
	for <buildroot@archiver.kernel.org>; Sat, 28 Jun 2025 10:19:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 200F241953;
	Sat, 28 Jun 2025 10:19:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7ay1iJAeOg8z; Sat, 28 Jun 2025 10:19:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6663D41956
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6663D41956;
	Sat, 28 Jun 2025 10:19:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 54C54154
 for <buildroot@buildroot.org>; Sat, 28 Jun 2025 10:19:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3A7C440213
 for <buildroot@buildroot.org>; Sat, 28 Jun 2025 10:19:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V15BAHSwAdsG for <buildroot@buildroot.org>;
 Sat, 28 Jun 2025 10:19:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2A6A44021E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2A6A44021E
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2A6A44021E
 for <buildroot@buildroot.org>; Sat, 28 Jun 2025 10:19:05 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id 0781A78034D;
 Sat, 28 Jun 2025 12:18:59 +0200 (CEST)
Received: from 2a01:e0a:485:b220:656e:cf44:475c:a8d2
 via 2a01:e0a:485:b220:656e:cf44:475c:a8d2 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 28 Jun 2025 12:18:59 +0200
MIME-Version: 1.0
Date: Sat, 28 Jun 2025 12:18:59 +0200
To: Titouan Christophe <titouan.christophe@mind.be>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>,
 thomas.perale@mind.be
In-Reply-To: <20250627151521.776955-1-titouan.christophe@mind.be>
References: <20250627151521.776955-1-titouan.christophe@mind.be>
User-Agent: Webmail Free/1.6.11
Message-ID: <1d4ee71f5dbc13bf94129f1e733d5359@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1751105943;
 bh=M11yuEh0gb8yj/2/X8YJ+C1VkSWopXjqaWqCBKmJqmU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=pdeVB/jmAHMM2/zcOcfp9ct68kIKSVbpQRQBF+UX5Kx8i+G+luDc6Y2EN/Nsn59Tx
 aNg2TPFOWhQ7VrARp5HHwsUrtNpMnNaj8d1GWskQtpeLIMgoKrzvdfnA7Hg+4VpPH5
 GLwzHnZgLSD2fozYvc0+G9ZDcaAGx22USYWguibN6pZc0oQ5w8lbBD8bK3bNnWH/X7
 5TMu3F1lr/t1Fn4zdYMHylgCGEyzqMVXLtNq2zKGQkYH87nhGBd/3RcEwne4MpKFil
 IZv8XYq8tnsFiL+wKaOiFFjdwxBZcmqP/qdP2O3nOOHAQZZ0FUmvXs/x9NO2JaG7hL
 e2NoW/yeRoXpQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=pdeVB/jm
Subject: Re: [Buildroot] [PATCH] package/libbpf: add patch for CVE-2025-29481
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

On 27/06/2025 17:15, Titouan Christophe via buildroot wrote:
> This fixes the following CVE:
> 
> - CVE-2025-29481:
>     Buffer Overflow vulnerability in libbpf 1.5.0 allows a local 
> attacker to
>     execute arbitrary code via the bpf_object__init_prog` function of 
> libbpf.
> 
> Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
