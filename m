Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08A3BC433F5
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 19:34:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B4C460BF6;
	Mon,  4 Apr 2022 19:34:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8PgTGTnglgte; Mon,  4 Apr 2022 19:34:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C700F6100C;
	Mon,  4 Apr 2022 19:34:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E46CA1BF27E
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 19:34:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DFCE660FFC
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 19:34:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AzSoOgLm14MO for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 19:34:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B95E360FE1
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 19:34:03 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 85DC040007;
 Mon,  4 Apr 2022 19:34:01 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nbSSe-006cgI-Nq; Mon, 04 Apr 2022 21:34:00 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20220403163737.223577-1-fontaine.fabrice@gmail.com>
 <20220403163737.223577-2-fontaine.fabrice@gmail.com>
Date: Mon, 04 Apr 2022 21:34:00 +0200
In-Reply-To: <20220403163737.223577-2-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Sun, 3 Apr 2022 18:37:37 +0200")
Message-ID: <875ynoy76f.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] package/libyang: disable tests
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
Cc: Jan =?utf-8?Q?Kundr=C3=A1t?= <jan.kundrat@cesnet.cz>,
 Heiko Thiery <heiko.thiery@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Disable tests which are enabled by default in debug mode since bump to
 > version 2.0.0 in commit 2a3edc5e00b38f4f927894d0911990c9060e4415 and
 > https://github.com/CESNET/libyang/commit/e84f12fc5eccd67ed41e852fa0e23c030ae8acb0
 > as they will raise the following build failure if cmocka is built before
 > libyang:

 > In file included from /home/buildroot/autobuild/instance-0/output-1/host/riscv64-buildroot-linux-musl/sysroot/usr/include/stdint.h:20,
 >                  from /home/buildroot/autobuild/instance-0/output-1/host/opt/ext-toolchain/lib/gcc/riscv64-buildroot-linux-musl/10.3.0/include/stdint.h:9,
 >                  from /home/buildroot/autobuild/instance-0/output-1/build/libyang-2.0.112/src/libyang.h:18,
 >                  from /home/buildroot/autobuild/instance-0/output-1/build/libyang-2.0.112/tests/utests/utests.h:30,
 >                  from /home/buildroot/autobuild/instance-0/output-1/build/libyang-2.0.112/tests/utests/extensions/test_yangdata.c:15:
 > /home/buildroot/autobuild/instance-0/output-1/host/riscv64-buildroot-linux-musl/sysroot/usr/include/bits/alltypes.h:53:24: error: conflicting types for 'uintptr_t'
 >    53 | typedef unsigned _Addr uintptr_t;
 >       |                        ^~~~~~~~~

 > Fixes:
 >  - http://autobuild.buildroot.org/results/7ae21fbb28b1a69183c5d8ed87cf5f5cbf055026

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2022.02.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
