Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1186D12D7B
	for <buildroot@archiver.kernel.org>; Mon, 11 Nov 2024 06:55:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 18ED6402FE;
	Mon, 11 Nov 2024 06:55:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o3zVzk6Vswy2; Mon, 11 Nov 2024 06:55:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ED932402FF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED932402FF;
	Mon, 11 Nov 2024 06:55:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 53BB06C
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 06:55:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3CA1D40289
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 06:55:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AoHaRkiAOet5 for <buildroot@buildroot.org>;
 Mon, 11 Nov 2024 06:55:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.5;
 helo=smtp5-g21.free.fr; envelope-from=vjardin@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9CF3C400D6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9CF3C400D6
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9CF3C400D6
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 06:55:09 +0000 (UTC)
Received: from L25025.local (unknown
 [IPv6:2a01:e0a:2af:22b0:812c:23ef:fa95:555a])
 (Authenticated sender: vjardin@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id DCDC15FFBA;
 Mon, 11 Nov 2024 07:55:04 +0100 (CET)
Date: Mon, 11 Nov 2024 07:55:04 +0100
From: Vincent Jardin <vjardin@free.fr>
To: Julien Olivain <ju.o@free.fr>
Cc: buildroot@buildroot.org
Message-ID: <vepx2w2warnmkbqu3gvvjjnkksuzxwzxnpquqvxcwhptewnpmu@pehogc6wdi5t>
References: <20241110190440.3CD6385FC3@busybox.osuosl.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241110190440.3CD6385FC3@busybox.osuosl.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1731308106;
 bh=UFcLN7QJINlmj2YXW9G97B4x1++8rHYTyIMaFq698EU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GrXEr1ziLziQASsiGMnniVzvwHg+XDFDpknrbZbfqUMb/U2cZHF87RSywJZtnez/m
 FwdhrM5NY7Y/1v95zvqZm4gaJgiTlbnBo0woSIAtLDiW5PxGRPvTM6dFjYCnlrxUTK
 tIX6NySSa2HmXv+xFDy0bUPaJVz54UI8RulYLECh+wgEpSLHnQf9XLT989hb5xS/ci
 AUpmt+dTA/Fm8K39J1jlNmZ06nq5qr5gaAJphsUFujaeWLasDk8687Ln39WzvbQFtB
 wjw1zIDQKEqXVRr5uKxp8LsEKAqUW/0yycu3NA2WN0pfoTumuXlDx3osAkn/m1Tuqe
 CaM9O5EkroGPw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=GrXEr1zi
Subject: Re: [Buildroot] [git commit] package/bfscripts: new package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sun, Nov 10, 2024 at 07:33:08PM UTC, Julien Olivain wrote:
> commit: https://git.buildroot.net/buildroot/commit/?id=dc4a5acfde2b0285548f0524ab8bfb10169294f4
> branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 

thank you Julien !
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
