Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ECF6C77B61
	for <buildroot@archiver.kernel.org>; Mon, 27 Mar 2023 19:12:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9CE2E6109E;
	Mon, 27 Mar 2023 19:12:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9CE2E6109E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UcaJHc87MTxD; Mon, 27 Mar 2023 19:12:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EAE776109B;
	Mon, 27 Mar 2023 19:12:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EAE776109B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7B7A91BF292
 for <buildroot@lists.busybox.net>; Mon, 27 Mar 2023 19:12:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 552CC6109B
 for <buildroot@lists.busybox.net>; Mon, 27 Mar 2023 19:12:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 552CC6109B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YwMhilPID6Ar for <buildroot@lists.busybox.net>;
 Mon, 27 Mar 2023 19:12:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B971060B74
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B971060B74
 for <buildroot@buildroot.org>; Mon, 27 Mar 2023 19:12:24 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 393EA40005;
 Mon, 27 Mar 2023 19:12:20 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pgsGR-003xLa-1P; Mon, 27 Mar 2023 21:12:19 +0200
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
 <877cv6psdx.fsf@dell.be.48ers.dk>
 <CABRndgz5EeQhEkqHG0R=T0AvQnzOLHbabO+MjkYH9UHK53pL8g@mail.gmail.com>
 <CABRndgwHc_rpSxXqMdMmGb+3yDy5FSAjk=UDqeA0CvRS13=oiQ@mail.gmail.com>
 <87355tp14u.fsf@dell.be.48ers.dk>
 <CABRndgyK0f71HMi15+r8k0nu51sHQrRDx=OA7e5BWR6Oudhnbg@mail.gmail.com>
Date: Mon, 27 Mar 2023 21:12:18 +0200
In-Reply-To: <CABRndgyK0f71HMi15+r8k0nu51sHQrRDx=OA7e5BWR6Oudhnbg@mail.gmail.com>
 (Zvi Vered's message of "Mon, 27 Mar 2023 20:19:17 +0300")
Message-ID: <87o7oenh4d.fsf@dell.be.48ers.dk>
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

 > Hi Peter,
 > I tried the file *rootfs.cpio.uboot*  created by buildroot.
 > *It works !  *
 > dropbear is not killed and there are not /dev/null messages.

Ok, good!

 > I want to add a few files to this rootfs and then pack it again to
 > *rootfs.cpio.uboot*
 > So I extracted rootfs.cpio with:

 > cpio -idv < /tmp/rootfs.cpio
 > *** Added few files to /root ****
 > ls | cpio -ov > /tmp/rootfs.cpio
 > gzip -f /tmp/rootfs.cpio
 > ./u-boot/u-boot-xlnx/tools/mkimage -A arm64 -T ramdisk -C gzip -n 'zynqmp'
 > -d /tmp/rootfs.cpio.gz /tmp/rootfs.cpio.gz.uboot

 > Is this the right sequence ?
 > I  tried the new rootfs.cpio.gz.uboot. Boot hangs.

You need to do such things as root (or run under fakeroot) to ensure
correct permissions and device nodes, but the real way to make
modifications of the rootfs is explained in the Buildroot manual:

https://buildroot.org/downloads/manual/manual.html#rootfs-custom

 > Thank you very much for your help,

You are welcome.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
