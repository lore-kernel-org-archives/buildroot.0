Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D73D9C54E5D
	for <buildroot@archiver.kernel.org>; Mon, 18 Mar 2024 13:43:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A3BB540608;
	Mon, 18 Mar 2024 13:43:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ay7UnJ6KLml9; Mon, 18 Mar 2024 13:43:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A799A408A5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A799A408A5;
	Mon, 18 Mar 2024 13:43:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 778CF1BF363
 for <buildroot@lists.busybox.net>; Mon, 18 Mar 2024 13:43:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 63C5F607BD
 for <buildroot@lists.busybox.net>; Mon, 18 Mar 2024 13:43:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zsTeKvBCW7Xr for <buildroot@lists.busybox.net>;
 Mon, 18 Mar 2024 13:43:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 62B4D607B3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 62B4D607B3
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 62B4D607B3
 for <buildroot@buildroot.org>; Mon, 18 Mar 2024 13:43:08 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 14C081BF205;
 Mon, 18 Mar 2024 13:43:05 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rmDGb-002f3Z-1n;
 Mon, 18 Mar 2024 14:43:05 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Javad Rahimipetroudi <javad.rahimipetroudi@essensium.com>
References: <20240318133338.1811892-1-javad.rahimipetroudi@mind.be>
Date: Mon, 18 Mar 2024 14:43:05 +0100
In-Reply-To: <20240318133338.1811892-1-javad.rahimipetroudi@mind.be> (Javad
 Rahimipetroudi's message of "Mon, 18 Mar 2024 14:33:37 +0100")
Message-ID: <878r2ffyfq.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v2 1/2] configs/avenger96: bump Uboot
 version to 2024.01
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

 > This patch upgrades the Uboot and ATF versions on the Avenger96 board.
 > The ATF version is upgraded to v2.8, and the DTB_FILE_NAME in ATF
 > additional build requirements is also modified to refelect the
 > correct board configuration.

Do U-Boot and ATF needs to be updated in sync? If not, please split up
in two.

If they do, then please document that (with some details about why) in
the commit message.



 > Changes v1 -> v2:
 >   - Uboot version fixed to 2024.01
 >   - Unnecessary variable removed from ATF additional build args

 > Signed-off-by: Javad Rahimipetroudi <javad.rahimipetroudi@mind.be>
 > ---
 >  configs/avenger96_defconfig | 6 +++---
 >  1 file changed, 3 insertions(+), 3 deletions(-)

 > diff --git a/configs/avenger96_defconfig b/configs/avenger96_defconfig
 > index 536899583c..0afdaacf8d 100644
 > --- a/configs/avenger96_defconfig
 > +++ b/configs/avenger96_defconfig
 > @@ -29,19 +29,19 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 >  # Bootloaders
 >  BR2_TARGET_ARM_TRUSTED_FIRMWARE=y
 >  BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION=y
 > -BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.6"
 > +BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_VERSION_VALUE="v2.8"
 >  BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="stm32mp1"
 >  BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP=y
 >  BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31=y
 >  BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_AS_BL33=y
 >  BR2_TARGET_ARM_TRUSTED_FIRMWARE_UBOOT_BL33_IMAGE="u-boot-nodtb.bin"
 > -BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="STM32MP_SDMMC=1 AARCH32_SP=sp_min DTB_FILE_NAME=stm32mp157a-avenger96.dtb E=0 BL33_CFG=$(BINARIES_DIR)/u-boot.dtb"
 > +BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="STM32MP_SDMMC=1 AARCH32_SP=sp_min DTB_FILE_NAME=stm32mp157a-dhcor-avenger96.dtb BL33_CFG=$(BINARIES_DIR)/u-boot.dtb"
 >  BR2_TARGET_ARM_TRUSTED_FIRMWARE_IMAGES="fip.bin *.stm32"
 >  BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_DTC=y
 >  BR2_TARGET_UBOOT=y
 >  BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 >  BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 > -BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.07"
 > +BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.01"
 >  BR2_TARGET_UBOOT_BOARD_DEFCONFIG="stm32mp15_trusted"
 >  # BR2_TARGET_UBOOT_FORMAT_BIN is not set
 >  BR2_TARGET_UBOOT_FORMAT_DTB=y
 > -- 

 > 2.44.0


-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
