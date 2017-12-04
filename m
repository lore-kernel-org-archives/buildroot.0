From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 5 Dec 2017 00:24:57 +0100
Subject: [Buildroot] [PATCH] xenomai: bump to 3.0.6
In-Reply-To: <20171204175909.21596-1-nolange79@gmail.com>
References: <20171204175909.21596-1-nolange79@gmail.com>
Message-ID: <439d0424-166d-4579-633c-771aa3d43fb0@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Norbert,

Le 04/12/2017 ? 18:59, Norbert Lange a ?crit?:
> From: Norbert Lange <norbert.lange@andritz.com>
> 
> this includes a fix to allow compilation with compilers
> defaulting to -fpie (gcc 6+)

Maybe you can add this link about a critical bug in Cobalt:

http://xenomai.org/pipermail/xenomai/2017-November/037923.html

This bug affect all previous version of Xenomai.

Otherwise:
Reviewed-by: Romain Naour <romain.naour@gmail.com>

Also, Xenomai contains several license files, can you add a license hash for
each of them in a followup patch?

Thanks!

Best regards,
Romain
> 
> Signed-off-by: Norbert Lange <nolange79@gmail.com>
> ---
>  package/xenomai/xenomai.hash | 2 +-
>  package/xenomai/xenomai.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/xenomai/xenomai.hash b/package/xenomai/xenomai.hash
> index 1290ca54fb..c36badb6bf 100644
> --- a/package/xenomai/xenomai.hash
> +++ b/package/xenomai/xenomai.hash
> @@ -1,2 +1,2 @@
>  # Locally computed;
> -sha256 84836a43b6a996dcdcb42b0b1653a3271cc201df2a2d42c1b4b3bafb2cca7c63  xenomai-3.0.5.tar.bz2
> +sha256 2c0dd3f0e36e4a10f97e0028989bb873e80f4d1ce212ac55fd3b28857c464f94  xenomai-3.0.6.tar.bz2
> diff --git a/package/xenomai/xenomai.mk b/package/xenomai/xenomai.mk
> index c53d5148f0..6bf08edfbc 100644
> --- a/package/xenomai/xenomai.mk
> +++ b/package/xenomai/xenomai.mk
> @@ -6,7 +6,7 @@
>  
>  XENOMAI_VERSION = $(call qstrip,$(BR2_PACKAGE_XENOMAI_VERSION))
>  ifeq ($(XENOMAI_VERSION),)
> -XENOMAI_VERSION = 3.0.5
> +XENOMAI_VERSION = 3.0.6
>  else
>  BR_NO_CHECK_HASH_FOR += $(XENOMAI_SOURCE)
>  endif
> 
