Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC6C3C433FE
	for <buildroot@archiver.kernel.org>; Tue, 12 Apr 2022 09:26:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 431B5415EB;
	Tue, 12 Apr 2022 09:26:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c798fx-cZyUe; Tue, 12 Apr 2022 09:26:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 219B7405AE;
	Tue, 12 Apr 2022 09:26:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CE8351BF2A1
 for <buildroot@lists.busybox.net>; Tue, 12 Apr 2022 09:26:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CA97E40141
 for <buildroot@lists.busybox.net>; Tue, 12 Apr 2022 09:26:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DH8ThnrL5hMF for <buildroot@lists.busybox.net>;
 Tue, 12 Apr 2022 09:26:45 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B0193400EF
 for <buildroot@buildroot.org>; Tue, 12 Apr 2022 09:26:44 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 16C8C20004;
 Tue, 12 Apr 2022 09:26:41 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1neCnI-008eK8-Uu; Tue, 12 Apr 2022 11:26:40 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Arnout Vandecappelle <arnout@mind.be>
References: <20220405185320.319C18361B@busybox.osuosl.org>
 <9ca9a86e-917a-ea5a-04bf-b9cd0e15aff5@othermo.de>
 <07cb544d-bc42-d774-08aa-67cecc96c1b0@mind.be>
 <87bkx7h299.fsf@dell.be.48ers.dk> <874k2zgxzk.fsf@dell.be.48ers.dk>
 <4fead5f8-95e6-6f88-6a8c-f62a32fcec9f@mind.be>
Date: Tue, 12 Apr 2022 11:26:40 +0200
In-Reply-To: <4fead5f8-95e6-6f88-6a8c-f62a32fcec9f@mind.be> (Arnout
 Vandecappelle's message of "Tue, 12 Apr 2022 10:28:10 +0200")
Message-ID: <87ilrefy9b.fsf@dell.be.48ers.dk>
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
Cc: Marcus Hoffmann <marcus.hoffmann@othermo.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >> In any case, I've pushed a commit to 2022.02.x to adjust the hash to
 >> what Github is now serving.

 >  As I've written in the mail that went concurrently with yours, this
 >  may change again at any time. Therefore, please make sure that you
 > update the tarball on sources.buildroot.org so there's a fallback when
 > the hash changes again.

It should happen automatically now that the hash matches, but I have
triggered a manual sync for containerd and cleared the negative cache
in cloudflare.

On a related note, the go/rust vendoring stuff isn't great for the
source mirror, where we basically run make foo-source for all packages -
And which now builds an internal toolchain and host-go / host-rust
before doing the download :/ I guess I'll need to rework the mirroring
logic a bit.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
