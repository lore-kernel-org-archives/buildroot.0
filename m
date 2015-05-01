From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 01 May 2015 15:25:20 +0200
Subject: [Buildroot] [PATCH 5/7] boot/mxs-bootlets: do not check hash of
 custom tarball
In-Reply-To: <bc53db66cfabb6adc0571eb614866bfdb68737ec.1430260630.git.yann.morin.1998@free.fr>
References: <cover.1430260630.git.yann.morin.1998@free.fr>
 <bc53db66cfabb6adc0571eb614866bfdb68737ec.1430260630.git.yann.morin.1998@free.fr>
Message-ID: <55437EC0.8010102@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 29/04/15 00:40, Yann E. MORIN wrote:
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 by adding an empty .hash file and checking that it fails for the default
version but not for a custom version.

 Regards,
 Arnout

> ---
>  boot/mxs-bootlets/mxs-bootlets.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/boot/mxs-bootlets/mxs-bootlets.mk b/boot/mxs-bootlets/mxs-bootlets.mk
> index 9b6bd7a..17af6dc 100644
> --- a/boot/mxs-bootlets/mxs-bootlets.mk
> +++ b/boot/mxs-bootlets/mxs-bootlets.mk
> @@ -8,6 +8,7 @@ ifeq ($(BR2_TARGET_MXS_BOOTLETS_CUSTOM_TARBALL),y)
>  MXS_BOOTLETS_TARBALL = $(call qstrip,$(BR2_TARGET_MXS_BOOTLETS_CUSTOM_TARBALL_URL))
>  MXS_BOOTLETS_SITE = $(patsubst %/,%,$(dir $(MXS_BOOTLETS_TARBALL)))
>  MXS_BOOTLETS_SOURCE = $(notdir $(MXS_BOOTLETS_TARBALL))
> +BR_NO_CHECK_HASH_FOR += $(MXS_BOOTLETS_SOURCE)
>  else ifeq ($(BR2_TARGET_MXS_BOOTLETS_CUSTOM_GIT),y)
>  MXS_BOOTLETS_SITE = $(BR2_TARGET_MXS_BOOTLETS_CUSTOM_GIT_URL)
>  MXS_BOOTLETS_SITE_METHOD = git
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
