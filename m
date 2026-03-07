Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9896FFC9ED3
	for <buildroot@archiver.kernel.org>; Sat,  7 Mar 2026 10:09:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 516C484277;
	Sat,  7 Mar 2026 10:09:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 23Mle_BGMWAO; Sat,  7 Mar 2026 10:09:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 792ED84276
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772878179;
	bh=+J2oWNf2Teu7sNCdKrjMgOr33XhCjf/yXczrrIpC0Jc=;
	h=Date:To:Cc:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=RzpMwCwlj/XSXG7P34sdHyyqfqsNADRyOtHq/T+jg/bBD6/n3phje3JuvKFtAiV1u
	 NZ+stkSLcmDFGJKW3aNlMvn+KjC6dlPzOdF6GyNgcaR+nI4Lhcf7A9pPVyclHQahMU
	 JF1qd69ZAx0g94Jwa9EdIAeKfetIiYaQnyedVRZuQRPYMyEb0UafcJmqxl35Mjs65U
	 SV0txuoeRScN3clpRuFYTFXftTDKryK5dwTjgQFt34urTob81ox1FNEDUGIc5q2NEd
	 WzOl1fIJ6kgPU+buScB/ICd3yfu9jm3tSbpS1uNbahd9Xy4OSf5FPEoxqwNCphjKwE
	 xd6OlceZJBYsQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 792ED84276;
	Sat,  7 Mar 2026 10:09:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9B795169
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 10:09:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8168D84276
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 10:09:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m-FJuq_aEfe9 for <buildroot@buildroot.org>;
 Sat,  7 Mar 2026 10:09:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.4;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8149784273
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8149784273
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8149784273
 for <buildroot@buildroot.org>; Sat,  7 Mar 2026 10:09:36 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 996F519F574;
 Sat,  7 Mar 2026 11:09:33 +0100 (CET)
Received: from 2a01:e0a:1065:2100:52d9:65fe:2df3:c492
 via 2a01:e0a:1065:2100:52d9:65fe:2df3:c492 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sat, 07 Mar 2026 11:09:33 +0100
MIME-Version: 1.0
Date: Sat, 07 Mar 2026 11:09:33 +0100
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org
In-Reply-To: <20260304182021.3743990-1-james.hilliard1@gmail.com>
References: <20260304182021.3743990-1-james.hilliard1@gmail.com>
User-Agent: Webmail Free/1.6.13
Message-ID: <002a2a84efcf82cdbb5452a87970a6c7@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1772878174;
 bh=8lP8p8ik8b9pviZTpnaFiiPHvc0LSYkDG1fvBw7ZG3Q=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=lBVqjgGRx4jzGajuBIhJ97DxNh+nwX7Izms5qdI2KVeOlbKZ/cwBto4jC4cohOLHQ
 wKyLe0LJAuX3k5xrk1W70qhH/aPC3U09DdrmFSNcboZflTnFiYF7/OeI1y7WNfMbUl
 iSZ+O/E9eOwgOrAfZQVFwXYPUiHn36v9JqhieO8DgBanwjWgMuQkD8MF1WvPSyoyLx
 Tsd5zrV9jR8RI+TJIPuZRFWiGhsDAOrLEhdwXaBrwdltgbSZcb1LSbQbCxiWFkF+YG
 YORTZa3aLG0+VcXzCnh1/efTpKw4OKgvPDgXknZhhiAkB0T8IwQRby69/MAiM36vTm
 uWxQmqSKarOug==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=lBVqjgGR
Subject: Re: [Buildroot] [PATCH 1/1] package/python-trio: bump to version
 0.33.0
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

On 04/03/2026 19:20, James Hilliard wrote:
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
