Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB759C19F28
	for <buildroot@archiver.kernel.org>; Wed,  3 Aug 2022 16:38:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4023582919;
	Wed,  3 Aug 2022 16:38:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4023582919
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CKNbpZ52C2Fu; Wed,  3 Aug 2022 16:38:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 41170828EF;
	Wed,  3 Aug 2022 16:38:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 41170828EF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 101A01BF3D5
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 16:37:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EBC5E828EF
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 16:37:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EBC5E828EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GK-UbvXp-wE9 for <buildroot@lists.busybox.net>;
 Wed,  3 Aug 2022 16:37:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9FF44828E3
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9FF44828E3
 for <buildroot@buildroot.org>; Wed,  3 Aug 2022 16:37:57 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 42D712000A;
 Wed,  3 Aug 2022 16:37:55 +0000 (UTC)
Date: Wed, 3 Aug 2022 18:37:54 +0200
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Message-ID: <20220803183754.1eb45753@windsurf>
In-Reply-To: <20220801204227.2993126-1-yann.morin.1998@free.fr>
References: <20220801204227.2993126-1-yann.morin.1998@free.fr>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1659544675;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NfTAvkueq2dZAohCeALEomDUoJKxdnxHlEyko58uA+4=;
 b=actWLx2If5eIok/IMUanB5gq9LLwC3mNx6jUEnrc4J6nOGAJOKnc8DDmPvjaZBnWfg5mQ2
 mFHU3NGTu/aiX4EPNWVgG4A2pJ7WmBzHgDcrdswMs2RBt9fO6t+zrTJxA0VkbE8EbyxL2f
 aVXeDYfpBBorT3R6U2BxRPx/qVq6V/kjNqWBZeaAT2cqtd/bUDSHwKM5zJUIdxwKiiBxJV
 3Pnj+Wl0zJl+/5HvFXPWvm41gVqclZ/7hP4f1w7WU0nVliFddgWLNBCvazovBIx9cVsp6Q
 dtbJTp5bxT8K2U0Ahs+ttOBGzzYZA/pbVrn9ENdLtwoIUohwCKHeX+/L4gMilw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=actWLx2I
Subject: Re: [Buildroot] [PATCHv2] Makefile: fix show-vars for good this time
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Roosen Henri <Henri.Roosen@ginzinger.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon,  1 Aug 2022 22:42:27 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> Commit 5c54c3ef3db2 (Makefile: workaround make 4.3 issue for 'printvars
> and 'show-vars') did not fully fix the show-vars case, which still
> segfaults.
> 
> Overall, show-vars generates a JSON blurb. That is supposed to be
> machine-readable, so we do not care that the variables are sorted, so
> we get rid of it to (slightly) simplify the code.
> 
> Then, we currently iterate twice on the list of variables: the first one
> to filter-out the 'internal' variables, and the second one to filter
> only the variables matching the pattern. We can do away by iterating
> only once, and applying both filters at once.
> 
> Since we now have an 'and' condition, we can take advantage of it: when
> none of the items in $(and) are empty, $(and) evaluates to the last
> item, while it evaluates to empty if any of the items is empty. So we
> can coalesce the $(if) and $(and) together: $(if $(and a,b),c) is
> equivalent to: $(and a,b,c) ; this gains us one parentheses depth.
> 
> Finally, the cause for the segfault is an overly-long call to $(info).
> Reducing that is not easy: we want to call clean-json on the whole of
> the JSON blurb, so we can't emit the individual variables one by one, or
> the trailing comma would not be trimmed away.
> 
> So, we go crazy: we just output each word from clean-json with $(info).
> 
> We can do that, because mk-json-str transforms all spaces in a string
> to an escaped UTF-8 sequence, so we will never have spaces in values;
> the keys are the variables, so they won't have spaces either; spaces in
> the rest of the JSON blurb are totally optional, so we don't care how
> many there are. We know there are spaces, because we explicitly
> introduce some (after "expanded" or "raw", for example), so we should
> never hit a too-big word for $(info) to print.
> 
> Thanks to Henri for the suggestion to push $(info) further inside the
> macro.
> 
> Reported-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> Cc: Roosen Henri <Henri.Roosen@ginzinger.com>
> Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> 
> ---
> Changes v1 -> v2:
>   - coalesce $(if) with $(and)
>   - don't output a trailing $(space) when calling $(info)
> ---
>  Makefile | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
