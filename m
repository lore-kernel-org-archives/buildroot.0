Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1D47C19F2B
	for <buildroot@archiver.kernel.org>; Wed,  3 Aug 2022 22:03:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 88796404C8;
	Wed,  3 Aug 2022 22:03:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 88796404C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i3iKou8IeWPN; Wed,  3 Aug 2022 22:03:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8A67540297;
	Wed,  3 Aug 2022 22:03:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8A67540297
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8199F1BF325
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 22:02:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 60DC981A50
 for <buildroot@lists.busybox.net>; Wed,  3 Aug 2022 22:02:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 60DC981A50
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xNNz2I0-4CJx for <buildroot@lists.busybox.net>;
 Wed,  3 Aug 2022 22:02:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6940A81761
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6940A81761
 for <buildroot@buildroot.org>; Wed,  3 Aug 2022 22:02:57 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 d65-20020a17090a6f4700b001f303a97b14so3578267pjk.1
 for <buildroot@buildroot.org>; Wed, 03 Aug 2022 15:02:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=0yDbY6ypqAnAiOSxpT3o+beX1rIA72BZEx3IU/xe/ro=;
 b=lxD/2txMTQ+3N2CYRbtd34t2bzwCjhV6TH0n39/Jj9bHemgcBGu4jfRSm2h/VNrYhN
 pL0RnX+z7VCIRzWZdOzlZAYKYfB6/xSnHm6PDeDBmP4jikL7E/iOiOCeHiXz76h02Vzv
 Zrwn2cYO7fHYT7dT98ORAOYdJR+P9JRkVeLaSoCHLsUW92V1bsahs7zetTk7IdiJeBcT
 73nKKH2+Hv/mfeQooSYW1zuROATwvdipwznlSZY2SnzrSJZUfURFx7knSrRs+ya2y2yl
 5Oey7yv/Hedq3HZzEFgWRl83VP+c3Mzol5FrZo2OnsDaBkvUvI5wFy9fCH61WVo/LLGt
 6kmw==
X-Gm-Message-State: ACgBeo3109lHsSSoswLhJUfdnqWTIdNC/hRuaj2po1s8DqjJgG6JREFq
 N83o7ZfKfYr2jqdNGiA07HNxDXxEsKZK5IGHcKnYueEnUTRPgKH7
X-Google-Smtp-Source: AA6agR5LxRcTQf7NDAhgwqQgvQtq7DIPz/PwbJulM6sGXQgrCr41EcJjsig2mrro9xBA9nzgEk60WNuuueokkvwjXbA=
X-Received: by 2002:a17:902:6b82:b0:16d:d268:3842 with SMTP id
 p2-20020a1709026b8200b0016dd2683842mr27377762plk.16.1659564176686; Wed, 03
 Aug 2022 15:02:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220313171355.271345-1-james.hilliard1@gmail.com>
 <20220803233856.3d609d8c@windsurf>
In-Reply-To: <20220803233856.3d609d8c@windsurf>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 3 Aug 2022 16:02:43 -0600
Message-ID: <CADvTj4r9D=kUa-N+HC2tVTt7Oxna=ZMSp-H5POaYzE2DsXCD-w@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=0yDbY6ypqAnAiOSxpT3o+beX1rIA72BZEx3IU/xe/ro=;
 b=EsmxSXHx+X2L/I0sgBClpkIyiQOg3RPltSuu6OSZl3VKig9JWbaEiJaUdoJqsDk/ks
 Euf6C1wWXdAvZmuMlQaubUDkWjcsW2lf9wLUBDzlO+bAISZisP1SMsuXE8I6pG7bNQlx
 Xatenp6lQKuTl1VMcYnFt2QbFs6zgkFaDUEPDv5wpWRtOGK8DrIu4RbUNB+Zbpo6EbII
 kRRfmbmrycH4OVc2yI9dV9XUbJkJmknCaAG2n2Y3o6l3Weg48vqEJZg/hY/qcnSjFuoL
 l2DNTSb52i6YU2Eoebnt7+8WfvySIPWRreQadv9c+pC85uScBqZx8dcwYkc4m9gQXc3j
 WAeQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=EsmxSXHx
Subject: Re: [Buildroot] [PATCH v2 1/2] utils/scanpypi: ensure tmp_extract
 is cleaned up on exception
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, Aug 3, 2022 at 3:38 PM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> On Sun, 13 Mar 2022 11:13:54 -0600
> James Hilliard <james.hilliard1@gmail.com> wrote:
>
> > +            s_file, s_path, s_desc = imp.find_module('setup', [self.tmp_extract])
> > +            imp.load_module('__main__', s_file, s_path, s_desc)
> > +            if self.metadata_name in self.setup_args:
> > +                pass
> > +            elif self.metadata_name.replace('_', '-') in self.setup_args:
> > +                self.metadata_name = self.metadata_name.replace('_', '-')
> > +            elif self.metadata_name.replace('-', '_') in self.setup_args:
> > +                self.metadata_name = self.metadata_name.replace('-', '_')
> > +            try:
> > +                self.setup_metadata = self.setup_args[self.metadata_name]
> > +            except KeyError:
> > +                # This means setup was not called
> > +                print('ERROR: Could not determine package metadata for {pkg}.\n'
> > +                      .format(pkg=self.real_name))
> > +                raise
> > +        finally:
> > +            os.chdir(current_dir)
> > +            sys.path.remove(self.tmp_extract)
> >
> >      def get_requirements(self, pkg_folder):
> >          """
>
> Are you sure this work correctly?

Looks right to me.

>
> If I understand correctly self.tmp_extract is where the Python package
> source code is extracted. So if you remove it at the end of
> load_setup(), how will your new load_pyproject() added in PATCH 2/2 be
> able to use the package source code?

We're not deleting self.tmp_extract, we're just ensuring we current dir and
sys.path states are cleaned up properly on failure, load_pyproject() does the
same thing. Always restoring initial state at the end means load_pyproject()
doesn't need to deal with current dir and sys.path global state changes induced
by load_setup().

>
> Also, why is this removal needed, as anyway the full tmp_path gets
> removed at the end of the main() function?

sys.path.remove(self.tmp_extract) is not the same as shutil.rmtree(tmp_path)

We're restoring the module search path at the end to avoid leaking global state
changes when there's an exception.

>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
