Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D93AC38142
	for <buildroot@archiver.kernel.org>; Tue, 31 Jan 2023 22:36:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 142D3404EB;
	Tue, 31 Jan 2023 22:36:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 142D3404EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id a2hKg5n4c6Yz; Tue, 31 Jan 2023 22:36:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B6164042F;
	Tue, 31 Jan 2023 22:36:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B6164042F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 253D91BF380
 for <buildroot@lists.busybox.net>; Tue, 31 Jan 2023 22:36:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F3C7840305
 for <buildroot@lists.busybox.net>; Tue, 31 Jan 2023 22:36:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F3C7840305
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5C-qyETlr7KP for <buildroot@lists.busybox.net>;
 Tue, 31 Jan 2023 22:36:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 15B504002E
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::222])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 15B504002E
 for <buildroot@buildroot.org>; Tue, 31 Jan 2023 22:36:22 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 901EB40004;
 Tue, 31 Jan 2023 22:36:19 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pMzEg-00A7aM-K2; Tue, 31 Jan 2023 23:36:18 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Thomas Devoogdt <thomas@devoogdt.com>
References: <20230130121930.3472747-1-thomas@devoogdt.com>
 <20230130121930.3472747-2-thomas@devoogdt.com>
Date: Tue, 31 Jan 2023 23:36:18 +0100
In-Reply-To: <20230130121930.3472747-2-thomas@devoogdt.com> (Thomas Devoogdt's
 message of "Mon, 30 Jan 2023 13:19:29 +0100")
Message-ID: <877cx249i5.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v3 2/3] package/fluent-bit: fix -latomic on
 various platforms
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
Cc: Thomas Devoogdt <thomas.devoogdt@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Thomas" == Thomas Devoogdt <thomas@devoogdt.com> writes:

 > From: Thomas Devoogdt <thomas.devoogdt@gmail.com>
 > /home/thomas/br-test-pkg/bootlin-nios2-glibc/host/opt/ext-toolchain/bin/../lib/gcc/nios2-buildroot-linux-gnu/10.3.0/../../../../nios2-buildroot-linux-gnu/bin/ld:
 > /tmp/fluent-bit.6F9rEA.ltrans28.ltrans.o: undefined reference to
 > symbol '__atomic_compare_exchange_8@@LIBATOMIC_1.0'
 > /home/thomas/br-test-pkg/bootlin-nios2-glibc/host/opt/ext-toolchain/bin/../lib/gcc/nios2-buildroot-linux-gnu/10.3.0/../../../../nios2-buildroot-linux-gnu/bin/ld:
 > /home/thomas/br-test-pkg/bootlin-nios2-glibc/host/nios2-buildroot-linux-gnu/sysroot/lib/libatomic.so.1:
 > error adding symbols: DSO missing from command line
 > collect2: error: ld returned 1 exit status

 > Signed-off-by: Thomas Devoogdt <thomas.devoogdt@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
