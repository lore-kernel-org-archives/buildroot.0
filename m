Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E016C43334
	for <buildroot@archiver.kernel.org>; Mon, 25 Jul 2022 18:52:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1DA5A61241;
	Mon, 25 Jul 2022 18:52:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1DA5A61241
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7-EGnTBztMYg; Mon, 25 Jul 2022 18:52:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 172A560E4E;
	Mon, 25 Jul 2022 18:52:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 172A560E4E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 94E4D1BF380
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 18:52:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6DE9740588
 for <buildroot@lists.busybox.net>; Mon, 25 Jul 2022 18:52:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6DE9740588
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mGtYsTTicoLi for <buildroot@lists.busybox.net>;
 Mon, 25 Jul 2022 18:52:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C4B4A4026F
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com
 [IPv6:2607:f8b0:4864:20::22d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C4B4A4026F
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 18:52:47 +0000 (UTC)
Received: by mail-oi1-x22d.google.com with SMTP id u76so14589734oie.3
 for <buildroot@buildroot.org>; Mon, 25 Jul 2022 11:52:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YZ03n/7aUhnjaCWwpRj95dQYLeyCAVvOo9aLD94Iarw=;
 b=NXRPmRQb1/jiC0lfe+KuJixFDUUQFlLS8F/ahbNEjePXY5BT1zL9Lc0/eHX8eRUpks
 15Sa27QoA8KKbZXzq8h9/H+YioHvPcxgd/sJ7cYzYTqz5p1tRVzjG7lkUT7qTSUNr/Fg
 H59ICh9nK9T1AlOyBq1QfXVt16q+KCdsbftX49Jh6MFR3OGM4EnF496lh/dCC8oK6Bfu
 YwoMUomCNoAs9OybCdEQESyfXQRePzg7iQi7aUJIkjgZtF5RQGVT9+AhX3SpQJgHvtcl
 HzoNtWQ4SiVcdZALJth0CJ4Lyt/wW/Uq0NMy8XlUOPepntb69bkeDWRq9xiofJxxRcH6
 z3CQ==
X-Gm-Message-State: AJIora+afGArrw14u51AAm9Ua0cf3zGXVL9e9H8q0sKSQcUgCyIZGn7d
 YgobcatuwbpenzibPTib3hZDXC4hhQH5J0xwhtXuJgdChhw=
X-Google-Smtp-Source: AGRyM1tdTV8e/zIrPtiY15rUfEbxXDsm7Su2CJxACAm28CPkOxgBs+yuM4Fg7fH3VG2fsdkSu4kSjBfzxBxHJnYqWbA=
X-Received: by 2002:a54:488d:0:b0:33a:87b3:31a with SMTP id
 r13-20020a54488d000000b0033a87b3031amr13644867oic.153.1658775165384; Mon, 25
 Jul 2022 11:52:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220109084732.2567404-1-james.hilliard1@gmail.com>
 <20220725132757.GE3168@scaer>
In-Reply-To: <20220725132757.GE3168@scaer>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Mon, 25 Jul 2022 12:52:34 -0600
Message-ID: <CADvTj4rk2EaqeHyxW_VQKpSHCxygfgrZZzQEFdcUumLOPsQMOw@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=YZ03n/7aUhnjaCWwpRj95dQYLeyCAVvOo9aLD94Iarw=;
 b=UalV02epOOjSkym2tn142mVmLsigjcTC7x1hi/AxjFnG29QbdOMEVUqEfdssgkc1Q2
 xKmOylAMSTG4oBFXSvHxdzItYlfVOCx3Trhy43qhCQnzw7cQH6p4enzS1sd47p0GoLNI
 iuXqajWIUSqt3yzzAgQH05QVMv+DfnfaRsZNKwiDGow/shqKprmE2POo0NOAmaPSFoY2
 ovdOHJuZf82dcf50UhmmASFVjGyvG6PQSxWOZkVRmAIoaY9+sUFRONXGAptEH9R/nKFm
 oHUE6Kh3eZvScfh410UAQ8X+xxgDhOuN/O/K/z4G9iy2FJjtvAIdMWEZc0MIjRufeuGM
 ub5w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=UalV02ep
Subject: Re: [Buildroot] [PATCH 1/1] package/pkg-cargo.mk: enable -Z
 target-applies-to-host via env
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, Jul 25, 2022 at 7:28 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> James, All,
>
> Resurecting this old patch that was applied, but I have a question about
> it, see below...
>
> On 2022-01-09 01:47 -0700, James Hilliard spake thusly:
> > This should be more reliable and fix the host == target bug when
> > doing indirect invocations using the cargo env.
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >  package/pkg-cargo.mk | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/package/pkg-cargo.mk b/package/pkg-cargo.mk
> > index 47ae86bfae..b6cb65c4f0 100644
> > --- a/package/pkg-cargo.mk
> > +++ b/package/pkg-cargo.mk
> > @@ -27,6 +27,7 @@
> >  PKG_CARGO_ENV = \
> >       CARGO_HOME=$(HOST_DIR)/share/cargo \
> >       __CARGO_TEST_CHANNEL_OVERRIDE_DO_NOT_USE_THIS="nightly" \
> > +     CARGO_UNSTABLE_TARGET_APPLIES_TO_HOST="true" \
> >       CARGO_TARGET_APPLIES_TO_HOST="false"
> >
> >  ################################################################################
> > @@ -88,7 +89,6 @@ define $(2)_BUILD_CMDS
> >                       $$(if $$(BR2_ENABLE_DEBUG),--debug,--release) \
> >                       --manifest-path Cargo.toml \
> >                       --locked \
> > -                     -Z target-applies-to-host \
>
> Did you forget to remove it from the _INSTALL_TARGET_CMDS?

Yeah, looks like it.

>
> Regards,
> Yann E. MORIN.
>
> >                       $$($(2)_CARGO_BUILD_OPTS)
> >  endef
> >  else # ifeq ($(4),target)
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
