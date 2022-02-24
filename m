Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 977F0C433EF
	for <buildroot@archiver.kernel.org>; Thu, 24 Feb 2022 07:35:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 34DB440336;
	Thu, 24 Feb 2022 07:35:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XqqzjP5B1Nxl; Thu, 24 Feb 2022 07:35:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 67C4E4032E;
	Thu, 24 Feb 2022 07:35:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5F96D1BF40D
 for <buildroot@lists.busybox.net>; Thu, 24 Feb 2022 07:35:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4BC0F60B6C
 for <buildroot@lists.busybox.net>; Thu, 24 Feb 2022 07:35:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id foQz4w8kCLxw for <buildroot@lists.busybox.net>;
 Thu, 24 Feb 2022 07:35:48 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::221])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 17F4460B6A
 for <buildroot@buildroot.org>; Thu, 24 Feb 2022 07:35:47 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1FAD4240005;
 Thu, 24 Feb 2022 07:35:43 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nN8f8-00Chx0-LE; Thu, 24 Feb 2022 08:35:42 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Neal Frager <nealf@xilinx.com>
References: <20220223180336.3372352-1-neal.frager@xilinx.com>
 <87wnhl4ab4.fsf@dell.be.48ers.dk>
 <SJ0PR02MB7758C7A233840BA37FFADBF3D73D9@SJ0PR02MB7758.namprd02.prod.outlook.com>
Date: Thu, 24 Feb 2022 08:35:42 +0100
In-Reply-To: <SJ0PR02MB7758C7A233840BA37FFADBF3D73D9@SJ0PR02MB7758.namprd02.prod.outlook.com>
 (Neal Frager's message of "Thu, 24 Feb 2022 06:54:35 +0000")
Message-ID: <87sfs84sz5.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
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
 >> Most (but not all) fragment files are using the .fragment suffix, so
 > I renamed these to uboot.fragment. I dropped the reviewed-by and
 > reworded the commit text a bit and committed - Thanks.

 > Thank you for this update and commit.  I have tested the clean build
 > with this patch this morning, and I confirm that it works as expected.

 > I am not sure why I had a build issue yesterday.  Starting from a new clean build worked correctly.

 > Also, I confirm that I ran my test with the environment variable
 > DEVICE_TREE undefined.  With this new patch, there are no requirements
 > for environment definitions.

 > Have you tested this patch on your ZCU106 yet?

Yes, I was successfully able to build and boot it (without the kernel
bump) here.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
