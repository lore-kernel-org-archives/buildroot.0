Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5196DCFC296
	for <buildroot@archiver.kernel.org>; Fri, 21 Nov 2025 18:27:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2518F40A41;
	Fri, 21 Nov 2025 18:27:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c9T45q1mL_z0; Fri, 21 Nov 2025 18:27:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4AD7040942
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4AD7040942;
	Fri, 21 Nov 2025 18:27:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id BAACF158
 for <buildroot@buildroot.org>; Fri, 21 Nov 2025 18:27:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A15EC40743
 for <buildroot@buildroot.org>; Fri, 21 Nov 2025 18:27:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NewyC6e0aK_l for <buildroot@buildroot.org>;
 Fri, 21 Nov 2025 18:27:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C4A1B40942
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C4A1B40942
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C4A1B40942
 for <buildroot@buildroot.org>; Fri, 21 Nov 2025 18:27:02 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id D62EA7803A2;
 Fri, 21 Nov 2025 19:26:57 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 21 Nov 2025 19:26:57 +0100
MIME-Version: 1.0
Date: Fri, 21 Nov 2025 19:26:57 +0100
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org, Romain Naour <romain.naour@gmail.com>
In-Reply-To: <20251115170133.1522658-1-bernd@kuhls.net>
References: <20251115170133.1522658-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.11
Message-ID: <9388123f191d252103ce9b3ae638accc@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1763749620;
 bh=F8FuWvNQbsNLXvcOX7ws92dne+YiYKhqfPBd927Hu24=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Rz4J515wUmPBUvGw1iFoET8+FPBE3JrJ73SuvgxRlSmB58vmLjJ8WDeNml46+Jj83
 jLFXdqHd3EekdMoCIpPBBC3ZSDdPgBTnGwkdDEvqEtgLhVb7k4EK2TaYp7d7lJ0GSm
 oIIqC9dQh7oBYQjnfoof31k6i1SR39dC8i5YMBMPIx4AALXu9uSWpj1PqA7CfDBJnJ
 kvzJgNaLo6iqa+XaE0HFV2FTm1MGnHNYvv1/eq4QV6qycB1f6XDZnDnlrn9GuNC6ni
 qrWBDSj9+QRz8EbwbxYjqIcT/PP9diHa2vx0sEDpyPMmfCOpNz+KQtTebi/m1Yq0hj
 URX7PW54dSyEA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=Rz4J515w
Subject: Re: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 25.3.0
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

On 15/11/2025 18:01, Bernd Kuhls wrote:
> Release notes:
> https://gitlab.freedesktop.org/mesa/mesa/-/blob/25.3/docs/relnotes/25.3.0.rst?ref_type=heads
> 
> Rebased patch 0001 due to upstream commit
> https://gitlab.freedesktop.org/mesa/mesa/-/commit/82bafaa1fa2d711f2cfa57fddddc3833c530f98f
> 
> Rebased patch 0003 due to upstream commit
> https://gitlab.freedesktop.org/mesa/mesa/-/commit/3bd0badd3a92ca0064e8d96f9e1b19651604262b
> 
> Removed VDPAU support following upstream commit:
> https://gitlab.freedesktop.org/mesa/mesa/-/commit/4b54277d2e9420e37cdce98b3a09e6cecf87300d
> Added Config.in.legacy option.
> 
> Added optional dependency to libdisplay-info for Vulkan drivers:
> https://gitlab.freedesktop.org/mesa/mesa/-/commit/2c870bbe20ccaed9d8c85bb3144075025d3c9a01
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/35461/diffs#0cc1139e3347f573ae1feee5b73dbc8a8a21fcfa
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to next, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
