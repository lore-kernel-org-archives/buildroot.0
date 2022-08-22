Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD6B8C28D13
	for <buildroot@archiver.kernel.org>; Mon, 22 Aug 2022 09:04:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F74241507;
	Mon, 22 Aug 2022 09:04:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F74241507
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nRGj_l6doLyN; Mon, 22 Aug 2022 09:04:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A85EC41505;
	Mon, 22 Aug 2022 09:04:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A85EC41505
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 717A91BF306
 for <buildroot@lists.busybox.net>; Mon, 22 Aug 2022 09:04:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4A94841505
 for <buildroot@lists.busybox.net>; Mon, 22 Aug 2022 09:04:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A94841505
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LwE3krAtNNPZ for <buildroot@lists.busybox.net>;
 Mon, 22 Aug 2022 09:04:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0FB95414C5
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0FB95414C5
 for <buildroot@buildroot.org>; Mon, 22 Aug 2022 09:04:47 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id m2so9353503pls.4
 for <buildroot@buildroot.org>; Mon, 22 Aug 2022 02:04:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=q8abQ+Ki69NItpou9dxA5cUuHd/IeCYao0yxIzPT+LI=;
 b=AI9tpkXsylulJ2nRn//fowDjZ3IPZ932N71K8aZwkrs86y3YUcvbCFfQGRQu7HS+RA
 fht6YYBY03GR82rAMiNZ1DMQ3Cp6fhahhhmYZrotJqwt/2hEgdxQfto5b4/laZ+s5l+C
 VCXhEw3wfJSYESu33rHBcOUTIp+yL9gZLZSoSI1gV6FWBD4DYr4hqeS5gTB3ECGieh44
 0jAhcOoVXezjl1+61es9qkZd+QIzWqjn/BobdENDy8RfiPbl0+g+OkjoxtJX5/nO614L
 /5FYpaqqHj4v8Tk9pKf0rSZFZnLoayV4c2jPAyNuAAHpauC5kq+jwOc2V3Yq5rYuhXUQ
 iHyg==
X-Gm-Message-State: ACgBeo0yBKlSWcFZ9hR/Gqs4Kg+YyDCVDYMCbnoua+1Mxk/DOy/0MnDO
 roexvyC0blRnfDEHj3nDssvS3pbvo6zlkrDJi5aOiC2V
X-Google-Smtp-Source: AA6agR6czjqgZt+NkCpp+B1nfgyAwZjD2alpuCBHAPo/3H/ku8pz775XI2Y40p3r70DndRtncGuqmGUmtvZ7g4bu4iY=
X-Received: by 2002:a17:90b:3e86:b0:1f5:2b4f:7460 with SMTP id
 rj6-20020a17090b3e8600b001f52b4f7460mr27933285pjb.97.1661159087362; Mon, 22
 Aug 2022 02:04:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220822072241.2056264-1-james.hilliard1@gmail.com>
 <1b0f969d-78f3-86ba-23e2-2e03af924800@othermo.de>
In-Reply-To: <1b0f969d-78f3-86ba-23e2-2e03af924800@othermo.de>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 22 Aug 2022 03:04:33 -0600
Message-ID: <CADvTj4qCT-p8+94SK49Wetg0H4fp5hDNvy-3_ZzPp4kZvKpZMw@mail.gmail.com>
To: Marcus Hoffmann <marcus.hoffmann@othermo.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=q8abQ+Ki69NItpou9dxA5cUuHd/IeCYao0yxIzPT+LI=;
 b=Sv2Z0zMFI3LJNgPm/7anY0MA1ap5/LX1zKRDh7f5VzaOgzzQhlpsLkxN9agCAnW/uU
 ShvDoGu2LiaYV2i6iUfPV89rDHXAG0ilJpzZsFnw+TV6O5lIeALPJpOYdRN7Ch36joxM
 Mj2a5T0IAxu2tmg2s5mZC5VBBpjr+8hCvC+1wpsUjUeYU6zslCoYByo738WV1I/cKnzX
 8KVkDa/0FGw0PtuCRaKRdVQZ8mPqbgOSVKHyNWwkTC3FQw+29gtzakde/RdYxgLeNyEr
 phvZSolcg1k/NwVZYDM//W5ApUJE0vObhc7owBqReewK84KDvLsefUdm5cjuONxWY/Ll
 yDgA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Sv2Z0zMF
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pep517: bump to version
 0.13.0
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

