Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F66DC433F5
	for <buildroot@archiver.kernel.org>; Tue, 11 Jan 2022 22:11:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 210CB83E9B;
	Tue, 11 Jan 2022 22:11:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YE-0LlC-I67d; Tue, 11 Jan 2022 22:10:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6133883EB7;
	Tue, 11 Jan 2022 22:10:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id ED7711BF32E
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 22:10:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DBCD76FB4B
 for <buildroot@lists.busybox.net>; Tue, 11 Jan 2022 22:10:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ppsCWCYW7n0a for <buildroot@lists.busybox.net>;
 Tue, 11 Jan 2022 22:10:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 12B49605EA
 for <buildroot@buildroot.org>; Tue, 11 Jan 2022 22:10:50 +0000 (UTC)
Received: by mail-oi1-x231.google.com with SMTP id w188so929009oiw.13
 for <buildroot@buildroot.org>; Tue, 11 Jan 2022 14:10:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/oAeZcTzivcF/qd9z1ktux4MBfKjTnxxYSkMV1ts1kA=;
 b=hBWlcKZUqg8WqzzheiPg00duQbealmLtnHt2r/A+Dse/G4mYjfaiG+B2pnSkXYlp/+
 JPyrpGNRB5vYsjWKypygjec3bI46v2Dcfg5XmuuBUi6B15/W6q+d4r3+ofJqqUuhxPbI
 wkDaCrayQWQYq8VsiBCcXnyzuu9U8xd6QAJ2MmzEpWZrcyE3FvxNPQspBjVr7LJvCHUb
 v06J6ktd03fN2pZXWVbq5kTZCJ4nc2CqAgAh/vgXwch92+eFZK+CsQ8+/B/YnDqBnTiV
 eWFtsP1o6wE0MOMkorwAs9t8vyjD6YrGSnP2R2dUBj3ygtf2qv7HJphpwqG8AKP2eF6+
 +8Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/oAeZcTzivcF/qd9z1ktux4MBfKjTnxxYSkMV1ts1kA=;
 b=1ngS6vLYlckij04IP6leKf1l1bchwokjv13TVNiz3mBBsowymG2QfijYsxQXRmi1tI
 g9URRkSsj73uv0/xH81POtRffDVApbWR7ML033rZqsFo+bVcYYBx4FLMPgLtZs4VipDX
 8jatqdJ5RZGGWNB/b8kzO6u7JlOtr1EqJqUd+WQb1EPx/bgKZxklDeAPxc1BvPfopRHP
 vfTnLorWbln3IgnDAg2xyh0WCap7mWj/RsycktrtRdoG7IZJ1qVAWRMoVxiH2dQpgFLk
 S94/zyU+LTxxX3kZIjQRroVLiYE9EjsefAy4OA61xrS2zoJogWfUjTQ3LCOSoHvbAGW4
 6qag==
X-Gm-Message-State: AOAM5332TIzZYPtmNWqfDDCc+YqsyMLIumNmB4xXEkc3336WeHNmV73N
 r5cb6KurnnHo2B3yrglcfn9ye3ZnKNGgy49hNVIhGZ5Or08=
X-Google-Smtp-Source: ABdhPJzFXd3upJ1yXJhX/SwFUaxYRLP0xemF2+Fedvj5Wg1WuZWhvz06xg3B8HRobaFv/MYmo4fthrCKlvyV8t1pHr0=
X-Received: by 2002:a05:6808:f8d:: with SMTP id
 o13mr2255287oiw.67.1641939050077; 
 Tue, 11 Jan 2022 14:10:50 -0800 (PST)
MIME-Version: 1.0
References: <20220111211708.517341-1-yann.morin.1998@free.fr>
 <5c2d7de5-56e5-d98a-3f13-3ef18ffcaa5e@lucaceresoli.net>
In-Reply-To: <5c2d7de5-56e5-d98a-3f13-3ef18ffcaa5e@lucaceresoli.net>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Tue, 11 Jan 2022 15:10:39 -0700
Message-ID: <CADvTj4rj-F+fuOSX0j14RPBeh1UDJ+hySoOs=KQh3jQybPeEuQ@mail.gmail.com>
To: Luca Ceresoli <luca@lucaceresoli.net>
Subject: Re: [Buildroot] [PATCH] package/zynq-boot-bin: drop legacy package
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, Jan 11, 2022 at 3:00 PM Luca Ceresoli <luca@lucaceresoli.net> wrote:
>
> Hi Yann,
>
> On 11/01/22 22:17, Yann E. MORIN wrote:
> > Since commit 6dd5a33c485c (zynq_zed: bump U-Boot to xilinx-v2016.2), we
> > have no in-tree users of zynq-boot-bin.py, as U-Boot has since v2016.01
> > been able to natively generate Xilinx images.
> >
> > zynq-boot-bin.py is python2-only and there is zero chance that upstream
> > will move it to python3. WE could carry a pytohn3-compatible copy, but
>
> s/pytohn3/python3/
>
> > that tool is now virtually unused.
> >
> > 6 years have passed now; let it rest in peace at last.
> >
> > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
> > Cc: James Hilliard <james.hilliard1@gmail.com>
> > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> > Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> > Cc: Luca Ceresoli <luca@lucaceresoli.net>
> > ---
> >  Config.in.legacy                         |  7 +++++++
> >  boot/uboot/Config.in                     | 12 ------------
> >  boot/uboot/uboot.mk                      | 11 -----------
> >  package/zynq-boot-bin/zynq-boot-bin.hash |  2 --
> >  package/zynq-boot-bin/zynq-boot-bin.mk   | 22 ----------------------
> >  5 files changed, 7 insertions(+), 47 deletions(-)
> >  delete mode 100644 package/zynq-boot-bin/zynq-boot-bin.hash
> >  delete mode 100644 package/zynq-boot-bin/zynq-boot-bin.mk
> >
> > diff --git a/Config.in.legacy b/Config.in.legacy
> > index b3e8d5a6d8..16d5ac40b3 100644
> > --- a/Config.in.legacy
> > +++ b/Config.in.legacy
> > @@ -146,6 +146,13 @@ endif
> >
> >  comment "Legacy options removed in 2022.02"
> >
> > +config BR2_TARGET_UBOOT_ZYNQ_IMAGE
> > +     bool "Generate image for Xilinx Zynq"
> > +     select BR2_LEGACY
> > +     help
> > +       Since 2016.1, U-Boot can natively generate the Zynq boot image,
> > +       and so the Xilinx-specific format and tools have been removed.
>
> As said in the discussion after James' patch, I would add something like:
>
>   Should you still need zynq-boot-bin.py you can download it at <URL>
>   and call it from a post-build script. You will need to install python2
>   on your host to run it.

I uploaded the python3 version here if anyone needs it:
https://gist.githubusercontent.com/jameshilliard/e09235dfc6f96c11418a134e6ebf7890/raw/135b7480c405ae8a77a9db615e495f9a9f2d3242/zynq-boot-bin.py

>
> --
> Luca
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
