Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 039D2C433FE
	for <buildroot@archiver.kernel.org>; Thu, 24 Nov 2022 12:00:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 93BD460E8F;
	Thu, 24 Nov 2022 12:00:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 93BD460E8F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yDNJvVlBalfE; Thu, 24 Nov 2022 12:00:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D945E610CC;
	Thu, 24 Nov 2022 12:00:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D945E610CC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3C6161BF48C
 for <buildroot@lists.busybox.net>; Thu, 24 Nov 2022 12:00:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1849260C06
 for <buildroot@lists.busybox.net>; Thu, 24 Nov 2022 12:00:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1849260C06
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x-0uFbLGsB_F for <buildroot@lists.busybox.net>;
 Thu, 24 Nov 2022 12:00:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA938610CD
Received: from serv15.avernis.de (serv15.avernis.de [176.9.89.163])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EA938610CD
 for <buildroot@buildroot.org>; Thu, 24 Nov 2022 12:00:11 +0000 (UTC)
Received: from webmail.serv15.avernis.de (ip6-localhost [IPv6:::1])
 by serv15.avernis.de (Postfix) with ESMTPSA id EE0BFBDE716B;
 Thu, 24 Nov 2022 13:00:08 +0100 (CET)
MIME-Version: 1.0
Date: Thu, 24 Nov 2022 12:00:08 +0000
From: Andreas Ziegler <br015@umbiko.net>
To: Charles Lohr <lohr85@gmail.com>
In-Reply-To: <mailman.9442.1669275362.179200.buildroot@buildroot.org>
References: <mailman.9442.1669275362.179200.buildroot@buildroot.org>
Message-ID: <cd5a955627dfcf09eefb5e58c355bd4b@umbiko.net>
X-Sender: br015@umbiko.net
X-Virus-Scanned: clamav-milter 0.103.7 at serv15.avernis.de
X-Virus-Status: Clean
Subject: Re: [Buildroot] CPIO Kernel Image Build Order for initramfs
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
Cc: buildroot <buildroot@buildroot.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Charles,

On 2022-11-21 06:26, Charles Lohr <lohr85@gmail.com> wrote:
> (Forgive me if this list isn't for questions, please direct me to the 
> right
> place. This is my first message to the list)
> 
> I want to build full executable images, with the rootfs built into the
> kernel without compression, so I'm using CPIO.  But, buildroot doesn't 
> seem
> to like this when starting from a clean slate.

You can enable this under 'Filesystem images' -> 'Initial RAM filesystem 
linked into Linux kernel' (BR2_TARGET_ROOTFS_INITRAMFS). This will 
execute the steps you now perform manually.

> It wants to build the kernel before the image, but if I do that, I get 
> this
> error.
> 
> make[4]: *** No rule to make target '../../images/rootfs.cpio', needed 
> by
> 'usr/initramfs_inc_data'.  Stop.
> 
> Right now, my process is: touch an empty images/rootfs.cpio file, 
> compile,
> touch the kernel config, recompile and this works but it's yucky.
> 
> What is the "right" answer?
> 
> Charles

Kind regards,
Andreas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
