Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80CAAC433EF
	for <buildroot@archiver.kernel.org>; Sat, 12 Feb 2022 13:43:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3715860D91;
	Sat, 12 Feb 2022 13:43:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KmGPyOA2ioC3; Sat, 12 Feb 2022 13:43:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7FB61605E8;
	Sat, 12 Feb 2022 13:43:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 99F951BF283
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 13:43:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 870F3410A3
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 13:43:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZnRZpCq_fZ2T for <buildroot@lists.busybox.net>;
 Sat, 12 Feb 2022 13:43:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 41F1E40362
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 13:43:24 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 29A38240002;
 Sat, 12 Feb 2022 13:43:20 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1nIsgK-0005aA-CU; Sat, 12 Feb 2022 14:43:20 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Neal Frager <neal.frager@xilinx.com>
References: <20220211144402.1626443-1-neal.frager@xilinx.com>
 <20220211144402.1626443-2-neal.frager@xilinx.com>
Date: Sat, 12 Feb 2022 14:43:20 +0100
In-Reply-To: <20220211144402.1626443-2-neal.frager@xilinx.com> (Neal Frager's
 message of "Fri, 11 Feb 2022 07:44:02 -0700")
Message-ID: <87leygnqtj.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v6 2/2] add configs/zynqmp_zcu102_defconfig
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
Cc: luca@lucaceresoli.net, giulio.benetti@benettiengineering.com,
 michal.simek@xilinx.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Neal" == Neal Frager <neal.frager@xilinx.com> writes:

 > This patch:
 > - adds support for Xilinx ZCU102 evaluation board
 > - ZCU102 features can be found here:
 > https://www.xilinx.com/products/boards-and-kits/zcu102.html

 > Signed-off-by: Neal Frager <neal.frager@xilinx.com>
 > Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
 > Tested-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
 > [Giulio: only build tested]

 > ---
 V1-> V2:
 > * fixed general build issues
 > * added extlinux.conf for run-time boot issue
 V2-> V3:
 > * enabled support for host machines without OpenSSL required by U-Boot and Linux
 > * moved readme.txt update to zynqmp_zcu102_defconfig patch 2/2
 V3-> V4:
 > * cleaned up commit log messages
 > * added version history
 V4-> V5:
 > * switched to sha1 urls to make ATF, U-Boot and Linux builds reproducible
 > * generated board specific pm_cfg_obj.c files with vitis 2021.2
 V5-> V6:
 > * fixed build issue with pm_cfg_obj.c files
 > ---
 > ---
 >  board/zynqmp/readme.txt          |  23 +-
 >  board/zynqmp/zcu102/pm_cfg_obj.c | 563 +++++++++++++++++++++++++++++++
 >  configs/zynqmp_zcu102_defconfig  |  39 +++
 >  3 files changed, 618 insertions(+), 7 deletions(-)
 >  create mode 100644 board/zynqmp/zcu102/pm_cfg_obj.c
 >  create mode 100644 configs/zynqmp_zcu102_defconfig

You forgot to add an entry to the DEVELOPERS file for it, so I've done
that, changed the git hashes with the git describe output like I
explained for zcu106 and committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
