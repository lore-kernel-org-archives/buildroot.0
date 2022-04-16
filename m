Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 748E5C433EF
	for <buildroot@archiver.kernel.org>; Sat, 16 Apr 2022 20:15:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 126FC611AF;
	Sat, 16 Apr 2022 20:15:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YTljJrTbhuSo; Sat, 16 Apr 2022 20:15:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E91260E93;
	Sat, 16 Apr 2022 20:15:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 04EBB1BF360
 for <buildroot@lists.busybox.net>; Sat, 16 Apr 2022 20:15:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E758283EDA
 for <buildroot@lists.busybox.net>; Sat, 16 Apr 2022 20:15:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QUpXNeR27Er2 for <buildroot@lists.busybox.net>;
 Sat, 16 Apr 2022 20:15:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A2A22832D9
 for <buildroot@buildroot.org>; Sat, 16 Apr 2022 20:15:51 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 6FBC1100003;
 Sat, 16 Apr 2022 20:15:48 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nfopf-00Eqtt-5T; Sat, 16 Apr 2022 22:15:47 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Neal Frager <nealf@xilinx.com>
References: <SJ0PR02MB77589C6E412691B171FB0527D7ED9@SJ0PR02MB7758.namprd02.prod.outlook.com>
Date: Sat, 16 Apr 2022 22:15:47 +0200
In-Reply-To: <SJ0PR02MB77589C6E412691B171FB0527D7ED9@SJ0PR02MB7758.namprd02.prod.outlook.com>
 (Neal Frager's message of "Tue, 12 Apr 2022 09:44:36 +0000")
Message-ID: <87ee1w7pjg.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] Xilinx KV260 Support
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Neal" == Neal Frager <nealf@xilinx.com> writes:

 > Dear buildroot community,
 > I am working on adding a defconfig for the Xilinx KV260 Starter Kit.
 > It is a low cost zynqmp development kit showcasing the first Xilinx Kria K26 SOM module.
 > https://www.xilinx.com/products/som/kria/kv260-vision-starter-kit.html

Looks nice!

 > I have managed to get buildroot up and running on the hardware, but I currently need to implement some manual steps.

 > Here are the issues I need to solve.  Both are related to a device tree overlay.

 > 1. Install the zynqmp-sck-kv-g-revB.dtbo to the output/images directory:
 > BR2_LINUX_KERNEL_INTREE_DTS_NAME="xilinx/zynqmp-sm-k26-revA xilinx/zynqmp-sck-kv-g-revB"
 > BR2_LINUX_KERNEL_DTB_OVERLAYS_SUPPORT=y

 > I need the build system to install the zynqmp-sm-k26-revA.dtb and the
 > zynqmp-sck-kv-g-revB.dtbo files to the output/images directory.
 > I have tried the BR2_LINUX_KERNEL_DTB_OVERLAYS_SUPPORT option above, but I do not see how to get the zynqmp-sck-kv-g-revB.dtbo
 > Instead of the zynqmp-sck-kv-g-revB.dtb.

Aren't they equvalent? E.G. the only difference between a normal .dtb
and a .dtbo is afaik that dtc is executed with the -@ argument, which is
what BR2_LINUX_KERNEL_DTB_OVERLAYS_SUPPORT does.


 > 2. Apply the overlay to generate a system.dtb in the post-image.sh:

 > I am currently using the following command to generate the system.dtb that I need for booting:
 > fdtoverlay -o output/images/system.dtb -i output/images/zynqmp-sm-k26-revA.dtb output/images/zynqmp-sck-kv-g-revB.dtbo

 > Does anyone have a good idea for how I could implement this in a generic way in the post-image.sh script?

Why are you using device tree overlays in the first place if you want to
merge it back at build time?

Looking at the DTS submission from Michal, it sounds like something
(U-Boot?) should do the carrier board detection and apply the correct
overlay at runtime?

https://lkml.org/lkml/2021/9/22/116

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
