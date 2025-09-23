Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8939ECAC5A5
	for <buildroot@archiver.kernel.org>; Tue, 23 Sep 2025 21:20:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 27FBE411C5;
	Tue, 23 Sep 2025 21:20:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TXGErmI7WveH; Tue, 23 Sep 2025 21:20:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56B3141115
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 56B3141115;
	Tue, 23 Sep 2025 21:20:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 15E13129
 for <buildroot@buildroot.org>; Tue, 23 Sep 2025 21:20:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 082C540141
 for <buildroot@buildroot.org>; Tue, 23 Sep 2025 21:20:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aRVFi6UfEj8K for <buildroot@buildroot.org>;
 Tue, 23 Sep 2025 21:20:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.1;
 helo=smtp1-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DFA7E4009D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DFA7E4009D
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DFA7E4009D
 for <buildroot@buildroot.org>; Tue, 23 Sep 2025 21:20:49 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPA id 8763EB00548;
 Tue, 23 Sep 2025 23:20:44 +0200 (CEST)
Received: from 2a01:e0a:485:b220:7427:ac55:2702:f075
 via 2a01:e0a:485:b220:7427:ac55:2702:f075 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Tue, 23 Sep 2025 23:20:44 +0200
MIME-Version: 1.0
Date: Tue, 23 Sep 2025 23:20:44 +0200
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: buildroot@buildroot.org, linux-amarula@amarulasolutions.com
In-Reply-To: <20250921153348.2636830-1-dario.binacchi@amarulasolutions.com>
References: <20250921153348.2636830-1-dario.binacchi@amarulasolutions.com>
User-Agent: Webmail Free/1.6.11
Message-ID: <6f6c398f2f2fa888b7318f8d27942fac@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1758662446;
 bh=6Bum8fQtp02dVKsQW+Gv6QIMYw8G5J65USLmEKm4wVg=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=XIXwNNcsbTxRdRaJKvNTNcf+aFid33ip2XaPPNYZp9EDW63XtlXUIiHCCcEglxoE5
 BiO69O3xMNP/gtJw93tKgtuGHBqLB9HdOxybdbjzzKixmz9IG4mco2QnriyMnK+ylU
 MboMAb729QKYTjRRReOFj8yLZnq6LC0gghcyIylTn0vB6BIjv1L1GIn5DJyxrZw0MR
 cl7F5huhysnDYhQ2VqePRNw4y3+HGmsVmoEBZ2ZY8/XNh/dQm+s/kqEInkoG3gh57p
 lUxKLUfqWY+L1Rg/vtD10uWlAzTfnPhWpt0P/1IPbB1urVCC4qKviLslJ4NNzH8P6I
 nkOsPPFLAC1Tg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=XIXwNNcs
Subject: Re: [Buildroot] [PATCH v2 1/2] package/bc: bump to 1.08.2
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

On 21/09/2025 17:33, Dario Binacchi wrote:
> Update patch 2 and drop patch 3 and 4 because integrated in the
> new version.

The package patch 0002 is introducing build and test failures. See:
https://gitlab.com/jolivain/buildroot/-/pipelines/2058115500
https://gitlab.com/jolivain/buildroot/-/jobs/11463775745
It's most likely a missing prototype.

Could you have a look please?

> Release notes:
> https://mail.gnu.org/archive/html/info-gnu/2025-01/msg00000.html
> https://lists.gnu.org/archive/html/info-gnu/2025-01/msg00002.html
> https://lists.gnu.org/archive/html/info-gnu/2025-05/msg00006.html
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
