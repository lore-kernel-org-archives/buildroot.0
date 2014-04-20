From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 20 Apr 2014 11:07:24 +0200
Subject: [Buildroot] [PATCH] Added support for linux headers for testing
 versions to build cross-compile tools
In-Reply-To: <1393334528-10441-1-git-send-email-lucas.zampar@gmail.com>
References: <1393334528-10441-1-git-send-email-lucas.zampar@gmail.com>
Message-ID: <20140420110724.5981255d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Lucas Zampar Bernardi,

On Tue, 25 Feb 2014 10:22:08 -0300, Lucas Zampar Bernardi wrote:
> From: Lucas Zampar Bernardi <lucas@writesys.com.br>
> 
> 
> This patch add support to buildroot compile an internal cross-compiler using linux hearders with releases candidates versions (testing).
> ---
>  package/linux-headers/linux-headers.mk |    6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/package/linux-headers/linux-headers.mk b/package/linux-headers/linux-headers.mk
> index 086e5d5..d6e9dbb 100644
> --- a/package/linux-headers/linux-headers.mk
> +++ b/package/linux-headers/linux-headers.mk
> @@ -13,6 +13,12 @@ LINUX_HEADERS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v2.6/
>  else
>  LINUX_HEADERS_SITE = $(BR2_KERNEL_MIRROR)/linux/kernel/v3.x/
>  endif
> +
> +# release candidates are in testing/ subdir
> +ifneq ($(findstring -rc,$(LINUX_HEADERS_VERSION)),)
> +LINUX_HEADERS_SITE := $(LINUX_HEADERS_SITE)testing/
> +endif
> +

Thanks for your patch, and sorry for the slow response. However,
instead of having a special case for -rc kernels, I'd prefer to either
have a way of specifying a custom Linux kernel tarball for
linux-headers, or even better, a way of using the same kernel headers
source code as the ones used to build the Linux kernel package itself.

So, for now, I'll mark this specific patch as Rejected, but I'll
definitely welcome improvements in one of the two directions proposed
above.

Thanks again!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
