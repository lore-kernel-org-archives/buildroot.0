Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3C7EC433EF
	for <buildroot@archiver.kernel.org>; Fri, 24 Dec 2021 18:04:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5F46383E36;
	Fri, 24 Dec 2021 18:04:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VuXGv7FuUP0p; Fri, 24 Dec 2021 18:04:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A865183E3A;
	Fri, 24 Dec 2021 18:04:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AE9481BF21A
 for <buildroot@lists.busybox.net>; Fri, 24 Dec 2021 18:04:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9A09C40480
 for <buildroot@lists.busybox.net>; Fri, 24 Dec 2021 18:04:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xabFPSZnfuCw for <buildroot@lists.busybox.net>;
 Fri, 24 Dec 2021 18:04:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2DEAD402DC
 for <buildroot@buildroot.org>; Fri, 24 Dec 2021 18:04:09 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 3D162E0003;
 Fri, 24 Dec 2021 18:04:08 +0000 (UTC)
Date: Fri, 24 Dec 2021 19:04:07 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Tudor Barbu <tudor.barbu@keysight.com>
Message-ID: <20211224190407.1a29db0e@windsurf>
In-Reply-To: <SJ0PR17MB54938C9DC46497D9C09DA979937C9@SJ0PR17MB5493.namprd17.prod.outlook.com>
References: <SJ0PR17MB54938C9DC46497D9C09DA979937C9@SJ0PR17MB5493.namprd17.prod.outlook.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/poco: bump version to 1.11.1
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
Cc: Tudor Barbu via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Tudor,

On Tue, 21 Dec 2021 11:48:05 +0000
Tudor Barbu via buildroot <buildroot@buildroot.org> wrote:

> From 14cb284a085107a11c6d3636660e5a7ad5550a98 Mon Sep 17 00:00:00 2001
> From: Tudor Barbu <tudor.barbu@keysight.com>
> Date: Fri, 17 Dec 2021 14:51:20 +0200
> Subject: [PATCH 1/1] package/poco: bump version to 1.11.1
> 
> This version contains multiple bug fixes and introduces ActiveRecord
> 
> Removed: 0001-poco-add-the-staging-path-to-search-path.patch
> 
> Selecting custom mysql lib and include is now supported via the
> configure script
> 
> The following patches are integrated in upstream:
> 0002-Add-support-for-m68000-1856.patch
> 0003-Foundation-src-utils.h-backport-double-conversion-ch.patch
> 
> I have performed a test build for aarch64 with gcc10 without issues
> 
> Signed-off-by: Tudor Barbu <tudor.barbu@keysight.com>

Thanks for your patch. However, it got damaged along the way, could you
try to use "git send-email" for future patch submissions?

Also, with your patch applied, the following defconfig which builds
poco in a very basic configuration, fails to build.

Example configuration:

BR2_arm=y
BR2_cortex_a9=y
BR2_ARM_ENABLE_VFP=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_POCO=y
# BR2_TARGET_ROOTFS_TAR is not set

Build failure:

In file included from include/Poco/SAX/SAXParser.h:23,
                 from include/Poco/DOM/DOMParser.h:22,
                 from src/DOMParser.cpp:15:
include/Poco/XML/ParserEngine.h:22:10: fatal error: expat.h: No such file or directory
   22 | #include <expat.h>
      |          ^~~~~~~~~
compilation terminated.

Could you have a look and submit an updated patch that addresses this
problem?

Thanks a lot!

Thomas Petazzoni
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
