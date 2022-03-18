Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D9C9C433FE
	for <buildroot@archiver.kernel.org>; Fri, 18 Mar 2022 20:50:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C2DCD60ADD;
	Fri, 18 Mar 2022 20:50:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2LUJnnO3U-hU; Fri, 18 Mar 2022 20:50:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B593D60A69;
	Fri, 18 Mar 2022 20:50:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8055B1BF2C6
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 20:50:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6D51F827A5
 for <buildroot@lists.busybox.net>; Fri, 18 Mar 2022 20:50:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3fePZNz3mtls for <buildroot@lists.busybox.net>;
 Fri, 18 Mar 2022 20:50:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F276C80B9F
 for <buildroot@buildroot.org>; Fri, 18 Mar 2022 20:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1647636623;
 bh=L95tjVx6aAYyETpev4PLI/1sAhvNVFVr519pl+ZnTg0=;
 h=X-UI-Sender-Class:Date:From:To:Subject:In-Reply-To:References;
 b=KjmKSI8p++jQR3lHKtlYcACeT8Vr1LAq0KYLJLVijefMxKONDWy9Txb9ZPNbm3+6w
 I2IGQQDJDJi1sqosHyMIS3USNXmTiR7YiClOB5ZbLbXCTM5mu2rgdK3Ci1AWcbwMDd
 p2KfGfTjLLAIaVHTH1Ga3OhOPJOpO0gdo6P3xAgY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.106]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MoO6M-1ntKdz0nGK-00om3o for
 <buildroot@buildroot.org>; Fri, 18 Mar 2022 21:50:23 +0100
Date: Fri, 18 Mar 2022 21:50:22 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Message-ID: <20220318215022.31a913e5@gmx.net>
In-Reply-To: <20220318202044.10413-5-ps.report@gmx.net>
References: <20220318202044.10413-1-ps.report@gmx.net>
 <20220318202044.10413-5-ps.report@gmx.net>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:QkkKCMqNQUnrl17isV7uUfq7N7RuQgbRY9x7ZKekW/4NUDDgYNg
 F0PGNWGWc44nx3LGDYAr+ig+2ZVY4Q3RmolRPAaZh11t8jXjjFh47Tcw35lEoynMHwaCWKM
 7XBxtkZIHs7yUq5H4l8PcAgEPPUV10Aomj4BCEwTQ0wYdIPELovvfsr6qx3nDpxUF+ayS/t
 XRMDulcN6erOeJRoar1XA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:vqpWaijDuZM=:hmQX0OBI5ORqDlA/voKPsz
 jveDK3CNoTetRisjGpyWFI7WwT1tMn6fwy0q/PED7UyiodNP0cOqVNg72HneUnWqJOLZoVeJw
 LfVmNLrMdD2NuRHX8OYVpL+iIV+kOQtOdw1tY5gGnggv2Z1pYWfFi3FahIY4JwfrjqK08T/fj
 KkDxqZlB2UdO+gqOqXU3PpcsySXijgssoys54roY4J80P9GxtI7++s1r1tq2wN3D+t77VZhfb
 7IlFCO0zmfnjj4WLwqFKnXeCj4MTYgrmOSAUCwTHiNBL6odaQwOX9Ix49FckXzgQHTXtkJEXm
 t6La6Mo/jVWJCrYkvp7VxYAC8J3XNP25zZBIOq91270VYIbMvOgPDioZuS4fLGKFEKfYC/mr3
 cK5Q/2QQgamvXtLn86DBmZtqAESZSDe7ujXiyNbxO8jYYhB036PMi9C2+3WcYdv7XfuClARYZ
 aI7v4A/OKNxe87rWpr056inZvLR3UofMfZD7xChe5m61F3LF6gnJZpaHexR16K9C7fxxo6ZwI
 XWU0DB3vEY85VQ7RxR3BvvSLlZP5ppW1jLPR3FQBJTT10j73OVL4g78Hcsace8573r1rFaqP4
 YfcneA0jmbU6Ygl/apTmgSMUAM+xeGl7120k0WOEqDPtHMvL5CUrSb/WEExLbayHEmX5sNcPN
 GIn24UPJmO88HXD4B+CzKFWvOKxIPZDd0gDf+hZKrpUa/vuuXIGQ5KSGLs1qImTGMdvEUzbtq
 fWnoI0MCGZ2c/I5b0b3/6yjB0XHxI97L6Y8x+VUJWVkkeONJ6Ae0H42Fm+qade6WMdGCsCjJV
 FCQAe428UA9aaUHDXzFIfkV4I2u5PeQGI7Xl71MxHYzs6+TlV/YNhzgfgDr2RQKK0XJakBF5v
 NbK21HuJ5ZPpVmIZLxlQHkgVI6Ym/MzZSjF8dt3fSrRsdZpL8llZvYfrwfGbr5JjKrUCT27gr
 4IaVRrqWy7lTfH9RGHqXSRHTi7bTZj4LrR/GEMj4U70JLbNzPdI7rGih802NiD2wbyZSZSH/2
 vsU+b0R4wZEvk36GgYdtMd5CzqvbGe61V18AT5rqwW4sx4sAHI7MfI7M/MrWClxrQDtSiFjgS
 BJUjSiS2OE2mEY=
