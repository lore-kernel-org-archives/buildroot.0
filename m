Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7B18F9D0F1
	for <buildroot@archiver.kernel.org>; Tue, 14 Apr 2026 20:25:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 74B42617AE;
	Tue, 14 Apr 2026 20:25:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tVPJD0vdB5l3; Tue, 14 Apr 2026 20:25:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC85F60851
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776198318;
	bh=rB5h2HFhtuLvaXFHpiz/IBXsSVuJ84FhPXkOV4WksSw=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=owbfUPo4oeSupYInZrWAeVJ5MwX0QZfXAcg5e03PIjflliHQrKzev27UT7oWj/QNr
	 a5W3aIbFEebKrHuPX+XbNzM2LT68Sf/Nx8zZb/14doVrXnlC+RqYiQbOe+1c788pLf
	 dPnFgpnAYFnJlur/Y4F3mbpscDR1xsd7YtA7EGQnFQKkcaMzko1MuRC1aowpiWnUID
	 E/MnBMfIAwmvbGPR8d86kM8Q7jj09XVEc8dXPeYt+aHXCoygdSgRrTE7gJsPyNkmjs
	 fxT8v0ncHULDl5SaS7X/wS2RF1IezlOA003JN00WXboiQOpKRm3K2iVXkrOZo/58WE
	 S4duNvg+GML+A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC85F60851;
	Tue, 14 Apr 2026 20:25:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 690C2375
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 20:25:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 59D6B60851
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 20:25:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KwTZt4jPAX6T for <buildroot@buildroot.org>;
 Tue, 14 Apr 2026 20:25:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C9165607B7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C9165607B7
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C9165607B7
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 20:25:14 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id 4605A2003D3;
 Tue, 14 Apr 2026 22:25:08 +0200 (CEST)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 14 Apr 2026 22:25:08 +0200
MIME-Version: 1.0
Date: Tue, 14 Apr 2026 22:25:08 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, Brandon Maier <brandon.maier@collins.com>,
 linux-amarula@amarulasolutions.com
In-Reply-To: <20260413193003.1909496-1-dario.binacchi@amarulasolutions.com>
References: <20260413193003.1909496-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.14
Message-ID: <aee6a3d636ed2b307787f5c04c24288b@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1776198311;
 bh=yF56FcpEHBvd6TL43IGXNW1+MUC8VnpjRKS5N/etuJQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=tGXb9j6tQLjuFIMtzP1ko83XfYpttpuoQf+Jo9GRHXNa0skzTCOH26Lgr+ANDZ/8H
 1ZOeGlRTIWqsgEwnhu47F/CIAWVl3l4QIzlM/mqI4XJA5aB2SL02Sa2V15tJbo6g1c
 hsh88zR73x++VXGPwjn31xQ07efW1Wvc/7o/b3I/DDZtkf4b/Hlns/UVKTEKo+Szaw
 Jl/sICfG7ajlC16Es1hJwas3CgiWkZG8qAANuN1LU9nqgOxYPZt15xtzia3B1BdTEp
 ixfEUB+U7JwrctaFrs5ag99DFW31TJVPOTLg/kGlxcwl/OOfxEiiNPuLmh8apeA/fL
 5hCEYDbfiZ2pA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=tGXb9j6t
Subject: Re: [Buildroot] [PATCH v2 1/1] package/mtd: bump to version 2.3.1
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

Hi Dario,

Thanks for the patch.

On 13/04/2026 21:30, Dario Binacchi wrote:
> Version 2.3.0 added the fsck.ubifs utility, so support it with
> the new Kconfig option BR2_PACKAGE_MTD_FSCKUBIFS.
> 
> Changelog: 
> https://git.infradead.org/?p=mtd-utils.git;a=blob;f=CHANGELOG.md
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

The runtime test with this new version is failing:
https://gitlab.com/jolivain/buildroot/-/jobs/13921725964

This new version probably needs host-pkgconf.

Could you have a look, please?

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
