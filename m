Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF13DC64ED6
	for <buildroot@archiver.kernel.org>; Mon, 27 Feb 2023 14:50:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 71F9540A2A;
	Mon, 27 Feb 2023 14:50:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 71F9540A2A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mMEdH2DdAq4A; Mon, 27 Feb 2023 14:50:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9C3A0402F4;
	Mon, 27 Feb 2023 14:50:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9C3A0402F4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9C3EC1BF2A2
 for <buildroot@lists.busybox.net>; Mon, 27 Feb 2023 14:50:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 760BC40946
 for <buildroot@lists.busybox.net>; Mon, 27 Feb 2023 14:50:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 760BC40946
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jmIJdiUXhLZS for <buildroot@lists.busybox.net>;
 Mon, 27 Feb 2023 14:50:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 14D97408DA
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 14D97408DA
 for <buildroot@buildroot.org>; Mon, 27 Feb 2023 14:50:04 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A862FFF814;
 Mon, 27 Feb 2023 14:50:02 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1pWepF-009FZx-NY; Mon, 27 Feb 2023 15:50:01 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Lang Daniel via buildroot <buildroot@buildroot.org>
References: <VI1P190MB04936D7377E09CA3A3AA93A49FAF9@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
Date: Mon, 27 Feb 2023 15:50:01 +0100
In-Reply-To: <VI1P190MB04936D7377E09CA3A3AA93A49FAF9@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
 (Lang Daniel via buildroot's message of "Mon, 27 Feb 2023 08:46:25
 +0000")
Message-ID: <87sfermacm.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 3/3] linux: bump _KERNEL_LATEST_VERSION to
 6.2
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
Cc: Lang Daniel <d.lang@abatec.at>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Lang" == Lang Daniel via buildroot <buildroot@buildroot.org> writes:

 > Signed-off-by: Daniel Lang <d.lang@abatec.at>
 > ---
 >  linux/Config.in | 6 +++---
 >  1 file changed, 3 insertions(+), 3 deletions(-)

 > diff --git a/linux/Config.in b/linux/Config.in
 > index 5cbef197ab..495fc48997 100644
 > --- a/linux/Config.in
 > +++ b/linux/Config.in
 > @@ -28,8 +28,8 @@ choice
 >  	prompt "Kernel version"
 
 >  config BR2_LINUX_KERNEL_LATEST_VERSION
 > -	bool "Latest version (6.1)"
 > -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_1 if BR2_KERNEL_HEADERS_AS_KERNEL
 > +	bool "Latest version (6.2)"
 > +	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_2 if BR2_KERNEL_HEADERS_AS_KERNEL

Given that 6.1 is a LTS kernel I would prefer to wait with patch 2+3
until after 2023.02 is released (E.G. in a few days).

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
