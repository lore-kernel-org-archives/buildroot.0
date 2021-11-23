Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D63B5C433EF
	for <buildroot@archiver.kernel.org>; Tue, 23 Nov 2021 18:33:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3B52360A6F;
	Tue, 23 Nov 2021 18:33:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3KyznzshPFZQ; Tue, 23 Nov 2021 18:33:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6B0F660A60;
	Tue, 23 Nov 2021 18:33:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E32B01BF39C
 for <buildroot@lists.busybox.net>; Tue, 23 Nov 2021 18:33:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D35FC80C87
 for <buildroot@lists.busybox.net>; Tue, 23 Nov 2021 18:33:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X6QK-pzand53 for <buildroot@lists.busybox.net>;
 Tue, 23 Nov 2021 18:33:30 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 36AF180C0B
 for <buildroot@buildroot.org>; Tue, 23 Nov 2021 18:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1637692403;
 bh=njbel35JggygoOWbMu6494OuuT/AuN9cQLUCJ2kLWyE=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=jxnA9gTLE5L3f5EMaXqBoaYOkIQGdZxm9BW9DXDjo/Ve3LaBDytzTB9KzixCg1mB4
 Yl/kb0XdppDKHuIisy1px70OqHUpbRTNWaOYC/qlTJ1gTQNtvxZkmghNj5HpADKgW8
 5rzLIc2xwj/hbXSUYX07hTgaWdFQ6EbiVVFQUnbY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.142]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MLzFx-1n6yrj3tQn-00HvWh; Tue, 23
 Nov 2021 19:33:23 +0100
Date: Tue, 23 Nov 2021 19:33:21 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: Arnout Vandecappelle <arnout@mind.be>
Message-ID: <20211123193321.074e7cd8@gmx.net>
In-Reply-To: <e4c35292-8807-37f1-086c-95d9b274df44@mind.be>
References: <20211118210623.1598934-1-fontaine.fabrice@gmail.com>
 <e4c35292-8807-37f1-086c-95d9b274df44@mind.be>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:J22LC2msFuYNu7qXMfcp5ZBEeZDFpUrl18HCaikqR4yfnlLlgZO
 KD3VDyx7zE7O7cURCJZ1uIChD+8rW07VF3KRc9VENkTTu78iho7gKhxOXrpQ8KifZjfWsrU
 EBgRYDsbDsuvqLQRA8Tjey37cgUNJxbDKGOeCxbrbtgX9uozDnuz9i4O++RV37Wr7z1LFOO
 3MV0PddqTgz+1gLKYPt1Q==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Wbjt58FV7j8=:TKm8CYmVXyK1C0Bz3l/N8O
 idaCeCEbh1HZDsLAbAPx+cn3bNvc4gRz6U2ML1fHvpYxKRbnISh7TWr24lOi/9bQmu+DLMU8P
 JFc7oSjVWSLYe+0aJ3pIkzuuuBPvyNayarHmUj3nTTRb2HU0HyLhHMmYyRAEOvQ7/fH3mthBT
 GOz0eixkQ8kTK18zIjXXeSYWIwaQ3j2iELIUF3XYzjaHTpatWJSfTCofTgRdtGaCrynA1rE/R
 jng9ZDMY4Lu4QGO7RSCRee+uuQj/B+BjMQaQW0LdA1v5hdqbVuu9hBnZNoiNCHafeIZN2mrvI
 gYT7/53hhaFuYl1+n61MuSMvLApyk+OyZBNL57diAmuMzd4erRw9xek5ii4EIwUlV3LpS9szj
 cuou3uXmT/H/XYHfWfW2d/obiBjguS1gLmHamfhVyiHqYu2w5qMAik+ew7K3LsjjPxOktxMXM
 7n/htLwuV0IfT+u292j6gt4oFXqsG0+IBvSqpxRmOVdiG5hiXHX2+h/aWqISejOL8rSQHun81
 dw95ohB15HNJrztRLsPmnFUiuflXd9No7Ng4neJIXpgXj+UvmX6dEOr6lgslOzZvKmTqW5as7
 1ndeZK2DGAuiZASF4LtKoJUAIeO77i2xb1bucsg4FhQhpBdI/pw/WKZwBXn/tmcsLBZ5rcsZh
 YT6WNf4mr6Cip97SjP2L07C70wN4P6QDuoYXm/qwFU7Rbf02iToaAzJ91+4vz76zy1GZIyjDs
 PKbJekWeaZwDwIg/X1vK+49Wt/t/t/wB/iiuxCXl3A9knsn/Rjp4CgZ/YNpHJhfyDjDv6VYqb
 j2xrM8eQpg3sk4mJqRLcqip/DOWQKkL8cBoL+GDUR9EyT6bjWaRPNeLfNS/Abn5B/dzy2dDcV
 XscxDtlUxuBdFV0h53i6k3ZAC0bZgT7ub2B5xURfEBTPJwy6lcMmD/Cg31J0m46Md6M/vDxz1
 magElUppHAa7GxEDKPz8lLARKuE/4G1KfjdQiJe8XhIpkk/UiAr0vfyHxFTY07WoBRPwVMSHV
 DJwJCVh+G25mGVRQaugGUONUcu41/mvrkMaRYN2sjsA3Msh0BXeZJHBRFf6/puq+FRnWQZBBb
 eUuAy9hrTr8v30=
