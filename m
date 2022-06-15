Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E7A3C43334
	for <buildroot@archiver.kernel.org>; Wed, 15 Jun 2022 21:01:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E5D22415B0;
	Wed, 15 Jun 2022 21:01:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y5MSw8iDDMDR; Wed, 15 Jun 2022 21:01:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C32B24152D;
	Wed, 15 Jun 2022 21:01:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3FBDA1BF356
 for <buildroot@lists.busybox.net>; Wed, 15 Jun 2022 21:01:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3C2E060BE7
 for <buildroot@lists.busybox.net>; Wed, 15 Jun 2022 21:01:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lBFsDMN_JaZI for <buildroot@lists.busybox.net>;
 Wed, 15 Jun 2022 21:01:40 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from hostingweb31-40.netsons.net (hostingweb31-40.netsons.net
 [89.40.174.40])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 92E1E60757
 for <buildroot@buildroot.org>; Wed, 15 Jun 2022 21:01:40 +0000 (UTC)
Received: from [77.244.183.192] (port=64152 helo=[192.168.178.42])
 by hostingweb31.netsons.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.95)
 (envelope-from <luca@lucaceresoli.net>) id 1o1a8w-000DQm-Rl;
 Wed, 15 Jun 2022 23:01:38 +0200
Message-ID: <cfb0b273-8c6c-099a-1fca-b285b37b3784@lucaceresoli.net>
Date: Wed, 15 Jun 2022 23:01:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Content-Language: it-IT
To: Neal Frager <neal.frager@xilinx.com>, buildroot@buildroot.org
References: <20220609140449.210030-1-neal.frager@xilinx.com>
 <20220609140449.210030-4-neal.frager@xilinx.com>
From: Luca Ceresoli <luca@lucaceresoli.net>
In-Reply-To: <20220609140449.210030-4-neal.frager@xilinx.com>
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
Subject: Re: [Buildroot] [PATCH v2 4/4] board/zynqmp/post-build.sh: remove
 unnecessary if
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
Cc: wesley@sonifex.co.uk, Neal Frager <neal.frager@amd.com>,
 giulio.benetti@benettiengineering.com, michal.simek@amd.com,
 yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 09/06/22 16:04, Neal Frager wrote:
> From: Neal Frager <neal.frager@amd.com>
> 
> Now that all of the extlinux.conf files have been removed,
> it is no longer necessary to check if the file exists.
> 
> Signed-off-by: Neal Frager <neal.frager@amd.com>


Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>



-- 
Luca
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
