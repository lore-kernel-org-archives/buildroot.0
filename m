Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF925C433EF
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 20:38:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7FB5B60BB7;
	Sun,  9 Jan 2022 20:38:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dsJKoxZjp_i3; Sun,  9 Jan 2022 20:38:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B8DAE60BB5;
	Sun,  9 Jan 2022 20:38:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 08B4D1BF44C
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 20:38:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E920681959
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 20:38:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MWj0fKVz-i3r for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 20:38:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E816281A39
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 20:38:06 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id x6so37297694lfa.5
 for <buildroot@buildroot.org>; Sun, 09 Jan 2022 12:38:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6BrTakAgPI+YbnLCcXqCt0ZHaNosPETMz9dNed+FhBA=;
 b=YCX0OxhTYgELa0XNgUpIsWxqK8SrlPTSFw6zsJk3TjWmpurFe3Li0o4Ku+N9ic0USf
 /SKS4mUjub/zJHu0RpUR8GCaokNg9eS2GsNfGG6FuQRntfpiU8Cj+GqJcWyIkVMQxZa9
 YeF7tvb+TD5ujfDHKljqn0XG4zypcipQQrtHIrlLvy7yyq5wgehzetvY7TM52n8mOJiH
 QI+zQPoxlD1x7KDHc1a2SCh1Habk4BZmVMil/vw2Slv5TzhHhjRWRsnY/8kHzi9xD5tl
 sTTBAGfuNPuXw5NiHTmti6e4kBq8HwXthSakQj7z9MmuI5xgF+3xWvvEya9pTT6Bsirq
 4lWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6BrTakAgPI+YbnLCcXqCt0ZHaNosPETMz9dNed+FhBA=;
 b=FwNFqdRpp+6apl/OSVXclp/hXacpkuP5zw6r8r+4sxxCjaKcqe9g4XyKxOL3IZ0vOD
 Fa1FWiLpBA38AykSARygEFTF0KfbvrL4arB32GDWq6ZlY/8oXH63Xlo19FmD7CoDDiIW
 6/Vrc1WmjY5hQ9Dr/BtlqmV1SZoIQHRHLGSTbseNV01U26xdB81nb166wE07N3iLpnqO
 N2DbUXH6omsKxUhvDnbhFQLjwGbM9yI7LowASSNx2rcM1DnVEwb/ckYjivVp2Eqptq02
 12mHJ4DT4dXNBlkiYix5nyibUKtIteLOQLOSOuYQkuPywNzIHQQaVtM1Vl5Rs93nkEyR
 cK2A==
X-Gm-Message-State: AOAM533NHU1fX+sjtpxw3Ij996Jeb1W8EvIv8T6s9k1w2xVn/Un5sfJ3
 j254oJGIKxax38nmPKEXA9B98kISaBFH8IeIUIZ+fUoR
X-Google-Smtp-Source: ABdhPJy+1Izkb/RFFVqecZPBqF0/MzcKcohNGd3GUL7KA+YtiTE4bZTIYbPw5bU8qK/WOsyn2Yp261/X3LEwZR7aPGc=
X-Received: by 2002:a19:7416:: with SMTP id v22mr4616153lfe.595.1641760684680; 
 Sun, 09 Jan 2022 12:38:04 -0800 (PST)
MIME-Version: 1.0
References: <20211203223127.274985-1-nolange79@gmail.com>
 <20211203223127.274985-3-nolange79@gmail.com>
 <f704eca2-7e54-8a37-d261-bdb655a2c31c@mind.be>
