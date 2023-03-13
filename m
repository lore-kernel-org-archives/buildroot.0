Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBAFAC61DA4
	for <buildroot@archiver.kernel.org>; Mon, 13 Mar 2023 18:52:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D42060E83;
	Mon, 13 Mar 2023 18:52:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D42060E83
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HR2gAqejNW6d; Mon, 13 Mar 2023 18:52:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B1E56605B5;
	Mon, 13 Mar 2023 18:52:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B1E56605B5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1AC561BF365
 for <buildroot@lists.busybox.net>; Mon, 13 Mar 2023 18:52:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E821C40272
 for <buildroot@lists.busybox.net>; Mon, 13 Mar 2023 18:52:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E821C40272
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IXqE6sfabrpb for <buildroot@lists.busybox.net>;
 Mon, 13 Mar 2023 18:52:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7BCE5401DC
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7BCE5401DC
 for <buildroot@buildroot.org>; Mon, 13 Mar 2023 18:52:22 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7BE6A2000C;
 Mon, 13 Mar 2023 18:52:20 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pbnHP-0006lK-Ic; Mon, 13 Mar 2023 19:52:19 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20230223123644.402595-1-fontaine.fabrice@gmail.com>
Date: Mon, 13 Mar 2023 19:52:19 +0100
In-Reply-To: <20230223123644.402595-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Thu, 23 Feb 2023 13:36:44 +0100")
Message-ID: <8735688ows.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/lttng-babeltrace: fix popt
 static build with libiconv
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
Cc: Philippe Proulx <eeppeliteloop@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix the following popt static build failure with libiconv:
 > configure:18149: checking for poptGetContext in -lpopt
 > configure:18172:
 > /home/buildroot/autobuild/instance-2/output-1/host/bin/m68k-buildroot-linux-uclibc-gcc
 > -o conftest -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
 > -D_FILE_OFFSET_BITS=64 -Os -g0 -static
 > -I/home/buildroot/autobuild/instance-2/output-1/host/bin/../m68k-buildroot-linux-uclibc/sysroot/usr/include/uuid
 > -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
 > -static conftest.c -lpopt
 > -L/home/buildroot/autobuild/instance-2/output-1/host/bin/../m68k-buildroot-linux-uclibc/sysroot/usr/lib
 > -luuid >&5
 > /home/buildroot/autobuild/instance-2/output-1/host/lib/gcc/m68k-buildroot-linux-uclibc/10.4.0/../../../../m68k-buildroot-linux-uclibc/bin/ld:
 > /home/buildroot/autobuild/instance-2/output-1/host/bin/../m68k-buildroot-linux-uclibc/sysroot/usr/lib/libpopt.a(poptint.o):
 > in function `POPT_fprintf':
 > poptint.c:(.text+0x28a): undefined reference to `libiconv_open'

 > [...]

 > checking for poptGetContext in -lpopt... no
 > configure: error: Cannot find popt.

 > Fixes:
 >  - http://autobuild.buildroot.org/results/4f465fe15664b1f9df3f26c331dc550852972f2f

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.11.x and 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
