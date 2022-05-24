Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53A6FC4321E
	for <buildroot@archiver.kernel.org>; Tue, 24 May 2022 19:01:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D1644167A;
	Tue, 24 May 2022 19:01:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PSF6ZWy2UrrC; Tue, 24 May 2022 19:01:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 53EDE415D6;
	Tue, 24 May 2022 19:01:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 75D5A1BF977
 for <buildroot@lists.busybox.net>; Tue, 24 May 2022 19:01:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 62FBC415D6
 for <buildroot@lists.busybox.net>; Tue, 24 May 2022 19:01:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dnUC_BR0pc87 for <buildroot@lists.busybox.net>;
 Tue, 24 May 2022 19:01:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A806C415D2
 for <buildroot@buildroot.org>; Tue, 24 May 2022 19:01:46 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:6823:fe26:3f6d:8e17])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 045CD5FF9A;
 Tue, 24 May 2022 21:01:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1653418903;
 bh=FmsNr4xlNwf5lEMl1vwpar6b3GEpaeOIINPbgZ7Ss5c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=A4TWwqpy5XHjUAV1+D/csBOpevvQDmNWWSYPycxhATjv4+EMNtvivZqZR3culYL7h
 jGsC9quvv5wSYRe8v7lP4zOl/9dR7qhXBIk6e09GhpOI9khwsC60VTNI7NjcqTMsHB
 l3J/VAxqGhtyPE4BuPf3wkfmA/1XncqjcXA6HAtYjS62+Eee0G8YwiViDPmPtnjjBN
 R31Bato3kkKhgKJohcXCW89VdNqiXrV1a5k6MKwdO3WemadNO5D/x/4eqqem6f7ELd
 9ARkmO/meXEM5tYD+mxzZMXLKVWubdNYUg3hZHUUQClma6jGxjXCa4shdSB+RBPZ3x
 mCn+DAgn2vdxw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 24 May 2022 21:01:38 +0200
Date: Tue, 24 May 2022 21:01:38 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220524190138.GB2500@scaer>
References: <20220514222811.3925140-1-james.hilliard1@gmail.com>
 <5a0bb1b8-b671-e85b-1942-3b17f31f0547@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5a0bb1b8-b671-e85b-1942-3b17f31f0547@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/midori: add missing
 !BR2_PACKAGE_GNUPG dependency
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
Cc: Romain Naour <romain.naour@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, Arnout, All,

On 2022-05-18 21:17 +0200, Arnout Vandecappelle spake thusly:
> On 15/05/2022 00:28, James Hilliard wrote:
> >The !BR2_PACKAGE_GNUPG needs to be propagated from BR2_PACKAGE_GCR.
> >
> >Fixes:
> >WARNING: unmet direct dependencies detected for BR2_PACKAGE_GCR
> >   Depends on [n]: BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS [=y] && BR2_USE_WCHAR [=y] && BR2_TOOLCHAIN_HAS_THREADS [=y] && BR2_USE_MMU [=y] && !BR2_STATIC_LIBS [=n] && !BR2_PACKAGE_GNUPG [=y]
> >   Selected by [y]:
> >   - BR2_PACKAGE_MIDORI [=y] && BR2_PACKAGE_MIDORI_ARCH_SUPPORTS [=y] && !BR2_STATIC_LIBS [=n] && BR2_INSTALL_LIBSTDCPP [=y] && BR2_HOST_GCC_AT_LEAST_8 [=y] && BR2_TOOLCHAIN_GCC_AT_LEAST_7 [=y] && BR2_TOOLCHAIN_USES_GLIBC [=y] && BR2_TOOLCHAIN_HAS_THREADS [=y] && BR2_TOOLCHAIN_HAS_SYNC_4 [=y] && BR2_USE_WCHAR [=y] && BR2_PACKAGE_LIBGTK3 [=y] && (BR2_PACKAGE_LIBGTK3_X11 [=y] || BR2_PACKAGE_LIBGTK3_WAYLAND [=n])
> >
> >Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> >---
> >  package/midori/Config.in | 1 +
> >  1 file changed, 1 insertion(+)
> >
> >diff --git a/package/midori/Config.in b/package/midori/Config.in
> >index 715295e5a6..54e19d4d34 100644
> >--- a/package/midori/Config.in
> >+++ b/package/midori/Config.in
> >@@ -25,6 +25,7 @@ config BR2_PACKAGE_MIDORI
> >  	bool "midori"
> >  	depends on BR2_PACKAGE_MIDORI_ARCH_SUPPORTS
> >  	depends on !BR2_STATIC_LIBS # webkitgtk
> >+	depends on !BR2_PACKAGE_GNUPG # gcr
>  You forget to add a comment for this.
>  Applied to master with that fixed, thanks.

Unfortunately, as Romain noticed, this is causing a circular (aka
recursive) kconfig dependency:

    $ make distclean; make defconfig
    [...]
    package/gstreamer1/gstreamer1/Config.in:5:error: recursive dependency detected!
    package/gstreamer1/gstreamer1/Config.in:5:      symbol BR2_PACKAGE_GSTREAMER1 is selected by BR2_PACKAGE_WEBKITGTK_MULTIMEDIA
    package/webkitgtk/Config.in:90: symbol BR2_PACKAGE_WEBKITGTK_MULTIMEDIA depends on BR2_PACKAGE_WEBKITGTK
    package/webkitgtk/Config.in:24: symbol BR2_PACKAGE_WEBKITGTK is selected by BR2_PACKAGE_MIDORI
    package/midori/Config.in:28:    symbol BR2_PACKAGE_MIDORI depends on BR2_PACKAGE_GNUPG
    package/gnupg/Config.in:1:      symbol BR2_PACKAGE_GNUPG is selected by BR2_PACKAGE_PYTHON_GNUPG
    package/python-gnupg/Config.in:1:       symbol BR2_PACKAGE_PYTHON_GNUPG depends on BR2_PACKAGE_PYTHON3
    package/python3/Config.in:5:    symbol BR2_PACKAGE_PYTHON3 is selected by BR2_PACKAGE_JACK2_DBUS
    package/jack2/Config.in:35:     symbol BR2_PACKAGE_JACK2_DBUS depends on BR2_PACKAGE_JACK2
    package/jack2/Config.in:1:      symbol BR2_PACKAGE_JACK2 is selected by BR2_PACKAGE_FLUIDSYNTH_JACK2
    package/fluidsynth/Config.in:38:        symbol BR2_PACKAGE_FLUIDSYNTH_JACK2 depends on BR2_PACKAGE_FLUIDSYNTH
    package/fluidsynth/Config.in:1: symbol BR2_PACKAGE_FLUIDSYNTH is selected by BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_FLUIDSYNTH
    package/gstreamer1/gst1-plugins-bad/Config.in:438:      symbol BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_FLUIDSYNTH depends on BR2_PACKAGE_GSTREAMER1

James, can you look at it, please?

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
