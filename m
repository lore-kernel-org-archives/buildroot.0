Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9787CC433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 21:17:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3787840611;
	Sat,  8 Jan 2022 21:17:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uj-JQroqR9Bl; Sat,  8 Jan 2022 21:17:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86A6240219;
	Sat,  8 Jan 2022 21:17:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 13BE71BF283
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 21:17:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 027F740219
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 21:17:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jv5TB8cRZiZ4 for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 21:17:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 08C6140204
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 21:17:40 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id k21so29416412lfu.0
 for <buildroot@buildroot.org>; Sat, 08 Jan 2022 13:17:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=K6n7hJhwckk/NbTBye2vC8DX5FvuSrZNLCRqly1kwGc=;
 b=lzpusYAGRX3fCvbPOav4Lb8r6wM60cj24se3OH3QG4k9ztgboheOtJrtXJ/i8DdPY2
 nbo75NucYP6r0xY0DWGt11h5z8O0LSfd+zLGpM/aiMhJsDr4r+z+5paPP9/zAJxqEmrA
 6XwzqS+kBiV4AhvST4+CnRx6z2Ciib3gRwlZ+lMbhtNugSjDl1fx4LwQA0N75sZgoZkQ
 oTzTlqQXhyNySNMSqgDsUDaEzt8t5iR1YkJCeZdS9Q8ecbZzVJdcy2nfDMO+VQhTeyt8
 oCIDSrrxYZ2C+WcbitxdDln0zX9Xb12URj+rxA2PJqZekUEdryi407U5qrviuTVt6ODf
 x80g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K6n7hJhwckk/NbTBye2vC8DX5FvuSrZNLCRqly1kwGc=;
 b=73lzb1OAhbv0qcDAT8exlqJ0snLC5VFZZ0Rf0fmS2X1tJKO1dPblaypvkUQ850e/9L
 PRSoTTHg2dU82OpJjpyQX+iDb8oH3lkTssPkDvWtPRMDF4AdMmjoixyUc06vsfwWEBcJ
 Se10hujmnmfFqgHgkyGsNRR2CDdO4Ij+jPmw2yJ6gaNYbwHw8PiiCtJDLdUR3fywhkBH
 HdT1iOi3UhgNVRmA7aByF42gl7N4bl2Dm0Bmz/6w05W95zYRusvzwr6Ud/nBMBxE6qQt
 X1xUyB0PUtaoV2O5M7r3zfDWz1gQDqaf1R2SgQvplniwAhdi0OxTgOM5r6LU5BO4kTCZ
 2Xng==
X-Gm-Message-State: AOAM531ZIi0OQbTQpFR6cTzrUjx3BJ9ST6bilGVhbsgwkjshpXTS/qJ1
 8VmW5wm9rENuNlhumh4Ron+N1xKBb2IWU3mbWWg=
X-Google-Smtp-Source: ABdhPJwHUti87MlRt0vuJMsuwSURYrH7MuAZoad++oKjR7aZCKX+izahQZfOpXp/+lFOGphmFFo4QyCNZFWpoVXWuLQ=
X-Received: by 2002:a05:6512:3093:: with SMTP id
 z19mr50521872lfd.670.1641676658802; 
 Sat, 08 Jan 2022 13:17:38 -0800 (PST)
MIME-Version: 1.0
References: <20200825000246.4035-1-joseph.kogut@gmail.com>
 <8bcace28-352f-1da3-51c6-0de868fa429f@mind.be>
 <0570b1f3-5229-5c0e-796a-53f8747b540a@mind.be>
In-Reply-To: <0570b1f3-5229-5c0e-796a-53f8747b540a@mind.be>
From: Norbert Lange <nolange79@gmail.com>
Date: Sat, 8 Jan 2022 22:17:27 +0100
Message-ID: <CADYdroOi1mE2a1bgMgnX2dVuS5SOwPO6qNEkz_zTwEOud7pCXw@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Subject: Re: [Buildroot] [PATCH 1/1] systemd: ensure tmpfiles.d/legacy.conf
 is installed
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Maxime Hadjinlian <maxime.hadjinlian@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, Adam Duskett <aduskett@gmail.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am Sa., 8. Jan. 2022 um 21:40 Uhr schrieb Arnout Vandecappelle <arnout@mind.be>:
>
>
> On 08/01/2022 20:12, Arnout Vandecappelle wrote:
> >
> >
> > On 25/08/2020 02:02, Joseph Kogut wrote:
> >> Systemd doesn't install tmpfiles.d/legacy.conf when sysv compatiblity
> >> isn't enabled. This config sets up /var/lock, which many programs such
> >> as uboot's fw_printenv/setenv still depend on by default.
> >>
> >> Signed-off-by: Joseph Kogut <joseph.kogut@gmail.com>
> >
> >  After all the discussion, I did finally apply to master, thanks.
>
>   And I ended up reverting it again - legacy.conf is now legacy.conf.in and it
> needs to be preprocessed, but that is only done if sysv-compat is enabled.
>
>   So if we want this, our only option is to enable sysv-compat (which is
> probably something we should do anyway).

Why the only option? you should just ship your own legacy.conf, it wont change.
Adding sysv compatibility, which is alot more than just the mkdir and
symlink, would mean adding alot baggage.
Baggage that wont even work as Yann spake thusly [1]

a tmpfile.conf with those 3 lines would be enough:
d /run/lock 0755 root root -
L /var/lock - - - - ../run/lock
d /run/lock/subsys 0755 root root -

Norbert.

PS. I am too lazy to google everything up, but I believe I brought up
this very topic before.

[1] - https://lists.buildroot.org/pipermail/buildroot/2020-July/287275.html
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
