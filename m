Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D38CC433EF
	for <buildroot@archiver.kernel.org>; Mon, 18 Jul 2022 20:29:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 82192417B7;
	Mon, 18 Jul 2022 20:29:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 82192417B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uW4UcEt18Sn3; Mon, 18 Jul 2022 20:29:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 282B0417B1;
	Mon, 18 Jul 2022 20:29:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 282B0417B1
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E7E691BF3D4
 for <buildroot@lists.busybox.net>; Mon, 18 Jul 2022 20:29:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CFCD36101E
 for <buildroot@lists.busybox.net>; Mon, 18 Jul 2022 20:29:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CFCD36101E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LkG_SFzAyLSS for <buildroot@lists.busybox.net>;
 Mon, 18 Jul 2022 20:29:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CFD9261017
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CFD9261017
 for <buildroot@buildroot.org>; Mon, 18 Jul 2022 20:29:49 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:5d47:1bcb:9db:ce0f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id BAFC013FA3C;
 Mon, 18 Jul 2022 22:29:44 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 18 Jul 2022 22:29:44 +0200
Date: Mon, 18 Jul 2022 22:29:44 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Baruch Siach <baruch@tkos.co.il>
Message-ID: <20220718202944.GE2249625@scaer>
References: <20220717193719.2429999-1-yann.morin.1998@free.fr>
 <87lesry0vz.fsf@tarshish> <20220717201831.GY2249625@scaer>
 <87edyjxdkm.fsf@tarshish>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87edyjxdkm.fsf@tarshish>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1658176187;
 bh=63E41iGVZS1Fk6DnyBF9W09Bq7wp5qqaqHGPjXKM41I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QuSgUKj3Zqo2AeA72TBH2LPXV7NJaMM7CoOsSlSrJLiEp9McqUF9+axmmOPSgix48
 v2CH5aLHMPpAtAQHmwKR4LMTADjYZQjnK8OHZkBBY9s8K7/DPfi5xTMIJcpMNCabaV
 ohPJozJpCMT7WnJWJeipOp0gL52wh4/oG9KkMkwFmfw2Y2oO4D3UPSemf5o25aoRB0
 C34HaumPXtB3EU+GSG36enge8Kcd/M1siVO81saP/Q/MwP+fs1QCcC07Vl4wJ34PuQ
 sr8DZcP0AIQ2Cbk4GENQl0/FR5CsxJzVnTppMpB3CDW+ZLQ+ve5x/MiQxx77PBUi4h
 i4z70jgx53MOA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=QuSgUKj3
Subject: Re: [Buildroot] [PATCHv4] package/uacme: requires TLS support in
 libcurl
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
Cc: Nicola Di Lieto <nicola.dilieto@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Baruch, All,

On 2022-07-18 06:38 +0300, Baruch Siach via buildroot spake thusly:
> On Sun, Jul 17 2022, Yann E. MORIN wrote:
> > On 2022-07-17 22:41 +0300, Baruch Siach via buildroot spake thusly:
[--SNIP--]
> >> This part is somewhat fragile as libcurl might remove support
> >> for any given back end like it recently did for NSS.
> > I guess openssl will always be a safe default, as it has no architecture
> > dependency. However, that would need further change in libcurl, such as:
[--SNIP--]
> Maybe, if we go down this path of 'depends -> select' for all other
> libcurl crypto backends, we can solve the original uacme problem with a
> simple !BR2_PACKAGE_LIBCURL_TLS_NONE dependency without recursion. Is
> that correct?

Probably. I was wondering why the current choice was using depends on
rathwer than select, as that would have been the most logical solution,
but the commit message does not explain it.

Probably this was done to avoid propagating all the reverse
dependencies...

> But I'm not sure what can of recursion worms that would open.

I was also wondering the same...

> I only meant to say that the comment above should mention that the
> package must select a crypto backend.

Yes, this could also do the trick, but it is not nice that a pakcage
that does not have to use crypto for itself be in charge of selecting a
crypto backend for libcurl... This does not look nice.

> uacme is a special case and it
> already selects a crypto backend.

Yes, and I indeed leverage that condition to introduce _FORCE_SSL_TLS

> BR2_PACKAGE_LIBCURL_FORCE_SSL_TLS use
> is unlikely to become very common in the foreseeable future. So I don't
> think we need to optimize of this corner case.

Valid.

[--SNIP--]
> > If you feel so-inclined, you can grab this patch and adapt it to ensure
> > a crypto backend is always enabled. Otherwise, I'll try to see what I
> > can o a bit later...
> I'm fine with the patch as is.

Ok, thanks for the feedback! :-)

I'll send an updated patch that tweaks the comment to also note that a
crupto backend needs to be selected.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
