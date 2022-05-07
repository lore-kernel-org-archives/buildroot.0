Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EE5BC433EF
	for <buildroot@archiver.kernel.org>; Sat,  7 May 2022 21:01:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A8233408C4;
	Sat,  7 May 2022 21:01:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QY39RDMhqcMN; Sat,  7 May 2022 21:01:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 24EB74017B;
	Sat,  7 May 2022 21:01:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4DC411BF599
 for <buildroot@lists.busybox.net>; Sat,  7 May 2022 21:01:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4B0D781384
 for <buildroot@lists.busybox.net>; Sat,  7 May 2022 21:01:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XrZBVfQyvMkB for <buildroot@lists.busybox.net>;
 Sat,  7 May 2022 21:01:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::232])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0D6A381378
 for <buildroot@buildroot.org>; Sat,  7 May 2022 21:01:34 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 9B6D7200003;
 Sat,  7 May 2022 21:01:30 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nnRYP-000XzC-Bm; Sat, 07 May 2022 23:01:29 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Neal Frager <nealf@xilinx.com>
References: <20220505155424.3002847-1-neal.frager@amd.com>
 <87pmkqzcsf.fsf@dell.be.48ers.dk>
 <BE2A1487-0690-4BE3-BFEA-AC439B98FD3D@xilinx.com>
Date: Sat, 07 May 2022 23:01:29 +0200
In-Reply-To: <BE2A1487-0690-4BE3-BFEA-AC439B98FD3D@xilinx.com> (Neal Frager's
 message of "Sat, 7 May 2022 06:26:28 +0000")
Message-ID: <87czgpys46.fsf@dell.be.48ers.dk>
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
Cc: "luca@lucaceresoli.net" <luca@lucaceresoli.net>,
 "giulio.benetti@benettiengineering.com"
 <giulio.benetti@benettiengineering.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>,
 "michal.simek@amd.com" <michal.simek@amd.com>,
 Neal Frager <neal.frager@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Neal" == Neal Frager <nealf@xilinx.com> writes:

Hi,

 >> Are you planning to also support other kria boards given the kria/
 >> subdir?

 > Yes, there is another Kria carrier board we are about to announce.  It
 > is not public yet, but I setup the directories in planning for this.

Ahh, sounds interesting ;)

 >> 
 >>> board/zynqmp/kria/post-build.sh        |   8 +
 >> 
 >> The post-build.sh copy is not so nice, but ok.

 > I agree.  If you have a better solution, I would be happy to have any suggestions.

There's a number of options, E.G. we could use a symlink to the existing
script or pass the file to copy as an argument in
BR2_ROOTFS_POST_SCRIPT_ARGS. U-Boot afaik also expands variable
references in the extlinux files, so if there is already a U-Boot
variable with the serial port name then that could be used.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
