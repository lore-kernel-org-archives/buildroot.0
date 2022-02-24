Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63F0DC433F5
	for <buildroot@archiver.kernel.org>; Thu, 24 Feb 2022 08:03:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C8A7460FEF;
	Thu, 24 Feb 2022 08:03:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zD1oO5D4eEQJ; Thu, 24 Feb 2022 08:02:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BCD1960F77;
	Thu, 24 Feb 2022 08:02:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DF81D1BF40D
 for <buildroot@lists.busybox.net>; Thu, 24 Feb 2022 08:02:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CDCE6400AF
 for <buildroot@lists.busybox.net>; Thu, 24 Feb 2022 08:02:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6e3ZFUQ13eOY for <buildroot@lists.busybox.net>;
 Thu, 24 Feb 2022 08:02:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from hostingweb31-40.netsons.net (hostingweb31-40.netsons.net
 [89.40.174.40])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C7C504017A
 for <buildroot@buildroot.org>; Thu, 24 Feb 2022 08:02:55 +0000 (UTC)
Received: from host-79-2-93-196.business.telecomitalia.it ([79.2.93.196]:51974
 helo=[192.168.101.73])
 by hostingweb31.netsons.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94.2)
 (envelope-from <luca@lucaceresoli.net>)
 id 1nN95R-000Gfm-Be; Thu, 24 Feb 2022 09:02:53 +0100
Message-ID: <158816b4-5b1e-1fe6-0e7b-6b289dd42c15@lucaceresoli.net>
Date: Thu, 24 Feb 2022 09:02:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Peter Korsgaard <peter@korsgaard.com>, Neal Frager <nealf@xilinx.com>
References: <20220223180336.3372352-1-neal.frager@xilinx.com>
 <87wnhl4ab4.fsf@dell.be.48ers.dk>
 <SJ0PR02MB7758C7A233840BA37FFADBF3D73D9@SJ0PR02MB7758.namprd02.prod.outlook.com>
 <87sfs84sz5.fsf@dell.be.48ers.dk>
From: Luca Ceresoli <luca@lucaceresoli.net>
In-Reply-To: <87sfs84sz5.fsf@dell.be.48ers.dk>
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
Subject: Re: [Buildroot] [PATCH v4 1/1] configs/zynqmp_zcu10x: fix U-Boot
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
Cc: "giulio.benetti@benettiengineering.com"
 <giulio.benetti@benettiengineering.com>, Michal Simek <michals@xilinx.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

On 24/02/22 08:35, Peter Korsgaard wrote:
>>>>>> "Neal" == Neal Frager <nealf@xilinx.com> writes:
> 
>  > Hi Peter,
>  >> Most (but not all) fragment files are using the .fragment suffix, so
>  > I renamed these to uboot.fragment. I dropped the reviewed-by and
>  > reworded the commit text a bit and committed - Thanks.
> 
>  > Thank you for this update and commit.  I have tested the clean build
>  > with this patch this morning, and I confirm that it works as expected.
> 
>  > I am not sure why I had a build issue yesterday.  Starting from a new clean build worked correctly.
> 
>  > Also, I confirm that I ran my test with the environment variable
>  > DEVICE_TREE undefined.  With this new patch, there are no requirements
>  > for environment definitions.
> 
>  > Have you tested this patch on your ZCU106 yet?
> 
> Yes, I was successfully able to build and boot it (without the kernel
> bump) here.

...and here too.

Thank you both!

-- 
Luca
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
