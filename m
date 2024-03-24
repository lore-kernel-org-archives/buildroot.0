Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92E56C47DD9
	for <buildroot@archiver.kernel.org>; Sun, 24 Mar 2024 13:54:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3792581583;
	Sun, 24 Mar 2024 13:54:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SLrkRJCa559h; Sun, 24 Mar 2024 13:54:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 477B7815AB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 477B7815AB;
	Sun, 24 Mar 2024 13:54:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 98F041BF5A2
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 13:54:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 83D34815AB
 for <buildroot@lists.busybox.net>; Sun, 24 Mar 2024 13:54:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UCWlAGhcm7NS for <buildroot@lists.busybox.net>;
 Sun, 24 Mar 2024 13:54:13 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=116.202.254.214;
 helo=ciao.gmane.io; envelope-from=gclub-buildroot@m.gmane-mx.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9E28D81583
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E28D81583
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9E28D81583
 for <buildroot@uclibc.org>; Sun, 24 Mar 2024 13:54:13 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gclub-buildroot@m.gmane-mx.org>) id 1roOIc-0007rT-GA
 for buildroot@uclibc.org; Sun, 24 Mar 2024 14:54:10 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: buildroot@uclibc.org
From: Bernd Kuhls <bernd@kuhls.net>
Date: Sun, 24 Mar 2024 14:53:07 +0100
Message-ID: <pan$3aaa8$7e8b5ffa$1345d421$b141e9e5@ID-313208.user.individual.net>
References: <20240324090325.1768623-1-nemaakhilesh__15532.5242479861$1711271038$gmane$org@gmail.com>
Mime-Version: 1.0
User-Agent: Pan/0.154 (Izium; 517acf4)
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=kuhls.net
Subject: Re: [Buildroot] [PATCH 1/1] package/procps-ng: bump to version 4.0.4
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

Am Sun, 24 Mar 2024 02:03:25 -0700 schrieb Akhilesh Nema:

> Release notes - https://gitlab.com/procps-ng/procps/-/releases/v4.0.4
> 
> - Dropped upstream patches - 0001-configure-Add--disable-w.patch and 0002-escape-c-Fix-missing-nl_langinfo-on-certain-configs.patch
> - Rename 0003-fix-pifd_open-check.patch to 0001-fix-pifd_open-check.patch. Removed partially upstreamed part.
> 
> Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
> ---
> $ ./utils/test-pkg -k -c procps-ng.config -p procps-ng
>                     bootlin-armv5-uclibc [1/6]: OK
>                      bootlin-armv7-glibc [2/6]: OK
>                    bootlin-armv7m-uclibc [3/6]: SKIPPED
>                      bootlin-x86-64-musl [4/6]: OK
>                       br-arm-full-static [5/6]: OK
>                              arm-aarch64 [6/6]: OK
> 6 builds, 1 skipped, 0 build failed, 0 legal-info failed, 0 show-info failed

Hi Akhilesh,

the build is broken using this defconfig:

BR2_x86_64=y
BR2_x86_corei7=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_CORE_I7_GLIBC_BLEEDING_EDGE=y
BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
BR2_PACKAGE_NCURSES_WCHAR=y
BR2_PACKAGE_PROCPS_NG=y

src/watch.c:56:11: fatal error: ncursesw/ncurses.h: No such file or directory

Regards, Bernd

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
