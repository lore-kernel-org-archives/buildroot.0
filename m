Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09A62ECAAD3
	for <buildroot@archiver.kernel.org>; Wed, 14 Sep 2022 23:05:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6626060B31;
	Wed, 14 Sep 2022 23:05:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6626060B31
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id atGFiKD4umfP; Wed, 14 Sep 2022 23:04:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7CC5C60A81;
	Wed, 14 Sep 2022 23:04:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7CC5C60A81
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 100221BF59F
 for <buildroot@lists.busybox.net>; Wed, 14 Sep 2022 23:04:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DCFC960A81
 for <buildroot@lists.busybox.net>; Wed, 14 Sep 2022 23:04:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DCFC960A81
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SmdMC-n5QEBO for <buildroot@lists.busybox.net>;
 Wed, 14 Sep 2022 23:04:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D80A160671
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D80A160671
 for <buildroot@buildroot.org>; Wed, 14 Sep 2022 23:04:55 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 j6-20020a17090a694600b00200bba67dadso15804528pjm.5
 for <buildroot@buildroot.org>; Wed, 14 Sep 2022 16:04:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=iERolfkH4LTlL0GXvOfy3TcogV47uaEmwd6HbVwn4BA=;
 b=5yGfLKKLJF514La9d+/nfpTmYP1c57RMDYo//Pka1dKsGoN3AYfMineFprvc28Q1TK
 Yo2fhrm4CQ08oG1mFf+VsfovEvU2rJmGA8JaB7GTDfR3Wkvhm+gujw3f5Fj5gq/LJSEk
 6nhpkCJjg1EDt7185ZZ/Xu8Gm3jL8Js9S6aBx1DMB/AAJwfKtFQ76AJxF+atAf/mcOxt
 94CptuF8VbDA5c31OGc3aqgZhJF54dnmSlmsY/BRhtkhsLh+cnhnkebF5b+23lat6b4u
 Wx8U3zZ2Saau5nMu53J/Qa2EbVD7nyaMwqlyCf30MJc2JEtIAR1xHOYGCUXLpf9FAa3x
 rVJg==
X-Gm-Message-State: ACrzQf0BXS4vnZ6ZybRG8IA1RbH1yLoCy+Ze62+trG9i4F2qgzl3TXAC
 /+LUixEV+BlSAXb84Nyo6rNaQIAkZO1FMXG5RjI=
X-Google-Smtp-Source: AMsMyM6NVs6FEnl+2FXjkggr+p6xfI6jkiWI50y9njW3PFqItwYX2n3vxXXMbt9VNvkUEC8PYsAxm11iCnf8L2BDsdI=
X-Received: by 2002:a17:902:6b82:b0:16d:d268:3842 with SMTP id
 p2-20020a1709026b8200b0016dd2683842mr1358811plk.16.1663196695173; Wed, 14 Sep
 2022 16:04:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220726063400.2321251-1-james.hilliard1@gmail.com>
 <20220726084726.GI3168@scaer>
 <CADvTj4oJCWJ2Pq4US_QAo34sSi_w6LZqt-t=w_v78VvviVfRfg@mail.gmail.com>
 <20220726162818.GM3168@scaer>
 <CADvTj4qD68Ans+OyCopSZoEuxawWKa+pY-a3uGvqZJeLLD6FcA@mail.gmail.com>
In-Reply-To: <CADvTj4qD68Ans+OyCopSZoEuxawWKa+pY-a3uGvqZJeLLD6FcA@mail.gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Wed, 14 Sep 2022 17:04:43 -0600
Message-ID: <CADvTj4pMDmG_bPe5mRwnU3VxaQHbw4RDnmo3-2sQs_xEmUvcmA@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=iERolfkH4LTlL0GXvOfy3TcogV47uaEmwd6HbVwn4BA=;
 b=gVyvNWwPe5Fhotf4o/VBH3eW2OKFq054Gnb7wvWuBtPpyw9RkyYbz6vi9wQs9Xw4+l
 VnQ+xjrbdcuRPEAetl0QW7UKt5R3iBi5ijQowcb4Pjgl8BKKLpfD2GmLkry15mAa7ezI
 46PVZFJzVALUMTtDLutgyvJyzS9BLNhjqOste+fCN4I0+uOm+JHDXGtQRMBmVNlUtlhi
 a+TO47xPgoToU8VQOJ4WFwvOVx3+MXCUiV11Mc7X23mCwdWpuflH3+LNomyzWDWTCgu1
 tqE6VlWAz+LLJIyKWwzVnLG3AsPaN8vRnYH04FwoPb++ykuMrrG1HwS4yF6Ic4qJ0aYD
 T2zg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=gVyvNWwP
