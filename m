Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 698D0C02183
	for <buildroot@archiver.kernel.org>; Thu, 16 Jan 2025 18:57:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 334644202E;
	Thu, 16 Jan 2025 18:57:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yx9QAFSFutOn; Thu, 16 Jan 2025 18:57:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 20F4F42386
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 20F4F42386;
	Thu, 16 Jan 2025 18:57:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 244F694B
 for <buildroot@buildroot.org>; Thu, 16 Jan 2025 18:57:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0FB8E4162A
 for <buildroot@buildroot.org>; Thu, 16 Jan 2025 18:57:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wXS9dFh-Vfps for <buildroot@buildroot.org>;
 Thu, 16 Jan 2025 18:57:16 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.2;
 helo=smtp2-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E675B41616
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E675B41616
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E675B41616
 for <buildroot@buildroot.org>; Thu, 16 Jan 2025 18:57:15 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPA id E28202003DC;
 Thu, 16 Jan 2025 19:57:04 +0100 (CET)
Received: from 82-64-214-120.subs.proxad.net ([82.64.214.120:58218])
 via 82-64-214-120.subs.proxad.net ([82.64.214.120])
 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 16 Jan 2025 19:57:04 +0100
MIME-Version: 1.0
Date: Thu, 16 Jan 2025 19:57:04 +0100
From: Julien Olivain <ju.o@free.fr>
To: Neal Frager <neal.frager@amd.com>
Cc: buildroot@buildroot.org, ibai.erkiaga-elorza@amd.com,
 luca.ceresoli@bootlin.com, brandon.maier@collins.com,
 thomas.petazzoni@bootlin.com, romain.naour@smile.fr, michal.simek@amd.com
In-Reply-To: <20250116150133.3828534-1-neal.frager@amd.com>
References: <20250116150133.3828534-1-neal.frager@amd.com>
User-Agent: Webmail Free/1.6.9
Message-ID: <0295ddda35c1b4251223c82d08568a76@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1737053832;
 bh=POYRfeLW5Y3nT05+vRBrix2n2A6mFqIMgYZCGSjfF0Y=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=hKhuRCdGqb5UDTYEWnis0fDp10XEbA2YNh8fg2NmMQ6rvOTEMmf5taXTLhqk09Av9
 q4ULw+k0VNnRc5dowVUNcLncC9TBtl1jc67Bpft/cmdfQhvKXdwbWgqzXEsZtW0V5a
 j83Lf0oOhWE5MSA2P2DdGwRzHjvsHV6RE07BdmVhVmAAR2zNQK8Zt3/uyu/4uQMCwc
 XGzxLfVwQLlG/dDSlJcxUJtKaBrzy7moaeXO4R53b5iohXXPy7gZzm/qL4t9ZqaYe6
 ct9LbjUt7ss/wEQi0Ah6lUHXRMaTG/73r7y1vF6lWp6WdwXNmgKlRFYE9Q8P//8NMm
 7sp7ytDn45lcA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=hKhuRCdG
Subject: Re: [Buildroot] [PATCH v1 1/3] configs/zynqmp_kria_kd240_defconfig:
 bump to Linux 6.6.60
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 16/01/2025 16:01, Neal Frager via buildroot wrote:
> This patch bumps the zynqmp_kria_kd240_defconfig to Linux kernel 
> 6.6.60.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
