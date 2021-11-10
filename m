Return-Path: <SRS0=ghJV=P5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8BF5C433F5
	for <buildroot@archiver.kernel.org>; Wed, 10 Nov 2021 21:00:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 67DFC61051
	for <buildroot@archiver.kernel.org>; Wed, 10 Nov 2021 21:00:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 67DFC61051
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F36DA40416;
	Wed, 10 Nov 2021 21:00:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YDDjCuaqV4bt; Wed, 10 Nov 2021 21:00:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1B79C401F0;
	Wed, 10 Nov 2021 21:00:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3C0BA1BF2F1
 for <buildroot@lists.busybox.net>; Wed, 10 Nov 2021 21:00:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3890C4048C
 for <buildroot@lists.busybox.net>; Wed, 10 Nov 2021 21:00:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2TBfkjoINcg7 for <buildroot@lists.busybox.net>;
 Wed, 10 Nov 2021 21:00:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 29CD640486
 for <buildroot@buildroot.org>; Wed, 10 Nov 2021 21:00:26 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:90c4:eaed:10a6:22de])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 922725FF27;
 Wed, 10 Nov 2021 22:00:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1636578024;
 bh=TtrZaunmZPBNphu1wPCTAb23v3JfUBeg7IjhlNY0pZQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XqQHUDoyq5osWxNdA/OWqz3FTrixq25KajfI+BnYYSkrEpzM6qgIYhlTNoAegCCvj
 1oVxQQUYSKElFhk1VwT1U2QIgrHTPWY7y14EXN0r/+jSiPpQ2/tX8RAnUGv6yT7ebY
 mx/JDdeV1K2ZWkzPq3T8NoV2wy2gciP07bLLgUjwYFPKynAOQLOftarK1r1NUK+VZ9
 HtlCtrP94e69mYPZ6aP0SLp7U2OMfnnXF33agwcsHTyB2dCWvCdy/RMa2g9kLCY6bd
 rX/Gtlgxmdqts0pbxG+4IzupnZnzN6w1e1EFVcf/v916xD5m3v0knkOIvQTWy3hNtL
 csYAz9UZjAJrQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 10 Nov 2021 22:00:20 +0100
Date: Wed, 10 Nov 2021 22:00:20 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20211110210020.GP2084998@scaer>
References: <20211110185133.52B178B8FF@busybox.osuosl.org>
 <20211110200610.63a2ea4e@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211110200610.63a2ea4e@gmx.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [git commit] package/meson: disable meson wrap
 downloads
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Peter, All,

On 2021-11-10 20:06 +0100, Peter Seiderer spake thusly:
> On Wed, 10 Nov 2021 19:37:34 +0100, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> 
> > commit: https://git.buildroot.net/buildroot/commit/?id=12ba3563655e3ebab252e52daa6c710864fa869f
> > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> >
> > We don't want to allow meson to download wrap dependencies as this
> > bypasses buildroot's dependency resolution.
> >
> > This is badly documented in the meson manual, but there is at least
> > an FAQ that refers to it:
> >
> >     https://mesonbuild.com/FAQ.html#does-wrap-download-sources-behind-my-back
> 
> https://mesonbuild.com/Subprojects.html#commandline-options

Ah, so obvious! :-)

I tried both:
    https://mesonbuild.com/Wrap-dependency-system-manual.html
    https://mesonbuild.com/Commands.html

> And [1] and [2] for some past time buildroot discussion on it...

Ah, thanks for the reminder. That's too bad I did not spot a
corresponding patch on the list. ;-)

Regards,
Yann E. MORIN.

> Regards,
> Peter
> 
> [1] http://lists.busybox.net/pipermail/buildroot/2019-December/572391.html
> [2]http://lists.busybox.net/pipermail/buildroot/2019-December/572391.html
> 
> >
> >     Meson has a option called wrap-mode which can be used to disable
> >     wrap downloads altogether with --wrap-mode=nodownload.
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > [yann.morin.1998@free.fr: add pointer to FAQ]
> > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> > ---
> >  package/meson/cross-compilation.conf.in | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/package/meson/cross-compilation.conf.in b/package/meson/cross-compilation.conf.in
> > index 37b49eea3b..7a7ece97ae 100644
> > --- a/package/meson/cross-compilation.conf.in
> > +++ b/package/meson/cross-compilation.conf.in
> > @@ -17,6 +17,7 @@ c_args = [@TARGET_CFLAGS@]
> >  c_link_args = [@TARGET_LDFLAGS@]
> >  cpp_args = [@TARGET_CXXFLAGS@]
> >  cpp_link_args = [@TARGET_LDFLAGS@]
> > +wrap_mode = 'nodownload'
> >
> >  [properties]
> >  needs_exe_wrapper = true
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
> 
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
