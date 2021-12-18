Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E96EC433F5
	for <buildroot@archiver.kernel.org>; Sat, 18 Dec 2021 22:44:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C2F314202A;
	Sat, 18 Dec 2021 22:44:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hMj-oQgn-BT2; Sat, 18 Dec 2021 22:44:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2CD214201F;
	Sat, 18 Dec 2021 22:44:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9BF721BF5AE
 for <buildroot@lists.busybox.net>; Sat, 18 Dec 2021 22:44:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 928DC606FF
 for <buildroot@lists.busybox.net>; Sat, 18 Dec 2021 22:44:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iAOBIdh7Nlnt for <buildroot@lists.busybox.net>;
 Sat, 18 Dec 2021 22:44:49 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C58B0606E7
 for <buildroot@buildroot.org>; Sat, 18 Dec 2021 22:44:48 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by relay12.mail.gandi.net (Postfix) with ESMTPSA id 312F7200003;
 Sat, 18 Dec 2021 22:44:44 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1myiRY-0005Na-GS; Sat, 18 Dec 2021 23:44:44 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20211218163742.13297-1-peter@korsgaard.com>
 <20211218211349.GN2603@scaer>
Date: Sat, 18 Dec 2021 23:44:44 +0100
In-Reply-To: <20211218211349.GN2603@scaer> (Yann E. MORIN's message of "Sat,
 18 Dec 2021 22:13:49 +0100")
Message-ID: <875yrlr0rn.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH] configs/roseapplypi_defconfig: bump kernel
 to 5.15.10
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Peter, All,
 > On 2021-12-18 17:37 +0100, Peter Korsgaard spake thusly:
 >> The kernel now has support for dma, ethernet, i2c, mmc, pinctrl, regulator,
 >> so enable drivers for those, change to a ext4 rootfs and enable DHCP on
 >> eth0.
 >> 
 >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

 > Applied to master, thanks.

 > Will we at some point be able to drop our custom kernel config file, and
 > use an upstream defconfig instead?

Possibly yes. Basic owl support was added to multi_v7_defconfig with:

commit 26ba4a474aec5998e52826319c4d7a1c98e8fab5
Author: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Date:   Thu Jan 21 11:44:47 2021 +0530

    ARM: multi_v7_defconfig: Enable Actions Semi platform and drivers

    The support for Actions Semi ARM32 platform has matured enough in the
    mainline. So let's enable it in multi_v7_defconfig along with the
    relevant drivers. The platform can now boot a distro from eMMC or uSD
    without any out of tree patch.

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=26ba4a474aec5998e52826319c4d7a1c98e8fab5

I haven't given it a try yet though. I'll try to find some time to do
it.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
