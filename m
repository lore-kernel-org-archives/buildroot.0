Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8019FC433EF
	for <buildroot@archiver.kernel.org>; Mon, 11 Apr 2022 06:30:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 22A0A83EB2;
	Mon, 11 Apr 2022 06:30:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dlIcWX_a7fp1; Mon, 11 Apr 2022 06:30:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E7BE83E90;
	Mon, 11 Apr 2022 06:30:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 072CB1BF46A
 for <buildroot@lists.busybox.net>; Mon, 11 Apr 2022 06:30:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E87A94157C
 for <buildroot@lists.busybox.net>; Mon, 11 Apr 2022 06:30:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yzgzTygOyesg for <buildroot@lists.busybox.net>;
 Mon, 11 Apr 2022 06:30:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 48F324157B
 for <buildroot@buildroot.org>; Mon, 11 Apr 2022 06:30:08 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7AAD91C0003;
 Mon, 11 Apr 2022 06:30:04 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1ndnYp-005tq2-DA; Mon, 11 Apr 2022 08:30:03 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Baruch Siach <baruch@tkos.co.il>
References: <20220405012059.2680327-1-james.hilliard1@gmail.com>
 <877d7wogm1.fsf@dell.be.48ers.dk> <87pmlodzw4.fsf@tarshish>
Date: Mon, 11 Apr 2022 08:30:03 +0200
In-Reply-To: <87pmlodzw4.fsf@tarshish> (Baruch Siach's message of "Mon, 11 Apr
 2022 07:08:53 +0300")
Message-ID: <87r164jfo4.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] linux/linux.mk: ensure custom kernel
 version is set
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
Cc: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Hi Peter,
 > On Sun, Apr 10 2022, Peter Korsgaard wrote:
 >>>>>>> "James" == James Hilliard <james.hilliard1@gmail.com> writes:
 >> 
 >> > Validate that BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE is set when
 >> > required.
 >> 
 >> > Fixes:
 >> > http://autobuild.buildroot.net/results/117/117c08e414776202446a9fdb96d084aa3c16af48
 >> 
 >> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
 >> 
 >> Committed to 2022.02.x, thanks.

 > Not in 2022.02.x as of commit 989c7c8f7b6e ("package/vim: security bump
 > to version 8.2.4732").

Ups, fixed now - Thanks!

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
