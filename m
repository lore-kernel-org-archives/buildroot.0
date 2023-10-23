Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 395CAC25B46
	for <buildroot@archiver.kernel.org>; Mon, 23 Oct 2023 18:19:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C3DCB836AE;
	Mon, 23 Oct 2023 18:19:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C3DCB836AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 73u5Hwji4pIl; Mon, 23 Oct 2023 18:19:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 297CA83613;
	Mon, 23 Oct 2023 18:19:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 297CA83613
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3E7301BF2FF
 for <buildroot@lists.busybox.net>; Mon, 23 Oct 2023 18:19:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0E10883613
 for <buildroot@lists.busybox.net>; Mon, 23 Oct 2023 18:19:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E10883613
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id F-iWrd5uMT6y for <buildroot@lists.busybox.net>;
 Mon, 23 Oct 2023 18:19:13 +0000 (UTC)
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B9733835F2
 for <buildroot@uclibc.org>; Mon, 23 Oct 2023 18:19:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B9733835F2
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1quzWA-00008U-Qm
 for buildroot@uclibc.org; Mon, 23 Oct 2023 20:19:10 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd@kuhls.net>
Date: Mon, 23 Oct 2023 20:18:36 +0200
Message-ID: <pan$8c9a5$a9b49a3f$7f6d8c9c$6bdbfe7b@ID-313208.user.individual.net>
References: <20231022162052.540388-1-bernd@kuhls.net>
 <721a32e6.19ae.18b5a5d7704.Coremail.andyshrk@163.com>
 <ZTY9wZpTWfdBwdx3__21731.7699267127$1698053611$gmane$org@fdugast-desk.home>
Mime-Version: 1.0
User-Agent: Pan/0.154 (Izium; 517acf4)
Subject: Re: [Buildroot] [PATCH v4 1/1] package/igt-gpu-tools: new package
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

Am Mon, 23 Oct 2023 11:32:49 +0200 schrieb Francois Dugast:

> Besides, something seems wrong with the binaries because I get this
> error when executing any of them:
> 
>     # igt_stats igt_stats[102]: segfault at 2a9f6 ip 000000000002a9f6 sp

Hi Francois,

igt_stats segfaults here, too, but intel_gpu_top works on my testbed:

# intel_gpu_top -L
card0                    Intel Sandybridge (Gen6)          
pci:vendor=8086,device=0102,card=0

intel-gpu-top: Intel Sandybridge (Gen6) @ /dev/dri/card0 -    0/   0 MHz; 
100% RC6;  0.29/ 5.83 W;        0 irqs/s
      IMC reads:      407 MiB/s
     IMC writes:        3 MiB/s

I will try to get a gdb backtrace for igt_stats and report back.

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
