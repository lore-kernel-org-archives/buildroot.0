Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D15A0C35FFA
	for <buildroot@archiver.kernel.org>; Wed, 19 Mar 2025 20:41:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A9B1405D9;
	Wed, 19 Mar 2025 20:41:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ied6G_br_Vik; Wed, 19 Mar 2025 20:41:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6965A411F0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6965A411F0;
	Wed, 19 Mar 2025 20:41:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D9F52D8C
 for <buildroot@buildroot.org>; Wed, 19 Mar 2025 20:41:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D4E7C40252
 for <buildroot@buildroot.org>; Wed, 19 Mar 2025 20:41:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o_5c-h42j20L for <buildroot@buildroot.org>;
 Wed, 19 Mar 2025 20:41:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 14B4A40114
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 14B4A40114
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 14B4A40114
 for <buildroot@buildroot.org>; Wed, 19 Mar 2025 20:41:35 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.1])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id B5289B00573;
 Wed, 19 Mar 2025 21:41:31 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Wed, 19 Mar 2025 21:41:31 +0100
MIME-Version: 1.0
Date: Wed, 19 Mar 2025 21:41:31 +0100
From: Julien Olivain <ju.o@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Cc: buildroot@buildroot.org
In-Reply-To: <20250318160701.25265-1-bernd@kuhls.net>
References: <20250318160701.25265-1-bernd@kuhls.net>
User-Agent: Webmail Free/1.6.10
Message-ID: <6ff018fb5e637da6ad048f8555711dc7@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1742416892;
 bh=ALHCwVVMsno/o3faY1Bk+rJKOoLQ80gkJk5ej+y3Y+M=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ZfZHesaPexkP6whbx0gKwqw3ravk+dv2E6cWMWy5AbbkdbzCcS8SJMqU34/Nlc+jL
 VJcIO6AlXaTQ+Jyfjn2W+N9ZEkqx7gd91y0ruI7xbxUSVMC98aSquc1sl0xFvbCRdm
 u+kVqKsmgOiIIoFCZxZ5/1Hq3QlMth8Vf2ZsqjZXGhoxfm6NuvBNZOuRCj7uhLjPQa
 rVT9879qqLkgXxjBhhuovhCpNMn1YCTEPbbclEXVYM1iGEZvVcQGL98WsM4dlRhr5Q
 nwTps8Bga+AWiqf1Cd/9vD+8cVl5HzYhSf7PANeFGkU2CHhhZnX4412R4p4h1ix4G4
 1k646gpWlORAg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ZfZHesaP
Subject: Re: [Buildroot] [PATCH 1/3] package/intel-gmmlib: bump version to
 22.7.0
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

On 18/03/2025 17:06, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