Sure thing.

On Mon, Aug 22, 2022 at 2:55 AM Marcus Hoffmann
<marcus.hoffmann@othermo.de> wrote:
>
> Hi James,
>
> thanks for keeping the python ecosystem up and running within buildroot :-).
>
> Could you perhaps include a list of changes (or a link to the upstream
> changelog, not sure what the buildroot project prefers here) in package
> version bumps? That would make reviewing the patches easier for others.

I usually try to mention any changes relevant to buildroot, most of the time
for simple version bumps there aren't any.

>
> For this package:
> https://github.com/pypa/pep517/blob/main/doc/changelog.rst#013
>
>      Remove support for end-of-life Pythons. Now requires Python3.6+.
>      Remove support for toml package. Now requires tomli.
>      Rely on preferred "files" API on Python 3.9 and later.

None of these have any impact for us, we already use tomli and we're
on python3.10.

>
>
> On 22.08.22 09:22, James Hilliard wrote:
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>
> Reviewed-by: Marcus Hoffmann <marcus.hoffmann@othermo.de>
>
> > ---
> >   package/python-pep517/python-pep517.hash | 4 ++--
> >   package/python-pep517/python-pep517.mk   | 4 ++--
> >   2 files changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/package/python-pep517/python-pep517.hash b/package/python-pep517/python-pep517.hash
> > index 4dd4c47fa0..6535e51656 100644
> > --- a/package/python-pep517/python-pep517.hash
> > +++ b/package/python-pep517/python-pep517.hash
> > @@ -1,5 +1,5 @@
> >   # md5, sha256 from https://pypi.org/pypi/pep517/json
> > -md5  7ed0adb5f737c316e071d48d66329a5d  pep517-0.12.0.tar.gz
> > -sha256  931378d93d11b298cf511dd634cf5ea4cb249a28ef84160b3247ee9afb4e8ab0  pep517-0.12.0.tar.gz
> > +md5  7fd08b11215256601a8a4940c1ba3d34  pep517-0.13.0.tar.gz
> > +sha256  ae69927c5c172be1add9203726d4b84cf3ebad1edcd5f71fcdc746e66e829f59  pep517-0.13.0.tar.gz
> >   # Locally computed sha256 checksums
> >   sha256  1b22b049b5267d6dfc23a67bf4a84d8ec04b9fdfb1a51d360e42b4342c8b4154  LICENSE
> > diff --git a/package/python-pep517/python-pep517.mk b/package/python-pep517/python-pep517.mk
> > index 45c4f8dd39..1fd294fbb4 100644
> > --- a/package/python-pep517/python-pep517.mk
> > +++ b/package/python-pep517/python-pep517.mk
> > @@ -4,9 +4,9 @@
> >   #
> >   ################################################################################
> >
> > -PYTHON_PEP517_VERSION = 0.12.0
> > +PYTHON_PEP517_VERSION = 0.13.0
> >   PYTHON_PEP517_SOURCE = pep517-$(PYTHON_PEP517_VERSION).tar.gz
> > -PYTHON_PEP517_SITE = https://files.pythonhosted.org/packages/0a/65/6e656d49c679136edfba25f25791f45ffe1ea4ae2ec1c59fe9c35e061cd1
> > +PYTHON_PEP517_SITE = https://files.pythonhosted.org/packages/4d/19/e11fcc88288f68ae48e3aa9cf5a6fd092a88e629cb723465666c44d487a0
> >   PYTHON_PEP517_LICENSE = MIT
> >   PYTHON_PEP517_LICENSE_FILES = LICENSE
> >   PYTHON_PEP517_SETUP_TYPE = flit-bootstrap
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
