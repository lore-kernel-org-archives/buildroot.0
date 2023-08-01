Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBD5BC0015E
	for <buildroot@archiver.kernel.org>; Tue,  1 Aug 2023 20:43:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8390F812E7;
	Tue,  1 Aug 2023 20:43:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8390F812E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p_maRW0hVuZ0; Tue,  1 Aug 2023 20:43:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC19A80EC4;
	Tue,  1 Aug 2023 20:43:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC19A80EC4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5862F1BF476
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 20:43:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2794060B95
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 20:43:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2794060B95
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wgfF-f9L6AaP for <buildroot@lists.busybox.net>;
 Tue,  1 Aug 2023 20:43:30 +0000 (UTC)
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C4F4E60B42
 for <buildroot@buildroot.org>; Tue,  1 Aug 2023 20:43:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C4F4E60B42
Received: by mail.gandi.net (Postfix) with ESMTPSA id B8B86240002;
 Tue,  1 Aug 2023 20:43:26 +0000 (UTC)
Date: Tue, 1 Aug 2023 22:43:24 +0200
To: Daniel Lang <dalang@gmx.at>
Message-ID: <20230801224304.75590fd6@windsurf>
In-Reply-To: <20230731182608.21007-2-dalang@gmx.at>
References: <20230731182608.21007-2-dalang@gmx.at>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690922607;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iBMPhu/5LRUjjYyf08i0Hp/HQcWBZlPSr4hxqAGn/Lw=;
 b=NLz+K+i2dVejWiPF28cYtFwa4I1UH3z0wMcYOV4tOCYjgibjh76MlgOmnAhZAG95ep9P1Z
 4hBOePhnr0q3T5GppSiY4ywIzEsPH5SUTdUpGkGL4K/hVmNPot7z97A+dD39BUqc7zpwLU
 qDUu88FgKfxluBO148W9gKVLRyjD4VSWt1Ok0E22j2i83yy3BdBHJDTkPCknFURLr2+G4r
 tUimtNgKa7DciQHdBFuIF56XJjJ1INeK5y7AuK+uBCc0nYQtPhdHFtqdXMdtuWuFMCFF6p
 UzJai4UQR5olBlvoOQPA7ZugRoN9nL1TYKCYX9SKODZZ5M3PxsCjaiZVy6oD3w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=NLz+K+i2
Subject: Re: [Buildroot] [PATCH] package/llvm-project/compiler-rt: add CPE ID
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 31 Jul 2023 20:26:07 +0200
Daniel Lang <dalang@gmx.at> wrote:

> llvm:compiler-rt is a valid CPE ID [0] for this package.
> 
> [0]: https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=compiler-rt
> 
> Signed-off-by: Daniel Lang <dalang@gmx.at>
> ---
>  package/llvm-project/compiler-rt/compiler-rt.mk | 1 +
>  1 file changed, 1 insertion(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