Subject: Re: [Buildroot] [PATCH v2 5/5] package/wget: bump version to 1.21.3
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello *,

On Fri, 18 Mar 2022 21:20:44 +0100, Peter Seiderer <ps.report@gmx.net> wrote:

> - bump version to 1.21.3 (for details see [1])
>
> - remove legacy --with-libidn option (see [2]), replace with
>   --enable-iri option in case locale support and libidn2 are available
>
> [1] https://lists.gnu.org/archive/html/info-gnu/2022-02/msg00017.html
> [2] https://git.savannah.gnu.org/cgit/wget.git/commit/configure.ac?id=a24e67e239ef949cc77a4c4e5a0beb703026a296
>
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> ---
> Changes v1 -> v2:
>   - split out from original patch
>   - fix iri option enable dependency
> ---
>  package/wget/wget.hash |  4 ++--
>  package/wget/wget.mk   | 14 ++++++--------
>  2 files changed, 8 insertions(+), 10 deletions(-)
>
> diff --git a/package/wget/wget.hash b/package/wget/wget.hash
> index 7f89bedb88..22674650a2 100644
> --- a/package/wget/wget.hash
> +++ b/package/wget/wget.hash
> @@ -1,6 +1,6 @@
>  # Locally calculated after checking pgp signature
> -# https://ftp.gnu.org/gnu/wget/wget-1.21.2.tar.lz.sig
> +# https://ftp.gnu.org/gnu/wget/wget-1.21.3.tar.lz.sig
>  # with key 6B98F637D879C5236E277C5C64FF90AAE8C70AF9
> -sha256  1727a330a86acacb3e57615ce268f5f29978bf7adec4abe6a30d370207bc91b3  wget-1.21.2.tar.lz
> +sha256  dbd2fb5e47149d4752d0eaa0dac68cc49cf20d46df4f8e326ffc8f18b2af4ea5  wget-1.21.3.tar.lz
>  # Locally calculated
>  sha256  e79e9c8a0c85d735ff98185918ec94ed7d175efc377012787aebcf3b80f0d90b  COPYING
> diff --git a/package/wget/wget.mk b/package/wget/wget.mk
> index 69ca8f261c..079afbee48 100644
> --- a/package/wget/wget.mk
> +++ b/package/wget/wget.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>
> -WGET_VERSION = 1.21.2
> +WGET_VERSION = 1.21.3
>  WGET_SOURCE = wget-$(WGET_VERSION).tar.lz
>  WGET_SITE = $(BR2_GNU_MIRROR)/wget
>  WGET_DEPENDENCIES = host-pkgconf
> @@ -38,15 +38,13 @@ else
>  WGET_CONF_OPTS += --without-ssl
>  endif
>
> -ifeq ($(BR2_PACKAGE_LIBICONV),y)
> -WGET_DEPENDENCIES += libiconv
> -endif

The above code one should be kept as there is at least one other
location in the source using iconv (protexted by '#ifdef HAVE_ICONV',
see src/url.c)...

> -
> -ifeq ($(BR2_PACKAGE_LIBIDN2),y)
> -WGET_CONF_OPTS += --with-libidn
> +# BR2_ENABLE_LOCALE and BR2_PACKAGE_LIBICONV are mutually exclusive
> +ifeq ($(BR2_ENABLE_LOCALE)$(BR2_PACKAGE_LIBICONV)$(BR2_PACKAGE_LIBIDN2),yy)
> +WGET_CONF_OPTS += --enable-iri
>  WGET_DEPENDENCIES += libidn2
> +WGET_DEPENDENCIES += $(if $(BR2_PACKAGE_LIBICONV),libiconv)

And so the above line can be removed...

Will send an updated patch set...

Regards,
Peter

>  else
> -WGET_CONF_OPTS += --without-libidn
> +WGET_CONF_OPTS += --disable-iri
>  endif
>
>  ifeq ($(BR2_PACKAGE_UTIL_LINUX_LIBUUID),y)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
