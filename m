Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1C68CE7A94
	for <buildroot@archiver.kernel.org>; Mon, 25 Sep 2023 11:43:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F09E60B05;
	Mon, 25 Sep 2023 11:43:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F09E60B05
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Wsm8S7d3UDWf; Mon, 25 Sep 2023 11:43:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DEEFD6076C;
	Mon, 25 Sep 2023 11:43:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DEEFD6076C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CE4F91BF2C9
 for <buildroot@lists.busybox.net>; Mon, 25 Sep 2023 11:43:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A7CAF8164A
 for <buildroot@lists.busybox.net>; Mon, 25 Sep 2023 11:43:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A7CAF8164A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IPYBhVvLWiGt for <buildroot@lists.busybox.net>;
 Mon, 25 Sep 2023 11:43:51 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::228])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6870B81589
 for <buildroot@buildroot.org>; Mon, 25 Sep 2023 11:43:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6870B81589
Received: by mail.gandi.net (Postfix) with ESMTPSA id AA39B1BF206;
 Mon, 25 Sep 2023 11:43:47 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qkk09-002ZI4-DO; Mon, 25 Sep 2023 13:43:45 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20230919061556.4252-1-fontaine.fabrice@gmail.com>
Date: Mon, 25 Sep 2023 13:43:45 +0200
In-Reply-To: <20230919061556.4252-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 19 Sep 2023 08:15:56 +0200")
Message-ID: <87a5taeavi.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/binutils: fix install of libsframe
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix the following build failure with oprofile raised since bump of
 > binutils to version 2.40 in commit
 > 35656482d3b74ab12a6c2395ac9ca61b60a2fd49:

 > configure: error: bfd library not found

 > [...]

 > configure:17928: checking for bfd_openr in -lbfd
 > configure:17953:
 > /home/buildroot/autobuild/run/instance-1/output-1/host/bin/arm-linux-gcc
 > -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
 > -D_FILE_OFFSET_BITS=64 -Os -g0 -D_LARGEFILE_SOURCE
 > -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 conftest.c -lbfd -liberty
 > -lpopt -ldl -lintl >&5
 > /home/buildroot/autobuild/run/instance-1/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/12.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld:
 > warning: libsframe.so.0, needed by
 > /home/buildroot/autobuild/run/instance-1/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libbfd.so,
 > not found (try using -rpath or -rpath-link)

 > Indeed, in this case, libsframe is not installed even after applying
 > commit 1b4d921e1da614a72fed2a79d5c4f8e0b6d1cd45 because
 > BR2_BINUTILS_VERSION_2_40_X is not selected by anyone (binutils package
 > is selected by oprofile and the toolchain is not generated by buildroot)

 > To fix this issue, invert the logic: install libsframe by default (i.e.
 > when binutils is selected or with a buildroot toolchain). libsframe will
 > not be installed only if binutils < 2.40 is detected.

 > Fixes:
 >  - http://autobuild.buildroot.org/results/af9a2d52823a332b48e6df14d2708b6a4b3833a4

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 > Changes v1 -> v2 (after review of Baruch Siach):
 >  - Fix title typo

Committed to 2023.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
