Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CFECEE4992
	for <buildroot@archiver.kernel.org>; Fri, 18 Aug 2023 20:24:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF33582B94;
	Fri, 18 Aug 2023 20:24:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF33582B94
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qrEaNeE8i7cv; Fri, 18 Aug 2023 20:24:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BF0058300C;
	Fri, 18 Aug 2023 20:24:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BF0058300C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 40C191BF31D
 for <buildroot@lists.busybox.net>; Fri, 18 Aug 2023 20:24:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1C1ED615F3
 for <buildroot@lists.busybox.net>; Fri, 18 Aug 2023 20:24:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1C1ED615F3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9r-QFVg8D50h for <buildroot@lists.busybox.net>;
 Fri, 18 Aug 2023 20:24:41 +0000 (UTC)
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 561D7615F2
 for <buildroot@buildroot.org>; Fri, 18 Aug 2023 20:24:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 561D7615F2
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:104e:727c:a742:4ed7])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 0DC56200385;
 Fri, 18 Aug 2023 22:24:34 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 18 Aug 2023 22:24:34 +0200
Date: Fri, 18 Aug 2023 22:24:34 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20230818202434.GA1134940@scaer>
References: <20230818151608.988723-1-bernd@kuhls.net>
 <20230818220314.3178c964@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230818220314.3178c964@windsurf>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1692390278;
 bh=24IY+0tlYcS11PgTXfoCxUZUPk6ekmwiASnWX5z2xkU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jAy+/XqgwmSVpNfpNguWpJppwHxRpLgyBZv+XZ56V7o63ntIe4dVrKYDRsJfwnebi
 c98GDw+uy8xrREsMmiOF5gQpwfF4OWxG06DhHrG5I5AzVfqJ5PxUHraShKyvbP/Dtd
 sLaSZDWSov4shWtTv5qDBGu43hiZYYNtH0URCfP4YVCDez8SDp9tQe68n22r8hHyX5
 yfXNEtOWs38dSPgfk4Nu6lIeIOox61fs0pOBQXnq1Mcxz747O5lp8UqxDI5z9JTxyI
 DnxMsIVtY6Q4kkrYKFJ+596VyR3QbMJBrmW6v9aJnHC4H047mnXnrFs7dftw9xrab8
 4dfLyoQpXOE+A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=jAy+/Xqg
Subject: Re: [Buildroot] [PATCH 1/1] package/pkg-generic.mk: fix typo in
 make target .stamp_built
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
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 2023-08-18 22:03 +0200, Thomas Petazzoni via buildroot spake thusly:
> On Fri, 18 Aug 2023 17:16:08 +0200
> Bernd Kuhls <bernd@kuhls.net> wrote:
> 
> > This fix can be backported because the offending line was added in 2009.

What is actualy broken?

As you noticed, the does has been there for moer than 14 years now, so
if something obvious was broken, we'd have notriced by now.

So, if this is broken, it is not obvious, and we need to udnerstand how
it is broken and why the fix is correct.

Regards,
Yann E. MORIN.

> > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
> > ---
> >  package/pkg-generic.mk | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/package/pkg-generic.mk b/package/pkg-generic.mk
> > index 5d1c1da128..9d40754939 100644
> > --- a/package/pkg-generic.mk
> > +++ b/package/pkg-generic.mk
> > @@ -286,7 +286,7 @@ $(BUILD_DIR)/%/.stamp_configured:
> >  	$(Q)touch $@
> >  
> >  # Build
> > -$(BUILD_DIR)/%/.stamp_built::
> > +$(BUILD_DIR)/%/.stamp_built:
> 
> Note that double colon rules have a specific meaning in make:
> 
>   https://www.gnu.org/software/make/manual/html_node/Double_002dColon.html
> 
> I've read a few times the page, but I'm not sure I fully grasp what it
> says, so I don't know if the double colon was intended (and needed at
> the time) or was a typo.
> 
> Thomas
> -- 
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
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
