Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB50FC4332F
	for <buildroot@archiver.kernel.org>; Mon, 17 Oct 2022 12:12:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D9104170A;
	Mon, 17 Oct 2022 12:12:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D9104170A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IKGn9U0SI8pT; Mon, 17 Oct 2022 12:12:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4058F416FA;
	Mon, 17 Oct 2022 12:12:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4058F416FA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D4BF01BF3DE
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 12:12:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BDCBC60D57
 for <buildroot@lists.busybox.net>; Mon, 17 Oct 2022 12:12:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BDCBC60D57
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NhbB4ySR-m77 for <buildroot@lists.busybox.net>;
 Mon, 17 Oct 2022 12:12:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED28F60D4D
Received: from mail-qv1-xf33.google.com (mail-qv1-xf33.google.com
 [IPv6:2607:f8b0:4864:20::f33])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ED28F60D4D
 for <buildroot@buildroot.org>; Mon, 17 Oct 2022 12:12:14 +0000 (UTC)
Received: by mail-qv1-xf33.google.com with SMTP id mx8so7248813qvb.8
 for <buildroot@buildroot.org>; Mon, 17 Oct 2022 05:12:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dRpsV4QbUoFKca2/W0zAyTwjc9giHp2v0p6rUsCdbt8=;
 b=0PmjjJlvmGJAlyKqfPe4ZlLvRsKQBOqC16mI1Fyisgmm5REnTOUcHABUDi6e3g7SGq
 8CL+gBdOw1ju0I50xnnEkf7uy7kBkzfGlqFqKbthbpM8froRW+evdiCkFWySU8OaUqm/
 Es8paEM17U/uXvbbppKkR2NaZ/yc17IG3fhBGxo59DguY0aQcOpY6JG2GauA2YzAWsoM
 nDdO3ZQsZ4c3yG4fR781b6yUNcjhAfVvYI40yLTXYRY/OAHMQ4Hq/J+v2scnkHVS4fcB
 nsWnJ4gQgrs9vf1HRnaGWPFw1qqDiuFMb5ceU4vCEJ8uNfHB/aIylMLeLLqyWX6LUNWk
 08xw==
X-Gm-Message-State: ACrzQf0LHovSvHHg3v6cqw5I6PvFGVGrDIMTnFT/JmuLiHTq7q+bT+u1
 Gy49iPM3JK/s82M7cbcqaCxfH5G7DhoY0bWd9Wo=
X-Google-Smtp-Source: AMsMyM6JDGVO6xs/4EqUcg5J/6MTI4qEhx95OT+19/3ivgQvyKmvXaFnVzR089kj74G2BNPzQGaznuvPKzyXNoIoNpA=
X-Received: by 2002:a05:6214:21ab:b0:4b4:6dc:b94e with SMTP id
 t11-20020a05621421ab00b004b406dcb94emr7733994qvc.107.1666008733635; Mon, 17
 Oct 2022 05:12:13 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1665868987.git.yann.morin.1998@free.fr>
In-Reply-To: <cover.1665868987.git.yann.morin.1998@free.fr>
From: Norbert Lange <nolange79@gmail.com>
Date: Mon, 17 Oct 2022 14:12:02 +0200
Message-ID: <CADYdroMmvaBpSbVkrc+Eu7KtkBt1m7Zqeu4mO6a2UZp+a1Hjrw@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: multipart/mixed; boundary="000000000000c3223505eb39e222"
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dRpsV4QbUoFKca2/W0zAyTwjc9giHp2v0p6rUsCdbt8=;
 b=W4hzJq+G75EZBEpafbbEz9zLDgor6Gf1mN6256UpoN6bp9BbdZcfS8IXWB6W33WotB
 VjAuIl3TsrWiv4BaOkdoBMXwsSI/HikFMAYL2UIK5v8CKKhqVVPf+eLlKmoJKFwtJtOX
 KajRPpNUs3EzBsuZpPJ1fMdpiEb3Lf51EmeN6odZ+vgDtDUCdsW9cqDWL6WgPMDZpXdl
 DjOjU0aSUuuN5g0et4yy1KxJngQfUD/g8EDD9bfozJUC4nXfGnNhSY3eQQdjUJ+O+SCk
 7b98rdClwxM3h2pqGtYYVDyrwarSnTYtH34KvR6ttwasTcRsdeMDjhgal3pDONgOCsRx
 i84w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=W4hzJq+G
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
Cc: =?UTF-8?B?SmXMgXJlzIFteSBSb3Nlbg==?= <jeremy.rosen@smile.fr>,
 Romain Naour <romain.naour@smile.fr>, "Yann E . MORIN" <yann.morin@orange.com>,
 buildroot@buildroot.org
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--000000000000c3223505eb39e222
Content-Type: text/plain; charset="UTF-8"

Hi,

