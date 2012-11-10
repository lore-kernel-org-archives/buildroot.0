From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 10 Nov 2012 02:08:44 +0100
Subject: [Buildroot] [PATCH] libatomic_ops version update 7.3alpha2 old
 version 1.2 does not compiles with modern gcc and utils
In-Reply-To: <1352465722-23459-1-git-send-email-alexander@mezon.ru>
References: <1352465722-23459-1-git-send-email-alexander@mezon.ru>
Message-ID: <509DA91C.8070805@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/09/12 13:55, Alexander Khryukin wrote:
>
> Signed-off-by: Alexander Khryukin<alexander@mezon.ru>
> ---
>   package/libatomic_ops/libatomic_ops.mk | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/package/libatomic_ops/libatomic_ops.mk b/package/libatomic_ops/libatomic_ops.mk
> index 6d50d0a..c946df0 100644
> --- a/package/libatomic_ops/libatomic_ops.mk
> +++ b/package/libatomic_ops/libatomic_ops.mk
> @@ -1,12 +1,12 @@
>  #############################################################
>  #
> -# Atomic_ops library
> +## Atomic_ops library
>  #
> -#############################################################
> +##############################################################

  Please don't modify the header.

>
> -LIBATOMIC_OPS_VERSION = 1.2
> +LIBATOMIC_OPS_VERSION = 7.3alpha2

  Is there a particular reason to use the experimental version, instead of
the "current" version 7.2d?

>   LIBATOMIC_OPS_SOURCE = libatomic_ops-$(LIBATOMIC_OPS_VERSION).tar.gz
> -LIBATOMIC_OPS_SITE = http://www.hpl.hp.com/research/linux/atomic_ops/download
> -LIBATOMIC_OPS_INSTALL_STAGING = YES
> +LIBATOMIC_OPS_SITE = http://www.hpl.hp.com/personal/Hans_Boehm/gc/gc_source/
> +	LIBATOMIC_OPS_INSTALL_STAGING = YES

  What's wrong with the old download site? It works fine for me...
And please don't mess up the indentation of the _INSTALL_STAGING line.


  Regards,
  Arnout

>
>   $(eval $(autotools-package))

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
