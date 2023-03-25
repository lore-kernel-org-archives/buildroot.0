Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7BD9C6FD1F
	for <buildroot@archiver.kernel.org>; Sat, 25 Mar 2023 10:38:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 54DF460B13;
	Sat, 25 Mar 2023 10:38:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 54DF460B13
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l-IohPD3E9Wq; Sat, 25 Mar 2023 10:38:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F08C60AB3;
	Sat, 25 Mar 2023 10:38:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F08C60AB3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 541D01BF29F
 for <buildroot@lists.busybox.net>; Sat, 25 Mar 2023 10:38:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2576A41716
 for <buildroot@lists.busybox.net>; Sat, 25 Mar 2023 10:38:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2576A41716
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wAduhuq9x9tm for <buildroot@lists.busybox.net>;
 Sat, 25 Mar 2023 10:37:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 554A141701
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 554A141701
 for <buildroot@buildroot.org>; Sat, 25 Mar 2023 10:37:57 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A368060002;
 Sat, 25 Mar 2023 10:37:54 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pg1HV-00DG3O-M1; Sat, 25 Mar 2023 11:37:53 +0100
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
Date: Sat, 25 Mar 2023 11:37:53 +0100
In-Reply-To: <CABRndgwHc_rpSxXqMdMmGb+3yDy5FSAjk=UDqeA0CvRS13=oiQ@mail.gmail.com>
 (Zvi Vered's message of "Sat, 25 Mar 2023 05:02:26 +0300")
Message-ID: <87355tp14u.fsf@dell.be.48ers.dk>
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
 > Did not try rootfs.cpio.uboot created by buildroot yet.
 > But I tried to extract rootfs.cpio (created by buildroot)
 > /dev contains the following:

 > -------------------------------------------------------------------------------------------------
 > drwxr-xr-x  4 zvivered zvivered 4096 Mar 12 22:20 .
 > drwxr-xr-x 17 zvivered zvivered 4096 Mar 14 20:31 ..
 > lrwxrwxrwx  1 zvivered zvivered   15 Mar 12 22:20 fd -> ../proc/self/fd
 > lrwxrwxrwx  1 zvivered zvivered   10 Mar 12 22:20 log -> ../tmp/log
 > drwxr-xr-x  2 zvivered zvivered 4096 Mar 12 22:20 pts
 > drwxr-xr-x  2 zvivered zvivered 4096 Mar 12 22:20 shm
 > lrwxrwxrwx  1 zvivered zvivered   17 Mar 12 22:20 stderr ->
 > ../proc/self/fd/2
 > lrwxrwxrwx  1 zvivered zvivered   17 Mar 12 22:20 stdin -> ../proc/self/fd/0
 > lrwxrwxrwx  1 zvivered zvivered   17 Mar 12 22:20 stdout ->
 > ../proc/self/fd/1
 > ------------------------------------------------------------------------------------------------------
 > Can you please explain how rest of /dev files are created during boot
 > sequence ?

The default for Buildroot is to use the devtmpfs filesystem in the
kernel to manage /dev, which will automatically create the needed device
nodes (see system configuration -> /dev management). This requires that
the kernel is built with CONFIG_DEVTMPFS=y and CONFIG_DEVTMPFS_MOUNT=y.


 > None of the scripts contains mdev.
 > I'm using the option:
 > BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
 > Is this the best option for automatic creation of /dev files ?

mdev is only needed if you need custom actions for device nodes,
E.G. special symlinks or module loading. Mdev also relies on devtmpfs as
explained above.

If you have enabled BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV, then you
should end up with a /etc/init.d/S10mdev init script to start up mdev.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
