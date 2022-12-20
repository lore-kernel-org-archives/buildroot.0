Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2654C4332F
	for <buildroot@archiver.kernel.org>; Tue, 20 Dec 2022 08:31:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7474860B46;
	Tue, 20 Dec 2022 08:31:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7474860B46
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oSq-UlKGMwxI; Tue, 20 Dec 2022 08:31:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA2C8607D0;
	Tue, 20 Dec 2022 08:31:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA2C8607D0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 055BA1BF28C
 for <buildroot@lists.busybox.net>; Tue, 20 Dec 2022 08:31:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E17F740133
 for <buildroot@lists.busybox.net>; Tue, 20 Dec 2022 08:31:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E17F740133
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PTN9r1-DNvfW for <buildroot@lists.busybox.net>;
 Tue, 20 Dec 2022 08:31:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 05918400D9
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 05918400D9
 for <buildroot@buildroot.org>; Tue, 20 Dec 2022 08:31:17 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:cf59:3d28:f63b:149b])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id BCE875FF9A;
 Tue, 20 Dec 2022 09:31:06 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 20 Dec 2022 09:31:06 +0100
Date: Tue, 20 Dec 2022 09:31:06 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <20221220083106.GD2909@scaer>
References: <20221219230802.2602798-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221219230802.2602798-1-f.fainelli@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1671525075;
 bh=CbeSakzkGN2ZeB9hpkTzwDFtmwE60gbiH3Ru9oqxo48=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SDhOMDffmD0S07mJFT01fl8AuTl8VNWtxBf4X4NxlSmbtJaw6gROnpR9ZdNl81hH+
 MlqU4yoWlSHI9/R4olMz7KTvU9Eezk/16usO1yGh7TM9QH5kFW+G9KuLFND/g236up
 DE1KBxfJHsIehxSBg27mS4kele8IpemhyXJXRS3ABZ3i6NnoK0VJ3KnNlJejltSKei
 yKejgSVKSx/TWK8WYgP4UvkuFFUzuaSFfiSprD/WbPZxzDgFCzmtZTDDLMGyF5eX33
 8E5WXo5Ipp0exjVxjkR0Bgw4b3lPuYfAlz5mFdtPyFmxMs3e+XiAB+jz4a2PqX7Jt1
 KMvgOP6e7dPJg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=SDhOMDff
Subject: Re: [Buildroot] [PATCH v2] package/libgpg-error: Disable unused
 files installation
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
Cc: bernd.kuhls@t-online.de, chrismcc@gmail.com, mmayer@broadcom.com,
 thomas.petazzoni@bootlin.com, buildroot@buildroot.org,
 fontaine.fabrice@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Florian, All,

On 2022-12-19 15:08 -0800, Florian Fainelli spake thusly:
> Disable a number of unused files that were being installed into the root
> filesystem and thus inflating its size needlessly:
> 
> * Disable the building of documentation
> 
> * Disable support for other languages which is comprised of Common Lisp that
>   buildroot has no package for
> 
> * Only install binaries and shared/static libraries, remove libtool archive

As Baruch mentioned in his review, disabling the documentation and
removing headers and libtool archives whould already be handled by the
package infra.

So I applied your v1 instead, and makred this one rejected.

Regards,
Yann E. MORIN.

> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
> ---
> Changes in v2:
> 
> - remove header files, pkgconfig and other unnecessary files
> 
>  package/libgpg-error/libgpg-error.mk | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/package/libgpg-error/libgpg-error.mk b/package/libgpg-error/libgpg-error.mk
> index 86dea6ad2acd..6ce1f8d908de 100644
> --- a/package/libgpg-error/libgpg-error.mk
> +++ b/package/libgpg-error/libgpg-error.mk
> @@ -14,7 +14,9 @@ LIBGPG_ERROR_INSTALL_STAGING = YES
>  LIBGPG_ERROR_CONFIG_SCRIPTS = gpg-error-config
>  LIBGPG_ERROR_DEPENDENCIES = $(TARGET_NLS_DEPENDENCIES)
>  LIBGPG_ERROR_CONF_OPTS = --disable-tests \
> -		--host=$(BR2_PACKAGE_LIBGPG_ERROR_SYSCFG)
> +		--host=$(BR2_PACKAGE_LIBGPG_ERROR_SYSCFG) \
> +		--disable-languages \
> +		--disable-doc
>  
>  ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
>  LIBGPG_ERROR_CONF_OPTS += --enable-threads
> @@ -22,4 +24,9 @@ else
>  LIBGPG_ERROR_CONF_OPTS += --disable-threads
>  endif
>  
> +define LIBGPG_ERROR_INSTALL_TARGET_CMDS
> +	$(MAKE) -C $(@D) DESTDIR="$(TARGET_DIR)" install-exec
> +	rm -f $(TARGET_DIR)/usr/lib/libgpg-error.la
> +endef
> +
>  $(eval $(autotools-package))
> -- 
> 2.34.1
> 

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
