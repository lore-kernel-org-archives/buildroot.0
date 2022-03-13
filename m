Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 106A2C433EF
	for <buildroot@archiver.kernel.org>; Sun, 13 Mar 2022 14:45:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61CB8408B1;
	Sun, 13 Mar 2022 14:45:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ysqSA94KN0Rg; Sun, 13 Mar 2022 14:45:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8406D408A2;
	Sun, 13 Mar 2022 14:45:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2B2E01BF42D
 for <buildroot@lists.busybox.net>; Sun, 13 Mar 2022 14:45:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1F54660B68
 for <buildroot@lists.busybox.net>; Sun, 13 Mar 2022 14:45:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BdIfeJzOB0Pb for <buildroot@lists.busybox.net>;
 Sun, 13 Mar 2022 14:45:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CE121606ED
 for <buildroot@buildroot.org>; Sun, 13 Mar 2022 14:45:42 +0000 (UTC)
Received: by mail-oi1-x229.google.com with SMTP id n7so14803168oif.5
 for <buildroot@buildroot.org>; Sun, 13 Mar 2022 07:45:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tVgVT9Pjs9H7H6yaVARUVAaUpKqV5zu75NcjTfnjBlg=;
 b=SqA7IC/8k5coM4iNzZ39qqnZOBd1KUnn0PqsDDpUW1ePQKl/xqEMjyinZQK/i8qL4X
 vl2Of2vk6D4su+DZ57Ddxgd11CqF/mIx565/D02wa2Or/wmzrih0Shh9srMd5Ix+Y0wy
 rlXFcPQuO3Xj/OhCqBbj0dsvFNFhYWz5qjcsyW5NzzLVhqNGQEzOs7azdhGn2MuofD25
 RFF13Oe+s0QjkW+ieu6nfmbvuCLtshzDnlDGo8Y0XA1ZB9PP6+uPwEGcpHV9h5jplYTG
 2cCoim457l/B2j0Rx869eyxwPWSRzLGB6hPVRnOD9Vkb+M9O4LL41HMNbMGzWYulYssU
 g8nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tVgVT9Pjs9H7H6yaVARUVAaUpKqV5zu75NcjTfnjBlg=;
 b=zD4bicczDi6VbubjOGSvIbieKMCAkMP5QW3zjzFDqUHhUI5qAMpgrbjdCKWwjsEzG8
 UcVOHxt5aGDCyPsu2XMHjVf3HSqJCrelbUdktjFt/mNLTvlqP757JWkJJdSfLr9937kl
 T8K/sgYkN65EopWZSCuSpGdvnP5Pp9aRiknwZOZTgousaXkitrLSGwQD6LOp/5nhaeDQ
 194kiDVTYTiE6pTnW6wjPXmrT3BFV4FcpD1c+urOpNmyxaZam+PHjCdIvzgF0fDDBXBv
 qu8Jj5c5DW9KGjprs4FBILloBpTMyvdfpHLTsn84l6SCiuuCFvwLwEPjmd6GNxZ2/lzX
 +Odg==
X-Gm-Message-State: AOAM532a9TFen+6c1LyDymiuKezNY1T68yrLr+PxOCCWsHLpDHIDUlSE
 bdRA+ADPaFTQh5mlTNhmJNYZ9W1J10jD2UDlJUsfS3y0fAg=
X-Google-Smtp-Source: ABdhPJxji5drBKbhEzRDdqXK/PGPZUSHlgdKSJNUKn2w3rGPGPoXYC6/iJ52lZqfDI2XvRuyxy2LyCUVl+4MqFR+LWA=
X-Received: by 2002:a05:6808:2188:b0:2da:5b4b:9445 with SMTP id
 be8-20020a056808218800b002da5b4b9445mr11103269oib.99.1647182741761; Sun, 13
 Mar 2022 07:45:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220311191717.3878852-1-james.hilliard1@gmail.com>
 <20220313090942.GR283544@scaer>
In-Reply-To: <20220313090942.GR283544@scaer>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 13 Mar 2022 08:45:30 -0600
Message-ID: <CADvTj4pSgf-L6UFk5sU1ewe-_WWXYZfhhvPS4QSYKTpCr2Exew@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [Buildroot] [PATCH 1/1] package/python-weasyprint: bump to
 version 54.2
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

On Sun, Mar 13, 2022 at 3:09 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Kames, All,
>
> On 2022-03-11 12:17 -0700, James Hilliard spake thusly:
> > Migrate from distutils to flit package infrastructure.
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>
> Applied to master, thanks.
>
> But see below, please...
>
> [--SNIP--]
> > diff --git a/package/python-weasyprint/python-weasyprint.mk b/package/python-weasyprint/python-weasyprint.mk
> > index 0a944825bb..925de855bc 100644
> > --- a/package/python-weasyprint/python-weasyprint.mk
> > +++ b/package/python-weasyprint/python-weasyprint.mk
> > @@ -4,10 +4,10 @@
> >  #
> >  ################################################################################
> >
> > -PYTHON_WEASYPRINT_VERSION = 53.4
> > +PYTHON_WEASYPRINT_VERSION = 54.2
> >  PYTHON_WEASYPRINT_SOURCE = weasyprint-$(PYTHON_WEASYPRINT_VERSION).tar.gz
> > -PYTHON_WEASYPRINT_SITE = https://files.pythonhosted.org/packages/72/25/336e274fde0e48cf9979d44667411fbcfa55d323fd7672068807b6de2f89
> > -PYTHON_WEASYPRINT_SETUP_TYPE = distutils
> > +PYTHON_WEASYPRINT_SITE = https://files.pythonhosted.org/packages/f3/dc/d3d6f1d87a0a0b09637a1f5076790e229cc803c3584ed4edb76553844001
> > +PYTHON_WEASYPRINT_SETUP_TYPE = flit
>
> 'flit', as well as 'pep5127', are not documented in the manual:
>     https://buildroot.org/downloads/manual/manual.html#_infrastructure_for_python_packages
>
> Can you please send updates to fix that, now? ;-)

Yeah, cleaning flit/pep517 support up a bit more first, the pep517
option may not
be needed except for in tree backends, I guess we should keep it around for now
but not sure if any packages are going to be using it:
https://peps.python.org/pep-0517/#in-tree-build-backends

No packages use direct pep517 anymore as of this refactor:
https://patchwork.ozlabs.org/project/buildroot/patch/20220313122112.261290-1-james.hilliard1@gmail.com/

I've added flit/pep517 support in scanpypi as well in:
https://patchwork.ozlabs.org/project/buildroot/patch/20220313143726.267306-1-james.hilliard1@gmail.com/

Will send a docs update after those are reviewed+merged since there
are potential
docs implications with those changes.

>
> Regards,
> Yann E. MORIN.
>
> >  PYTHON_WEASYPRINT_LICENSE = BSD-3-Clause
> >  PYTHON_WEASYPRINT_LICENSE_FILES = LICENSE
> >
> > --
> > 2.25.1
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
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
