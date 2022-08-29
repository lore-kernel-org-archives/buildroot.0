Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E6A3ECAAD4
	for <buildroot@archiver.kernel.org>; Mon, 29 Aug 2022 08:07:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A832640588;
	Mon, 29 Aug 2022 08:07:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A832640588
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fVSFHTlgBxh5; Mon, 29 Aug 2022 08:07:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D1801404B1;
	Mon, 29 Aug 2022 08:07:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D1801404B1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 05A111BF40D
 for <buildroot@lists.busybox.net>; Mon, 29 Aug 2022 08:07:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D9128409C1
 for <buildroot@lists.busybox.net>; Mon, 29 Aug 2022 08:07:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D9128409C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jfaujFWOvHYI for <buildroot@lists.busybox.net>;
 Mon, 29 Aug 2022 08:07:34 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 881A14091E
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 881A14091E
 for <buildroot@buildroot.org>; Mon, 29 Aug 2022 08:07:34 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:c66a:3d95:4f85:baec])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 4F8E2780523;
 Mon, 29 Aug 2022 10:07:28 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 29 Aug 2022 10:07:28 +0200
Date: Mon, 29 Aug 2022 10:07:28 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220829080728.GU37358@scaer>
References: <20220828221705.58756-1-fontaine.fabrice@gmail.com>
 <20220829073024.GT37358@scaer>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220829073024.GT37358@scaer>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1661760451;
 bh=T4M4sVm+omiAqsGvWT2h9Z92bGtIkreHslh/cWj2dow=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HpYXIr1fRX5a6trAYoCttm1qau8fVFRDkRpEP9CSq5f0gqrlm4Xg/G7gSQgdN24Zb
 JQ20f/NM0lxEHgxAouezrrAeuSfmlTYAc0dishksvxQ0jcFudPk1MQY96sUrOu0ovc
 650Yd2giZU/07hwu+uGGjvIhoyolawiUJSnx2u77S5bOFhdixo0eq5OQ5kHcsVexNh
 1TrWKkswqaJ4p55JXwENQwZOd6IVeWNYWHImCqPiOgUBShfcpm/9lI/+2ajzWwwXTl
 PKoOtN25injgJj3CGGJX/4uHax6pwmZhIqRRFQNuXX4fCEA2ZG429XPuUmFjwNMD8U
 HIFq64RkcweJg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=HpYXIr1f
Subject: Re: [Buildroot] [PATCH 1/1] package/collectd: disable libupsclient
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-08-29 09:30 +0200, Yann E. MORIN spake thusly:
> On 2022-08-29 00:17 +0200, Fabrice Fontaine spake thusly:
> > Disable libupsclient to avoid the following build failure if
> > libupsclient is installed on host:
[--SNIP--]
> However, I think a better fix would be to understand why this breaks,
> even though we do have nut enabled in the config, and collectd's
> configure did detect it correctly.
[--SNIP--]
> So, the detection fails, not because of the upsclient is missing (it is
> not!), but because the detection fails. Why does that toolchan not have
> the time_t type defined? It is a musl toolchain, so maybe, just maybe?

Maybe something in nut, along the lines of (totally untested):

    diff --git a/clients/upsclient.h b/clients/upsclient.h
    index 08574b8f8..8f7a95759 100644
    --- a/clients/upsclient.h
    +++ b/clients/upsclient.h
    @@ -41,6 +41,10 @@
     	#include <limits.h>
     #endif

    +#if defined HAVE_TIME_H
    +	#include <time.h>
    +#endif
    +
     #ifdef __cplusplus
     /* *INDENT-OFF* */
     extern "C" {

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
