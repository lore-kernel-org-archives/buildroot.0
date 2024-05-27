Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77366C25B7C
	for <buildroot@archiver.kernel.org>; Mon, 27 May 2024 13:01:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4164E400C4;
	Mon, 27 May 2024 13:01:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h3vqJ-_kN4AG; Mon, 27 May 2024 13:00:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 466E840102
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 466E840102;
	Mon, 27 May 2024 13:00:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CE5281D1CAA
 for <buildroot@lists.busybox.net>; Mon, 27 May 2024 13:00:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C6BF4402B8
 for <buildroot@lists.busybox.net>; Mon, 27 May 2024 13:00:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XT8KG22G3-Bl for <buildroot@lists.busybox.net>;
 Mon, 27 May 2024 13:00:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::226;
 helo=relay6-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 6CA184029C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6CA184029C
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6CA184029C
 for <buildroot@buildroot.org>; Mon, 27 May 2024 13:00:54 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 43872C000B;
 Mon, 27 May 2024 13:00:51 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1sBZy6-005KKH-26;
 Mon, 27 May 2024 15:00:50 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20240505190044.1246330-1-fontaine.fabrice@gmail.com>
Date: Mon, 27 May 2024 15:00:50 +0200
In-Reply-To: <20240505190044.1246330-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 5 May 2024 21:00:44 +0200")
Message-ID: <87ttijbe9p.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/libutempter: do not hardcode PIE
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > PIE will be set by buildroot if the user wants it so set
 > {COMPILE,LINK}_PIE to an empty value to fix the following build failure
 > raised since the addition of the package in commit
 > 02c818bc5c7a6967a212f12e4caa8ccdfa0b452b:

 > /home/buildroot/autobuild/run/instance-3/output-1/host/bin/m68k-linux-gcc
 > -W -Wall -Waggregate-return -Wcast-align -Wconversion
 > -Wdisabled-optimization -Wmissing-declarations
 > -Wmissing-format-attribute -Wmissing-noreturn -Wmissing-prototypes
 > -Wpointer-arith -Wredundant-decls -Wshadow -Wstrict-prototypes
 > -Wwrite-strings -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
 > -D_FILE_OFFSET_BITS=64 -O2 -g0 -std=gnu99 -DLIBEXECDIR=\"/usr/lib\"
 > -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
 > -Wl,-z,relro -Wl,-stats -fPIE -pie -Wl,-z,now utempter.c -o utempter

 > [...]

 > /home/buildroot/autobuild/run/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/m68k-buildroot-linux-uclibc/12.3.0/../../../../m68k-buildroot-linux-uclibc/bin/ld:
 > /home/buildroot/autobuild/run/instance-3/output-1/host/m68k-buildroot-linux-uclibc/sysroot/usr/lib/Scrt1.o:
 > in function `lib_main':
 > (.text+0x4): undefined reference to `__shared_flat_add_library'

 > Fixes: 02c818bc5c7a6967a212f12e4caa8ccdfa0b452b
 >  - http://autobuild.buildroot.org/results/3a5581fd4edf56bbdc48ab111a2351fc70f1c703

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 > Changes v1 -> v2 (after review of Yann E. Morin):
 >  - Also set COMPILE_PIE

Committed to 2024.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
