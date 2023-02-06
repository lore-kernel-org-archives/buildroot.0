Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38118C05027
	for <buildroot@archiver.kernel.org>; Mon,  6 Feb 2023 11:33:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D0CF3400BF;
	Mon,  6 Feb 2023 11:33:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D0CF3400BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id okvArcHQ4kSZ; Mon,  6 Feb 2023 11:33:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E7DF040328;
	Mon,  6 Feb 2023 11:33:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E7DF040328
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C30BD1BF397
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 11:33:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9D00081584
 for <buildroot@lists.busybox.net>; Mon,  6 Feb 2023 11:33:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D00081584
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z496WwGG12KS for <buildroot@lists.busybox.net>;
 Mon,  6 Feb 2023 11:33:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7355581585
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7355581585
 for <buildroot@buildroot.org>; Mon,  6 Feb 2023 11:33:11 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id bj22so9413033oib.11
 for <buildroot@buildroot.org>; Mon, 06 Feb 2023 03:33:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=itaUter+/Tk0WIvhV7rUmy/A2syJkY2JRDp8BxWCsYo=;
 b=uhG/F0pTKyHOehDoonwoaGFHNNuR29IsUuLJCn/S2sTMUS4UcKv8uBU8HQQSz6oeR7
 vJuOaMPWo7PH1lqwJcQkNhIzROtjPaTMHo5WAUqNDoVuBeaUorCvKGDa60ZGZy+HuXYz
 udjgb8v5kA4brWvVwvekTL7ZimzGXpbjpQQO/Y76UIsy81sjlhIUsjvmbHq4h2MrP1+T
 6J5wQV19QwUdeAJzqAHFANoXIv+dqDW5QX44/p3mbNaB+41WMZSGiUzPKoFfM5b40syU
 Aoc3Gb7f/Fw8boChBKP6RN8+nIXXrUlcp2j/+cEjnjoN8LW7BVxnilejMi3he3aBTSgK
 E0jA==
X-Gm-Message-State: AO0yUKUDMpHvb6PRpdYg4GyskH1TzqoU5X4kCsBYlVz7pRzxM88eSNQJ
 a7NcJyuOfIL2W/OpfnHmmedIsazn7+d1lY2xoIn1pod4clFXBA==
X-Google-Smtp-Source: AK7set8mfUuIlCCr6lzAxby1TK9B7EpdkCllp9Y5F8EH5Zc5wOITlREGBMtRs2vGebYLs1XpmzOeBtyxOuf+qqqXUCc=
X-Received: by 2002:a05:6808:1a12:b0:37a:fb74:dc1a with SMTP id
 bk18-20020a0568081a1200b0037afb74dc1amr328771oib.18.1675683190321; Mon, 06
 Feb 2023 03:33:10 -0800 (PST)
MIME-Version: 1.0
References: <20220920232154.1219792-1-KAMenyaev@sberdevices.ru>
 <CAEyMn7YCnxWokN9y90TeqAr4fW21jz0dXZSzYqtEs+qYqG3cxQ@mail.gmail.com>
In-Reply-To: <CAEyMn7YCnxWokN9y90TeqAr4fW21jz0dXZSzYqtEs+qYqG3cxQ@mail.gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 6 Feb 2023 04:32:59 -0700
Message-ID: <CADvTj4oZBG8hXJNeEwdnm2tjaJDkzq8w-dBa=W_WQmY=L42pZA@mail.gmail.com>
To: Heiko Thiery <heiko.thiery@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=itaUter+/Tk0WIvhV7rUmy/A2syJkY2JRDp8BxWCsYo=;
 b=TXWlTeKiIJVRHalk3TYkpIkbqa28JkQleKbQaJ2pa1X70eHjs+xp45uvwoU4ixLL+h
 QIpj55s1aqC5NhSV02v2KQQHhT/mpn4aEVt1QK2a7yA46Uq4cb+Aw1cQ5dfa+JzCeXYH
 BRp+vI5ZB/scr6eor6waz+mX4bWb4PptwG20akS9IMVsC9+He058Yq9sgY1XHQCeAyMu
 l/VzyIeSyjKq4CV4GLxnq4cwNnp68XcnzpbBvOD219z3w0S+nITrfZCkUHATJVV52ifR
 F6Ba6TBTArUIT0h7rKNJaZDFtN0tGkss0MIoCMET5Hr4IX5ZMtyhpUrmD1xG52GkCwrY
 YP8w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=TXWlTeKi
