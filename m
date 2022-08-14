Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06D5EC25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 19:59:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D02481839;
	Sun, 14 Aug 2022 19:59:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D02481839
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G_ylbA-ZwQZw; Sun, 14 Aug 2022 19:59:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B37C1817E4;
	Sun, 14 Aug 2022 19:59:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B37C1817E4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 988261BF215
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 19:59:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 80CA9817E4
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 19:59:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 80CA9817E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nUB6yoEF1Ywb for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 19:59:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 984DA81444
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 984DA81444
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 19:59:01 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4cac:4fa9:6c11:832f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id D348C6012E;
 Sun, 14 Aug 2022 21:58:56 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 14 Aug 2022 21:58:56 +0200
Date: Sun, 14 Aug 2022 21:58:56 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20220814195856.GL2854108@scaer>
References: <20220813195943.2411510-1-fontaine.fabrice@gmail.com>
 <20220814143031.0ef0497e@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220814143031.0ef0497e@windsurf>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1660507140;
 bh=Tv36ujD/1Weg+PXYKJ/G9p0Z4lPs6saJpwfAllFRPDg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=deuazfGgP6FGXQGr7Eq68yboMGME+9KFRuIKPza45BvUWYTRLU6dkuSUv8BOJ2DNd
 aE8Rwhd3uRtrXUvHoZLdB/a0zSWOoyL+dxIkILtSzZbEbheyyFF/qqHkIOmeUixX9y
 h2sGepBTkohnPMUW7VvGdwHDHbpO44/1cqPZYrORHs8BYxj79VaQfEh+fuFxFfnYt8
 mjQlLpQMaEtQzFNVZonzpn/3ckDEjI+TAyOnM0feEBFHQr0Z/hK0yOw2kBdl/1qVHF
 fTEy8cJevGkH2fMcfeI5UGx2S9Kz7oxwFrXRsnULIXRohwkug6cRw1Wg/EeuWw2WBi
 tPhWoqzK5EzOw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=deuazfGg
Subject: Re: [Buildroot] [PATCH 1/1] package/udpcast: fix musl build
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-08-14 14:30 +0200, Thomas Petazzoni via buildroot spake thusly:
> On Sat, 13 Aug 2022 21:59:43 +0200
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
> 
> > Fix the following musl build failure raised since bump to version
> > 20211207 in commit ecf85b4ef58873e9acf749adedfbaa90baaaf3c0:
> > 
> > receivedata.c: In function 'findSlice':
> > receivedata.c:348:2: error: unknown type name 'ptrdiff_t'
> >   348 |  ptrdiff_t pos = slice - clst->slices;
> >       |  ^~~~~~~~~
> > receivedata.c:17:1: note: 'ptrdiff_t' is defined in header '<stddef.h>'; did you forget to '#include <stddef.h>'?
> >    16 | #include "fec.h"
> >   +++ |+#include <stddef.h>
> >    17 |
> > 
> > Fixes:
> >  - http://autobuild.buildroot.org/results/30208c6f175967fed6de690447a09e0c86547b24
> > 
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > ---
> >  package/udpcast/0001-fix-musl-build.patch | 31 +++++++++++++++++++++++
> >  1 file changed, 31 insertions(+)
> >  create mode 100644 package/udpcast/0001-fix-musl-build.patch
> 
> Applied to master, thanks.

And now, really applied to master, thanks. ;-)

Regards,
Yann E. MORIN.

> Thomas
> -- 
> Thomas Petazzoni, CTO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

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
