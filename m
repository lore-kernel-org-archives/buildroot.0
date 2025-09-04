Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FC04CA1013
	for <buildroot@archiver.kernel.org>; Thu,  4 Sep 2025 16:48:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4257F60674;
	Thu,  4 Sep 2025 16:48:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AB7sZW2WdtS2; Thu,  4 Sep 2025 16:48:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1464A60632
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1464A60632;
	Thu,  4 Sep 2025 16:48:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id A60AE111
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:48:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 97A144005E
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:48:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ropjqex93AXt for <buildroot@buildroot.org>;
 Thu,  4 Sep 2025 16:48:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BB4BA40051
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BB4BA40051
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BB4BA40051
 for <buildroot@buildroot.org>; Thu,  4 Sep 2025 16:48:22 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.3])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPA id 5870919F742;
 Thu,  4 Sep 2025 18:48:09 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Thu, 04 Sep 2025 18:48:09 +0200
MIME-Version: 1.0
Date: Thu, 04 Sep 2025 18:48:09 +0200
To: Neal Frager <neal.frager@amd.com>
Cc: buildroot@buildroot.org, ibai.erkiaga-elorza@amd.com,
 luca.ceresoli@bootlin.com, yann.morin@orange.com, brandon.maier@collins.com,
 thomas.petazzoni@bootlin.com, romain.naour@smile.fr, michal.simek@amd.com,
 romain.naour@gmail.com
In-Reply-To: <20250901132933.937424-1-neal.frager@amd.com>
References: <20250901132933.937424-1-neal.frager@amd.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <6359edf63d18a02ced12ef3d31dd6993@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1757004499;
 bh=WNVfeNb/Z4tyRTkPGqFc6N2Sv0XYbs6Oo6Tyc3h6USQ=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=q7d2BdQkhDxqhjuwTnf3nwmtKtw2fve3JDRzG+6uORDC9WUzUdlbpbHJg3N1T38Kc
 WO/RZnEhKtYhaMWf+nTvFn+DA4p4jKrlkV5IUPS1Bnvs/JG/MsbyP7CjRaRp7n8Ep7
 nHSvI1YIZBhQWYcmLXjBVoTYP70iSsOI3e/lOmTEOZBHbtgLcxZpG5IdXKHhJ4lDx+
 FNNX4VQAkPQu/aW845AxAr+jlSMe+YeB+ccqyRr4ba6HvFHaU9SWIJnnBLjLFptB8O
 xeFhjje029yAK/aSt1g/svHSVQKNoQltcAZP27DdxHkVMGJX3Dh9ET0mD4l0xuKLBz
 EgkT/jLAooX6A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=q7d2BdQk
Subject: Re: [Buildroot] [PATCH v1 1/2] board/versal: increase vfat
 partition to 64M
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

On 01/09/2025 15:29, Neal Frager via buildroot wrote:
> In the process of bumping Linux kernel 6.12.10 to 6.12.40, the size of 
> the
> default Linux kernel Image file for versal products is increasing from 
> 23.4M
> to 26.9M. This is leaving limited free space in the vfat partition 
> meaning
> users may unknowingly exceed the 32M size by just adding Linux kernel 
> configs.
> 
> To avoid potential problems, this patch doubles the size of the vfat 
> partition
> to 64M, which should be plenty of space for any configuration.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>

Series applied to master, thanks.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
