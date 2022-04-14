Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38775C433F5
	for <buildroot@archiver.kernel.org>; Thu, 14 Apr 2022 20:07:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2FFE41890;
	Thu, 14 Apr 2022 20:07:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LWKr8TrEMhHO; Thu, 14 Apr 2022 20:07:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CE979418EB;
	Thu, 14 Apr 2022 20:07:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 34AD91BF393
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 20:07:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 22982831BD
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 20:07:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qnkK5NOnyldu for <buildroot@lists.busybox.net>;
 Thu, 14 Apr 2022 20:07:04 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CEF7282C84
 for <buildroot@buildroot.org>; Thu, 14 Apr 2022 20:07:03 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 7CDB91BF203;
 Thu, 14 Apr 2022 20:07:00 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1nf5k3-00BrQT-Hc; Thu, 14 Apr 2022 22:06:59 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle <arnout@mind.be>
References: <20220405185320.319C18361B@busybox.osuosl.org>
 <9ca9a86e-917a-ea5a-04bf-b9cd0e15aff5@othermo.de>
 <07cb544d-bc42-d774-08aa-67cecc96c1b0@mind.be>
 <87bkx7h299.fsf@dell.be.48ers.dk> <874k2zgxzk.fsf@dell.be.48ers.dk>
 <4fead5f8-95e6-6f88-6a8c-f62a32fcec9f@mind.be>
 <87ilrefy9b.fsf@dell.be.48ers.dk>
 <73baff5b-2b45-446f-e910-be5a21e74c4e@mind.be>
Date: Thu, 14 Apr 2022 22:06:59 +0200
In-Reply-To: <73baff5b-2b45-446f-e910-be5a21e74c4e@mind.be> (Arnout
 Vandecappelle's message of "Thu, 14 Apr 2022 21:15:36 +0200")
Message-ID: <87h76vbfa4.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
Subject: Re: [Buildroot] [git commit] package/containerd: security bump to
 version 1.5.11
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >> On a related note, the go/rust vendoring stuff isn't great for the
 >> source mirror, where we basically run make foo-source for all packages -
 >> And which now builds an internal toolchain and host-go / host-rust
 >> before doing the download :/ I guess I'll need to rework the mirroring
 >> logic a bit.

 >  Just don't delete the output directory?

That could kind of work if I used a per-branch output directory and
cleaned it up one in a while to not have odd behaviour when the
(dependences of) host-go / host-rust changes yeah.

I'll give it a try.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
