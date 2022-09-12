Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88029C6FA83
	for <buildroot@archiver.kernel.org>; Mon, 12 Sep 2022 21:42:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 23468825FE;
	Mon, 12 Sep 2022 21:42:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 23468825FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fLnrS_m658NQ; Mon, 12 Sep 2022 21:42:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 41D23823F6;
	Mon, 12 Sep 2022 21:42:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 41D23823F6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 964D81BF333
 for <buildroot@lists.busybox.net>; Mon, 12 Sep 2022 21:42:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6960F4156C
 for <buildroot@lists.busybox.net>; Mon, 12 Sep 2022 21:42:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6960F4156C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oXKfJhm7t_lA for <buildroot@lists.busybox.net>;
 Mon, 12 Sep 2022 21:42:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1FEDB4155F
Received: from mout-b-110.mailbox.org (mout-b-110.mailbox.org
 [IPv6:2001:67c:2050:102:465::110])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1FEDB4155F
 for <buildroot@buildroot.org>; Mon, 12 Sep 2022 21:42:50 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-b-110.mailbox.org (Postfix) with ESMTPS id 4MRKny45pTz9sW6;
 Mon, 12 Sep 2022 23:42:46 +0200 (CEST)
Message-ID: <13fbf101-4f1b-e1a4-9a0c-80b00de59ac6@othermo.de>
Date: Mon, 12 Sep 2022 23:42:44 +0200
MIME-Version: 1.0
Content-Language: en-US
To: erichiggins@gmail.com
References: <CAHfxMJ69P8NVSqJr2tkNajMbFG-FD=Wz2DUfdstRQSqi86_3qw@mail.gmail.com>
 <5554ec40-062b-2e1e-e395-66509b97832e@othermo.de>
 <CAHfxMJ4KYXkeyX3yxH7yNQCR3zq6qShdzJch+bR0qqfvcr-gEw@mail.gmail.com>
From: Marcus Hoffmann <marcus.hoffmann@othermo.de>
In-Reply-To: <CAHfxMJ4KYXkeyX3yxH7yNQCR3zq6qShdzJch+bR0qqfvcr-gEw@mail.gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=othermo.de; s=MBO0001; t=1663018966;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qGGKgBr0T/g1KNR+iXsH97USqG9BzM+A5xmQY4pnLHA=;
 b=07H0MhNJa5wdMaMhu2bK5GVyMjCkBc7pAb6N8VYNw4A0dvCka9CrC1cgkyjieyEmEWs80g
 /W0AhKWtfi4NQE8zLU/VwWMKwxBPRXPJM2r2cY3hUV/aslenn2y65EEOTq2u+dktvyno6e
 //NZ3aGXDNpdFwvrCE6GGoZ+YrBCsi0YW/jo1wlELTQybbiYe7HddL+bcz83YJNdsKlqXz
 0cDzIsHQoF1e/nJiCGH1dcEu1QFawejdiDYeIiEYMH/Nfl/HYX4/3fpIJ7SqT9VS4pChYN
 n6HCOuJ2CUkdMNOv3f58of4cW5PlJBqbM6pyjyIkj6jp6+ZLaFcrhN998R60TA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=othermo.de header.i=@othermo.de
 header.a=rsa-sha256 header.s=MBO0001 header.b=07H0MhNJ
Subject: Re: [Buildroot] Patch for buildroot script utils/scanpypi
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Eric,

On 12.09.22 18:25, erichiggins@gmail.com wrote:
> I can, but I have to say that I agree with the note from the accepted 
> answer on stackoverflow:
> https://stackoverflow.com/questions/68238912/how-to-configure-and-use-git-send-email-to-work-with-gmail-to-email-patches-to <https://stackoverflow.com/questions/68238912/how-to-configure-and-use-git-send-email-to-work-with-gmail-to-email-patches-to>
> 
> The Buildroot project is creating too many barriers to contribute by not 
> adopting modern standards (e.g. self-hosted vs GitHub/GitLab, mailing 
> list patches vs Pull Requests, IRC vs Slack/Discord, etc).

There's also benefits to this model (apart from not using centralized, 
proprietary platforms being a good thing IMO):

It's much more common to get reviews/input from non-maintainers on this 
list, whereas on github people usually don't look through other peoples 
pull requests.

> There are many contributions that I would love to make, but the project 
> makes it much harder than it needs to be and it's not a good use of my time.

Together with Patchwork the email workflow is pretty nice actually.

You'll even get all the review comments here, I just wish it would allow 
commenting there (and sending it to the ML on behalf of the commenter):

https://patchwork.ozlabs.org/project/buildroot/patch/CAHfxMJ4cFRmUBteM-tM_gM=5fbdupjJRaahnbc34wifYgSn=gg@mail.gmail.com/

Looking forward to more of your contributions :-).

Best,
Marcus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
