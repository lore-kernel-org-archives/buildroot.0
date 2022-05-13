Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87E68C433EF
	for <buildroot@archiver.kernel.org>; Fri, 13 May 2022 16:56:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4329940AC6;
	Fri, 13 May 2022 16:56:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id arCK_03LuSfJ; Fri, 13 May 2022 16:56:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5347E40ABD;
	Fri, 13 May 2022 16:56:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5E85A1BF86B
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 16:55:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4C1D240ABD
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 16:55:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 09K-t_CSA6hh for <buildroot@lists.busybox.net>;
 Fri, 13 May 2022 16:55:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 39EA440ABA
 for <buildroot@buildroot.org>; Fri, 13 May 2022 16:55:58 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 554851BF204;
 Fri, 13 May 2022 16:55:55 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1npYa2-00B2kc-7W; Fri, 13 May 2022 18:55:54 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20220513144215.2598981-1-peter@korsgaard.com>
 <20220513144215.2598981-4-peter@korsgaard.com>
 <20220513163446.GQ1597494@scaer>
Date: Fri, 13 May 2022 18:55:54 +0200
In-Reply-To: <20220513163446.GQ1597494@scaer> (Yann E. MORIN's message of
 "Fri, 13 May 2022 18:34:46 +0200")
Message-ID: <87lev58j8l.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 4/4] {linux,
 linux-headers}: default to 5.17.x
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
 > On 2022-05-13 16:42 +0200, Peter Korsgaard spake thusly:
 >> 5.15.x is getting quite old, so default to 5.17.x instead.

 > But 5.15 is a longterm kernel, while 5.17 will probably not be.

True, but we normally default to the latest kernel, I just kept it for
5.15 for the LTS release.

 > Also, see below...

 >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 >> ---
 > [--SNIP--]
 >> diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
 >> index 5ff616fb34..859f772624 100644
 >> --- a/package/linux-headers/Config.in.host
 >> +++ b/package/linux-headers/Config.in.host
 > [--SNIP--]
 >> @@ -56,10 +56,6 @@ config BR2_KERNEL_HEADERS_5_15
 >> bool "Linux 5.15.x kernel headers"
 >> select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
 >> 
 >> -config BR2_KERNEL_HEADERS_5_16
 >> -	bool "Linux 5.16.x kernel headers"
 >> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_16

 > Did you forget to squash this hunk...

Ups, indeed. Will fix.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
