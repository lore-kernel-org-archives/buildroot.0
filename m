Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5393DC433F5
	for <buildroot@archiver.kernel.org>; Mon,  7 Feb 2022 18:43:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E9844403BF;
	Mon,  7 Feb 2022 18:43:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HkM3AcAlHz-d; Mon,  7 Feb 2022 18:43:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C111340158;
	Mon,  7 Feb 2022 18:43:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F017D1BF299
 for <buildroot@lists.busybox.net>; Mon,  7 Feb 2022 18:43:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D6AA581290
 for <buildroot@lists.busybox.net>; Mon,  7 Feb 2022 18:43:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y9_f63zpTmm5 for <buildroot@lists.busybox.net>;
 Mon,  7 Feb 2022 18:43:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E58958128F
 for <buildroot@buildroot.org>; Mon,  7 Feb 2022 18:43:44 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 1AAB020007;
 Mon,  7 Feb 2022 18:43:42 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peter@korsgaard.com>)
 id 1nH8zG-0006yB-Fy; Mon, 07 Feb 2022 19:43:42 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Andrey Nechypurenko <andreynech@gmail.com>
References: <CAOiXNkCq0M11qPm=nyJdLgFPRSf7Y+rWfhgGfPLuXsWk4ziCaw@mail.gmail.com>
Date: Mon, 07 Feb 2022 19:43:42 +0100
In-Reply-To: <CAOiXNkCq0M11qPm=nyJdLgFPRSf7Y+rWfhgGfPLuXsWk4ziCaw@mail.gmail.com>
 (Andrey Nechypurenko's message of "Mon, 7 Feb 2022 11:33:16 +0100")
Message-ID: <87ee4esejl.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] Build error with 2021.11.x
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

>>>>> "Andrey" == Andrey Nechypurenko <andreynech@gmail.com> writes:

 > Hello Buildrooters,
 > I just updated Buildroot from 2021.08.x to 2021.11.x and got build problems.
 > In particular, ICU library could not be built. I was trying with ARM
 > external toolchain and with Linaro 2018 getting the same error.

 > It would be great if someone can provide hints on what might be wrong and
 > how to fix the problem. Below are the relevant logs and information.

 > Thank you,
 > Andrey.

 >>>> icu 69-1 Configuring

[snip]

 > INTLTOOL_PERL=/usr/bin/perl CFLAGS="-D_LARGEFILE_SOURCE
 > -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O3 -g0
 > -D_FORTIFY_SOURCE=1
 > -I/home/and/p2/build/prodx/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/drm"
 > LDFLAGS=" -ldrm" ac_cv_lbl_unaligned_fail=yes

Hmm, is this a pristine upstream Buildroot 2021.11 without any external
packages? You seem to be passing some extra CFLAGS / LDFLAGS to the
configure script.

Variables like TARGET_CONFIGURE_OPTS are global, so you cannot change it
in a custom package without causing problems, like this:

 > configure:3057: checking whether the C compiler works
 > configure:3079:
 > /home/and/p2/build/prodx/host/bin/arm-linux-gnueabihf-gcc
 > -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -O3
 > -g0 -D_FORTIFY_SOURCE=1
 > -I/home/and/p2/build/prodx/host/arm-buildroot-linux-gnueabihf/sysroot/usr/include/drm
 > -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
 > -ldrm conftest.c -latomic >&5
 > /home/and/p2/build/prodx/host/opt/ext-toolchain/bin/../lib/gcc/arm-linux-gnueabihf/7.3.1/../../../../arm-linux-gnueabihf/bin/ld:
 > cannot find -ldrm

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
