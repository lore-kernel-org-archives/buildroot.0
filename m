Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A091C54E58
	for <buildroot@archiver.kernel.org>; Mon, 18 Mar 2024 09:55:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 00BE481458;
	Mon, 18 Mar 2024 09:55:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3HYD1gr4IK1g; Mon, 18 Mar 2024 09:55:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 00B1B81465
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 00B1B81465;
	Mon, 18 Mar 2024 09:55:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 585A81BF365
 for <buildroot@lists.busybox.net>; Mon, 18 Mar 2024 09:55:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 523694014D
 for <buildroot@lists.busybox.net>; Mon, 18 Mar 2024 09:55:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u_Rsy_jAkAdF for <buildroot@lists.busybox.net>;
 Mon, 18 Mar 2024 09:55:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.193;
 helo=relay1-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 57E81400F8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 57E81400F8
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 57E81400F8
 for <buildroot@buildroot.org>; Mon, 18 Mar 2024 09:55:55 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E21C6240007;
 Mon, 18 Mar 2024 09:55:51 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rm9ih-002Z2S-0q;
 Mon, 18 Mar 2024 10:55:51 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Javad Rahimipetroudi <javad.rahimipetroudi@essensium.com>
References: <20240318093026.8193-1-javad.rahimipetroudi@mind.be>
Date: Mon, 18 Mar 2024 10:55:51 +0100
In-Reply-To: <20240318093026.8193-1-javad.rahimipetroudi@mind.be> (Javad
 Rahimipetroudi's message of "Mon, 18 Mar 2024 10:30:25 +0100")
Message-ID: <87sf0nhniw.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/2] configs/avenger96: bump Uboot version
 to 2024.01
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
Cc: Marleen Vos <marleen.vos@mind.be>,
 Javad Rahimipetroudi <javad.rahimipetroudi@mind.be>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Javad" == Javad Rahimipetroudi <javad.rahimipetroudi@essensium.com> writes:

 > This patch upgrades Uboot version on Avenger96 board
 > Signed-off-by: Javad Rahimipetroudi <javad.rahimipetroudi@essensium.com>
 > ---

Please mark updated patches as v2, v3, .. and write a summary under the
--- about what you have changed, thanks.


>  board/arrow/avenger96/overlay/boot/extlinux/extlinux.conf | 2 +-
 >  configs/avenger96_defconfig                               | 4 ++--
 >  2 files changed, 3 insertions(+), 3 deletions(-)

 > diff --git a/board/arrow/avenger96/overlay/boot/extlinux/extlinux.conf b/board/arrow/avenger96/overlay/boot/extlinux/extlinux.conf
 > index 5d506b3dae..7d6d7f8a44 100644
 > --- a/board/arrow/avenger96/overlay/boot/extlinux/extlinux.conf
 > +++ b/board/arrow/avenger96/overlay/boot/extlinux/extlinux.conf
 > @@ -1,4 +1,4 @@
 >  label stm32mp157c-dk2-buildroot
 >    kernel /boot/zImage
 >    devicetree /boot/stm32mp157a-dhcor-avenger96.dtb
 > -  append root=/dev/mmcblk1p4 rootwait
 > +  append root=/dev/mmcblk0p4 rootwait
 > diff --git a/configs/avenger96_defconfig b/configs/avenger96_defconfig
 > index 536899583c..45600ef2fe 100644
 > --- a/configs/avenger96_defconfig
 > +++ b/configs/avenger96_defconfig
 > @@ -29,13 +29,13 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 >  # Bootloaders
 >  BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 >  BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
 > -BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.6"
 > +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.8"

Your commit message says u-boot but you are changing ATF?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
