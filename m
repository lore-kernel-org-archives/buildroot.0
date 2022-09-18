Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55825C54EE9
	for <buildroot@archiver.kernel.org>; Sun, 18 Sep 2022 08:46:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B54EC408DB;
	Sun, 18 Sep 2022 08:46:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B54EC408DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GE_nYXuL9mnI; Sun, 18 Sep 2022 08:46:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CE7BB404A1;
	Sun, 18 Sep 2022 08:46:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CE7BB404A1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 762841BF282
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 08:46:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4E8BD4097F
 for <buildroot@lists.busybox.net>; Sun, 18 Sep 2022 08:46:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4E8BD4097F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mZqn5A-Mwqtx for <buildroot@lists.busybox.net>;
 Sun, 18 Sep 2022 08:46:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CDCD4400D7
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CDCD4400D7
 for <buildroot@buildroot.org>; Sun, 18 Sep 2022 08:46:26 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:2a18:6673:cb9f:3864])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 577DD13F88A;
 Sun, 18 Sep 2022 10:46:19 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 18 Sep 2022 10:46:18 +0200
Date: Sun, 18 Sep 2022 10:46:18 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20220918084618.GC1419013@scaer>
References: <cover.1660931225.git.yann.morin.1998@free.fr>
 <417c53083693347f5c22298c49c8ff9df1f35d0f.1660931225.git.yann.morin.1998@free.fr>
 <55b0aae8-4e00-990b-2f98-abbb4437c29e@mind.be>
 <20220917211029.GA1127102@scaer>
 <6f1c35c9-2e99-99ca-0846-f285d2cd0015@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6f1c35c9-2e99-99ca-0846-f285d2cd0015@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1663490783;
 bh=ZG9paSkUD5x9q+kwIsS+KQqA8InOZKH4O/KjGgjWDTo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HvzlFXkTUOZpvg9DDSqsaamFc3qSuhZHJi9FAFqT9sfzs41q7bE03tfEkCMlTTnnd
 +PSc+sWV5s+b6rHFkTVD7DE9s2HkYiId3uOKNw8LEGGoBNDqnL3OCs8d57rFZv5qgu
 O2pfFDNhDQKdYh2XyUMGDaJztWC+J4WJ0o6SyIvFiQaPBEyFW/n1X72k8SWOgxi3R9
 EEVElPGLWdDz/3G3c5fVRpc06K7zzDC5/G+HnKegtijFwB6Z3m+HNn1ikbln0E/YaV
 4TjPgFYrGCIKf7XLmj00gNpWNeJieJ449tK6wMQa8y9Wjb7gTKy0Qt37eCb9Hk30qn
 PeLzVz+wBpo2w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=HvzlFXkT
Subject: Re: [Buildroot] [PATCH 3/4] fs/cpio: accept a list of dracut.conf
 files
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
Cc: Adam Duskett <aduskett@gmail.com>,
 Thierry Bultel <thierry.bultel@linatsea.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Arnout, All,

On 2022-09-18 10:41 +0200, Arnout Vandecappelle spake thusly:
> On 17/09/2022 23:10, Yann E. MORIN wrote:
> >When that patch was written, we did not have a release yet with support
> >for dracut, so I did not add a legacy for _CPIO_DRACUT_CONF_FILE when I
> >made it a plural. But 2022.08 does have dracut, so we now need to handle
> >the legacy for BR2_TARGET_ROOTFS_CPIO_DRACUT_CONF_FILE (or not make it a
> >plural).
>  I know that, that's why I first checked if dracut was merged in 2022.08. It
> was merged during the stabilisation period but to next, not to master. So,
> no worries.

Arg... Of coutrse, stupid me... :-/

I'll mark my morning patch as rejected, then.

Thanks for being more acute than I was! :-)

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
