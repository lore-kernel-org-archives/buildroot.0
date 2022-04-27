Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8700BC433F5
	for <buildroot@archiver.kernel.org>; Wed, 27 Apr 2022 08:42:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C33F41997;
	Wed, 27 Apr 2022 08:42:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M4gujoVrOqjQ; Wed, 27 Apr 2022 08:42:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 908A441980;
	Wed, 27 Apr 2022 08:42:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 59B731BF947
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 08:42:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 461B260D75
 for <buildroot@lists.busybox.net>; Wed, 27 Apr 2022 08:42:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jIE62dfs56yq for <buildroot@lists.busybox.net>;
 Wed, 27 Apr 2022 08:42:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com
 [IPv6:2001:4860:4864:20::32])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4465F60A92
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 08:42:20 +0000 (UTC)
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-e68392d626so1246116fac.4
 for <buildroot@buildroot.org>; Wed, 27 Apr 2022 01:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=F6lCWrcEkFoAJ2plXbF2ak7iwt1IQabWzqiiGx4G+58=;
 b=qNjvtMDYHzzBwccYpa9ssKliGEYFISYtBehHBfX5P7omDqodwBdy9BqVDj141EFEXZ
 mk0lMYf+nIVKDvdwXfkDJcejbnODxpXsnNa79o0AhOSPoFMcc8RzGPngWQlzX+TOta4P
 ux5j3CzmeFXx69juyKwQtkqc41bmHCpfU4U6jN/Ka2sfZfgdWWTUgeiz54Cmd4g/mY+y
 PtMrYIjyRzI1ArHeCtEIe3Ke3bcaUnD+Iod8CnZ+YHcM0ZwLd9uCRIHKPe0jvD5JOikO
 RJd9Lx+QCim+BbuZofEBAc6ewOm50vtdmDUluOSqYpUr/fYH2ONen1rCHAe7za5sPgA/
 vvDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=F6lCWrcEkFoAJ2plXbF2ak7iwt1IQabWzqiiGx4G+58=;
 b=FNi/++pFucSGoFKwY2Fmjvcs4RasC+1qAa6RfoI/B9mq47/kvRqc1MiZVfgC6lgP/s
 5+S4PHOduEk59jxViaqQeX7KaRabD8Zj9QCIEnmB0g8OTooLgVi6QM3D9b/gwM7msD3a
 jSaFclrIdayblosbdM4YDS9xoCD1UcToe2UogLnbOW1L9tPDW+fDIqWhhlilesu70Si/
 xONnXh1Hyi88YWOHP6B1uM8jZWkxxLB33XUmF4cBcKRZeTDUNTrIK7MoT5pz+fQMmEu7
 KFHO3OyDRUlT3R6F4hfUh39ZLF0ByQh7SBpn8gzUR6tsnJWmYrPK7KJMKXuTcWllLb+z
 frxQ==
X-Gm-Message-State: AOAM533aW1QGJLYv1dozPemKeXXaeA2xk0EK88lCIMy1ZETwgBaOdrgm
 xUVpS5mKKStJ+vH411JmeqQUQTUQnGMXnpas5dE=
X-Google-Smtp-Source: ABdhPJzPuAqFMhz0Zj9QgJl1yvs9zxPVGhUQcNDLiyuFfdzhWLA+pNPNNs1rIGknNlzspfA45VJv8r4vRS+k+8GOTSA=
X-Received: by 2002:a05:6870:912c:b0:e9:1a05:bc0d with SMTP id
 o44-20020a056870912c00b000e91a05bc0dmr8147188oae.99.1651048938951; Wed, 27
 Apr 2022 01:42:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220427035039.1664864-1-james.hilliard1@gmail.com>
 <20220427103102.7f934c1f@windsurf>
In-Reply-To: <20220427103102.7f934c1f@windsurf>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 27 Apr 2022 02:42:08 -0600
Message-ID: <CADvTj4og7yAZT69jVo8=5yHSppj7ih7dsUAy6hH+zib7HEi51g@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/python3: drop libressl support
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot <buildroot@buildroot.org>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, Apr 27, 2022 at 2:31 AM Thomas Petazzoni
<thomas.petazzoni@bootlin.com> wrote:
>
> Hello James,
>
> On Tue, 26 Apr 2022 21:50:39 -0600
> James Hilliard <james.hilliard1@gmail.com> wrote:
>
> > Libressl is no longer supported as of python 3.10.
> >
> > See: https://peps.python.org/pep-0644/#libressl
> >
> > Fixes:
> >  - http://autobuild.buildroot.net/results/a16/a160cfdc9dfc036c4dc41af1c796f8838d91c573
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>
> Thanks for your patch. I think it raises one question: is libressl
> still relevant? Should we still support it?

Well it's still actively maintained at least.

>
> My understanding was that it is not really a successful fork, and in
> the end, openssl has mostly caught up and remains the de-facto standard
> implementation. See https://lwn.net/Articles/841664/.

We do support a number of other rather uncommon ssl implementations
in general, and at least it's easy enough to disable for unsupported
configurations.

>
> I don't have a very well-informed opinion, but perhaps we should think
> about this?

Yeah, not really sure, it may be useful to keep around, I think it has an
alternative updated API to openssl's updated API that may be desirable
for some use cases, although probably not the most commonly used.

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
