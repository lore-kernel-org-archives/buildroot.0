Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0FCDC00144
	for <buildroot@archiver.kernel.org>; Fri, 29 Jul 2022 10:15:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5E9E140CA1;
	Fri, 29 Jul 2022 10:15:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5E9E140CA1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZK82qTqRdBnW; Fri, 29 Jul 2022 10:15:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5D8A54016A;
	Fri, 29 Jul 2022 10:15:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5D8A54016A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 983BF1BF288
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 10:15:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 801188316F
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 10:15:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 801188316F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tY4G64_KvOAE for <buildroot@lists.busybox.net>;
 Fri, 29 Jul 2022 10:15:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 51491824F4
Received: from mail.grinn-global.com (mail.grinn-global.com [77.55.128.204])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 51491824F4
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 10:15:10 +0000 (UTC)
X-Virus-Scanned: by amavisd-new using ClamAV (16)
Received: from [192.168.10.50] (77-255-23-229.adsl.inetia.pl [77.255.23.229])
 by server220076.nazwa.pl (Postfix) with ESMTP id 543A51BC8F8;
 Fri, 29 Jul 2022 12:15:07 +0200 (CEST)
Message-ID: <4e6429ba-40cf-3c2d-1e75-0a9e1edd0c6e@grinn-global.com>
Date: Fri, 29 Jul 2022 12:15:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20220729111229.4acffff8@windsurf>
From: Bartosz Bilas <b.bilas@grinn-global.com>
In-Reply-To: <20220729111229.4acffff8@windsurf>
Subject: Re: [Buildroot] Help to fix your Buildroot defconfigs
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
Cc: buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,

On 29.07.2022 11:12, Thomas Petazzoni via buildroot wrote:
> Hello,
>
> You are receiving this e-mail because you are the maintainer of one or
> several defconfigs in Buildroot, which are now failing to build in our
> CI.
>
> Could you please have a look at the failure (see links below), and
> submit patches to address the issues affecting your defconfigs?
>
> If you are no longer interested in maintaining your defconfig, let us
> know, and we will remove it from Buildroot.
>
> We would like all those issues to be fixed for our upcoming Buildroot
> 2022.08 release due end of August. Therefore, if we do not receive a
> fix by then, the failing defconfig will be removed.
>
> Here is the complete list of failing defconfigs, alongside with the
> failure reason and the link to the build log:
>
> pine64_sopine_defconfig -> arm-trusted-firmware fails to build
> https://gitlab.com/buildroot.org/buildroot/-/jobs/2781800954
>
> pine64_defconfig -> arm-trusted-firmware fails to build
> https://gitlab.com/buildroot.org/buildroot/-/jobs/2781800951
>
> orangepi_zero_plus_defconfig -> arm-trusted-firmware fails to build
> https://gitlab.com/buildroot.org/buildroot/-/jobs/2781800936
>
> orangepi_win_defconfig -> arm-trusted-firmware fails to build
> https://gitlab.com/buildroot.org/buildroot/-/jobs/2781800929
>
> orangepi_rk3399_defconfig -> arm-trusted-firmware fails to build
> https://gitlab.com/buildroot.org/buildroot/-/jobs/2781800927
>
> orangepi_prime_defconfig -> arm-trusted-firmware fails to build
> https://gitlab.com/buildroot.org/buildroot/-/jobs/2781800927
>
> orangepi_pc2_defconfig -> arm-trusted-firmware fails to build
> https://gitlab.com/buildroot.org/buildroot/-/jobs/2781800927
>
> orangepi_one_plus_defconfig -> syntax error in U-Boot Device Tree
> https://gitlab.com/buildroot.org/buildroot/-/jobs/2781800907
>
> imx8mpico_defconfig -> syntax error in U-Boot Device Tree
> https://gitlab.com/buildroot.org/buildroot/-/jobs/2781800735
>
> imx8mmpico_defconfig -> syntax error in U-Boot Device Tree
> https://gitlab.com/buildroot.org/buildroot/-/jobs/2781800730
>
> friendlyarm_nanopi_r1_defconfig -> U-Boot builds need Python2, which is no longer in Buildroot
> https://gitlab.com/buildroot.org/buildroot/-/jobs/2781800656
>
> friendlyarm_nanopi_neo_plus2_defconfig -> arm-trusted-firmware fails to build
> https://gitlab.com/buildroot.org/buildroot/-/jobs/2781800653
>
> friendlyarm_nanopi_neo_defconfig -> U-Boot builds need Python2, which is no longer in Buildroot
> https://gitlab.com/buildroot.org/buildroot/-/jobs/2781800648
>
> friendlyarm_nanopi_neo4_defconfig -> arm-trusted-firmware fails to build
> https://gitlab.com/buildroot.org/buildroot/-/jobs/2781800643
>
> friendlyarm_nanopi_neo2_defconfig -> arm-trusted-firmware fails to build
> https://gitlab.com/buildroot.org/buildroot/-/jobs/2781800637
>
> friendlyarm_nanopi_m4_defconfig -> arm-trusted-firmware fails to build
> https://gitlab.com/buildroot.org/buildroot/-/jobs/2781800634
>
> friendlyarm_nanopi_m1_plus_defconfig -> U-Boot builds need Python2, which is no longer in Buildroot
> https://gitlab.com/buildroot.org/buildroot/-/jobs/2781800629
>
> friendlyarm_nanopi_a64_defconfig -> arm-trusted-firmware fails to build
> https://gitlab.com/buildroot.org/buildroot/-/jobs/2781800622
>
> friendlyarm_nanopc_t4_defconfig -> arm-trusted-firmware fails to build
> https://gitlab.com/buildroot.org/buildroot/-/jobs/2781800619
>
> bananapro_defconfig -> U-Boot builds need Python2, which is no longer in Buildroot
> https://gitlab.com/buildroot.org/buildroot/-/jobs/2781800516

here you go

https://patchwork.ozlabs.org/project/buildroot/patch/20220729100953.968434-1-b.bilas@grinn-global.com/

Best
Bartek
>
> bananapi_m64_defconfig -> arm-trusted-firmware fails to build
> https://gitlab.com/buildroot.org/buildroot/-/jobs/2781800514
>
> bananapi_m2_plus_defconfig -> U-Boot builds need Python2, which is no longer in Buildroot
> https://gitlab.com/buildroot.org/buildroot/-/jobs/2781800509
>
> bananapi_m1_plus_defconfig -> U-Boot builds need Python2, which is no longer in Buildroot
> https://gitlab.com/buildroot.org/buildroot/-/jobs/2781800507
>
> bananapi_m1_defconfig -> syntax error in U-Boot Device Tree
> https://gitlab.com/buildroot.org/buildroot/-/jobs/2781800505
>
> Thanks for your contribution to Buildroot!
>
> Thomas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
