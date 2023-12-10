Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4905EC4167B
	for <buildroot@archiver.kernel.org>; Sun, 10 Dec 2023 19:28:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E265E400D0;
	Sun, 10 Dec 2023 19:28:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E265E400D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K_-QUPobYh5I; Sun, 10 Dec 2023 19:28:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CFFA440116;
	Sun, 10 Dec 2023 19:28:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CFFA440116
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 38D781BF368
 for <buildroot@lists.busybox.net>; Sun, 10 Dec 2023 19:28:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 10A5181E63
 for <buildroot@lists.busybox.net>; Sun, 10 Dec 2023 19:28:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10A5181E63
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p4LKWdA9ZJFK for <buildroot@lists.busybox.net>;
 Sun, 10 Dec 2023 19:28:24 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9380481E61
 for <buildroot@buildroot.org>; Sun, 10 Dec 2023 19:28:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9380481E61
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4BE8E60003;
 Sun, 10 Dec 2023 19:28:21 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rCPTQ-002SEq-1I;
 Sun, 10 Dec 2023 20:28:20 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
References: <5969347.lOV4Wx5bFT@kilian-aisec>
 <7af21f66-d3c5-e42f-03e5-8a1f6b370520@mind.be>
 <20230902094244.0251e004@windsurf> <23317020.6Emhk5qWAg@kilian-aisec>
 <a6f09f61-573b-465a-b5a9-6d175c313f2b@mind.be>
Date: Sun, 10 Dec 2023 20:28:20 +0100
In-Reply-To: <a6f09f61-573b-465a-b5a9-6d175c313f2b@mind.be> (Arnout
 Vandecappelle via buildroot's message of "Sat, 9 Dec 2023 22:29:32
 +0100")
Message-ID: <87msuhoo17.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
Subject: Re: [Buildroot] Buildroot docker image
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
Cc: Kilian Zinnecker <kilian.zinnecker@mail.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, yann.morin.1998@free.fr
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Arnout" == Arnout Vandecappelle via buildroot <buildroot@buildroot.org> writes:

Hi,

 >  In retrospect, this was probably a mistake :-) Alpine is based on the
 >  musl libc, and as you noticed below, there are host tools that don't
 >  work with musl. Clearly, nobody is using Buildroot on a musl-based
 >  build machine at the moment, since nobody ever complained about this
 > (and fakeroot always needs to be built).

Yes, lets stick to a "normal" glibc based distribution.

 >  So, if we do go for Alpine as the official docker image, we can
 >  expect quite a lot of breakage... Therefore, before going there, I
 >  think we should go for a "normal" distro after all for the time
 >  being. Of all the traditional distros, ubuntu:22.04 has by far the
 >  smallest image at 80MB (this actually came as quite the surprise to
 >  me... I have no idea why Fedora would be twice as large! But it does
 >  already include Python, so after installing all necessary packages it
 >  may even out again...).

I think Fedora is the outlier here, Debian is similar to Ubuntu:

docker image ls debian:12.2\*
REPOSITORY   TAG         IMAGE ID       CREATED       SIZE
debian       12.2-slim   31d5e503c34f   2 weeks ago   74.8MB
debian       12.2        0ce03c8a15ec   2 weeks ago   117MB

Given that we already use Debian for the "CI" container, it IMHO makes
sense to use it here as well.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
