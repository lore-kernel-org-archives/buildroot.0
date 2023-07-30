Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86021C001DC
	for <buildroot@archiver.kernel.org>; Sun, 30 Jul 2023 20:26:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D8C766101B;
	Sun, 30 Jul 2023 20:26:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D8C766101B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WHdnJydDEpxt; Sun, 30 Jul 2023 20:26:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 256B761019;
	Sun, 30 Jul 2023 20:26:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 256B761019
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1E6E81BF31E
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 20:26:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E8F60817A8
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 20:26:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E8F60817A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SaeunRqGJgm5 for <buildroot@lists.busybox.net>;
 Sun, 30 Jul 2023 20:26:12 +0000 (UTC)
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A1CA081494
 for <buildroot@uclibc.org>; Sun, 30 Jul 2023 20:26:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A1CA081494
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1qQCzR-000AAX-PV
 for buildroot@uclibc.org; Sun, 30 Jul 2023 22:26:09 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd@kuhls.net>
Date: Sun, 30 Jul 2023 22:25:19 +0200
Message-ID: <pan$23df6$8f2c97e9$80972a17$d2124f06@ID-313208.user.individual.net>
References: <20230730054316.D9D0E400FE__49774.3708708853$1690695823$gmane$org@smtp2.osuosl.org>
Mime-Version: 1.0
User-Agent: Pan/0.154 (Izium; 517acf4)
Subject: Re: [Buildroot] [autobuild.buildroot.net] Daily results for
 2023-07-29
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

Hi Thomas,

Am Sun, 30 Jul 2023 05:43:11 -0000 schrieb Thomas Petazzoni via buildroot:

>    http://autobuild.buildroot.net/results/
d377efffbe2112f7bdf73bbee55e655ce1e03d44
>    | s390x     |       host-ccache-4.8.2        | NOK |
>    http://autobuild.buildroot.net/results/
a49c1eac4ba5ec6de71bd2dcbd201183cd28aa8d
>    | ORPH
>     or1k     |       host-ccache-4.8.2        | NOK |
>     http://autobuild.buildroot.net/results/
d84de4df9e4186ee2ac6c0903fd44a53e7916fb3
>     | ORPH

these build errors are caused by an ICE in host gcc, in our case 
gcc-12.3.1 on br-autobuild-1:

According to https://bugs.gentoo.org/906310#c3 the error was fixed 
upstream: https://gcc.gnu.org/git/gitweb.cgi?
p=gcc.git;h=396a4e76afec30d2461638f569cae18955eb4ad2

Is it possible to update the toolchain on br-autobuild-1?

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