In-Reply-To: <f704eca2-7e54-8a37-d261-bdb655a2c31c@mind.be>
From: Norbert Lange <nolange79@gmail.com>
Date: Sun, 9 Jan 2022 21:37:53 +0100
Message-ID: <CADYdroObYomucx13RWtjFQrD608b+6ruNMhMNAox0u3tK+108A@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Subject: Re: [Buildroot] [PATCH v2 3/4] package/systemd: adopt odering in
 nsswitch to newer versions
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
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am So., 9. Jan. 2022 um 13:55 Uhr schrieb Arnout Vandecappelle <arnout@mind.be>:
>
>
>
> On 03/12/2021 23:31, Norbert Lange wrote:
> > This modifies the order of the nss modules, reflecting the current
> > state of the documentation.
> >
> > nss-mymachines lost support for resolution of users and groups,
> > and now only does resolution of hostnames. Changed in v246.
> >
> > Multiple changes in regards to nss-myhostname now recommend placement
> > after nss-files and before nss-dns. See commits ce266330, f918c67.
> >
> > nss-resolve handles the nss-files logic itself, and its suggested to
> > move in front of nss-files. Changed in v249.
> >
> > Signed-off-by: Norbert Lange <nolange79@gmail.com>
>
>   This patch was superseded by [1], which is marked as v2 just like this patch.
> I hope you understand that this is a little confusing for the maintainers (or
> for anyone reviewing it).

Yeah sorry, still got my troubles with the mailing list conventions.

>
>   If you want to make life easier for use, please:
>
> - Re-post the entire series when one patch changes.
>
> - Make sure you include a patch changelog (you do that, I'm just saying it here
> for completeness). Patches which haven't changed can have a "No changes"
> version, but personally I don't care too much about that (it's implied by the
> fact that there is a patch changelog but this particular version is not
> included). That saves a bit of time during the rebase since you don't have to
> reword every commit.

ok, so far I thought I should not change the version unless the commit changed.

>
> - Mark the old series as Superseded in patchwork. When you create an account,
> you can always update your own patches.
>
>   I applied the series (including the [1]) to master. There's one comment I'll
> post separately.
>
>   Regards,
>   Arnout
>
> [1]
> https://patchwork.ozlabs.org/project/buildroot/patch/20211203230919.683527-1-nolange79@gmail.com/
>
>
>
> > ---
> >   package/systemd/systemd.mk | 8 +++-----
> >   1 file changed, 3 insertions(+), 5 deletions(-)
> >
> > diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
> > index 373e5c82bb..16202d4ac9 100644
> > --- a/package/systemd/systemd.mk
> > +++ b/package/systemd/systemd.mk
> > @@ -563,13 +563,11 @@ define SYSTEMD_INSTALL_NSSCONFIG_HOOK
> >               -e '/^gshadow:/ {/systemd/! s/$$/ systemd/}' \
> >               $(if $(BR2_PACKAGE_SYSTEMD_RESOLVED), \
> >                       -e '/^hosts:/ s/[[:space:]]*mymachines//' \
> > -                     -e '/^hosts:/ {/resolve/! s/files/files resolve [!UNAVAIL=return]/}' ) \
> > +                     -e '/^hosts:/ {/resolve/! s/files/resolve [!UNAVAIL=return] files/}' ) \
> >               $(if $(BR2_PACKAGE_SYSTEMD_MYHOSTNAME), \
> > -                     -e '/^hosts:/ {/myhostname/! s/$$/ myhostname/}' ) \
> > +                     -e '/^hosts:/ {/myhostname/! s/files/files myhostname/}' ) \
> >               $(if $(BR2_PACKAGE_SYSTEMD_MACHINED), \
> > -                     -e '/^passwd:/ {/mymachines/! s/files/files mymachines/}' \
> > -                     -e '/^group:/ {/mymachines/! s/files/files [SUCCESS=merge] mymachines/}' \
> > -                     -e '/^hosts:/ {/mymachines/! s/files/files mymachines/}' ) \
> > +                     -e '/^hosts:/ {/mymachines/! s/^\(hosts:[[:space:]]*\)/\1 mymachines/}' ) \
> >               $(TARGET_DIR)/etc/nsswitch.conf
> >   endef
> >
> >
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
