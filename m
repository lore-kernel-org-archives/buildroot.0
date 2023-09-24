Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 522D4CE7A8A
	for <buildroot@archiver.kernel.org>; Sun, 24 Sep 2023 18:20:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BCD984030E;
	Sun, 24 Sep 2023 18:20:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BCD984030E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z050HY6RyBuj; Sun, 24 Sep 2023 18:20:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F9374030F;
	Sun, 24 Sep 2023 18:20:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F9374030F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 555A21BF337
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 18:20:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 39DD14030E
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 18:20:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 39DD14030E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6CqDnnTEX9A9 for <buildroot@lists.busybox.net>;
 Sun, 24 Sep 2023 18:20:03 +0000 (UTC)
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A64FC40305
 for <buildroot@uclibc.org>; Sun, 24 Sep 2023 18:20:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A64FC40305
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:2d77:ae6d:70e:6233])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 5CDD919F57B;
 Sun, 24 Sep 2023 20:19:58 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 24 Sep 2023 20:19:58 +0200
Date: Sun, 24 Sep 2023 20:19:58 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230924181958.GQ1469982@scaer>
References: <20230924162909.1019467-1-fontaine.fabrice@gmail.com>
 <pan$86ec1$f0965aa5$21c4e56d$f81dbe7e@ID-313208.user.individual.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <pan$86ec1$f0965aa5$21c4e56d$f81dbe7e@ID-313208.user.individual.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1695579600;
 bh=gi3ObD7bb9+z2GQmW2EPYvgju/UeVYiS9jGzUZV4gKE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gUaLE8eukeNPjEbuui68jCV4adRDeUr6L1y0jcD3akBmbCjemBiBSnU8StC4KTEVd
 M7+kE78JzQoNIWSWtD7uk7qfeKJ2R+Hb1mlbldGctfom6FcjHWEM/EU46rnHPtkhdO
 zjTRRYqM6tH8aP57LvWsTCYItnO0nmopGvXSUJZwAKATC9yNvmapJj1rCzLLN6dNE/
 qJFJHuyGpJRCB/cUW4cRoEuSUgI5DQQeER/2R0INOwmEj4o2JQMe9+3v4q24eGU1oe
 7MPmKFLYyTxt4WL6cRsJMlEr/RwcyrOK3NJ/ziDUu0bWYk4RHFJg7W8xRD6I0pwCUa
 8i+6/T5toPJ/A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=gUaLE8eu
Subject: Re: [Buildroot] [PATCH 1/1] package/pppd: drop
 PPPD_DROP_INTERNAL_IF_PPOL2TP_H
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
Cc: buildroot@uclibc.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bernd, All,

On 2023-09-24 19:20 +0200, Bernd Kuhls spake thusly:
> Am Sun, 24 Sep 2023 18:29:09 +0200 schrieb Fabrice Fontaine:
> 
> > PPPD_DROP_INTERNAL_IF_PPOL2TP_H is not needed since bump to version
> > 2.4.6 in commit 49b239ab20e632792a6c61173ba830cdc2128ebf and
> > https://github.com/ppp-project/ppp/commit/
> c41092dd4c49267f232f6cba3d31c6c68bfdf68d
> 
> Hi Fabrice,
> 
> your patch is part of my patch bumping pppd to 2.5.0:
> https://patchwork.ozlabs.org/project/buildroot/patch/
> 20230726060041.4434-1-bernd@kuhls.net/

But the hooks is already not needed for 2.4.9, so it is not related to
the bump from 2.4.9 to 2.5.0, so we want it as a separate change
(because it can then be backported if needed).

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
