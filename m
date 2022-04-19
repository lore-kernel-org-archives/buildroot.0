Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7BB1C433EF
	for <buildroot@archiver.kernel.org>; Tue, 19 Apr 2022 10:40:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2AD4C40BF1;
	Tue, 19 Apr 2022 10:40:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IbXW6wBJ6rew; Tue, 19 Apr 2022 10:40:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 32AF0408F3;
	Tue, 19 Apr 2022 10:40:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9B22F1BF8B4
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 10:40:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 96AF94249F
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 10:40:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=othermo.de
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E1g3ca5aAClL for <buildroot@lists.busybox.net>;
 Tue, 19 Apr 2022 10:40:03 +0000 (UTC)
X-Greylist: delayed 00:07:38 by SQLgrey-1.8.0
Received: from mout-b-206.mailbox.org (mout-b-206.mailbox.org
 [IPv6:2001:67c:2050:102:465::206])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2C8974249D
 for <buildroot@buildroot.org>; Tue, 19 Apr 2022 10:40:03 +0000 (UTC)
Received: from smtp102.mailbox.org (smtp102.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:3:0])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mout-b-206.mailbox.org (Postfix) with ESMTPS id 4KjKqp0dHNz9sZP
 for <buildroot@buildroot.org>; Tue, 19 Apr 2022 12:32:22 +0200 (CEST)
Message-ID: <f5c69162-68a5-3751-c6e0-aa7e921aa6b9@othermo.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=othermo.de; s=MBO0001; 
 t=1650364339;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nC1gNlDFsrG9CXNcQvQwdkvnxJyCPGlXC+WmIkfxJC4=;
 b=nw3QjJOEXm9fqysjeBeknZe8mgFtymo0Rlqt45Fo4tKewy5QmxQFubhhiQ19paz1GVSAbG
 mpuEOTK91YqWMkLmj7Oww6mQlnPdWl+868LkHTobm5adbkqrqW9y2P1XEus1QB9FoquxtG
 J8eIivQ2q+byB1PU2Qfr4ttrOdgIM6Ageytmn5ogPLXv5v4YKu9i1dvMbV1Grz1+Qb76Wr
 vq6PmrJnvQLVnPo02RqHDzmjs/2xxMsR/i0qYXGPrMly+MbvWH3q4PxtenB8223Ut2762S
 3kd+cImtte6Qo463LKlANd2rSOvTEC2vuYaHrjWihN/20JqEEBBqHgtyV7gKpQ==
Date: Tue, 19 Apr 2022 12:32:14 +0200
MIME-Version: 1.0
Content-Language: en-US
To: buildroot@buildroot.org
References: <20220415025224.1876125-1-tianyuanhao3@163.com>
From: Marcus Hoffmann <marcus.hoffmann@othermo.de>
In-Reply-To: <20220415025224.1876125-1-tianyuanhao3@163.com>
Subject: Re: [Buildroot] [PATCH] package/network-manager: remove invalid
 dependencies
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 15.04.22 04:52, TIAN Yuanhao wrote:
> Dependency on libiw has been removed since 0.9.3.990 [1].
> Dependency on libgcrypt has been removed since 1.2-beta1 [2].
> Dependency on libuuid has been removed since 1.31.4-dev [3].
> 
> [1]: https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/commit/7d0761588c2dde8816c109c38c1c94233fd74afe
> [2]: https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/commit/b6f5f030331cc680edbe19ae322e894494d63687
> [3]: https://gitlab.freedesktop.org/NetworkManager/NetworkManager/-/commit/73b9883c6f30320b727a664ff2c84cc772aac94b
> 
> Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>


Reviewed-by: Marcus Hoffmann <marcus.hoffmann@othermo.de>
Tested-by: Marcus Hoffmann <marcus.hoffmann@othermo.de>

> ---
>   package/network-manager/Config.in          | 6 ------
>   package/network-manager/network-manager.mk | 2 +-
>   2 files changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/package/network-manager/Config.in b/package/network-manager/Config.in
> index a48cb37b15..1370c81c9c 100644
> --- a/package/network-manager/Config.in
> +++ b/package/network-manager/Config.in
> @@ -1,6 +1,5 @@
>   config BR2_PACKAGE_NETWORK_MANAGER
>   	bool "network-manager"
> -	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS # libgcrypt
>   	depends on !BR2_STATIC_LIBS # gnutls
>   	depends on BR2_USE_MMU # dbus
>   	depends on BR2_PACKAGE_HAS_UDEV
> @@ -13,11 +12,6 @@ config BR2_PACKAGE_NETWORK_MANAGER
>   	select BR2_PACKAGE_DBUS
>   	select BR2_PACKAGE_GNUTLS
>   	select BR2_PACKAGE_LIBGLIB2
> -	select BR2_PACKAGE_LIBGCRYPT
> -	select BR2_PACKAGE_UTIL_LINUX
> -	select BR2_PACKAGE_UTIL_LINUX_LIBUUID
> -	select BR2_PACKAGE_WIRELESS_TOOLS
> -	select BR2_PACKAGE_WIRELESS_TOOLS_LIB
>   	select BR2_PACKAGE_LIBNDP
>   	help
>   	  NetworkManager is a set of co-operative tools that make
> diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
> index a90228992c..d979cfc0d7 100644
> --- a/package/network-manager/network-manager.mk
> +++ b/package/network-manager/network-manager.mk
> @@ -10,7 +10,7 @@ NETWORK_MANAGER_SOURCE = NetworkManager-$(NETWORK_MANAGER_VERSION).tar.xz
>   NETWORK_MANAGER_SITE = https://download.gnome.org/sources/NetworkManager/$(NETWORK_MANAGER_VERSION_MAJOR)
>   NETWORK_MANAGER_INSTALL_STAGING = YES
>   NETWORK_MANAGER_DEPENDENCIES = host-pkgconf udev gnutls libglib2 \
> -	libgcrypt wireless_tools util-linux host-intltool libndp
> +	host-intltool libndp
>   NETWORK_MANAGER_LICENSE = GPL-2.0+ (app), LGPL-2.1+ (libnm)
>   NETWORK_MANAGER_LICENSE_FILES = COPYING COPYING.LGPL CONTRIBUTING.md
>   NETWORK_MANAGER_CPE_ID_VENDOR = gnome
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
