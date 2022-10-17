Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E50E6C433FE
	for <buildroot@archiver.kernel.org>; Mon, 17 Oct 2022 16:50:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 50E8660F69;
	Mon, 17 Oct 2022 16:50:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 50E8660F69
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j0uy_pfhiCjE; Mon, 17 Oct 2022 16:50:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A8D660F74;
	Mon, 17 Oct 2022 16:49:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A8D660F74
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4B6641BF331
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 16:49:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 32DC140A59
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 16:49:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 32DC140A59
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tZQRp0zJCafr for <buildroot@lists.busybox.net>;
 Mon, 17 Oct 2022 16:49:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2832E40A0D
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com
 [IPv6:2607:f8b0:4864:20::72f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2832E40A0D
 for <buildroot@buildroot.org>; Mon, 17 Oct 2022 16:49:56 +0000 (UTC)
Received: by mail-qk1-x72f.google.com with SMTP id a18so7027876qko.0
 for <buildroot@buildroot.org>; Mon, 17 Oct 2022 09:49:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FMaLpQPVNSdasrs663X4j68u0fW87Y6qyyHviDNCYbY=;
 b=nXH0sOIBfw8YJ7iWjnsClAtiJf45VmDhAuo6DOn7NSJfDhTIAPwAZPUM5AwagiV84N
 Qskmtqlt/TzC4Ui7HGbnmAp8zSqIl+W2dbwYy7YUTFWbJvwB+m137gUN0ZzbPwSy9jmS
 Q3w/WrDHTXbAt9MCItzTqErtxYyMFk4bplFKtLCUnzYxYUJLbwS+BJ87kGahj6GHH+Uf
 UPwF46FoKquXcnfeDGg5VYxaishumkDTmgbo0kQtcHLXC5VeXSlQpY5YhT7quJU3gnGM
 WXnaRTZYKEPePJyTrttYd9z9dczdmcTsEXrUS8Js4TWEd9r8CzSmPmdZMJ4LQySRECIs
 6W3Q==
X-Gm-Message-State: ACrzQf0KKc9myg0JM8X4bVM9Lqy8tNThwj4banEIXca7o4ukcUsYhBT2
 YgU79q6EU9T82sQwuExiE9//0M6vHSPraBg71k4=
X-Google-Smtp-Source: AMsMyM6U4webhCSDGsus9Z2rqcCZTINNffJBdPGoSNJUZ5Px9EywOE1z2EQLkimqd3w7Ur+DO7bSMC8DivdZk7BrwwQ=
X-Received: by 2002:a05:620a:410b:b0:6ee:b331:2e34 with SMTP id
 j11-20020a05620a410b00b006eeb3312e34mr8379289qko.639.1666025394883; Mon, 17
 Oct 2022 09:49:54 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1665868987.git.yann.morin.1998@free.fr>
 <CADYdroMmvaBpSbVkrc+Eu7KtkBt1m7Zqeu4mO6a2UZp+a1Hjrw@mail.gmail.com>
 <30300_1666015916_634D62AC_30300_412_1_20221017141154.GE2064029@tl-lnx-nyma7486>
 <CADYdroMNqJr3nDGhi0=_TttJ9jNp2dD44M=NVQJioLFDxreQVQ@mail.gmail.com>
 <14503_1666022446_634D7C2E_14503_9_8_20221017160044.GF2064029@tl-lnx-nyma7486>
In-Reply-To: <14503_1666022446_634D7C2E_14503_9_8_20221017160044.GF2064029@tl-lnx-nyma7486>
From: Norbert Lange <nolange79@gmail.com>
Date: Mon, 17 Oct 2022 18:49:43 +0200
Message-ID: <CADYdroOjp1duBTiNsdv=C1afgahQVmiDTg49-z_=hdqQJfVxqw@mail.gmail.com>
To: yann.morin@orange.com
Content-Type: multipart/mixed; boundary="000000000000d9f3c505eb3dc3a3"
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=FMaLpQPVNSdasrs663X4j68u0fW87Y6qyyHviDNCYbY=;
 b=jYZ8D1MAumE1XyJ6crlqUoQ06aQOrYNO3lPqMyv5PEU+FOQ0WgIoS/kXSXUFMmnUbd
 f+JLh7oy2I/24QMksGfc4xfeUWhucxUP0RbqJLxfSEdi9XWy8NazHz8rVOJKLjTPtcgs
 HG2RGIXVlWsggoSPrsDeJdA+3eefLTq73wo/FLbpwCAugbhVm13yxzYhTE667CQUSPOW
 Oz46JqO/OsyC2SUIHa+49ngDBFbr5/zU2H/xk6UwTQi7eXB39euONaU43BoYB4rhEctW
 3S+UZD1HolHF0FRfb8jmnRu1bIXSDaI2tSqipn376lnXbQ8T3G0hgIVML9Dg3FVez/Ky
 yUxw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=jYZ8D1MA
Subject: Re: [Buildroot] [PATCH 0/4] systemd: sort out the conflict between
 var factory and tmpfiles (branch systemdify-var)
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
Cc: Romain Naour <romain.naour@smile.fr>,
 =?UTF-8?B?SmXMgXJlzIFteSBSb3Nlbg==?= <jeremy.rosen@smile.fr>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--000000000000d9f3c505eb3dc3a3
Content-Type: text/plain; charset="UTF-8"

Am Mo., 17. Okt. 2022 um 18:00 Uhr schrieb <yann.morin@orange.com>:
>
> Norert, All,
>
> On 2022-10-17 16:50 +0200, Norbert Lange spake thusly:
> > Am Mo., 17. Okt. 2022 um 16:11 Uhr schrieb <yann.morin@orange.com>:
> > > On 2022-10-17 14:12 +0200, Norbert Lange spake thusly:
> > > > Am Sa., 15. Okt. 2022 um 23:23 Uhr schrieb Yann E. MORIN
> > > > <yann.morin.1998@free.fr>:
> > > [--SNIP--]
> > > > > The solution we implemented in Buildroot is to generate a factory for
> > > > > /var, and register that as tmpfiles, at build time, and mount a tmpfs on
> > > > > the then-empty /var at runtime, so that systemd-tmpfiles populates /var
> > > > > on boot. Having a tmpfs means /var is repopulated from a clean state at
> > > > > each boot, and people who want a persistent /var have to provide their
> > > > > own mechanism to mount their actual filesystem instead.
> > > > Here the issue is, that the logic will never be complete, I will
> > > > have to dig up old threads, but it fails with various combinations
> > > > of symlinks.
> > > The thing is, out of the box, Buildroot needs a working situation.
> > Yes, my argument would be a technical better solution.
>
> But so far, we do not have that technically better solution, so we need
> to fix things that are arctually broken.

I tried to bring that in for ages. Probably just have cooked up a patch instead.

>
> [--SNIP--]
> [--SNIP--]
> > > Now, please understand that some people are very happy with using a /var
> > > factory, and some are even happy that /var is being mounted as a tmpfs
> > > too.
> > Would they be unhappy if everything works as it did before?
>
> By "works as it did before", do you mean "using a var factory that was
> not broken for them"? Yes, I am being teasing.
>
> We'd have to evaluate the alternative proposal when we see it, if that
> can replace the existing solution.
>
> > > That is assuming that one will use an initramfs. For example, in my
> > > systems, I do not use one, and I do not want to use one.
> > No, initramfs is optional
>
> Ah, but you had so far only talked about using an initramfs to prepare
> an overlay, so I assumed your solution was tied to using an initramfs.
> If it's not, then let's see it.

Nah, it was always in respect of not messing around to much with the
filesystem itself.

I consider managing patch-series time consuming, so I'd like to discuss
the way this should be structured before.

This could be one completely separate package for example, allowing
different solutions.

>
> [--SNIP--]
> > > However, in my case I expressely do not want to use an initramfs: my
> > > rootfs is a squashfs mounted on an initrd. I also have a tmpfs mounted on
> > > /var, as I am very happy that /var gets factory value at boot (my
> > > resilient data is accessed in some other ways).
> > I am not sure if initrd/initramfs means something different here.
>
> initrd is a blockdevice in memory. The filesystem one puts in there can
> be any filesystem that could be otherwise stored on another blockdevice.
>
> initramfs is a filesystem in memory, like a tmpfs. The initramfs is
> read-write.

Ok, I am using those pretty much interchangeable,
just some block you tell the bootloader to load, either cpio or filesystem.

>
> > > > The recurring attempts to discuss this ended in [1].
> [--SNIP--]
> > > And finally, I believe it may even address more complex situations,
> > > where people will provide their own fakeroot-script to do the
> > > preparatory works.
> >
> > My own usecase is that  use the buildroot as pristine rootfs and then
> > slice it up as
> > necessary. But just to get this out of the way.
> >
> > More importantly, I would propose a simpler, yet more robust solution
> > than the var factory.
> >
> > For this, the files in the attached archive have to end up in
> > /lib/systemd/system.
>
> Did you forget to attach something, by chance?

Was attached in my post before - now 2 mails back. gonna add it
again for convienience.

>
> > What this does:
> > Before the time /var is supposed to be accessed, an tmpfs will be
> > mounted in /run,
>
> We already have that: /run is automatically mounted by systemd, no?

mounts a tmpfs in /run/varoverlay, own directory.
/run is guaranteed to be writable and available before any systemd
unit is started.

>
> > and the /var folder will be shifted around to end up in an overlayfs
> > *below* this tmpfs.
>
> What do you mean by "shifted"?

you have to bind-mount /var to another directory, so you can use it as lower fs.
/run/varoverlay/lower <- /var

then.. you mount an overlayfs *at* /var where you need to reference the original
folder with /run/varoverlay/lower

/var <- overlay of  /run/varoverlay/upper (tmpfs) and
/run/varoverlay/lower( orignal /var )

>
> > The bind-mount is done with a systemd mount unit, means if you have mounts
> > *in /var or below* those will be correctly ordered.
>
> Yeah, switching away from the fstab is good.

fstab wouldnt allow for the needed dependencies.

>
> > -   No initramfs necessary
> > -   No duplicate files in the var factory and tmpfs (unless they are
> > modified of course). So your suashed files stay compressed.
> > -   No tricky autogenerated tmpfiles
> > -   Would be possible to do something similar in other init systems
> >
> > The only downside would be the reliance on overlayfs - technically you
> > could also
> > adopt that solution to copy stuff into the tmpfs.
> >
> > Besides my obvious biases there are technical arguments to be had.
>
> We all have biases, me ot the last. :-)
>
> My technical arguments for this series are:
>   - it is currently kinda-broken
>   - var factory works until proven otherwise
>   - so we need to fix them
>
> I'll be sure to do as unbiased a review as possible for your proposal
> when I see it. ;-)

