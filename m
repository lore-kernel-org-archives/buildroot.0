Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1128C47258
	for <buildroot@archiver.kernel.org>; Sun, 28 Jan 2024 07:57:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 20DDF82CE5;
	Sun, 28 Jan 2024 07:57:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 20DDF82CE5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qwAyeJwT7T8a; Sun, 28 Jan 2024 07:57:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D24B82B94;
	Sun, 28 Jan 2024 07:57:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D24B82B94
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 827521BF3C0
 for <buildroot@lists.busybox.net>; Sun, 28 Jan 2024 07:57:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6714D400CF
 for <buildroot@lists.busybox.net>; Sun, 28 Jan 2024 07:57:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6714D400CF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TGmkF53mgP2h for <buildroot@lists.busybox.net>;
 Sun, 28 Jan 2024 07:57:01 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4B9E94000B
 for <buildroot@buildroot.org>; Sun, 28 Jan 2024 07:57:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4B9E94000B
Received: by mail.gandi.net (Postfix) with ESMTPSA id 05D63FF804;
 Sun, 28 Jan 2024 07:56:57 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rU02D-00CZYy-0x;
 Sun, 28 Jan 2024 08:56:57 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20240126135747.2407552-1-peter@korsgaard.com>
 <ZbVmT0V0pDW6IegC@landeda>
Date: Sun, 28 Jan 2024 08:56:57 +0100
In-Reply-To: <ZbVmT0V0pDW6IegC@landeda> (Yann E. MORIN's message of "Sat, 27
 Jan 2024 21:23:43 +0100")
Message-ID: <87wmrtzy9i.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH] package/darkhttpd: security bump to version
 1.15
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Peter, All,
 > On 2024-01-26 14:57 +0100, Peter Korsgaard spake thusly:
 >> Fixes the following security issues:
 >> 
 >> CVE-2024-23770: Local Leak of Authentication Parameter in Process List
 >> 
 >> CVE-2024-23771: Basic Auth Timing Attack
 >> 
 >> https://security.opensuse.org/2024/01/22/darkhttpd-basic-auth-issues.html
 >> 
 >> Notice that CVE-2024-23770 is only documented as a known weakness, not
 >> fixed.
 >> 
 >> Also change the license logic to use the dedicated COPYING file available
 >> since 1.14:
 >> 
 >> https://github.com/emikulic/darkhttpd/commit/a8ae2b1de069588cad23d79a5392445ee9590fcd
 >> 
 >> This license is ISC, not MIT - So adjust DARKHTTPD_LICENSE to match.

 > This means the licensing stuff should be backported to the maintenance
 > branches, and should thus have been a separate patch prior to the
 > version bump.

 > But since this is a security fix, I guess you'll want to backport the
 > version bump too. And since the odlest stable, 2023.02, already had
 > darkhttpd 1.14, it is possibe to backport the version bump to all
 > maintenance branches.

 > Thus, I considered splitting, got slightly cat-distracted, and pushed
 > without splitting.

Hehe ;) That was indeed also the reason why I didn't do the effort to
split it in multiple patches.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
