Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78022C433EF
	for <buildroot@archiver.kernel.org>; Mon, 31 Jan 2022 16:20:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2188E82835;
	Mon, 31 Jan 2022 16:20:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id obM2-yYZf0eG; Mon, 31 Jan 2022 16:20:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 722E78271D;
	Mon, 31 Jan 2022 16:20:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DB10A1BF375
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 16:20:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C44014034F
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 16:20:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=collabora.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bSP1_1Z4g0uI for <buildroot@lists.busybox.net>;
 Mon, 31 Jan 2022 16:20:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E1BA54155E
 for <buildroot@buildroot.org>; Mon, 31 Jan 2022 16:20:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: adalessandro) with ESMTPSA id CBD601F42BF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1643646012;
 bh=GD8TkYbAJeB+iFJvrxH6U4qa36DjG8Kc2K4opzDDfak=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=GsxdjAa5mjFI/9bABP3ec7hXZluEqn3CMBunqLXZtXW+K+HHuq+jdlO30F7cTSzMQ
 PomkaVbConzxo1A3XjW8yvoMDCw89axrzFSWTPUtslO4gg+F6xXJUYIUZdqdPas6z3
 N64myLJJli69P3d+wbgdfLKdQbHE/M9lN4eEp3lYpL0AzbcGuKB8CkKRt3Z4z+JXBn
 VxKqs6hpA3Vr8cwggzC9K1D0nskidrmRA5Z4k8pZlrF6dF66nxUun13EZv5Fh5n3f9
 olLhy9Odj8OdcrVf7bHsYGVApbQRxrbcwFwOf/5S0p/IpS6BZ+1kmlmcG0PhVi1xI/
 5nCQ8RVS5R7Bw==
Message-ID: <eb50a462-7e8e-ce73-7726-874c930a0b7f@collabora.com>
Date: Mon, 31 Jan 2022 13:19:58 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Content-Language: en-US
To: Michael Trimarchi <michael@amarulasolutions.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
References: <20220131145555.2819020-1-michael@amarulasolutions.com>
From: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
In-Reply-To: <20220131145555.2819020-1-michael@amarulasolutions.com>
Subject: Re: [Buildroot] [PATCH V3] board: Add support for iMX8MN BSH SMM S2
 PRO
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Heiko Thiery <heiko.thiery@gmail.com>, Jagan Teki <jagan@amarulasolutions.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Michael, all,

On 1/31/22 11:55, Michael Trimarchi wrote:
> Add initial support for iMX8MN BSH SMM S2 PRO board:
> 
> - Linux: v5.17-rc1
> - Uboot 2022-01-rc1 (reference tree)
> - Default packages from buildroot
> 
> https://www.apertis.org/reference_hardware/imx8mn_bsh_smm_s2pro_setup/
> 
> Add Ariel D'Alessandro as co-maintainer, we work together on
> platform mainline
> 
> Build and tested using:
> docker pull registry.gitlab.com/buildroot.org/buildroot/base:20220105.2314
> 
> Cc: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
> Cc: Jagan Teki <jagan@amarulasolutions.com>
> Cc: Heiko Thiery <heiko.thiery@gmail.com>
> Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>

Tested-by: Ariel D'Alessandro <ariel.dalessandro@collabora.com>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
