Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCE82C4167B
	for <buildroot@archiver.kernel.org>; Sun, 10 Dec 2023 11:18:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31DAA60E0B;
	Sun, 10 Dec 2023 11:18:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 31DAA60E0B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UrG_ns2Nc7vL; Sun, 10 Dec 2023 11:17:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 316D361023;
	Sun, 10 Dec 2023 11:17:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 316D361023
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8B2711BF5A9
 for <buildroot@lists.busybox.net>; Sun, 10 Dec 2023 11:17:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 699BA409B5
 for <buildroot@lists.busybox.net>; Sun, 10 Dec 2023 11:17:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 699BA409B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q70fwTaY-IXF for <buildroot@lists.busybox.net>;
 Sun, 10 Dec 2023 11:17:53 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 51DCF405F1
 for <buildroot@buildroot.org>; Sun, 10 Dec 2023 11:17:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 51DCF405F1
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 13CF013F861;
 Sun, 10 Dec 2023 12:17:46 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 10 Dec 2023 12:17:46 +0100
Date: Sun, 10 Dec 2023 12:17:46 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Zhangjin Wu <falcon@tinylab.org>
Message-ID: <ZXWeWoawTYeyYbOx@landeda>
References: <ZXSwdJFb46e_u2RX@landeda>
 <20231210013653.28449-1-falcon@tinylab.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231210013653.28449-1-falcon@tinylab.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1702207070;
 bh=QY+mTjGOJPK1AG7ogV+MoPOfTmSnxM6OPtuabcWKTig=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vBZdsnJQv67LKWm1ru1wnXv7QqytXV7iKDhDug8qI/T/l73I4NqXbEQt+35Mjtjm8
 xr7X64SvXmPaLeRXSpSAi5CdGs+/672b/2NkfmxWq7pS+I7TGi4nertUJLMQZo/JLk
 aHd7sH3BagOZzyJaI/tLHEOiKQ6apXVqbeIwkf+iLrGYiLC8LLlX7Ye9MTPcahuINr
 2nUhSWToEJwMA38tjoyGNlQXvTDU7p1wKLvxUBZ/2RTyQN0qFjCdiYQFK8hJFBQntY
 3aupTVJmcHjj0T40PZqiKGiVqp9XWucYT+mw+gdyVKrGMFvRfLpsWMUM3LXDFtuXxC
 rDcpnhZGTaqGg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=vBZdsnJQ
Subject: Re: [Buildroot] [PATCH 1/1] package/mpfr: Fix GNU Mirror Path
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
Cc: thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Zhangjin Wu, All,

On 2023-12-10 09:36 +0800, Zhangjin Wu spake thusly:
> > On 2023-12-10 00:21 +0800, Zhangjin Wu spake thusly:
> > > Replacing http://www.mpfr.org with BR2_GNU_MIRROR variable
[--SNIP--]
> > What is the rationale for switching over to the GNU mirror rather than
> > use the official upstream location?
> I have found that the downloading of mpfr from its official site is very
> slow in our region, sometimes, costs several hours and even fails at
> last. But the downloading from one of its local GNU mirror sites is fast
> and deterministic.
> And I have checked that the latest version of mpfr has been stored in
> the GNU mirror site too:
> http://ftpmirror.gnu.org/mpfr-4.2.1.tar.xz

    $ wget http://ftpmirror.gnu.org/mpfr-4.2.1.tar.xz
    HTTP request sent, awaiting response... 404 Not Found
    2023-12-10 11:54:02 ERROR 404: Not Found.

(it's missing the /mpfr/ directory component in the path ;-) ).

> So, it should be reasonable and safe for us to do such switch ;-)

The thing is, we can't really switch away from the official site, just
because it is slow for some people, as the alternative might be the
other way around for others: for me, the GNU mirror is ~8 times slower
than the official MPFR site: 8.80MBps vs 1.06MBps (mpfr is small, so
that's not much consequential, but that's on principle).

So, I think you would have a few (complementary) options:

  - keep a local cache of your download directory: if BR2_DL_DIR is set
    in the environment, then Buildroot will use that directory to look
    for, and store, downloaded archives. That directory is never removed
    by Buildroot (unless it is the default value of $(TOPDIR)/dl);

  - similar to the above, populate a directory on a machine in your
    local network, serve that directory with an HTTP(S) server, and
    point BR2_PRIMARY_SITE to that location;

  - change BR2_WGET to include one of the wget timeout options (see the
    wget manual for the details): --timeout=seconds --dns-timeout=seconds
    --connect-timeout=seconds --read-timeout=seconds. In your case, maybe
    --read-timeout with a small-ish number of seconds would be enough to
    trigger a failed download, and Buildroot will fallback to
    downloading from BR2_BACKUP_SITE.

I know that the above might not be entirely satisfactory, but we really
prefer to get the sources from the official location, unless there is a
very strong reason not to. In this case, I don't think it is
appropriate, especially since Buildroot has mechanisms in place to cope
with such situations already.

Regards,
Yann E. MORIN.

> Regards,
> Zhangjin Wu
> 
> > Regards,
> > Yann E. MORIN.
> > 
> > > Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
> > > ---
> > >  package/mpfr/mpfr.mk | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/package/mpfr/mpfr.mk b/package/mpfr/mpfr.mk
> > > index 8d12c7502b..a5e26404d1 100644
> > > --- a/package/mpfr/mpfr.mk
> > > +++ b/package/mpfr/mpfr.mk
> > > @@ -5,7 +5,7 @@
> > >  ################################################################################
> > >  
> > >  MPFR_VERSION = 4.1.1
> > > -MPFR_SITE = http://www.mpfr.org/mpfr-$(MPFR_VERSION)
> > > +MPFR_SITE = $(BR2_GNU_MIRROR)/mpfr
> > >  MPFR_SOURCE = mpfr-$(MPFR_VERSION).tar.xz
> > >  MPFR_LICENSE = LGPL-3.0+
> > >  MPFR_LICENSE_FILES = COPYING.LESSER
> > > -- 
> > > 2.34.1
> > > 
> > > _______________________________________________
> > > buildroot mailing list
> > > buildroot@buildroot.org
> > > https://lists.buildroot.org/mailman/listinfo/buildroot
> > 
> > -- 
> > .-----------------.--------------------.------------------.--------------------.
> > |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> > | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> > | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> > | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> > '------------------------------^-------^------------------^--------------------'
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
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