Subject: Re: [Buildroot] [PATCH 1/2] package/python-iniparse: add
 host-python-iniparse
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
Cc: sdfw_system_team@sberdevices.ru, KAMenyaev@sberdevices.ru,
 Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Zoltan Gyarmati <zgyarmati@zgyarmati.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, Feb 6, 2023 at 3:12 AM Heiko Thiery <heiko.thiery@gmail.com> wrote:
>
> Hi,
>
> Am Mi., 21. Sept. 2022 um 01:24 Uhr schrieb <KAMenyaev@sberdevices.ru>:
> >
> > From: Konstantin Menyaev <KAMenyaev@sberdevices.ru>
> >
> > Make the host variant of python-iniparse
> > as host-crudini dependency.
> >
> > Signed-off-by: Konstantin Menyaev <KAMenyaev@sberdevices.ru>
>
> Reviewed-by: Heiko Thiery <heiko.thiery@gmail.com>
>
> > ---
> >  package/Config.in.host                     |  1 +
> >  package/python-iniparse/Config.in.host     | 11 +++++++++++
> >  package/python-iniparse/python-iniparse.mk |  1 +
> >  3 files changed, 13 insertions(+)
> >  create mode 100644 package/python-iniparse/Config.in.host
> >
> > diff --git a/package/Config.in.host b/package/Config.in.host
> > index f437ef680c..fb805577d1 100644
> > --- a/package/Config.in.host
> > +++ b/package/Config.in.host
> > @@ -72,6 +72,7 @@ menu "Host utilities"
> >         source "package/pkgconf/Config.in.host"
> >         source "package/pru-software-support/Config.in.host"
> >         source "package/pwgen/Config.in.host"
> > +       source "package/python-iniparse/Config.in.host

Missing a trailing quote:
package/Config.in.host:81:warning: multi-line strings not supported

> >         source "package/python-cython/Config.in.host"
> >         source "package/python-greenlet/Config.in.host"
> >         source "package/python-kflash/Config.in.host"
> > diff --git a/package/python-iniparse/Config.in.host b/package/python-iniparse/Config.in.host
> > new file mode 100644
> > index 0000000000..e93022e815
> > --- /dev/null
> > +++ b/package/python-iniparse/Config.in.host
> > @@ -0,0 +1,11 @@
> > +config BR2_PACKAGE_HOST_PYTHON_INIPARSE
> > +       bool "host python-iniparse"
> > +       select BR2_PACKAGE_HOST_PYTHON_SIX # runtime
> > +       help
> > +         iniparse is an INI parser for Python which is API compatible
> > +         with the standard library's ConfigParser, preserves
> > +         structure of INI files (order of sections & options,
> > +         indentation, comments, and blank lines are preserved when
> > +         data is updated), and is more convenient to use.
> > +
> > +         https://pypi.python.org/pypi/iniparse
> > diff --git a/package/python-iniparse/python-iniparse.mk b/package/python-iniparse/python-iniparse.mk
> > index d31a490bd8..e76987d1e9 100644
> > --- a/package/python-iniparse/python-iniparse.mk
> > +++ b/package/python-iniparse/python-iniparse.mk
> > @@ -12,3 +12,4 @@ PYTHON_INIPARSE_LICENSE_FILES = LICENSE-PSF LICENSE
> >  PYTHON_INIPARSE_SETUP_TYPE = setuptools
> >
> >  $(eval $(python-package))
> > +$(eval $(host-python-package))
> > --
> > 2.37.3
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
