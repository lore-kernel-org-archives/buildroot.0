Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2623AC4332F
	for <buildroot@archiver.kernel.org>; Wed,  8 Nov 2023 21:14:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D47C481D65;
	Wed,  8 Nov 2023 21:14:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D47C481D65
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z2kqxeJBQVo4; Wed,  8 Nov 2023 21:14:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E2D981C46;
	Wed,  8 Nov 2023 21:14:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E2D981C46
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0DAAE1BF4DD
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 21:14:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DA84360AD5
 for <buildroot@lists.busybox.net>; Wed,  8 Nov 2023 21:14:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DA84360AD5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ufp-qsrGApqE for <buildroot@lists.busybox.net>;
 Wed,  8 Nov 2023 21:14:09 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1AB8560AAF
 for <buildroot@buildroot.org>; Wed,  8 Nov 2023 21:14:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1AB8560AAF
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6F681E0002;
 Wed,  8 Nov 2023 21:14:07 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1r0psE-001GeX-2X;
 Wed, 08 Nov 2023 22:14:06 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: <yann.morin@orange.com>
References: <cover.1698941362.git.yann.morin@orange.com>
 <8647e9778bb35b421a4a989e0b69b6a4d18968cd.1698941362.git.yann.morin@orange.com>
Date: Wed, 08 Nov 2023 22:14:06 +0100
In-Reply-To: <8647e9778bb35b421a4a989e0b69b6a4d18968cd.1698941362.git.yann.morin@orange.com>
 (yann morin's message of "Thu, 2 Nov 2023 17:09:20 +0100")
Message-ID: <87msvoosm9.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/8] package/pkg-cargo: don't expand license
 info when empty
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

>>>>>   <yann.morin@orange.com> writes:

 > From: "Yann E. MORIN" <yann.morin@orange.com>
 > The cargo infrastructure automatically expands the list of licenses with
 > a little blurb that the licenses for vendored dependencies might be
 > missing in the list.

 > However, when a package does not define a license, the resulting text is
 > sub-optimal, resulting in a manifest that contains (with a leading
 > comma, yes):

 >     , vendored dependencies licenses probably not listed

 > In that case, pointing out some unkown licensing terms may be part of
 > unkonwn licensing terms is superfluous.

 > Instead, just let the legal infra do its job, and report an "unkown"
 > license altogether.

 > Signed-off-by: Yann E. MORIN <yann.morin@orange.com>

Committed to 2023.02.x and 2023.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