Am Sa., 15. Okt. 2022 um 23:23 Uhr schrieb Yann E. MORIN
<yann.morin.1998@free.fr>:
>
> Hello All!
>
> This small four-patch series touches on the delicate intricacies of the
> systemd package and how we integrate it in Buildroot, especially with
> regard to read-only filesystems.
>
> The underlying issue is that systemd wants a writable /var filesystem
> (it will store a bunch of things at runtime in there). A lot of packages
> also expect a writable /var. After all, var stands for variadic, so it
> is not supposed to be set in stone and read-only.

Nobody says var should be read-only, the argument is about
doing work up-front. Which is enough to get alot
things running even *if* its read-only.

> The solution we implemented in Buildroot is to generate a factory for
> /var, and register that as tmpfiles, at build time, and mount a tmpfs on
> the then-empty /var at runtime, so that systemd-tmpfiles populates /var
> on boot. Having a tmpfs means /var is repopulated from a clean state at
> each boot, and people who want a persistent /var have to provide their
> own mechanism to mount their actual filesystem instead.

Here the issue is, that the logic will never be complete, I will
have to dig up old threads, but it fails with various combinations
of symlinks.

Its an inherently fragile approach, and I would question the solution as whole.

> However, for some people, this does not seem to work as expected, so we
> introduced a call to systemd-tmpfiles at build time, to pre-populate the
> rootfs from all the tmpfiles, of which our var factory, at build time.

There are several usecases where this is atleast non-optimal,
and for a default to mess with the filesystem in such a way is
not a good foundation.

I am not sure if I am up-to-date, but the original call during
the fakeroot stage you just do the work that wouldve been
done on first boot.

>
> These two mechanism clash with each others, and are mostly incompatible,
> and causes files to be duplicated.

One of them doesn't do anything than a regular system start,
the other is likely to cause trouble, trying to fix packages
that wont work with an empty var in an automatic way.

>
> To solve the issue, this series introduces new options, so the user can
> elect to use either, none, or both mechanisms, as they see fit.
>
> The first steps are borrowed from Yann@work, where we make it easier to
> change the location where /var is nounted from, by making it a systemd
> mount unit, rather than use the legacy fstab, and move the factory to
> /usr/share as it is a system factory (/etc is for the administartor to
> provide overrides). Note that those two are not strictly required for
> the following, but since that makes it easier to change the /var
> filesystem in a systemd-compliant manner, they are a nice addition to
> the series.
>
> Then we move together the two mechanisms under the auspices of a common
> package, to make it easier to later make them conditional.
>
> Finally, we introduce those two new options, that drive each mechanism.
>
> Eventally, we want to highlight that, by default, the behaviour has not
> changed, since the two new options default to y, so as to explicitly
> keep the behaviour from nefore this patchset.

I would prefer a  robust solution that provides a filesystem image
that is compatible with further tinkering, particularly mounting /var
in the initramfs.

I attacked a drop-in solution, that has none of the drawbacks,
correctly works with mounting stuff in /var,
and only requires overlayfs to be available in the kernel.

Funny detail: together with the upfront creation
of some directories in /var via the systemd-tmpfiles build-time call,
a basic usable system is available even if the overlay fails.

The recurring attempts to discuss this ended in [1].

Short on time nowadays so I can hardly pull together all relevant parts again.

regards, Norbert

>
> Regards,
> Yann E. MORIN.
>
>
> ----------------------------------------------------------------
> Yann E. MORIN (4):
>       package/skeleton-systemd: move /var factory out of /etc
>       package/skeleton-systemd: systemd-ify mounting /var tmpfs with ro rootfs
>       package/skeleton-systemd: host the tmpfiles preparation script
>       system: add options for var factory and tmpfiles pre-seed
>
>  .../fakeroot_tmpfiles.sh                           |  0
>  .../skeleton-init-systemd/skeleton-init-systemd.mk | 18 +++++++---
>  package/skeleton-init-systemd/var.mount            | 18 ++++++++++
>  package/systemd/systemd.mk                         |  6 ----
>  system/Config.in                                   | 38 +++++++++++++++++++++-
>  5 files changed, 69 insertions(+), 11 deletions(-)
>  rename package/{systemd => skeleton-init-systemd}/fakeroot_tmpfiles.sh (100%)
>  create mode 100644 package/skeleton-init-systemd/var.mount
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'

[1] - https://lists.buildroot.org/pipermail/buildroot/2022-July/645680.html

--000000000000c3223505eb39e222
Content-Type: application/x-xz; name="overlay_var.tar.xz"
Content-Disposition: attachment; filename="overlay_var.tar.xz"
Content-Transfer-Encoding: base64
Content-ID: <f_l9cq9e8h0>
X-Attachment-Id: f_l9cq9e8h0

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
--000000000000c3223505eb39e222
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--000000000000c3223505eb39e222--
