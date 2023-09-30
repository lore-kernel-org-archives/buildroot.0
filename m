Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B34B6E748E6
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 21:12:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44A816076C;
	Sat, 30 Sep 2023 21:12:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 44A816076C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8m9WiE_Z7Ygz; Sat, 30 Sep 2023 21:12:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7CE75610A3;
	Sat, 30 Sep 2023 21:12:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7CE75610A3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2889F1BF5DF
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 21:12:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0151E42C33
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 21:12:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0151E42C33
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YA7ctNWBZGIM for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 21:12:14 +0000 (UTC)
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B4D5642C2B
 for <buildroot@uclibc.org>; Sat, 30 Sep 2023 21:12:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B4D5642C2B
Received: from relay5-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::225])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id F0E6AC3F90
 for <buildroot@uclibc.org>; Sat, 30 Sep 2023 20:59:25 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7EADF1C0003;
 Sat, 30 Sep 2023 20:59:21 +0000 (UTC)
Received: from peko by dell.home with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qmh3Y-00Fnfq-Pg; Sat, 30 Sep 2023 22:59:20 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Bernd Kuhls <bernd@kuhls.net>
References: <20230911210917.1114974-1-romain.naour@gmail.com>
 <87edigg4hb.fsf__32334.269203578$1696015980$gmane$org@48ers.dk>
 <pan$74e20$83ce0131$1cf2374f$6f20e2d8@ID-313208.user.individual.net>
Date: Sat, 30 Sep 2023 22:59:20 +0200
In-Reply-To: <pan$74e20$83ce0131$1cf2374f$6f20e2d8@ID-313208.user.individual.net>
 (Bernd Kuhls's message of "Sat, 30 Sep 2023 22:08:58 +0200")
Message-ID: <87r0mf74yf.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
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
Cc: buildroot@uclibc.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Bernd" == Bernd Kuhls <bernd@kuhls.net> writes:

 > Am Fri, 29 Sep 2023 21:32:32 +0200 schrieb Peter Korsgaard:
 >> > See:
 >> > https://lists.gnu.org/archive/html/info-gnu/2023-07/msg00010.html
 >> 
 >> > Runtime tested with Qemu on Gitlab-ci:
 >> > https://gitlab.com/kubu93/buildroot/-/pipelines/998435203
 >> > https://gitlab.com/buildroot.org/toolchains-builder/-/pipelines/
 > 998926028

 > Hi,

 > with this defconfig:

 > BR2_x86_64=y
 > BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
 > BR2_PACKAGE_DHCP=y

 > this patch breaks building the dhcp package:

 > Building dns library in /home/bernd/buildroot/br4/output/build/dhcp-4.4.3-
 > P1/bind/bind-9.11.36/lib/dns
 > ./gen: /lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.38' not found 
 > (required by ./gen)
 > make[4]: *** [Makefile:601: include/dns/enumtype.h] Error 1
 > make[3]: *** [Makefile:595: include] Error 2

So gen is presumably built for the target, but the build system for some
reason tries to execute it on the host - E.G. it was already a problem,
but it only happened to work before as the glibc version on your build
host matched better (was >=) than the 2.38.x version we use now.

 > Please note that this build error only occurs when the target and the host 
 > system have the same arch. For example this defconfig builds fine:

Ok, so I guess we somehow need to convince the dhcp build system to not
execute ./gen, even if target looks compatible to the host.

 > BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
 > BR2_PACKAGE_DHCP=y

 > "git revert 34f8d874ee" fixes the problem.

 > Some infos about my host system:

 > $ cat /etc/debian_version 
 > 12.1

I believe Debian 12 uses glibc 2.36:

https://packages.debian.org/search?keywords=libc6

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
