Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9573EC4332F
	for <buildroot@archiver.kernel.org>; Wed,  2 Nov 2022 06:53:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E48DB607D0;
	Wed,  2 Nov 2022 06:53:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E48DB607D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HMUquz0N7XZr; Wed,  2 Nov 2022 06:53:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BBBF3607C9;
	Wed,  2 Nov 2022 06:53:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BBBF3607C9
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 56C181BF94D
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 06:53:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2687B607C9
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 06:53:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2687B607C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8vppDzwp8M-m for <buildroot@lists.busybox.net>;
 Wed,  2 Nov 2022 06:53:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CB1B8607C7
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CB1B8607C7
 for <buildroot@buildroot.org>; Wed,  2 Nov 2022 06:53:32 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 5A4AA1C0008;
 Wed,  2 Nov 2022 06:53:28 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oq7ct-006Kim-AO; Wed, 02 Nov 2022 07:53:27 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Neal Frager <neal.frager@amd.com>
References: <20221013064931.60174-1-neal.frager@amd.com>
Date: Wed, 02 Nov 2022 07:53:27 +0100
In-Reply-To: <20221013064931.60174-1-neal.frager@amd.com> (Neal Frager's
 message of "Thu, 13 Oct 2022 00:49:31 -0600")
Message-ID: <877d0dvod4.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v4 1/1] boot/uboot/uboot.mk: add pmufw.elf
 support
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
Cc: luca.ceresoli@bootlin.com, buildroot@buildroot.org, kris.chaplin@amd.com,
 wesley@sonifex.co.uk, giulio.benetti@benettiengineering.com,
 michal.simek@amd.com, yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Neal" == Neal Frager <neal.frager@amd.com> writes:

 > This patch adds support for zynqmp pmufw.elf files.
 > It will allow buildroot to use pmufw.elf binaries directly
 > from the Xilinx git repository built by petalinux in
 > addition to still supporting pmufw.bin binaries built
 > by the zynqmp-pmufw-builder.

 > https://github.com/Xilinx/ubuntu-firmware/tree/v2022.1_22.04_1/xlnx-firmware

 > Signed-off-by: Neal Frager <neal.frager@amd.com>
 > ---
 > V1-> V2:
 >   - corrected objcopy instruction for converting elf to bin
 > V2-> V3:
 >   - removed unnecessary spaces
 >   - simplified if statement to check for a pmufw.elf file
 > V3-> V4:
 >   - added spaces around = sign of UBOOT_ZYNQMP_PMUFW_BASENAME definition

Committed to 2022.08.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