Subject: Re: [Buildroot] [PATCH 1/1] package/mesa3d: set cpp_rtti option
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Romain Naour <romain.naour@gmail.com>, buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Tue, Jul 26, 2022 at 11:18 AM James Hilliard
<james.hilliard1@gmail.com> wrote:
>
> On Tue, Jul 26, 2022 at 10:28 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> >
> > James, All,
> >
> > On 2022-07-26 09:31 -0600, James Hilliard spake thusly:
> > > On Tue, Jul 26, 2022 at 2:47 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > > > On 2022-07-26 00:34 -0600, James Hilliard spake thusly:
> > > > > This needs to be set based on BR2_PACKAGE_LLVM_RTTI being set.
> > > > BR2_PACKAGE_LLVM_RTTI is a sub-option of llvm, so it somehow means
> > > > that llvm should be a dependency of mesa3d, which your patch does not
> > > > add.
> > > It's an optional dependency.
> >
> > I know. But how does it make sense to add BR2_PACKAGE_LLVM_RTTI without
> > a dependency on llvm?
> >
> > And note that mesa3d does not use the fact that llvm is enabled, to
> > enable its llvm support; one has to explicitly request it with
> > BR2_PACKAGE_MESA3D_LLVM.
> >
> > > > But we already have a conditional dependency on llvm, so this nex rtti
> > > > option should be a sub-condition of BR2_PACKAGE_MESA3D_LLVM?
> > > Setting -Dcpp_rtti=false when llvm isn't used is harmless, it seemed clearer
> > > to just have the single independent conditional for BR2_PACKAGE_LLVM_RTTI.
> >
> > If you have a configuration with:
> >
> >     BR2_PACKAGE_LLVM=y
> >     BR2_PACKAGE_LLVM_RTTI=y
> >     BR2_PACKAGE_MESA3D=y
> >     # BR2_PACKAGE_MESA3D_LLVM is unset
> >
> > Then llvm support is not built in mesa3d, yet your code would cause us
> > to pass -Dcpp_rtti=true, which does not seem to make sense.
>
> I think I did it this way in case llvm gets pulled in as a transient dependency
> down the line.
>
> I mean -Dcpp_rtti=true is still technically accurate when
> BR2_PACKAGE_LLVM_RTTI=y even if BR2_PACKAGE_MESA3D_LLVM isn't
> set, it's just unused internally by mesa3d in that case I think.
>
> Having it separate from BR2_PACKAGE_MESA3D_LLVM seems to make
> things less likely to break in the event of llvm getting pulled in as
> a transient
> dependency in the future.

Sent a v2 with it under BR2_PACKAGE_MESA3D_LLVM if that's preferable:
https://patchwork.ozlabs.org/project/buildroot/patch/20220914230334.4001572-1-james.hilliard1@gmail.com/

>
> >
> > So, I think we want that to move to the existing condition, like so:
> >
> >     diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
> >     index 96520e2efd..980faced31 100644
> >     --- a/package/mesa3d/mesa3d.mk
> >     +++ b/package/mesa3d/mesa3d.mk
> >     @@ -48,6 +48,11 @@ ifeq ($(BR2_PACKAGE_MESA3D_LLVM),y)
> >      MESA3D_DEPENDENCIES += host-llvm llvm
> >      MESA3D_MESON_EXTRA_BINARIES += llvm-config='$(STAGING_DIR)/usr/bin/llvm-config'
> >      MESA3D_CONF_OPTS += -Dllvm=enabled
> >     +ifeq ($(BR2_PACKAGE_LLVM_RTTI),y)
> >     +MESA3D_CONF_OPTS += -Dcpp_rtti=true
> >     +else
> >     +MESA3D_CONF_OPTS += -Dcpp_rtti=false
> >     +endif
> >      else
> >      # Avoid automatic search of llvm-config
> >      MESA3D_CONF_OPTS += -Dllvm=disabled
> >
> > Regards,
> > Yann E. MORIN.
> >
> > --
> > .-----------------.--------------------.------------------.--------------------.
> > |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> > | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> > | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> > | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> > '------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