Gonna take me few days. should be easy to test tough with the provided files,
just throw them into the buildroot filesystem overlay.

Helps if you make some assessment where they should fit. the
systemd package is already bloated enough.

>
> > > PS. Please note that there are two different Yann in this thread: me at
> > > work using Buildroot, and Yann at home, one of the maintainers. Look at
> > > the email to be sure who's talking (not that I-at-work talk in the name
> > > of my employer either).
> > > I try to segregate the two identities as much as I can, but sometime
> > > there is some overlap, like here.
> > > YEM.
> >
> > Not making things much clearer ;)
>
> If it can comfort you, it is not much clearer in my own head either!  ;-)

Good to know, so we can discuss on even terms.

regards, Norbert

--000000000000d9f3c505eb3dc3a3
Content-Type: application/x-xz; name="overlay_var.tar.xz"
Content-Disposition: attachment; filename="overlay_var.tar.xz"
Content-Transfer-Encoding: base64
Content-ID: <f_l9d0fou90>
X-Attachment-Id: f_l9d0fou90

/Td6WFoAAATm1rRGAgAhARYAAAB0L+Wj4BH/AnNdADYbyIzvO8yPAP4FziZo3Oy0itJTZ1Giqnuw
DGfVmjx9l/5Wh5HVtFaZPoP+lVzwNIDYIZ+5bKfsXhema754JsFlNvHD0agdqyWRINs6JiH7C4qe
H2jO/25uRz8drAg3/D+f5gDqV++vakthLJkZ/AUz0ZaIIC4qO1I15g+BBFfHZ6IUHWISB2h2n1PP
TUJjhHCyPA3oJZeyIfKhFOkcAYUXkOxyD16A7zlY+mCeo+mkAwaihOja7RNwmvJctIzOwdK5r2lC
2lUp1juR/2bDzKW7txPkHMEmkLaXfli2KIhG1va+QXEgfyZbniXiWA/G0faYVI9NySMDZL8KMn02
fm0nW8eswLEEXSR4Pf8V24Osh+cR5CRf2aMXNFBCNUIEVWV/GDp9TS6sWXuPXS5k+czUgSOKdFCP
iSKqBBPevd5oFFkRb7X30U/O22LJcStkcAABgdaah0vSRttbCniwdihubOwfuDSRaaTq3jj/8ydF
dSIsevKrS9kRCdhTmeBf8o27uwZ3LstazQIsOoTLKJI01vaDUX+/f6dCzCfWp9m1tWJGUTsLkzOq
Np+pH31NG1wSkg4TE7fpXzDnTqBIGtl3gjPywNX2SVvBIWEJ4EJnUvRDBUE3SEdttX1/beyYJ5sM
pqBM/YU05z3G41nlXICxSxb3sdYInV5ANP6G1V3F+2MuFe/9X33Pn6wpIIlyABpUnj2l1hDxvIEY
TqUvm/K0nvyF1Ijk45lLoUcoA5/JBYOO8IqNe/YMOslCsb2g3geTzd8PgCHnJHoJjRRtYF3T6mOm
pISHG/Yuhk9mJh1VVUDN0wKq/n9aAzRfAmPnbdmJQAAAApuesqx07TAAAY8FgCQAAKelTjaxxGf7
AgAAAAAEWVo=
--000000000000d9f3c505eb3dc3a3
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--000000000000d9f3c505eb3dc3a3--
