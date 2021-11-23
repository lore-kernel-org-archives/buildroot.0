Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C9BBC433EF
	for <buildroot@archiver.kernel.org>; Tue, 23 Nov 2021 19:17:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 940E24037C;
	Tue, 23 Nov 2021 19:17:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6FFzW3hICv4Q; Tue, 23 Nov 2021 19:17:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 78D1440374;
	Tue, 23 Nov 2021 19:17:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0724D1BF30C
 for <buildroot@lists.busybox.net>; Tue, 23 Nov 2021 19:17:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 00A88402FA
 for <buildroot@lists.busybox.net>; Tue, 23 Nov 2021 19:17:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G3Xx-3qS1U6W for <buildroot@lists.busybox.net>;
 Tue, 23 Nov 2021 19:17:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 29E8E402D3
 for <buildroot@buildroot.org>; Tue, 23 Nov 2021 19:17:26 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 35-20020a9d08a6000000b00579cd5e605eso507377otf.0
 for <buildroot@buildroot.org>; Tue, 23 Nov 2021 11:17:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=EaNExUAJZFXUxV3T6yty5YRh1TP6CcdI7BXzHpTTikA=;
 b=EPo4sgCD8DwKTl4RvxEGU3vPJ90uQbP6oo3tGYDZT7YEFikD2AJIZBOFY8VfkqVz0M
 xUte+7u8EFyn+is8R7ZLpAXlECy5xmI7hkftnxN8HpCMMxbOZ30nGrS41UY2NsVkUQYG
 TTQ/OCuGXPyQAEBzeED3a+XkgvPSOshTafpyqkhg7COBHZ+dCxXHVXYIZ5PCD0OkWomm
 +gNhS66LO3ImntWF4lsGWT5CtakkwylOuEpqL/xiCQ7u3w+3QQJvu9vXVMBYBQkbvxuU
 GG23oQIkf//NS5hx7ustzsxbpwcO659h1xicEkm6U6SPJndkYIdY8x59NKWyAmVwwLly
 v8ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EaNExUAJZFXUxV3T6yty5YRh1TP6CcdI7BXzHpTTikA=;
 b=FNzT6reHlZ7b00rIghyTpkZhhiSx0+LDKRSzTpONZtsb+LiL8jKJdzmZZ/GtdYgl9e
 fxTNXvpis0bwABmxGOnOHAMBtdC6jAjfs5hguQiCYejvnp5Z7APZ8p0rRcpPQ/ItJ4WF
 5GQcwel45xmWezCm5jtCT3M+TtQi4yr1lrc81PTr7j9BbIAo7xh5kEcmXq2bib6VehHa
 kIuHkU+psVye2XUI+OhmAuutDAgYpVnwEVIPA0Y/O8poctD391T4HngaWyy7Knv0w+bF
 Ke6Es3bp79aBBWEZtG40SaJ3Y6R2vI0M7AgZ4oywkAtmbI1hi57roaHXyp0/kbDhLSWi
 GcUQ==
X-Gm-Message-State: AOAM531cCehi+WxQiOOtpXcxr6LFmtvKTi7o7Z0hSc1k98WdYU4DHiMx
 fE3NbRJmhkc8TBmdFnhjfJzFtxktNJ9VGKZpWiE=
X-Google-Smtp-Source: ABdhPJxi+wKLlFCJVn6fXtvmS+SrYPcEl0ndfU9Gk18cmfM2Lg1eqnVmNkNcaEO96W7X96kXjaPmCpj+fz55eJia2to=
X-Received: by 2002:a05:6830:1681:: with SMTP id
 k1mr7058071otr.242.1637695045022; 
 Tue, 23 Nov 2021 11:17:25 -0800 (PST)
MIME-Version: 1.0
References: <20211104003607.2022984-1-aduskett@gmail.com>
 <1ac1eba2-b623-b962-fc24-f17a76495e41@mind.be>
In-Reply-To: <1ac1eba2-b623-b962-fc24-f17a76495e41@mind.be>
From: Adam Duskett <aduskett@gmail.com>
Date: Tue, 23 Nov 2021 11:17:14 -0800
Message-ID: <CAFSsvmqku1TN9TE96PHEzgV0S=XDN_h1NipV9bAWbjVY_SScAQ@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Subject: Re: [Buildroot] [PATCH vRFC 0/4] package/midori: bump to version 9.0
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Adrian Perez de Castro <aperez@igalia.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Wow, I didn't expect it to be pretty much perfect! That's fantastic!
Thank you so much! And yes, I will be checking the autobuilders
for failures!

Adam

On Mon, Nov 22, 2021 at 3:11 PM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>
> On 04/11/2021 01:36, Adam Duskett wrote:
> > This is a huge update that took me a few weeks of playing around with
> > to get going.
> >
> > Heres the tldr version:
> >    - Midori now lives at https://github.com/midori-browser/core
> >    - The latest version builds with host-python3
> >    - libpeas is a requirement of midori 9.0
> >    - webkitgtk has to be compiled with introspection support
> >    - gcr and it's ui plugin is no longer optional
> >    - gcr ui also works with wayland and x11
> >
> > I tested this with test-pkg -a
> > 45 builds, 38 skipped, 0 build failed, 0 legal-info failed
> >
> > It's huge, it's complicated, and it needs review.
>
>   Although I did spend quit a bit of time on it, it was pretty much perfect :-)
>
>   You're not in DEVELOPERS for any of these packages, so I guess you'll be
> monitoring the autobuilders by hand for the coming month or so?
>
>   Regards,
>   Arnout
>
> >
> > You're welcome ;)
> >
> > Adam
> >
> > Adam Duskett (4):
> >    package/gcr/gcr.mk: enable gtk backend for wayland
> >    package/webkitgtk: add gobject-introspection optional dependency
> >    package/libpeas: new package
> >    package/midori: bump to version 9.0
> >
> >   package/Config.in                             |  3 +-
> >   package/gcr/gcr.mk                            |  4 +-
> >   package/libpeas/Config.in                     | 45 ++++++++++++++++++
> >   package/libpeas/libpeas.hash                  |  4 ++
> >   package/libpeas/libpeas.mk                    | 38 +++++++++++++++
> >   .../0001-disable-vala-fatal-warnings.patch    | 30 ++++++++++++
> >   package/midori/0001-fix-bug-1492932.patch     | 44 ------------------
> >   ...ion-to-specify-path-to-g-ir-compiler.patch | 37 +++++++++++++++
> >   package/midori/0002-gcr-for-x11-only.patch    | 32 -------------
> >   package/midori/Config.in                      | 46 ++++++++++++++-----
> >   package/midori/midori.hash                    |  4 +-
> >   package/midori/midori.mk                      | 19 ++++----
> >   package/webkitgtk/webkitgtk.mk                |  8 +++-
> >   13 files changed, 210 insertions(+), 104 deletions(-)
> >   create mode 100644 package/libpeas/Config.in
> >   create mode 100644 package/libpeas/libpeas.hash
> >   create mode 100644 package/libpeas/libpeas.mk
> >   create mode 100644 package/midori/0001-disable-vala-fatal-warnings.patch
> >   delete mode 100644 package/midori/0001-fix-bug-1492932.patch
> >   create mode 100644 package/midori/0002-add-option-to-specify-path-to-g-ir-compiler.patch
> >   delete mode 100644 package/midori/0002-gcr-for-x11-only.patch
> >
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
