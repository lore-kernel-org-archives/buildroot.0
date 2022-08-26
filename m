Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B228ECAAA3
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 17:49:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 872AE4102E;
	Fri, 26 Aug 2022 17:49:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 872AE4102E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fgAD_-qIpmXC; Fri, 26 Aug 2022 17:49:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A762441029;
	Fri, 26 Aug 2022 17:49:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A762441029
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4DF991BF38A
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 17:49:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 35DE083F1E
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 17:49:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 35DE083F1E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RuDqBlExteHj for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 17:49:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5019A83F1D
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5019A83F1D
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 17:49:22 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 x63-20020a17090a6c4500b001fabbf8debfso2502754pjj.4
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 10:49:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=/5WlcMRa73pVu9a/YINUOkTNnPyZHTLlQm71Yu4Wljs=;
 b=h7Uw0iau+tOuWbNfrUN+KfjY+qQHoFqxawm3xdnPdyxISw5Hz+hofFjjLctiAd5b8P
 +t0HKKEEZ5L2uOtsx9fPDryFYi/oD2Um0QV7f/LeMqVcZd4isnzGV5GF35oby5cks/yo
 aKc9z21C2hlnw7Ak/0O0Kf5nDRL/G+OocHnEGnUuVKt/8ANlfqF0aOZCun4Rko15ZxVc
 BcD9T8t+qDo4iMPpC5iM5ZGJei7punyOCS/4pzyHdtxcEUwjlBR71X+ElpBISIiffOua
 WPHc+xCfJtRqqgE3K7oT08Ln0rWlFsS7SBYJxb96dgKPT0nN8EtQ/8+jyisZIAcGs+jy
 yo2g==
X-Gm-Message-State: ACgBeo35m9Omn79kiD8HVOiV/STzq7d3yGrjVUZGYJ2Y4W8DRy+8OiIW
 +EPmDfaX4biewIrBNfbqQGpI8WpBKFxQEKxGaPw=
X-Google-Smtp-Source: AA6agR5Q6Sw+dVAjMpLjBe1zGOmbhY/8pY0fvOS23dCQ3nipw7AoBCpcvmSRwmOL6Lafi6RToY7Svd+1b20eGUmJpeE=
X-Received: by 2002:a17:902:6b82:b0:16d:d268:3842 with SMTP id
 p2-20020a1709026b8200b0016dd2683842mr4698986plk.16.1661536161517; Fri, 26 Aug
 2022 10:49:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220826155934.12677-1-tianyuanhao3@163.com>
In-Reply-To: <20220826155934.12677-1-tianyuanhao3@163.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 26 Aug 2022 11:49:09 -0600
Message-ID: <CADvTj4qvuO_OB-x0VRuh146KvfZ_9=6FL2F0MRTKkkU4x9U+Uw@mail.gmail.com>
To: TIAN Yuanhao <tianyuanhao3@163.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=/5WlcMRa73pVu9a/YINUOkTNnPyZHTLlQm71Yu4Wljs=;
 b=Cnbu8GuCx9FR6z77YIBkEkX9Yq9kAK80yQ7ncCAhVHa5aUucUOWPUetRrEHC8yZrpK
 3k2kwctIQ0bWW4NvUkGntgu2TfDICiXDbz08HxilyzpEOxMS6QOh4A265xwNeyrOkFU/
 0cWMcEpRFmQWCQtWRm9n6FqL7rgCGBsi5lKpHw+tugWSyI/ZXKI+uV2pL2kWFzXu7+WX
 0VjHEmPTYItPgktZBfDmuwc/uc3Zd2fHUbbyvOKGUHZoXdHNxxUxymbOJZvm4XzlqHWt
 2ma+iGJWVspwROsI5/GddjNUoYp1OENAD2+4Dq8/fvogJWNxA/n8GxIetfGUdTvbxu0m
 Kz5g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Cnbu8GuC
Subject: Re: [Buildroot] [PATCH 1/1] package/network-manager: needs
 host-libxslt
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, Aug 26, 2022 at 10:01 AM TIAN Yuanhao <tianyuanhao3@163.com> wrote:
>
> Besides, order depends alphabetically.
>
> Fixes:
> output/build/network-manager-1.36.4/meson.build:89:0: ERROR: Program 'xsltproc' not found or not executable
>
> See:
> http://cgit.openembedded.org/meta-openembedded/tree/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.36.2.bb?h=kirkstone#n13
>
> Cc: James Hilliard <james.hilliard1@gmail.com>
Reviewed-by: James Hilliard <james.hilliard1@gmail.com>
> Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
> ---
>  package/network-manager/network-manager.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
> index d782370082..391baaafde 100644
> --- a/package/network-manager/network-manager.mk
> +++ b/package/network-manager/network-manager.mk
> @@ -9,8 +9,8 @@ NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).4
>  NETWORK_MANAGER_SOURCE = NetworkManager-$(NETWORK_MANAGER_VERSION).tar.xz
>  NETWORK_MANAGER_SITE = https://download.gnome.org/sources/NetworkManager/$(NETWORK_MANAGER_VERSION_MAJOR)
>  NETWORK_MANAGER_INSTALL_STAGING = YES
> -NETWORK_MANAGER_DEPENDENCIES = host-pkgconf dbus udev gnutls libglib2 \
> -       host-intltool libndp util-linux
> +NETWORK_MANAGER_DEPENDENCIES = host-intltool host-libxslt host-pkgconf \
> +       dbus gnutls libglib2 libndp udev util-linux
>  NETWORK_MANAGER_LICENSE = GPL-2.0+ (app), LGPL-2.1+ (libnm)
>  NETWORK_MANAGER_LICENSE_FILES = COPYING COPYING.LGPL CONTRIBUTING.md
>  NETWORK_MANAGER_CPE_ID_VENDOR = gnome
> --
> 2.25.1
>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