Subject: Re: [Buildroot] [PATCH 1/1] package/lighttpd: run autoreconf
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Arnout,

On Mon, 22 Nov 2021 21:42:39 +0100, Arnout Vandecappelle <arnout@mind.be> wrote:

> On 18/11/2021 22:06, Fabrice Fontaine wrote:
> > For an unknown reason, the build fails since bump to version 1.4.60 in
> > commit d62b7f54f00291a50274409fb5510527fd725ffe on:
> >
> > array.c:140:2: error: 'for' loop initial declarations are only allowed in C99 mode
> >    for (uint32_t i = 0; i < sz; ++i) {
> >    ^
> >
> > Running autoreconf fixes the build.
> >
> > Fixes:
> >   - http://autobuild.buildroot.org/results/0349d8fed35b0766796dd9ba3b8de6ff8bd68fe7
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>
>   After reading this thread and the upstream bug report, I did a bunch more
> analysis and drilled it down to the real issue. See the bug report and the
> updated commit message:
>
>      Since upstream commit bb1d35dc1767 [1] (which is part of the bump to
>      version 1.4.60), configure.ac no longer checks for a specific C
>      standard. It will therefore use the "default" standard. With autoconf
>      2.69 (which is what is used to generate the configure script in the
>      tarball), the default standard is C89, which requires no option to be
>      passed to the compiler. However, that means that older compilers, e.g.
>      GCC 4.8, will indeed use C89 and not C99. This leads to the following
>      error.
>
>      array.c:140:2: error: 'for' loop initial declarations are only allowed in
> C99 mode
>        for (uint32_t i = 0; i < sz; ++i) {
>        ^
>
>      In autoconf 2.71 (which is used by Buildroot), the default standard has
>      changed: it is now C11 if available, C99 failing that, and finally fall
>      back to C89. Since GCC 4.8 (and later) support C11, that's what will be
>      selected, so C99 is allowed as well. Thus, running autoreconf fixes the
>      build.
>
>      The issue was reported upstream [2].
>
>      Fixes:
>       -
> http://autobuild.buildroot.org/results/0349d8fed35b0766796dd9ba3b8de6ff8bd68fe7
>
>      [1]
> https://redmine.lighttpd.net/projects/lighttpd/repository/14/revisions/bb1d35dc17671bc308e25651b4f5fa0c3008cc69
>      [2] https://redmine.lighttpd.net/issues/3116
>
>
>   Applied to master, thanks.

Wow, thanks for further investigation and detailed/proper write up!

Regards,
Peter

>
>   Regards,
>   Arnout
>
> > ---
> >   package/lighttpd/lighttpd.mk | 2 ++
> >   1 file changed, 2 insertions(+)
> >
> > diff --git a/package/lighttpd/lighttpd.mk b/package/lighttpd/lighttpd.mk
> > index 9c18a6038e..c39a5db20f 100644
> > --- a/package/lighttpd/lighttpd.mk
> > +++ b/package/lighttpd/lighttpd.mk
> > @@ -12,6 +12,8 @@ LIGHTTPD_LICENSE = BSD-3-Clause
> >   LIGHTTPD_LICENSE_FILES = COPYING
> >   LIGHTTPD_CPE_ID_VENDOR = lighttpd
> >   LIGHTTPD_DEPENDENCIES = host-pkgconf
> > +# Issue in configure script provided in tarball
> > +LIGHTTPD_AUTORECONF = YES
> >   LIGHTTPD_CONF_OPTS = \
> >   	--without-wolfssl \
> >   	--libdir=/usr/lib/lighttpd \
> >
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
