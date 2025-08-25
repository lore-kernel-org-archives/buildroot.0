Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1E62C8303F
	for <buildroot@archiver.kernel.org>; Mon, 25 Aug 2025 20:41:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A8CD84BA6;
	Mon, 25 Aug 2025 20:41:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ToAS13Wa3bUM; Mon, 25 Aug 2025 20:41:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9C1F684B9F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C1F684B9F;
	Mon, 25 Aug 2025 20:41:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id AF0B4B0B
 for <buildroot@buildroot.org>; Mon, 25 Aug 2025 20:41:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 95C4E415CB
 for <buildroot@buildroot.org>; Mon, 25 Aug 2025 20:41:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dws5na3WOVZx for <buildroot@buildroot.org>;
 Mon, 25 Aug 2025 20:41:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.3;
 helo=smtp3-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 030E041545
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 030E041545
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 030E041545
 for <buildroot@buildroot.org>; Mon, 25 Aug 2025 20:41:18 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPA id 00C2013F88F;
 Mon, 25 Aug 2025 22:41:05 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Mon, 25 Aug 2025 22:41:05 +0200
MIME-Version: 1.0
Date: Mon, 25 Aug 2025 22:41:05 +0200
To: Neal Frager <neal.frager@amd.com>
Cc: buildroot@buildroot.org, ibai.erkiaga-elorza@amd.com,
 luca.ceresoli@bootlin.com, yann.morin@orange.com, brandon.maier@collins.com,
 thomas.petazzoni@bootlin.com, romain.naour@smile.fr, michal.simek@amd.com,
 romain.naour@gmail.com
In-Reply-To: <20250825152358.3409564-1-neal.frager@amd.com>
References: <20250825152358.3409564-1-neal.frager@amd.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <1ed9b37eda6b5c8a6d470ad0bcbfe41a@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1756154475;
 bh=nWQ3R1kOcEGO3/NNixlOlO/idBRfraBtwdIU/K1/ApE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=iJND1H5xEgujVtwgnVaGMJ9Yoo3M+brHV5mOjCrAgRIZ11pYfEa7NCy42HjQsJ3I5
 0lOPytLBGS9hQmGiz8HOIPIuuqVzZg5PLeQB7ol55X7lzoSVucj71+dITMDhTz+ePR
 X8DOUNc3eWv8vM435q9Mhg5lFLGInKxUcjLBuKycavChMtHF69wsZgZdr7DqAWIj1w
 jjXKZBgw0q9BA2YMOUBNg08ds3ai+16OETO9BlhHTcvKjdJJoAKc7OaIBBQVkiIDes
 flv2iGV4eX67VJrUP0zAY0uAl2mHZj1Z7pRtE8o4Mwl5brgz5jH5J2/QRTufz6WSP/
 qSmjHuqAaKukA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=iJND1H5x
Subject: Re: [Buildroot] [PATCH v1 1/1] board/xilinx: remove xilinx_v2024.2
 hashes
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

On 25/08/2025 17:23, Neal Frager via buildroot wrote:
> This patch removes the xilinx_v2024.2 hashes since all xilinx 
> defconfigs have
> been bumped to xilinx_v2025.1.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
