Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1923C38145
	for <buildroot@archiver.kernel.org>; Wed,  7 Sep 2022 07:33:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B47A60A69;
	Wed,  7 Sep 2022 07:33:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B47A60A69
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cMZbb93Uc2_P; Wed,  7 Sep 2022 07:33:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D421C607B0;
	Wed,  7 Sep 2022 07:33:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D421C607B0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0D3C81BF365
 for <buildroot@lists.busybox.net>; Wed,  7 Sep 2022 07:33:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DD338402E5
 for <buildroot@lists.busybox.net>; Wed,  7 Sep 2022 07:33:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DD338402E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4Bi_ERTn0yTY for <buildroot@lists.busybox.net>;
 Wed,  7 Sep 2022 07:33:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AA83240199
Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AA83240199
 for <buildroot@buildroot.org>; Wed,  7 Sep 2022 07:33:30 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 073AF20000F;
 Wed,  7 Sep 2022 07:33:26 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1oVpYs-00E78W-0N; Wed, 07 Sep 2022 09:33:26 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20220906161557.2645766-1-peter@korsgaard.com>
 <20220906213513.GC1490660@scaer> <20220906214119.GD1490660@scaer>
Date: Wed, 07 Sep 2022 09:33:25 +0200
In-Reply-To: <20220906214119.GD1490660@scaer> (Yann E. MORIN's message of
 "Tue, 6 Sep 2022 23:41:19 +0200")
Message-ID: <87v8pzy6yi.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH-next 1/2] nezha_defconfig: bump opensbi,
 u-boot and linux
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

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Peter, All,
 > On 2022-09-06 23:35 +0200, Yann E. MORIN spake thusly:
 >> On 2022-09-06 18:15 +0200, Peter Korsgaard spake thusly:
 >> > [...]  Keep the kernel build configuration in
 >> > place so host-{bison,flex} is built.
 >> Finally, with PPD, the PPD of u-boot would not have host-flex and
 >> host-bison because of the kernel anyway (it gets them from host-dtc
 >> instead) as the kernel is not a dependency of u-boot.

 > And the build did actually succeed with PPD when running in our docker
 > ref image which does not have flex or bison, and removing those two
 > lines:
 >     BR2_LINUX_KERNEL_DTS_SUPPORT=y
 >     BR2_LINUX_KERNEL_INTREE_DTS_NAME="allwinner/sun20i-d1-nezha"

 > But since I don't have the board, I can't test it...

Hmm, perhaps the comment in linux.mk is wrong then and modern kernels no
longer need flex and bison? No, it does look like it generated
dtc-lexer.lex.c / dtc-parser.tab.c:

ls -lah build/linux-custom/scripts/dtc/dtc-*
-rw-r--r-- 1 peko peko 6,2K Jun 14 03:26 build/linux-custom/scripts/dtc/dtc-lexer.l
-rw-r--r-- 1 peko peko  59K Sep  7 08:24 build/linux-custom/scripts/dtc/dtc-lexer.lex.c
-rw-r--r-- 1 peko peko  33K Sep  7 08:24 build/linux-custom/scripts/dtc/dtc-lexer.lex.o
-rw-r--r-- 1 peko peko  72K Sep  7 08:24 build/linux-custom/scripts/dtc/dtc-parser.tab.c
-rw-r--r-- 1 peko peko 4,3K Sep  7 08:24 build/linux-custom/scripts/dtc/dtc-parser.tab.h
-rw-r--r-- 1 peko peko  37K Sep  7 08:24 build/linux-custom/scripts/dtc/dtc-parser.tab.o
-rw-r--r-- 1 peko peko  11K Jun 14 03:26 build/linux-custom/scripts/dtc/dtc-parser.y

So I am not sure how it could work for you?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
