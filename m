Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 639FFC4332F
	for <buildroot@archiver.kernel.org>; Mon, 12 Dec 2022 07:23:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE45140255;
	Mon, 12 Dec 2022 07:23:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE45140255
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ThZXi4QGMvl2; Mon, 12 Dec 2022 07:23:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CFF5C40240;
	Mon, 12 Dec 2022 07:23:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CFF5C40240
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D08421BF288
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 07:23:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B7FD260AC0
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 07:23:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B7FD260AC0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ayma1XVfqpPY for <buildroot@lists.busybox.net>;
 Mon, 12 Dec 2022 07:22:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 463EA6080A
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 463EA6080A
 for <buildroot@buildroot.org>; Mon, 12 Dec 2022 07:22:59 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2A2DE1C0007;
 Mon, 12 Dec 2022 07:22:55 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1p4d9L-00BsAe-6i; Mon, 12 Dec 2022 08:22:55 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Indrek Kruusa <indrek.kruusa@gmail.com>
References: <20221211201704.25858-1-indrek.kruusa@gmail.com>
Date: Mon, 12 Dec 2022 08:22:55 +0100
In-Reply-To: <20221211201704.25858-1-indrek.kruusa@gmail.com> (Indrek Kruusa's
 message of "Sun, 11 Dec 2022 22:17:00 +0200")
Message-ID: <87359lytkg.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/5] configs/nezha_defconfig: bump versions
 for uboot, sbi and linux kernel
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

>>>>> "Indrek" == Indrek Kruusa <indrek.kruusa@gmail.com> writes:

 > kernel: bump to version 6.1.0-rc3 in d1/wip branch
 > u-boot: use the version with full SPL support from d1-wip branch
 > opensbi: take in the latest fixes from d1-wip branch

 > Other:
 > remove patches directory definition as no patches are needed anymore
 > update linux headers version
 > update binary name as the new uboot generates it

Thanks. Funny enough I was just working on doing pretty much the same
thing here. I've CC'ed you on the patch series I just sent.

This patch does a bunch of different things, but it doesn't do enough -
E.G. it doesn't update genimage.cfg so the build is broken after this
commit - So that is not good. Maybe have a look at my series where I
update each component (U-Boot/OpenSBI/Linux) separately.

 > Signed-off-by: Indrek Kruusa <indrek.kruusa@gmail.com>

 > @@ -17,14 +16,14 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 >  # BR2_TARGET_ROOTFS_TAR is not set
 >  BR2_TARGET_OPENSBI=y
 >  BR2_TARGET_OPENSBI_CUSTOM_TARBALL=y
 > -BR2_TARGET_OPENSBI_CUSTOM_TARBALL_LOCATION="$(call github,smaeul,opensbi,e6793dc36a71537023f078034fe795c64a9992a3)/opensbi-e6793dc36a71537023f078034fe795c64a9992a3.tar.gz"
 > +BR2_TARGET_OPENSBI_CUSTOM_TARBALL_LOCATION="$(call github,smaeul,opensbi,5307908fb651a01cc6a2f3fd9fc7b9b471bbccb3)/opensbi-5307908fb651a01cc6a2f3fd9fc7b9b471bbccb3.tar.gz"

Why still use this custom opensbi? There is D1 support in version 1.1 as
mentioned on https://linux-sunxi.org/Allwinner_Nezha


 >  BR2_TARGET_OPENSBI_PLAT="generic"
 >  # BR2_TARGET_OPENSBI_INSTALL_JUMP_IMG is not set
 >  BR2_TARGET_SUN20I_D1_SPL=y

You are still enabling the old sun20i-d1-spl even though you change to
use U-Boot SPL?


-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
