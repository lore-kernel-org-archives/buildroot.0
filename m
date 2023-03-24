Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C681C6FD1C
	for <buildroot@archiver.kernel.org>; Fri, 24 Mar 2023 06:37:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7DAA34091E;
	Fri, 24 Mar 2023 06:37:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7DAA34091E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LKj3rgKHV9SW; Fri, 24 Mar 2023 06:37:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A704B40921;
	Fri, 24 Mar 2023 06:37:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A704B40921
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E0A811BF295
 for <buildroot@lists.busybox.net>; Fri, 24 Mar 2023 06:37:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BA97282076
 for <buildroot@lists.busybox.net>; Fri, 24 Mar 2023 06:37:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BA97282076
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DHPbzm63Jsrc for <buildroot@lists.busybox.net>;
 Fri, 24 Mar 2023 06:37:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 552108200C
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 552108200C
 for <buildroot@buildroot.org>; Fri, 24 Mar 2023 06:37:03 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id CC96020003;
 Fri, 24 Mar 2023 06:36:59 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pfb2o-00BvXk-Nf; Fri, 24 Mar 2023 07:36:58 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Zvi Vered <veredz72@gmail.com>
References: <CABRndgw1EVFyDNDcRJ10gOPFfw-gH+7Gqx7P537EiSVr5Wq6Kw@mail.gmail.com>
 <875yavx0ui.fsf@dell.be.48ers.dk>
 <CABRndgyqeJXm6XqwYQ_QUaQAGB9EENSq4dc3qLaq6Y3RUhxFUg@mail.gmail.com>
 <87edpiuehn.fsf@dell.be.48ers.dk>
 <CABRndgwMRVDXzSAoGb5fU9PqM2b6z6we5rH40_NCs7w12LHiDA@mail.gmail.com>
 <877cv9vr7v.fsf@dell.be.48ers.dk>
 <CABRndgz8n37jikSwt3uBkGTM-UBObYcny6xEqhnFkDod9dae1Q@mail.gmail.com>
 <87355wv45c.fsf@dell.be.48ers.dk>
 <CABRndgycL0_hvf5dizJDby8VeW_z4xSnTZkXUOsVsXwy==yheA@mail.gmail.com>
 <875yasq7l8.fsf@dell.be.48ers.dk>
 <CABRndgzV8hKy1pyRCNm+sgi_ePoHgYrS5h_4ca2bZd3E006nPQ@mail.gmail.com>
Date: Fri, 24 Mar 2023 07:36:58 +0100
In-Reply-To: <CABRndgzV8hKy1pyRCNm+sgi_ePoHgYrS5h_4ca2bZd3E006nPQ@mail.gmail.com>
 (Zvi Vered's message of "Fri, 24 Mar 2023 06:30:28 +0300")
Message-ID: <877cv6psdx.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] 2023.02 : pty_allocate: openpty: No such file or
 directory
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

>>>>> "Zvi" == Zvi Vered <veredz72@gmail.com> writes:

Hello,

 > Hi Peter,
 > I did not know about an option to embed the rootfs as an initramfs.
 > The "custom way" is always plan B.
 > Can you please specify what I should modify in the .config of buildroot for
 > this purpose ?

If you configure Buildroot to build your Linux kernel as well, then you
will see a new option under filesystem images called "initial RAM
filesystem linked into linux kernel".

> Currently I extract rootfs.tar and then run the following script:
 > ------------------------------------------------------------------------------------------------------------
 > ./kernel/linux-xlnx/scripts/gen_initramfs_list.sh ../rootfs > initramfs_list
 > ./kernel/linux-xlnx/usr/gen_init_cpio initramfs_list > rootfs.cpio
 > gzip rootfs.cpio
 > ./u-boot/u-boot-xlnx/tools/mkimage -A arm64 -T ramdisk -C gzip -n
 > 'petalinux-user-image-plnx-zynqmp' -d rootfs.cpio.gz rootfs.cpio.gz.u-boot
 > -------------------------------------------------------------------------------------------------------------
 > This creates rootfs.cpio.gz.u-boot which is loaded via TFTP.

You presumably do this as a normal user, so file ownership will be wrong
and device nodes (like your /dev/null problem) cannot be correctly
created.

Even if you don't want to build a Linux kernel with Buildroot you can
replace those 4 steps with the cpio filesystem option in Buildroot,
E.G.:

 [*] cpio the root filesystem (for use as an initial RAM filesystem)
       cpio type (cpio the whole root filesystem)  --->
       Compression method (gzip)  --->
 [*]   Create U-Boot image of the root filesystem

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
