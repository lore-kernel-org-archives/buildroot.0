Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CFB2CD3447
	for <buildroot@archiver.kernel.org>; Fri,  8 May 2026 12:35:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD30841B79;
	Fri,  8 May 2026 12:35:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xJRarOjdN1yK; Fri,  8 May 2026 12:35:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1DE9541B5B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778243711;
	bh=jYNw2jCllwA6bK+L6+nS+cimynRETPGmPk4OVWcxV9w=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=SaGanSlU1Rdv3cWn9hAEqgJA46j9OaS7LcPjAmVpoV2XaME2qE76hNccU8ItsNgeJ
	 Nt8ElLdpBBH8gs5r6M5MAb8jJXDua0rHCgYdZ3RtZTcnbhI0HMo5dGasS/0xzjnv1x
	 hmUcGhpf2i3JSWrrO2drVNodzGl2vKQ0YhiJmxJwPafVN0a9di6JaIXXgxzbmh6d1t
	 KmqQ2zksHl0TXqoi+oG03fnNkaCcN7mH53KhR9rGcuKH8Y2d/ET4u/e8kQlMpfqHen
	 nzVVw2YHOuZrVvhoqc1qpFKHUhyIQRARKTE6e3V02PqIS3+kQ3064oMwORSUqMfZxY
	 aos/SmSENK3WQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1DE9541B5B;
	Fri,  8 May 2026 12:35:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3F392317
 for <buildroot@buildroot.org>; Fri,  8 May 2026 12:35:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2496A8422E
 for <buildroot@buildroot.org>; Fri,  8 May 2026 12:35:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yAfsa1wmC8ln for <buildroot@buildroot.org>;
 Fri,  8 May 2026 12:35:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 45E15841B9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 45E15841B9
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 45E15841B9
 for <buildroot@buildroot.org>; Fri,  8 May 2026 12:35:07 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 7229619F738;
 Fri,  8 May 2026 14:35:03 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 08 May 2026 14:35:03 +0200
MIME-Version: 1.0
Date: Fri, 08 May 2026 14:35:03 +0200
To: Sofiane HAMAM <sofiane.hamam@smile.fr>
Cc: buildroot@buildroot.org, Bryan Brattlof <bb@ti.com>
In-Reply-To: <20260507202047.3809574-1-sofiane.hamam@smile.fr>
References: <20260507202047.3809574-1-sofiane.hamam@smile.fr>
User-Agent: Webmail Free/1.6.14
Message-ID: <63c4ad01d6dfd8d1d49bdfd436ff212d@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1778243705;
 bh=Ly1Ot75KJ43I/KNCTTRZ7w4LtFJweNQg+twLVPgDL0c=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=RLFDVrVjoaziDSFaqFMNM+qr/2H37q4EZgWtewDUmi/BwJIqij9Lj4vtJg3q259CJ
 +zoOkcpChDmc5XeGEgdUoxE9xQYgHRjtzg1aFsT06s9BEy0+CUGd4WDCPYMM8wn8pl
 R09XcRvgtyavfRx2YeTj6NlRpfsa4Y/4SP7ehy72uAD308EkZlhPkBTq2ArPEWmBaP
 j7IlG2qQd5Lh+g5onsY7bULgyqyWpqY/kmp7DdylncZ4J9Oawnw8B3aaAfCk/Q7f6t
 /9LSDK+46zmIGdaY2I4SXjxASemN19QasbGMg7kDVMQbSMewUdr3kPQc+9j/3EiJ8Y
 Ij3i6Cf46/4Xg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=RLFDVrVj
Subject: Re: [Buildroot] [PATCH 1/1] configs/ti_tda4vm_sk_defconfig: pick
 starter kit r5 and uboot defconfig files
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

On 07/05/2026 22:20, Sofiane HAMAM via buildroot wrote:
> Fix TDA4VM Starter-Kit defconfig pointing to TD4VM EVM instead of SK R5 
> and uboot
> defconfigs.
> The starter kit board boots just fine with the evm defconfigs, but it 
> is more accurate
> to use the start kit defconfigs for the starter kit board.
> 
> Signed-off-by: Sofiane HAMAM <sofiane.hamam@smile.fr>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
