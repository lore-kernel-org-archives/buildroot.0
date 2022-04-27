Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37550C433F5
	for <buildroot@archiver.kernel.org>; Wed, 27 Apr 2022 20:09:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D9D614019F;
	Wed, 27 Apr 2022 20:09:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WbB4pH0DlG3X; Wed, 27 Apr 2022 20:09:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0290140136;
	Wed, 27 Apr 2022 20:09:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 479EB1BF869
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 20:09:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 34F0C40151
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 20:09:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Dz4B_OLVW11I for <buildroot@lists.busybox.net>;
 Wed, 27 Apr 2022 20:09:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DFFFF40136
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 20:09:22 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id C86C5FF807;
 Wed, 27 Apr 2022 20:09:18 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1njnyP-003J41-MC; Wed, 27 Apr 2022 22:09:17 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle <arnout@mind.be>
References: <20220427035039.1664864-1-james.hilliard1@gmail.com>
 <20220427103102.7f934c1f@windsurf>
 <CADvTj4og7yAZT69jVo8=5yHSppj7ih7dsUAy6hH+zib7HEi51g@mail.gmail.com>
 <2c51f9ba-5d02-17f7-98d0-8a4c1b6dcf79@mind.be>
Date: Wed, 27 Apr 2022 22:09:17 +0200
In-Reply-To: <2c51f9ba-5d02-17f7-98d0-8a4c1b6dcf79@mind.be> (Arnout
 Vandecappelle's message of "Wed, 27 Apr 2022 17:41:53 +0200")
Message-ID: <87y1zqi902.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/python3: drop libressl support
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
Cc: Asaf Kahlon <asafka7@gmail.com>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>, "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >>> I don't have a very well-informed opinion, but perhaps we should think
 >>> about this?
 >> Yeah, not really sure, it may be useful to keep around, I think it
 >> has an
 >> alternative updated API to openssl's updated API that may be desirable
 >> for some use cases, although probably not the most commonly used.

 >  At that point, however, having libressl as a virtual package
 >  alternative for openssl becomes less and less realistic. Virtual
 > packages should only be used if the alternatives can be considered
 > drop-in replacements with compatible API. A few exceptions are
 > acceptable, but it's becoming too much.

 >  We should also start thinking what to do with openssl 3. It has an
 >  API that is somewhat compatible with openssl 1.1.1, but there are
 > almost no packages that can use it without any changes. This could
 > actually be an opportunity to get aout of this mess: most packages
 > that are not compatible with libressl are probably already compatible
 > with openssl 3. So if we introduce an openssl3 package, we can migrate
 > the packages that don't like libressl to that, and leave the choice
 > between openssl 1.1.1 and libressl for legacy and BSD packages.

That indeed sounds like a way forward. Do we expect most applications to
(already have) move to the v3.x API or do we rather expect to have to
keep around openssl 1.1.1 / libressl for a long time?

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
