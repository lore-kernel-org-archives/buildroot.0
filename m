From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 02 May 2015 14:21:50 +0200
Subject: [Buildroot] [PATCH 1/2] package/libpthsem: remove
 argp-standalone dependency
In-Reply-To: <1430562486-23625-1-git-send-email-romain.naour@openwide.fr>
References: <1430562486-23625-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <5544C15E.9060103@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/05/15 12:28, Romain Naour wrote:
> argp-standalone provide libargp.a and argp.h which are
> never used in libpthsem.
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 Build-test with and without the _COMPAT option, and checked that there is no
reference to argp in the source.

 Adding the original submitter of this package in Cc for final verification.
Gregory, do you remember why you added the argp-standalone dependency?

 Regards,
 Arnout

> ---
>  package/libpthsem/Config.in    | 1 -
>  package/libpthsem/libpthsem.mk | 1 -
>  2 files changed, 2 deletions(-)
> 
> diff --git a/package/libpthsem/Config.in b/package/libpthsem/Config.in
> index 932acec..3219de1 100644
> --- a/package/libpthsem/Config.in
> +++ b/package/libpthsem/Config.in
> @@ -1,7 +1,6 @@
>  config BR2_PACKAGE_LIBPTHSEM
>  	bool "libpthsem"
>  	depends on BR2_USE_MMU # fork()
> -	select BR2_PACKAGE_ARGP_STANDALONE
>  	help
>  	  GNU pth is a user mode multi threading library. pthsem is an extend
>  	  version, with support for semaphores added.
> diff --git a/package/libpthsem/libpthsem.mk b/package/libpthsem/libpthsem.mk
> index 7c1de86..f9f6f71 100644
> --- a/package/libpthsem/libpthsem.mk
> +++ b/package/libpthsem/libpthsem.mk
> @@ -11,7 +11,6 @@ LIBPTHSEM_LICENSE = LGPLv2.1+
>  LIBPTHSEM_LICENSE_FILES = COPYING
>  LIBPTHSEM_AUTORECONF = YES
>  LIBPTHSEM_INSTALL_STAGING = YES
> -LIBPTHSEM_DEPENDENCIES = argp-standalone
>  LIBPTHSEM_CONFIG_SCRIPTS = pthsem-config
>  
>  ifeq ($(BR2_PACKAGE_LIBPTHSEM_COMPAT),y)
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
