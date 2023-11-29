Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF776C4167B
	for <buildroot@archiver.kernel.org>; Wed, 29 Nov 2023 09:00:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D89781319;
	Wed, 29 Nov 2023 09:00:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D89781319
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e7E6sDWYsQtL; Wed, 29 Nov 2023 09:00:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DF56981290;
	Wed, 29 Nov 2023 09:00:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DF56981290
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0DE5D1BF276
 for <buildroot@lists.busybox.net>; Wed, 29 Nov 2023 09:00:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E431B41800
 for <buildroot@lists.busybox.net>; Wed, 29 Nov 2023 09:00:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E431B41800
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bowz-JWiOWvL for <buildroot@lists.busybox.net>;
 Wed, 29 Nov 2023 09:00:54 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::224])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1C2B041802
 for <buildroot@buildroot.org>; Wed, 29 Nov 2023 09:00:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C2B041802
Received: by mail.gandi.net (Postfix) with ESMTPSA id D824DE0012;
 Wed, 29 Nov 2023 09:00:50 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1r8GR8-0015yg-0L;
 Wed, 29 Nov 2023 10:00:50 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20231129074635.9797-1-fontaine.fabrice@gmail.com>
Date: Wed, 29 Nov 2023 10:00:49 +0100
In-Reply-To: <20231129074635.9797-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Wed, 29 Nov 2023 08:46:35 +0100")
Message-ID: <87sf4p9bni.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/openrc: fix uclibc handling
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
Cc: =?utf-8?Q?Micha=C5=82_=C5=81yszczek?= <michal.lyszczek@bofc.pl>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix issues spotted by Yann E. Morin in commit
 > ca169d1d0a5df92e6a1f0850e6969cc525849e6f:
 >  - BR2_TOOLCHAIN_BUILDROOT_UCLIBC -> BR2_TOOLCHAIN_USES_UCLIBC
 >  - Add dependency to openrc package and not only to init system

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
