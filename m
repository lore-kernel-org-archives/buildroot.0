Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3261FC433F5
	for <buildroot@archiver.kernel.org>; Wed, 23 Feb 2022 22:29:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D0F2B415CC;
	Wed, 23 Feb 2022 22:29:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kl5IoXhSVEEX; Wed, 23 Feb 2022 22:29:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 30101415C8;
	Wed, 23 Feb 2022 22:29:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C71A91BF868
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 22:29:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C2FDE60B9F
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 22:29:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qoi35flMjfsq for <buildroot@lists.busybox.net>;
 Wed, 23 Feb 2022 22:29:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from hostingweb31-40.netsons.net (hostingweb31-40.netsons.net
 [89.40.174.40])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DE4A760ABD
 for <buildroot@buildroot.org>; Wed, 23 Feb 2022 22:29:53 +0000 (UTC)
Received: from [77.244.183.192] (port=62604 helo=[192.168.178.41])
 by hostingweb31.netsons.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <luca@lucaceresoli.net>)
 id 1nN08t-0002yT-I5; Wed, 23 Feb 2022 23:29:51 +0100
Message-ID: <4f6c5422-e10a-f99b-4f3a-1118e026b8d8@lucaceresoli.net>
Date: Wed, 23 Feb 2022 23:29:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Peter Korsgaard <peter@korsgaard.com>
References: <20220223125118.2325363-1-neal.frager@xilinx.com>
 <ae77a8c9-9ecb-9050-b683-ccc52abc9d15@lucaceresoli.net>
 <871qzt5pgn.fsf@dell.be.48ers.dk>
From: Luca Ceresoli <luca@lucaceresoli.net>
In-Reply-To: <871qzt5pgn.fsf@dell.be.48ers.dk>
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
Subject: Re: [Buildroot] [PATCH v1 1/1] configs/zynqmp_zcu10x: fix U-Boot
 dts config
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
Cc: Neal Frager <neal.frager@xilinx.com>, giulio.benetti@benettiengineering.com,
 michal.simek@xilinx.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Peter,

On 23/02/22 20:54, Peter Korsgaard wrote:
>>>>>> "Luca" == Luca Ceresoli <luca@lucaceresoli.net> writes:
> 
>  > Hi Neal,
>  > On 23/02/22 13:51, Neal Frager wrote:
>  >> This patch:
>  >> - fixes U-Boot issue when DEVICE_TREE environment variable undefined
> 
>  > This appears unrelated from the version bumps. Please send separate patches.
> 
>  >> - bumps U-Boot to Xilinx 2022.01-171
>  >> - bumps Linux to Xilinx 5.15-945
> 
> I don't have the zcu106 here anymore, but this new kernel didn't boot
> here (no output after 'Starting Linux'). Does it boot for you?

I'll try to test tomorrow. Anyway IIRC I have an Engineering Sample
silicon, not sure whether this can prevent booting.

-- 
Luca
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
