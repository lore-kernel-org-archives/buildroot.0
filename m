Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55C04CCD183
	for <buildroot@archiver.kernel.org>; Fri,  3 Oct 2025 20:16:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2746B40634;
	Fri,  3 Oct 2025 20:16:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RGvxqgesJJfP; Fri,  3 Oct 2025 20:16:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA8B2405AA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA8B2405AA;
	Fri,  3 Oct 2025 20:16:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8F88C118
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 20:16:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 75B8C40557
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 20:16:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id G1j1S93zx-Dp for <buildroot@buildroot.org>;
 Fri,  3 Oct 2025 20:16:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::14;
 helo=smtp5-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C51AB4054C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C51AB4054C
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C51AB4054C
 for <buildroot@buildroot.org>; Fri,  3 Oct 2025 20:16:19 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPA id ED8BB6012F;
 Fri,  3 Oct 2025 22:16:07 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Fri, 03 Oct 2025 22:16:07 +0200
MIME-Version: 1.0
Date: Fri, 03 Oct 2025 22:16:07 +0200
To: Neal Frager <neal.frager@amd.com>
Cc: buildroot@buildroot.org, ibai.erkiaga-elorza@amd.com,
 luca.ceresoli@bootlin.com, yann.morin@orange.com, brandon.maier@collins.com,
 thomas.petazzoni@bootlin.com, romain.naour@smile.fr, michal.simek@amd.com,
 romain.naour@gmail.com
In-Reply-To: <20251003092514.3686293-1-neal.frager@amd.com>
References: <20251003092514.3686293-1-neal.frager@amd.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <538838b7cd28c157e5be4a20771701a2@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1759522577;
 bh=feVNcsxIP7UUNZzVmSGAf61jMwYztJFA48nrJsacffo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Fv/PQYc8OVb/Qm1Ku5/mCsqysz2IyDZ01ymIfFkPToT/QgDHihr9Y/rQx6nHoXu52
 oO/47J+s+i2vW1lklEWobgZps+ldWLe7A8NzxHvWaAfkaJ3JMngGKjowPjAIVOK1wQ
 GBUfOVDnYw+MI8alhvDvgtycyX3/8/L4HndetK1frLgYViotlntuM1w7ZP+spcjotb
 ZpL8JhtFGARJRVhVcTsIoSHLTq4e+xxZQmSE01353GizmYna0GtWl+hx14hrLPk4cb
 v99IxgdxIvvK5h548I45KkfOv2Wu3qDdNdQZ468zBouy3qtqJdnNDZE2WkfQ7OMj5F
 XDJ3FF8K0ylog==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Fv/PQYc8
Subject: Re: [Buildroot] [PATCH v1 1/1] board/versal/post-image: remove
 unnecessary mkdir
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

On 03/10/2025 11:25, Neal Frager via buildroot wrote:
> The board/versal/post-image.sh script has an unnecessary mkdir command:
> mkdir -p "${BINARIES_DIR}"
> 
> Just above the command, the script is making a symlink for the Linux 
> DTB in
> the ${BINARIES_DIR}, so if the ${BINARIES_DIR} did not already exist 
> with
> images inside, the script would fail regardless of whether this mkdir 
> is
> executed or not.
> 
> For this reason, remove the mkdir call from the script because it is 
> not
> necessary.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
