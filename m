Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AA68C7EE22
	for <buildroot@archiver.kernel.org>; Sun, 14 May 2023 12:29:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F385A41C2B;
	Sun, 14 May 2023 12:29:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F385A41C2B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x3fgZHhYfZ27; Sun, 14 May 2023 12:29:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B38C441BA1;
	Sun, 14 May 2023 12:29:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B38C441BA1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8A3D11BF48B
 for <buildroot@lists.busybox.net>; Sun, 14 May 2023 12:29:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6F92C41BA1
 for <buildroot@lists.busybox.net>; Sun, 14 May 2023 12:29:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6F92C41BA1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id APj_WQYQ_p4h for <buildroot@lists.busybox.net>;
 Sun, 14 May 2023 12:29:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2E54541B9B
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2E54541B9B
 for <buildroot@buildroot.org>; Sun, 14 May 2023 12:29:50 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:e91d:2912:5826:9d75])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 9104BB0057C;
 Sun, 14 May 2023 14:29:43 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 14 May 2023 14:29:43 +0200
Date: Sun, 14 May 2023 14:29:43 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Daniel Lang <dalang@gmx.at>
Message-ID: <20230514122943.GY2582048@scaer>
References: <20230509124720.205717-1-dalang@gmx.at>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230509124720.205717-1-dalang@gmx.at>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1684067388;
 bh=DVARcxVFNYmVHB1Mkz8Vlt4cuNG6k6Ue5RZ8Su7EDEs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dQRCX22jp7PKkaI7DzqoJ4ApvXo3q95bkSit9Z3StOjXXE2SiQ2fqVOuy0h2muUWM
 8+QiTeh7uSc8ffQ3imSxehY/+F2p5Z5fpjrUDaWkeO2g5/jMSAN+PcURkrSY0J5Uno
 /1ljtvBie8LAimUrzMVeBvuikSF22++lceXOasMIK9V/lmoiD4VDVtcmfzYsRSoZlm
 E/5AISGVSmdqbLzXJtSuonRePyB9Y0ntxk8Y2w9O5P88UxAJO/Zc1seOWQZA9OQIIA
 Vg7QoyILqJihhMH14SwC166UL3Ga1Oi5dWY0s0+c1t+SYWKQjCAXO4hpr0OCBnH1r+
 LH83TSk3qU7UA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=dQRCX22j
Subject: Re: [Buildroot] [PATCH] package/gtkmm3: bump to version 3.24.7
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>, Daniel Lang <d.lang@abatec.at>,
 James Knight <james.knight@collins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Daniel, All,

On 2023-05-09 14:47 +0200, Daniel Lang spake thusly:
> https://gitlab.gnome.org/GNOME/gtkmm/-/blob/3.24.7/NEWS
> 
> README [0] states:
> 
> It's easiest to build with Meson, if the tarball was made with Meson,
> and to build with Autotools, if the tarball was made with Autotools.
> Then you don't have to use maintainer-mode.
> How do you know how the tarball was made? If it was made with Meson,
> it contains files in untracked/gdk/gdkmm/, untracked/gtk/gtkmm/ and
> other subdirectories of untracked/.
> 
> This is the case, therefore switch to meson build system.
> 
> Also disable tests and demos.
> gtkmm3 tries to detect if X11 is enabled for gtk.
> Switch to explicit definition to be safe.
> 
> [0]: https://gitlab.gnome.org/GNOME/gtkmm/-/blob/3.24.7/README
> 
> Signed-off-by: Daniel Lang <dalang@gmx.at>
> ---
[--SNIP--]
> diff --git a/package/gtkmm3/gtkmm3.mk b/package/gtkmm3/gtkmm3.mk
> index 8bbcf224e6..df3d688648 100644
> --- a/package/gtkmm3/gtkmm3.mk
> +++ b/package/gtkmm3/gtkmm3.mk
[--SNIP--]
> @@ -13,4 +13,14 @@ GTKMM3_LICENSE_FILES = COPYING COPYING.tools
>  GTKMM3_INSTALL_STAGING = YES
>  GTKMM3_DEPENDENCIES = atkmm2_28 cairomm1_14 glibmm2_66 libgtk3 libsigc2 pangomm2_46 host-pkgconf
>  
> -$(eval $(autotools-package))
> +GTKMM3_CONF_OPTS += \

For the first, unconditional assignemnt, simple assignment is enough, so
I changed that when applying.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> +	-Dbuild-demos=false \
> +	-Dbuild-tests=false
> +
> +ifeq ($(BR2_PACKAGE_LIBGTK3_X11),y)
> +GTKMM3_CONF_OPTS += -Dbuild-x11-api=true
> +else
> +GTKMM3_CONF_OPTS += -Dbuild-x11-api=false
> +endif
> +
> +$(eval $(meson-package))
> -- 
> 2.40.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

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
