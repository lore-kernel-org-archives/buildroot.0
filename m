Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CA76C433F5
	for <buildroot@archiver.kernel.org>; Fri,  6 May 2022 19:22:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC60082AF5;
	Fri,  6 May 2022 19:22:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J5v1AtK_Wmm1; Fri,  6 May 2022 19:22:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C6DB0829EE;
	Fri,  6 May 2022 19:22:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DD9731BF3A9
 for <buildroot@lists.busybox.net>; Fri,  6 May 2022 19:22:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C555A60784
 for <buildroot@lists.busybox.net>; Fri,  6 May 2022 19:22:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jZbV2ozfscVV for <buildroot@lists.busybox.net>;
 Fri,  6 May 2022 19:22:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay11.mail.gandi.net (relay11.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 822C560625
 for <buildroot@buildroot.org>; Fri,  6 May 2022 19:22:45 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 71019100002;
 Fri,  6 May 2022 19:22:41 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nn3XE-00HKUQ-E1; Fri, 06 May 2022 21:22:40 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Neal Frager <neal.frager@amd.com>
References: <20220505155424.3002847-1-neal.frager@amd.com>
Date: Fri, 06 May 2022 21:22:40 +0200
In-Reply-To: <20220505155424.3002847-1-neal.frager@amd.com> (Neal Frager's
 message of "Thu, 5 May 2022 09:54:23 -0600")
Message-ID: <87pmkqzcsf.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v1 1/2] add
 configs/zynqmp_kria_kv260_defconfig
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
 michal.simek@amd.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Neal" == Neal Frager <neal.frager@amd.com> writes:

 > This patch adds support for Xilinx Kria KV260 starter kit.
 > KV260 features can be found here:
 > https://www.xilinx.com/products/boards-and-kits/kv260.html

 > While the Kria SOM is based on a ZynqMP SoC, there are some key
 > boot config differences from the other ZynqMP evaluation boards.

 > 1. There are no boot switches on Kria SOMs. The boot mode is thus
 > hard configured for QSPI flash. A pre-programmed boot.bin comes
 > with every Starter Kit. U-Boot can then find the Linux kernel and
 > file system on the SD card.

 > Optional instructions for updating the boot.bin in the QSPI flash
 > can be found in the readme.txt file and the link below.

 > https://xilinx-wiki.atlassian.net/wiki/spaces/A/pages/1641152513/Kria+K26+SOM

 > 2. Kria SOMs use UART1 for the console instead of UART0. For this
 > reason, Kria Starter Kits will use a separate extlinux.conf file
 > from other ZynqMP evaluation boards.

 > Signed-off-by: Neal Frager <neal.frager@amd.com>
 > ---
 >  board/zynqmp/kria/extlinux.conf        |   4 +
 >  board/zynqmp/kria/kv260/pm_cfg_obj.c   | 556 +++++++++++++++++++++++++
 >  board/zynqmp/kria/kv260/uboot.fragment |   1 +

Are you planning to also support other kria boards given the kria/
subdir?

>  board/zynqmp/kria/post-build.sh        |   8 +

The post-build.sh copy is not so nice, but ok.

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
