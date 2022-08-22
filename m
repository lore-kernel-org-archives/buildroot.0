Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5943C28D13
	for <buildroot@archiver.kernel.org>; Mon, 22 Aug 2022 07:57:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 10B74409F5;
	Mon, 22 Aug 2022 07:57:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 10B74409F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qz46DOdE-KAa; Mon, 22 Aug 2022 07:57:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0344F409E9;
	Mon, 22 Aug 2022 07:57:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0344F409E9
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E880C1BF577
 for <buildroot@lists.busybox.net>; Mon, 22 Aug 2022 07:57:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D063B40169
 for <buildroot@lists.busybox.net>; Mon, 22 Aug 2022 07:57:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D063B40169
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id y997FFUplbZ6 for <buildroot@lists.busybox.net>;
 Mon, 22 Aug 2022 07:57:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E5AC5400D2
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E5AC5400D2
 for <buildroot@buildroot.org>; Mon, 22 Aug 2022 07:57:19 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id pm13so1236348pjb.5
 for <buildroot@buildroot.org>; Mon, 22 Aug 2022 00:57:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=IvwLtPL6bkhPUE7MCihsYmU96psUEYndzmwaXopMsyU=;
 b=UEUVcfUZQ79Ckl0c2zwxHlzG4iygWPC9zdGL66j+UfF3uxom59Ik50y7UfIK++xT8W
 rN0ljsM8BnM62KUwV1ew6Hf/A5ze+YaGl/W9+WMJg890dgpw+WXFo/LoVgZLf3NjnMbM
 H/PRqyfQNwsy2PmPWBtUtACHs++YWinWF+F7eCQLl0n2nqJpP8nnI2JRhPHSSRBET5F7
 TICDbujegbopfOxeJUTdrqBtwLgNTwE5wEkmZX7ofHOUmW0J2XLSFxykVNLcKL7yFNUF
 sES7CHj+fuDAHaa6LoMgM04migcGQlHLHZPVFWcCgST5uwPg6fQsW0ZbKJX71Ihz6c54
 Th3Q==
X-Gm-Message-State: ACgBeo2f59AXd3Vy7oDfpmnXupuxftkAdbWdT4YM6F1e/gmSGZJWS4Wq
 JIlVzH/NOD5w7BxXWaidzi0DHnv8xaiFS3Y2eeYWlsItD8s=
X-Google-Smtp-Source: AA6agR7LCkAPKirSLq3PB91ILOip3Sq2HGGNlOSl7n72YUDg2YontuMTwZHS52fKNhG+keUh9jfd/+sv0d4EUwjS0Vc=
X-Received: by 2002:a17:90b:4acc:b0:1f5:7f05:12e8 with SMTP id
 mh12-20020a17090b4acc00b001f57f0512e8mr21194840pjb.92.1661155039312; Mon, 22
 Aug 2022 00:57:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220822060201.3333515-1-james.hilliard1@gmail.com>
 <20220822071611.GW2167049@scaer>
In-Reply-To: <20220822071611.GW2167049@scaer>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 22 Aug 2022 01:57:07 -0600
Message-ID: <CADvTj4oewb-iE9OMkHKak=VyFiMejG810FwWGikjcLWpTqWUqA@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=IvwLtPL6bkhPUE7MCihsYmU96psUEYndzmwaXopMsyU=;
 b=P0LQFz+h9K6IPeiV6jdZWS+4Gd7rovC3Ktv1M7nnWANbN+/3VkJc1y/xkWf2QisviP
 1ziMZDra/E5fh0o/vKwfVfdqfbUpAo7Ei1bgotN2HobtNQpE4CvksQlGbA3H7iVrRzYk
 bAukZnzSI2ilE2pXBWMEuzQjXEPnlv6vidnuQsoZwuj2H67JPmCRPzCyZx9aMpnK7FsJ
 jsPNI2HMhAVoe/BSoZBcYRxiGtINmmRiwswm0FIu1ly8Qs23Zb6aQuh81Kj1xNTmH6jG
 gs0Rub4yTiRPta/khb/3pe2VgjsSWQHFWJPe9CgYD7k216KWwwPsYte6n6AFt1C9FPMz
 Y4tw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=P0LQFz+h
Subject: Re: [Buildroot] [PATCH v2 1/1] package/pkg-python: clean
 conflicting pep517 packages before install
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
Cc: Marcus Hoffmann <marcus.hoffmann@othermo.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, Aug 22, 2022 at 1:16 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> James, All,
>
> On 2022-08-22 00:02 -0600, James Hilliard spake thusly:
> > The python installer package isn't able to overwrite packages that
>
> s/packages/files of packges/

Changed in v3

>
> > already exist, this causes problems when doing a rebuild or update
> > without a full clean.
> >
> > To fix this we can use functionality from importlib to identify and
> > remove any conflicting python package files before installation.
> >
> > Since we are adding this functionality to our pyinstaller.py script
> > we must also use pyinstaller.py for host python packages to avoid
> > hitting this issue there as well.
>
> Please split in two:
>   - first pach to use ur pyinstaller for host packages
>   - second patch to cleanup

Split in v3:
https://patchwork.ozlabs.org/project/buildroot/patch/20220822075418.903230-1-james.hilliard1@gmail.com/
https://patchwork.ozlabs.org/project/buildroot/patch/20220822075418.903230-2-james.hilliard1@gmail.com/

>
> [--SNIP--]
> > diff --git a/package/pkg-python.mk b/package/pkg-python.mk
> > index 5794e3a195..b147827821 100644
> > --- a/package/pkg-python.mk
> > +++ b/package/pkg-python.mk
> > @@ -139,6 +139,14 @@ PKG_PYTHON_PEP517_INSTALL_STAGING_OPTS = \
> >  HOST_PKG_PYTHON_PEP517_ENV = \
> >       $(HOST_PKG_PYTHON_ENV)
> >
> > +HOST_PKG_PYTHON_PEP517_INSTALL_OPTS = \
> > +     --interpreter=/bin/python \
>
> Why is this not $(HOST_DIR)/bin/python ?

Fixed in v3:
https://patchwork.ozlabs.org/project/buildroot/patch/20220822075418.903230-1-james.hilliard1@gmail.com/

>
> There is no guarantee that there is a python interpreter on the build
> machine, and we anyway want to use our python, not the system one.
>
> Regards,
> Yann E. MORIN.
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
