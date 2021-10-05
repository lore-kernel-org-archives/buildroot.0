Return-Path: <SRS0=EGOI=OZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 751D3C433EF
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 07:25:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C4FFC61409
	for <buildroot@archiver.kernel.org>; Tue,  5 Oct 2021 07:25:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C4FFC61409
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lucaceresoli.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8248C40215;
	Tue,  5 Oct 2021 07:25:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HJ2CPK00KLF6; Tue,  5 Oct 2021 07:25:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8C55D40210;
	Tue,  5 Oct 2021 07:25:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C819E1BF32B
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 07:25:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C4FAF83B35
 for <buildroot@lists.busybox.net>; Tue,  5 Oct 2021 07:25:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KW2EfFspC7x8 for <buildroot@lists.busybox.net>;
 Tue,  5 Oct 2021 07:25:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from hostingweb31-40.netsons.net (hostingweb31-40.netsons.net
 [89.40.174.40])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CADF183B03
 for <buildroot@buildroot.org>; Tue,  5 Oct 2021 07:25:01 +0000 (UTC)
Received: from [185.56.157.72] (port=33232 helo=[192.168.101.73])
 by hostingweb31.netsons.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <luca@lucaceresoli.net>)
 id 1mXeot-00DUOT-6p; Tue, 05 Oct 2021 09:24:59 +0200
To: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
References: <20211005005346.955339-1-giulio.benetti@benettiengineering.com>
 <20211005005346.955339-2-giulio.benetti@benettiengineering.com>
From: Luca Ceresoli <luca@lucaceresoli.net>
Message-ID: <2c68e328-f983-75ea-6922-aaefe1ab7aae@lucaceresoli.net>
Date: Tue, 5 Oct 2021 09:24:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211005005346.955339-2-giulio.benetti@benettiengineering.com>
Content-Language: en-US
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - buildroot.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id:
 luca+lucaceresoli.net/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: Re: [Buildroot] [PATCH 1/4] configs/bananapi_m1: use NEON+VFPv4 as
 FPU strategy
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
Cc: Jagan Teki <jagan@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

On 05/10/21 02:53, Giulio Benetti wrote:
> Allwinner A20 supports NEON+VFPv4 so let's enable instead of the default
> VFPv4-D16.
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>

-- 
Luca
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
