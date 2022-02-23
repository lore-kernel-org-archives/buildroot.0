Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D1C4C4332F
	for <buildroot@archiver.kernel.org>; Wed, 23 Feb 2022 17:05:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9ED2A415CB;
	Wed, 23 Feb 2022 17:05:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o4OyavR-olAc; Wed, 23 Feb 2022 17:05:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CEA334157E;
	Wed, 23 Feb 2022 17:05:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B4F821BF5F6
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 17:05:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A189240142
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 17:05:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pLwaHSGRDWsm for <buildroot@lists.busybox.net>;
 Wed, 23 Feb 2022 17:05:28 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 04A68400CD
 for <buildroot@buildroot.org>; Wed, 23 Feb 2022 17:05:27 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id D221BFF80A;
 Wed, 23 Feb 2022 17:05:23 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nMv4s-00CEbS-Sd; Wed, 23 Feb 2022 18:05:22 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Neal Frager <nealf@xilinx.com>
References: <20220223125118.2325363-1-neal.frager@xilinx.com>
 <SJ0PR02MB7758FF7514FC2ABEF4BF2F04D73C9@SJ0PR02MB7758.namprd02.prod.outlook.com>
Date: Wed, 23 Feb 2022 18:05:22 +0100
In-Reply-To: <SJ0PR02MB7758FF7514FC2ABEF4BF2F04D73C9@SJ0PR02MB7758.namprd02.prod.outlook.com>
 (Neal Frager's message of "Wed, 23 Feb 2022 14:30:58 +0000")
Message-ID: <878ru15x9p.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
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
Cc: "luca@lucaceresoli.net" <luca@lucaceresoli.net>,
 "giulio.benetti@benettiengineering.com"
 <giulio.benetti@benettiengineering.com>, Michal Simek <michals@xilinx.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Neal" == Neal Frager <nealf@xilinx.com> writes:

 > Hi Peter,
 > +++ b/board/zynqmp/zcu106/uboot-fragment.config
 > @@ -0,0 +1,2 @@
 > +CONFIG_DEFAULT_DEVICE_TREE="zynqmp-zcu106-revA"
 > +

 > I tried your method of creating a uboot fragment config that just modifies the CONFIG_DEFAULT_DEVICE_TREE.

 > However, when I build, I get the following error:

 > Device Tree Source (arch/arm/dts/unset.dtb) is not correctly specified.
 > Please define 'CONFIG_DEFAULT_DEVICE_TREE'
 > or build with 'DEVICE_TREE=<device_tree>' argument

 > I can see that the U-Boot .config is correctly modified with
 > CONFIG_DEFAULT_DEVICE_TREE="zynqmp-zcu106-revA"

 > But it does not build.  How did you get this to build on your side?

Are you sure you are using a clean Buildroot tree? It works here with
your patch applied.

Easiest way to check is to just do something like:

make O=output-test zynqmp_zcu106_defconfig
make O=output-test uboot-menuconfig

And then scroll down to 'Device Tree Control' and verify that you have:

(zynqmp-zcu106-revA) Default Device Tree for DT control

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
