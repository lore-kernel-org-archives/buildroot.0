Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ABA0EB64DC
	for <buildroot@archiver.kernel.org>; Sun, 25 Jun 2023 19:42:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B13E981E56;
	Sun, 25 Jun 2023 19:42:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B13E981E56
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ojCBZI7whbLw; Sun, 25 Jun 2023 19:42:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E634181E43;
	Sun, 25 Jun 2023 19:42:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E634181E43
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3D7FB1BF3A4
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 19:42:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1578B4098A
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 19:42:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1578B4098A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S_5-McMVdweY for <buildroot@lists.busybox.net>;
 Sun, 25 Jun 2023 19:42:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DA69E409FD
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DA69E409FD
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 19:42:04 +0000 (UTC)
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
X-GND-Sasl: peter@korsgaard.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6BC1B40004;
 Sun, 25 Jun 2023 19:42:01 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qDVcW-0077re-3h; Sun, 25 Jun 2023 21:42:00 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle <arnout@mind.be>
References: <20230622051703.2543-1-bernd@kuhls.net>
 <727a340c-9b87-eb4d-8291-5b97a256d9b1@mind.be>
 <87r0pzny4u.fsf@48ers.dk>
 <5508df57-8aec-ed78-061d-aa1477d20b66@mind.be>
Date: Sun, 25 Jun 2023 21:42:00 +0200
In-Reply-To: <5508df57-8aec-ed78-061d-aa1477d20b66@mind.be> (Arnout
 Vandecappelle's message of "Sun, 25 Jun 2023 21:34:05 +0200")
Message-ID: <87mt0nnxbr.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH v2 1/2] package/raptor: security bump
 version to 2.0.16
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
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 25/06/2023 21:24, Peter Korsgaard wrote:
 >>>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
 >> > On 22/06/2023 07:17, Bernd Kuhls wrote:
 >> >> This version included the patches removed by this commit, no new CVEs
 >> >> were fixed.
 >> >  So, I guess we shouldn't call it a "security bump" then? AFAIU
 >> the
 >> >  only reason to call it security bump is to flag to Peter that it
 >> > should be backported to stable.
 >> 
 >> And that is even not necessary. I do look at all commits getting applied
 >> to master to (try to) decide if something should be backported, E.G. if
 >> it is a (security) bugfix and also applies to the version in LTS.

 >  Oh. I saw you sometimes change the subject line to include "security
 >  bump" when the submitter forgets to...

Sure, if it is a security bump then we normally mention it in the commit
message and I sometimes fix that up when applying if the contributor
forgot to do so - But my point is that I don't just look at

git log --grep 'security bump'

Or something like that, I really skim through all commit on master.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
