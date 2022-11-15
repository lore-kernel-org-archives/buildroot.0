Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC718C4332F
	for <buildroot@archiver.kernel.org>; Tue, 15 Nov 2022 08:19:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6BBD04051E;
	Tue, 15 Nov 2022 08:19:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6BBD04051E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZeBiqdFcXFEM; Tue, 15 Nov 2022 08:19:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5114640363;
	Tue, 15 Nov 2022 08:19:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5114640363
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2A80B1BF232
 for <buildroot@lists.busybox.net>; Tue, 15 Nov 2022 08:19:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1214540363
 for <buildroot@lists.busybox.net>; Tue, 15 Nov 2022 08:19:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1214540363
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hwLdgRow46xn for <buildroot@lists.busybox.net>;
 Tue, 15 Nov 2022 08:19:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DAEAB40352
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DAEAB40352
 for <buildroot@buildroot.org>; Tue, 15 Nov 2022 08:19:30 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 556FB60005;
 Tue, 15 Nov 2022 08:19:27 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1ourAE-008Lnr-A0; Tue, 15 Nov 2022 09:19:26 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20221106230450.970235-1-fontaine.fabrice@gmail.com>
Date: Tue, 15 Nov 2022 09:19:26 +0100
In-Reply-To: <20221106230450.970235-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 7 Nov 2022 00:04:50 +0100")
Message-ID: <871qq4iq9d.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/gptfdisk: fix popt static build
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix the following static build failure with popt and iconv raised since
 > bump to version 1.0.9 in commit 69015ce94ac3ffe7f349ec37868eea0d0ffec90e
 > and
 > https://sourceforge.net/p/gptfdisk/code/ci/122b58ad82f1a144226d262c87241ee035ed1aff
 > (which added an unified Makefile):

 > /home/autobuild/autobuild/instance-0/output-1/host/bin/mips64el-buildroot-linux-uclibc-g++
 > crc32.o support.o guid.o gptpart.o mbrpart.o basicmbr.o mbr.o gpt.o
 > bsd.o parttypes.o attributes.o diskio.o diskio-unix.o sgdisk.o gptcl.o
 > -static -liconv -lpopt -o sgdisk
 > /home/autobuild/autobuild/instance-0/output-1/host/lib/gcc/mips64el-buildroot-linux-uclibc/11.3.0/../../../../mips64el-buildroot-linux-uclibc/bin/ld:
 > /home/autobuild/autobuild/instance-0/output-1/host/mips64el-buildroot-linux-uclibc/sysroot/usr/lib64/../lib64/libpopt.a(poptint.o):
 > in function `strdup_locale_from_utf8':
 > poptint.c:(.text+0x113c): undefined reference to `libiconv_open'

 > As can be seen above, this build failure is raised because -liconv is
 > added before -lpopt so use pkgconfig and SGDISK_LDLIBS

 > The addition of -liconv in LDLIBS could probably be removed in a
 > follow-up patch for next branch

 > Fixes:
 >  - http://autobuild.buildroot.org/results/c9f2c9e737c2dd1cd4c1a08a5e8a48165179282d

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
