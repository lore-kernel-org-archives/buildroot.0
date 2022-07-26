Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE753C00140
	for <buildroot@archiver.kernel.org>; Tue, 26 Jul 2022 16:28:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3E8784119D;
	Tue, 26 Jul 2022 16:28:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3E8784119D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PwGWIiiGx-Y3; Tue, 26 Jul 2022 16:28:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 37FFB40612;
	Tue, 26 Jul 2022 16:28:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 37FFB40612
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 385571BF3D9
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 16:28:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 11C2960A93
 for <buildroot@lists.busybox.net>; Tue, 26 Jul 2022 16:28:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 11C2960A93
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N0SBY4VxERXD for <buildroot@lists.busybox.net>;
 Tue, 26 Jul 2022 16:28:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 15298600B4
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 15298600B4
 for <buildroot@buildroot.org>; Tue, 26 Jul 2022 16:28:26 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9946:e64:fb26:3d99])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id B8A5F780521;
 Tue, 26 Jul 2022 18:28:18 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 26 Jul 2022 18:28:18 +0200
Date: Tue, 26 Jul 2022 18:28:18 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220726162818.GM3168@scaer>
References: <20220726063400.2321251-1-james.hilliard1@gmail.com>
 <20220726084726.GI3168@scaer>
 <CADvTj4oJCWJ2Pq4US_QAo34sSi_w6LZqt-t=w_v78VvviVfRfg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADvTj4oJCWJ2Pq4US_QAo34sSi_w6LZqt-t=w_v78VvviVfRfg@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1658852903;
 bh=0UdReEhS9qU6K70NrGnJkE+ECRpVyI7S6dkxxUG7wHw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lIMP+3rYveECYD5rl+I3RP4hr492PWD6G5v95+4t8GEkAgh57jXtHfK4it9EzVk72
 8asyeMu9sXZ6XDAqQclZGGe/vTf4RQk4RFp79M0q5kM0tmmQUvdWQZLn+K+g2x3MY8
 DZn84QHx8+OUAhGEhdn6TmgDM3b9Ctwh1o7R1CPp8T/aQEVWvZE0Tx2g2oq1GGpkVG
 r5o1UR8ix2nnKVTGlVrs/NitUEp1Dm0YnUchOaHkM5exoe32KbVhA9T2juqKVk3QMI
 RvRHe7g9gRADXFEgtctBG7aXK+KVowF1IpgD0yaGBi+mBurBW/6wegaAlrYruKK+P+
 ODiLtmKH7Lpog==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=lIMP+3rY
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

James, All,

On 2022-07-26 09:31 -0600, James Hilliard spake thusly:
> On Tue, Jul 26, 2022 at 2:47 AM Yann E. MORIN <yann.morin.1998@free.fr> wrote:
> > On 2022-07-26 00:34 -0600, James Hilliard spake thusly:
> > > This needs to be set based on BR2_PACKAGE_LLVM_RTTI being set.
> > BR2_PACKAGE_LLVM_RTTI is a sub-option of llvm, so it somehow means
> > that llvm should be a dependency of mesa3d, which your patch does not
> > add.
> It's an optional dependency.

I know. But how does it make sense to add BR2_PACKAGE_LLVM_RTTI without
a dependency on llvm?

And note that mesa3d does not use the fact that llvm is enabled, to
enable its llvm support; one has to explicitly request it with
BR2_PACKAGE_MESA3D_LLVM.

> > But we already have a conditional dependency on llvm, so this nex rtti
> > option should be a sub-condition of BR2_PACKAGE_MESA3D_LLVM?
> Setting -Dcpp_rtti=false when llvm isn't used is harmless, it seemed clearer
> to just have the single independent conditional for BR2_PACKAGE_LLVM_RTTI.

If you have a configuration with:

    BR2_PACKAGE_LLVM=y
    BR2_PACKAGE_LLVM_RTTI=y
    BR2_PACKAGE_MESA3D=y
    # BR2_PACKAGE_MESA3D_LLVM is unset

Then llvm support is not built in mesa3d, yet your code would cause us
to pass -Dcpp_rtti=true, which does not seem to make sense.

So, I think we want that to move to the existing condition, like so:

    diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
    index 96520e2efd..980faced31 100644
    --- a/package/mesa3d/mesa3d.mk
    +++ b/package/mesa3d/mesa3d.mk
    @@ -48,6 +48,11 @@ ifeq ($(BR2_PACKAGE_MESA3D_LLVM),y)
     MESA3D_DEPENDENCIES += host-llvm llvm
     MESA3D_MESON_EXTRA_BINARIES += llvm-config='$(STAGING_DIR)/usr/bin/llvm-config'
     MESA3D_CONF_OPTS += -Dllvm=enabled
    +ifeq ($(BR2_PACKAGE_LLVM_RTTI),y)
    +MESA3D_CONF_OPTS += -Dcpp_rtti=true
    +else
    +MESA3D_CONF_OPTS += -Dcpp_rtti=false
    +endif
     else
     # Avoid automatic search of llvm-config
     MESA3D_CONF_OPTS += -Dllvm=disabled

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
