Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B92B1C433EF
	for <buildroot@archiver.kernel.org>; Tue, 10 May 2022 21:04:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F2EA41833;
	Tue, 10 May 2022 21:04:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Hlx3-xjTgbLP; Tue, 10 May 2022 21:04:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 441C44170B;
	Tue, 10 May 2022 21:04:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BA5F01BF421
 for <buildroot@lists.busybox.net>; Tue, 10 May 2022 21:04:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A8A4D4170B
 for <buildroot@lists.busybox.net>; Tue, 10 May 2022 21:04:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K7GpJEhX2q6q for <buildroot@lists.busybox.net>;
 Tue, 10 May 2022 21:04:53 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from hostingweb31-40.netsons.net (hostingweb31-40.netsons.net
 [89.40.174.40])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 674444170A
 for <buildroot@buildroot.org>; Tue, 10 May 2022 21:04:53 +0000 (UTC)
Received: from lmontsouris-655-1-15-199.w80-11.abo.wanadoo.fr
 ([80.11.122.199]:54238 helo=[192.168.1.105])
 by hostingweb31.netsons.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <luca@lucaceresoli.net>)
 id 1noX2J-000DTo-2J; Tue, 10 May 2022 23:04:51 +0200
Message-ID: <5c3c886d-002c-7ce9-bb94-43a39b6fa513@lucaceresoli.net>
Date: Tue, 10 May 2022 23:04:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: it-IT
To: TIAN Yuanhao <tianyuanhao3@163.com>, buildroot@buildroot.org
References: <20220509153031.1562693-1-tianyuanhao3@163.com>
From: Luca Ceresoli <luca@lucaceresoli.net>
In-Reply-To: <20220509153031.1562693-1-tianyuanhao3@163.com>
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - hostingweb31.netsons.net
X-AntiAbuse: Original Domain - buildroot.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lucaceresoli.net
X-Get-Message-Sender-Via: hostingweb31.netsons.net: authenticated_id:
 luca@lucaceresoli.net
X-Authenticated-Sender: hostingweb31.netsons.net: luca@lucaceresoli.net
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Subject: Re: [Buildroot] [PATCH 1/1] package/rtl8188eu: enable required
 kernel options
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Tian,

On 09/05/22 17:30, TIAN Yuanhao wrote:
> Enable Linux kernel configuration options required by the driver.
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/951/9514704d6d44fc1b5dd188eac06b269427d3dee2
>  - http://autobuild.buildroot.org/results/9ea/9ea060cc35e859ebc73c65fe2d1f7478f9b4fa8d
>  - http://autobuild.buildroot.org/results/658/658c06f8125613b56511d3351cdfd3d8e19d48da
> 
> Reported-by: Luca Ceresoli <luca@lucaceresoli.net>
> Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>

Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>

-- 
Luca
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
