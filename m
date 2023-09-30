Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A159E748E6
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 20:09:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D27560BFF;
	Sat, 30 Sep 2023 20:09:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D27560BFF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ugKtZt8poByW; Sat, 30 Sep 2023 20:09:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 157DD60BE0;
	Sat, 30 Sep 2023 20:09:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 157DD60BE0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 920281BF5AE
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 20:09:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 653804013B
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 20:09:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 653804013B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ouh-ZZdfRpvF for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 20:09:14 +0000 (UTC)
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3AA1A40131
 for <buildroot@uclibc.org>; Sat, 30 Sep 2023 20:09:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3AA1A40131
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1qmgH0-000AdH-OY
 for buildroot@uclibc.org; Sat, 30 Sep 2023 22:09:10 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd@kuhls.net>
Date: Sat, 30 Sep 2023 22:08:58 +0200
Message-ID: <pan$74e20$83ce0131$1cf2374f$6f20e2d8@ID-313208.user.individual.net>
References: <20230911210917.1114974-1-romain.naour@gmail.com>
 <87edigg4hb.fsf__32334.269203578$1696015980$gmane$org@48ers.dk>
Mime-Version: 1.0
User-Agent: Pan/0.154 (Izium; 517acf4)
Subject: Re: [Buildroot] [PATCH 1/2] package/{glibc,
 localedef}: bump to version
 2.38-13-g92201f16cbcfd9eafe314ef6654be2ea7ba25675
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am Fri, 29 Sep 2023 21:32:32 +0200 schrieb Peter Korsgaard:

>  > See:
>  > https://lists.gnu.org/archive/html/info-gnu/2023-07/msg00010.html
> 
>  > Runtime tested with Qemu on Gitlab-ci:
>  > https://gitlab.com/kubu93/buildroot/-/pipelines/998435203
>  > https://gitlab.com/buildroot.org/toolchains-builder/-/pipelines/
998926028

Hi,

with this defconfig:

BR2_x86_64=y
BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
BR2_PACKAGE_DHCP=y

this patch breaks building the dhcp package:

Building dns library in /home/bernd/buildroot/br4/output/build/dhcp-4.4.3-
P1/bind/bind-9.11.36/lib/dns
./gen: /lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.38' not found 
(required by ./gen)
make[4]: *** [Makefile:601: include/dns/enumtype.h] Error 1
make[3]: *** [Makefile:595: include] Error 2

Please note that this build error only occurs when the target and the host 
system have the same arch. For example this defconfig builds fine:

BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
BR2_PACKAGE_DHCP=y

"git revert 34f8d874ee" fixes the problem.

Some infos about my host system:

$ cat /etc/debian_version 
12.1
$ uname -a
Linux buildroot 6.1.55-x64v3-xanmod1 #0~20230923.gbb709ca SMP 
PREEMPT_DYNAMIC Sat Sep 23 15:37:25 UTC x86_64 GNU/Linux

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
