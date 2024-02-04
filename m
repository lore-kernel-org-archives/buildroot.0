Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAB86C48286
	for <buildroot@archiver.kernel.org>; Sun,  4 Feb 2024 20:59:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5CF0E405B7;
	Sun,  4 Feb 2024 20:59:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5CF0E405B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id t6q_P9kP9HfF; Sun,  4 Feb 2024 20:59:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 772304055F;
	Sun,  4 Feb 2024 20:59:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 772304055F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F3C861BF288
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 20:59:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D93CC4169B
 for <buildroot@lists.busybox.net>; Sun,  4 Feb 2024 20:59:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D93CC4169B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UA_YY9Y5kKOA for <buildroot@lists.busybox.net>;
 Sun,  4 Feb 2024 20:59:47 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7FA3B41697
 for <buildroot@buildroot.org>; Sun,  4 Feb 2024 20:59:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7FA3B41697
Received: by mail.gandi.net (Postfix) with ESMTPSA id 47540FF803;
 Sun,  4 Feb 2024 20:59:42 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rWjaY-00A1v3-02;
 Sun, 04 Feb 2024 21:59:42 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Baruch Siach <baruch@tkos.co.il>
References: <20240117210756.265708-1-ju.o@free.fr> <Zazgd8sRYiHBY1CB@landeda>
 <871q9sr42s.fsf@48ers.dk> <87il345jah.fsf@tarshish>
Date: Sun, 04 Feb 2024 21:59:41 +0100
In-Reply-To: <87il345jah.fsf@tarshish> (Baruch Siach's message of "Sun, 04 Feb
 2024 17:40:14 +0200")
Message-ID: <87o7cwoshu.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] [PATCH 1/1] package/postgresql: fix service runtime
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
Cc: Maxim Kochetkov <fido_max@inbox.ru>, Julien Olivain <ju.o@free.fr>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Hi Peter,
 > On Sun, Feb 04 2024, Peter Korsgaard wrote:

 >> > Applied to master, thanks.
 >> 
 >> Committed to 2023.11.x, thanks.

 > Not in 2023.11.x as of commit 7d35d445a1ae ("package/micropython: fix
 > building after dropping GIT_DIR=. workaround").

Ehh, I made a mistake - 2023.11.x doesn't have postgresql 16.x, so this
is not backported.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
