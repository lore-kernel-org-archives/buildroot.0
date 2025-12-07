Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BC73D1CDC6
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 22:14:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3CB4880C00;
	Sun,  7 Dec 2025 22:14:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iEIrQVsMLY9J; Sun,  7 Dec 2025 22:14:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C7E180BFA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765145670;
	bh=B4EiN+nNu6lBZkSJtibmP1AKoKalSHH77dYRBGTwScM=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=kt4CA4OM3N4YrpknEXcfL2PIEtT/A1S5SVMChdfbCXshJ4LMq6gvTobQ0KChOtTLm
	 6RasH122JbQuG3SmIgFW3QMSq0ISiV1zVuU9v51y2V2P7WRgcB/EOaLD3phNmlTTjj
	 yNJAjEpeh2fbypaAFe0ap/McLMPZKfnrmWwKJrEQSUMIf3VYdoYvJmE0rA3JOOnYO5
	 t4ghjwqXlo8EMM/Ljg3Kc/WhxKuxLDCcLgG1UzWB5Q9exLGu318aPcsKLZNwnOkKi1
	 EJIf6KNvUflCvJAF4eJZFEb9YRLXzgTsq0EsW6Ey2jvEiyYvR2FJeJ9jK7gx/UaoX7
	 tlNMYqvncQO5Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C7E180BFA;
	Sun,  7 Dec 2025 22:14:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D62152CF
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 22:14:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C7D8040637
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 22:14:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6E1qE1DBRTIa for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 22:14:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org EB65A40514
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EB65A40514
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EB65A40514
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 22:14:27 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id A9ADC19F574;
 Sun,  7 Dec 2025 23:14:23 +0100 (CET)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 07 Dec 2025 23:14:23 +0100
MIME-Version: 1.0
Date: Sun, 07 Dec 2025 23:14:23 +0100
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Cc: buildroot@buildroot.org, Joseph Kogut <joseph.kogut@gmail.com>
In-Reply-To: <20251206095116.2090087-1-giulio.benetti@benettiengineering.com>
References: <20251206095116.2090087-1-giulio.benetti@benettiengineering.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <a79a352e1f885c8253ece30fb90705f5@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1765145665;
 bh=yUo9J3LSI3N4RPFieEpwXNj+Pa+naz9vlEnabj54Yus=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=VZ5f5Uy2tpLLjrqq/EU7dR2tz5kqGp4oqzYPQgcks5Vvbu6uDe6fwYmcWybs0Q77g
 0ZtE3hfmy+LHOC91QE0Icv+seMCvggjnDM7yjTVgaV5jwTflAnWiW54WXsGIVr4rRF
 aWRF9+/xoYnvrZtEUi9aG1vQuKMdiopiViqJsOiUXesYmTycXJGAOazhKpOV71RdbK
 XkGaicTzreP0zAuRp6bzdyfjDezmPftWQzFkWbySgN6PeN/ORTusgY0f0YKvohhpxx
 OfUU3jkQ82Q5ZkevyikWdho7CnbJJFdOFdfTC9NgL5HTJuTlP7S/s9Nb6by0woKmTe
 JbDRWXBhOiGnw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=VZ5f5Uy2
Subject: Re: [Buildroot] [PATCH] package/libnss: bump version to 3.119
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

On 06/12/2025 10:51, Giulio Benetti wrote:
> For release note, see:
> https://hg-edge.mozilla.org/projects/nss/file/tip/doc/rst/releases/nss_3_119.rst
> 
> NOTE: libnss 3.119 require libnspr 4.38.2
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

I applied this patch to next, after rebasing it.

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
