Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4AA0C25B7E
	for <buildroot@archiver.kernel.org>; Thu, 30 May 2024 19:29:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 75A9E4056F;
	Thu, 30 May 2024 19:29:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 94HKiCvobDbQ; Thu, 30 May 2024 19:29:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6012B405A1
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6012B405A1;
	Thu, 30 May 2024 19:29:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3581A1D4A24
 for <buildroot@lists.busybox.net>; Thu, 30 May 2024 19:29:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1F48E60697
 for <buildroot@lists.busybox.net>; Thu, 30 May 2024 19:29:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PSn_FGUHrCeS for <buildroot@lists.busybox.net>;
 Thu, 30 May 2024 19:29:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.200;
 helo=relay7-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C6FB560668
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C6FB560668
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C6FB560668
 for <buildroot@buildroot.org>; Thu, 30 May 2024 19:29:23 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 97E7A20004;
 Thu, 30 May 2024 19:29:21 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sClSj-00CCwR-06;
 Thu, 30 May 2024 21:29:21 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Romain Naour via buildroot <buildroot@buildroot.org>
References: <20240527100424.397567-1-romain.naour@smile.fr>
Date: Thu, 30 May 2024 21:29:20 +0200
In-Reply-To: <20240527100424.397567-1-romain.naour@smile.fr> (Romain Naour via
 buildroot's message of "Mon, 27 May 2024 12:04:24 +0200")
Message-ID: <871q5jqesv.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCHv2] configs/lepotato_defconfig: new defconfig
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
Cc: Romain Naour <romain.naour@smile.fr>,
 Kilian Zinnecker <kilian.zinnecker@mail.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Romain" == Romain Naour via buildroot <buildroot@buildroot.org> writes:

 > Add basic support for the Libre Computer "Le Potato" SBC.
 > https://libre.computer/products/aml-s905x-cc

 > Signed-off-by: Romain Naour <romain.naour@smile.fr>
 > Tested-by: Kilian Zinnecker <kilian.zinnecker@mail.de>
 > Signed-off-by: Romain Naour <romain.naour@smile.fr>
 > ---
 > v2: add BR2_DOWNLOAD_FORCE_CHECK_HASHES=y and hashes
 >     update kernel to 6.6.32 and u-boot 2024.04.
 > ---
 >  DEVELOPERS                                    |  2 +
 >  board/librecomputer/lepotato/extlinux.conf    |  4 +
 >  board/librecomputer/lepotato/genimage.cfg     | 33 ++++++++
 >  .../patches/linux-headers/linux-headers.hash  |  2 +
 >  .../lepotato/patches/linux/linux.hash         |  2 +
 >  .../lepotato/patches/uboot/uboot.hash         |  2 +
 >  board/librecomputer/lepotato/post-build.sh    |  5 ++
 >  board/librecomputer/lepotato/post-image.sh    | 23 ++++++
 >  board/librecomputer/lepotato/readme.txt       | 82 +++++++++++++++++++
 >  configs/lepotato_defconfig                    | 52 ++++++++++++
 >  10 files changed, 207 insertions(+)
 >  create mode 100644 board/librecomputer/lepotato/extlinux.conf
 >  create mode 100644 board/librecomputer/lepotato/genimage.cfg
 >  create mode 100644 board/librecomputer/lepotato/patches/linux-headers/linux-headers.hash
 >  create mode 100644 board/librecomputer/lepotato/patches/linux/linux.hash
 >  create mode 100644 board/librecomputer/lepotato/patches/uboot/uboot.hash
 >  create mode 100755 board/librecomputer/lepotato/post-build.sh
 >  create mode 100755 board/librecomputer/lepotato/post-image.sh
 >  create mode 100644 board/librecomputer/lepotato/readme.txt
 >  create mode 100644 configs/lepotato_defconfig

 > +++ b/board/librecomputer/lepotato/extlinux.conf
 > @@ -0,0 +1,4 @@
 > +label linux
 > +  kernel /Image
 > +  devicetree /meson-gxl-s905x-libretech-cc.dtb
 > +  append console=ttyAML0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait
 > diff --git a/board/librecomputer/lepotato/genimage.cfg b/board/librecomputer/lepotato/genimage.cfg
 > new file mode 100644
 > index 0000000000..b10e5d9440
 > --- /dev/null
 > +++ b/board/librecomputer/lepotato/genimage.cfg
 > @@ -0,0 +1,33 @@
 > +image boot.vfat {
 > +	vfat {
 > +		files = {
 > +			"Image",
 > +			"meson-gxl-s905x-libretech-cc.dtb",
 > +			"extlinux"

Is the vfat partition strictly needed or could you directly have the
rootfs as the first/single partition like we do for lafrite?

If so, that would make things a bit simpler (E.G. no post-build script,
host-mtools / host-dosfstools).

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
