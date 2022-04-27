Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A318CC433EF
	for <buildroot@archiver.kernel.org>; Wed, 27 Apr 2022 07:21:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5C9054051D;
	Wed, 27 Apr 2022 07:21:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R1WJ2YRpAxQk; Wed, 27 Apr 2022 07:21:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4CF5B40192;
	Wed, 27 Apr 2022 07:21:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C88071BF48C
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 07:21:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B602140192
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 07:21:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dHJzgJANOXH4 for <buildroot@lists.busybox.net>;
 Wed, 27 Apr 2022 07:21:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com
 [IPv6:2001:4860:4864:20::33])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 36A0440102
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 07:21:17 +0000 (UTC)
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-e922e68b0fso1098780fac.1
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 00:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ELm8HLx1LH8+X0SIRUKbspZ2DfZPrP+EWI7YHONHXlQ=;
 b=NAUss5a/Tkq7+vUWll3mlwk+OVDgDw/V8KoOZjh7ckf3CV2BOumYcpno0kIsI/42Vb
 fFK2qaVZCPHU9Uti2fPVLy62dV3Yl1GQwg0fwzk+kJ1lZinT9TFq/2wxnfW1eWrsDsEe
 Pl6aPiW3pgP/qpfPkaFRp9yzD1I40Z/Fk0tcl1IfWRazT42VfSZtdHVQbRok9+SnZ4DH
 LbYlRz8hDmHeAnnCtZEJ4E9GIP8fL3WTee1y1YKFE4Z2LM+aGu+aqHLSSuo/TuQN282B
 LZfHl0gmaOLX+qAi0uEte9yuRTDos2Q78LH2kX/OFBIpQv3wJymHf6x67okeIBTSdI9F
 QwkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ELm8HLx1LH8+X0SIRUKbspZ2DfZPrP+EWI7YHONHXlQ=;
 b=ZZubOazk2AJEM/W/11m8JDm/1bQe4edhhqdlCVeR5bClZp4gu5hd3AKBKUxYDdSS2z
 XTt3DhPFFcA3bO4sQmUeMUkVCOVIh+6FalzqVaa50kz83QSwR2WHzHBcMHODh+X0sZiU
 TEt8wGfzKmAB3a2yqvHTwC5jk2a7aTPUG7HjkEM8rkGk6zkWuxtEzH09SuoWipAAarBC
 A3WEhR6fQ7zNyXOilpqclnqygP1qd4VOiE+wGhVW147gj7ro04H6En445djl75GT106u
 S7LUe1YUtbbzmAAxP74asDKe/MfzjkRrOd5CBoVerjp8KZw6vAPp6JqAZVyhH8Nl5jng
 iJbg==
X-Gm-Message-State: AOAM532rzhjAhMMjDGF0J6bI81bfgwo35Ofrr7XX+rNSJ5vslcXle/AG
 tT2l/MwwYo8A/kIx0e8l3fqldEu9pbjqsOjmj4g=
X-Google-Smtp-Source: ABdhPJx6X4ScV7K9u9Vxf4jQhht6aafaPi1UBPEmjuVS88SapNYRA/p3/7jCSYkEALsqFT354hiMxsWciz67aedVSO0=
X-Received: by 2002:a05:6870:311d:b0:de:9b6c:362b with SMTP id
 v29-20020a056870311d00b000de9b6c362bmr14423965oaa.200.1651044076165; Wed, 27
 Apr 2022 00:21:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220426012311.1738027-1-james.hilliard1@gmail.com>
 <69c6a8fb-0d05-0ae9-4c7d-b76e388f2958@mind.be>
In-Reply-To: <69c6a8fb-0d05-0ae9-4c7d-b76e388f2958@mind.be>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 27 Apr 2022 01:21:05 -0600
Message-ID: <CADvTj4qhrD61q9cEDRE-xdoL3ewoERk=j-gVGAPJyRpQKX7wJg@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Subject: Re: [Buildroot] [PATCH 1/1] package/python-pep517: migrate setup
 type to flit
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, Apr 27, 2022 at 1:10 AM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>
> On 26/04/2022 03:23, James Hilliard wrote:
> > This package is moving to flit, we need to use flit-bootstrap
> > since host-python-pypa-build depends on host-python-pep517.
>
>   But that only becomes relevant when we bump the version to something which
> drops distutils support, right?

Yeah, it will be required soon though it seems:
https://github.com/pypa/pep517/blob/v0.12.0/pyproject.toml#L2

The distutils support in pep517 is coming from the deprecated flit distutils
generator compatibility feature.

>
>   Of course, we can merge this patch now already, that's not what I'm saying.
> But the commit message says "we need to" which is not entirely correct. It's
> more like "we'll have to". Right?

The "we need to" part was referring to having to use the special flit-bootstrap
setup type instead of the regular flit setup type, not that this is immediately
needed by pep517, I may not have worded that clearly I guess.

>
>   Regards,
>   Arnout
>
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >   package/python-pep517/python-pep517.mk | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/package/python-pep517/python-pep517.mk b/package/python-pep517/python-pep517.mk
> > index 99aa62d51d..45c4f8dd39 100644
> > --- a/package/python-pep517/python-pep517.mk
> > +++ b/package/python-pep517/python-pep517.mk
> > @@ -9,7 +9,7 @@ PYTHON_PEP517_SOURCE = pep517-$(PYTHON_PEP517_VERSION).tar.gz
> >   PYTHON_PEP517_SITE = https://files.pythonhosted.org/packages/0a/65/6e656d49c679136edfba25f25791f45ffe1ea4ae2ec1c59fe9c35e061cd1
> >   PYTHON_PEP517_LICENSE = MIT
> >   PYTHON_PEP517_LICENSE_FILES = LICENSE
> > -PYTHON_PEP517_SETUP_TYPE = distutils
> > +PYTHON_PEP517_SETUP_TYPE = flit-bootstrap
> >   HOST_PYTHON_PEP517_DEPENDENCIES = host-python-tomli
> >
> >   $(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
