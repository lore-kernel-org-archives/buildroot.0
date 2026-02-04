Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B63CCE95372
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 10:20:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 826D781028;
	Wed,  4 Feb 2026 10:20:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xVwrm56mZ4-X; Wed,  4 Feb 2026 10:20:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 92D138102F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770200423;
	bh=TsKVS7MTV1OGtXFRwwTAspWJcrNhZ0HCM+bHH9Ysm1E=;
	h=Date:To:Cc:References:From:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=AcHBzjq4kylzkApquZ03vL2+cBuAmYu+lgeN3+unpUabS/MM/+T7ehGZu2LczhFJy
	 Mj+AN1y5u08dd4EGWUY9sy08Tw1SbNYjR8k6nDqWr264L9saDdoDczTw+hIXnVqQLk
	 r/bHp55SlANsDWmLEFhGYgQlIkPd6ZwI6cTFMkvYLMaEeXmLU1lIc0nImqR7QnT2Uq
	 EEET1J68epbdb+WLboIiHoz0oBcL/F5b8J9MaCpfxZZwhmuT6t5t1gGaGcukPm3EtH
	 bbdzs7A8H3QcL9l3pnU27Eqoz/Lo9ne37d7bAcbkGsuhBdRcjB+6m00M5EuYlpPkVt
	 GgcNrotwjiAcg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92D138102F;
	Wed,  4 Feb 2026 10:20:23 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 86D96173
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 10:20:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 72A66400F6
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 10:20:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o8UdU3-l5uvj for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 10:20:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.133;
 helo=smtpdh18-2.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 2EC414005C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2EC414005C
Received: from smtpdh18-2.aruba.it (smtpdh18-2.aruba.it [62.149.155.133])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2EC414005C
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 10:20:17 +0000 (UTC)
Received: from [192.168.50.220] ([84.33.84.190]) by Aruba SMTP with ESMTPSA
 id nZzavFL6c5StenZzbvraeY; Wed, 04 Feb 2026 11:20:15 +0100
Message-ID: <c2099f83-af1e-4015-8095-910aa3684c28@benettiengineering.com>
Date: Wed, 4 Feb 2026 11:20:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: buildroot@buildroot.org, Leon Anavi <leon.anavi@konsulko.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Fabrice Goucem <fabrice.goucem@oss.nxp.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Lothar Felten <lothar.felten@gmail.com>, Fabio Estevam <festevam@gmail.com>
References: <20260114195451.3978704-1-giulio.benetti@benettiengineering.com>
 <20260114195451.3978704-4-giulio.benetti@benettiengineering.com>
 <aYB5IT-eqRgySeDQ@windsurf>
Content-Language: en-US
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <aYB5IT-eqRgySeDQ@windsurf>
X-CMAE-Envelope: MS4xfNj39xEcHTts1af9sDZNNCuwJ2AhDxaIPfkw+8Uq8VAEu6nyQgnvmTNL1axeVs4Qk6KPFenXb/NxOkzlnjb0+D/S4m/LiW+i5+Ll6pV6Kv/hA4nLTjrz
 t8SkUMXfYDCYSd8DWSCodiH5ilXyNopJN4KayrSE9vRXEkxD6fkk5+s4SECjk5YbltLYMzxxuxaIZCI5Wyx9ktaVbUU1yu9LRPbWBxry+mqRtbQc6C+oNK/m
 8QcbEiSXh8knxJB0Xbqcf+nH6X8ROepzPJJE7ro4tRCCUp/CNwhNANOMP8JYV0GNApeyYrxiag3FPq+Et9ZHa4U1mOSapD9fjwk5j4ak5kzBSQVkucqQtlC8
 IMeOAci/NtqdzbYu0blec9Yg1Hh74Yc3nlX0GaLqn2SLBBK+2+/dD7AkLWBw8dUg2+TKwpbOZVu0FZF4ez+dTN9PANjwrbDhQHg+MA2rNozDzs5YLU7t3SJr
 GumtJE/lz+dVpX+G
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1770200415; bh=lBANXzsTZESyIH40QA71h7SxeKP9oQqUQkJFmE5kwFA=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=nQsE61NY4cnFnE0L4tnEBiYQmIZllN4BXAHTuKKkRT6jX8ImdCu/nJrk0AjbAS2bB
 ILei63vr95tybt+pqFsTK3x1zsjS+448FHaV39po1A1OxDVRaja7XSwnW0ATy+ZQx3
 eRj6kUWDDNLeJZty51RwyjrAetCEqTZEKoVfXMhBFWn7qkafTGgWCGxpKXSlz8jX7W
 xryrmBXWyNzewOo5InvUN0e4yKlwJR03TPRkYLVA1o0YujzfbCliJvSND95yrk/k2l
 nDPOBGJc1D56UgET+wShAk3DLgEg8I1ZGHPnhFp4UVOh8xgKM8CkngElf0IAlQgole
 fWb8qXtTbmwbw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=nQsE61NY
Subject: Re: [Buildroot] [PATCH 03/17] board/bananapi: simplify berry and
 ultra configurations
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

On 2/2/26 11:16, Thomas Petazzoni wrote:
> On Wed, Jan 14, 2026 at 08:54:36PM +0100, Giulio Benetti wrote:
>> The genimage.cfg and post-build.sh files for Banana Pi Berry and
>> Ultra are identical. Replace the files in the M2 Ultra directory
>> with symbolic links pointing to the M2 Berry directory to reduce
>> code duplication and ease maintenance.
>>
>> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> 
> I am not sure I'm a big fan of this. Indeed, anyone editing the
> bananapi-m2-berry/ files will not necessarily realize that they are
> shared with another machine. 

I haven't considered this case and I prefer then to drop this and
the Allwinner patche[1] without introducing this change

[1]: 
https://patchwork.ozlabs.org/project/buildroot/patch/20260114195451.3978704-10-giulio.benetti@benettiengineering.com/

Giulio

> It would be OK if the files were at a
> place where it is more obvious that they are "common".
> 
> Also, lots of Allwinner boards in fact could share that same genimage
> configuration file.
> 
> Thomas

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
