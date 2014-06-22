From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 22 Jun 2014 19:14:36 +0200
Subject: [Buildroot] [PATCH] imagemagick: Enable for host
In-Reply-To: <1402902112-12487-1-git-send-email-vincent.stehle@laposte.net>
References: <1402902112-12487-1-git-send-email-vincent.stehle@laposte.net>
Message-ID: <20140622191436.7d432cbe@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Vincent Stehl?,

On Mon, 16 Jun 2014 09:01:52 +0200, Vincent Stehl? wrote:
> This allows to use e.g. convert to generate files at build time.
> 
> Signed-off-by: Vincent Stehl? <vincent.stehle@laposte.net>
> ---
>  package/imagemagick/imagemagick.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/imagemagick/imagemagick.mk b/package/imagemagick/imagemagick.mk
> index a6f3f45..ae191f1 100644
> --- a/package/imagemagick/imagemagick.mk
> +++ b/package/imagemagick/imagemagick.mk
> @@ -119,3 +119,4 @@ IMAGEMAGICK_CONF_OPT += --without-bzlib
>  endif
>  
>  $(eval $(autotools-package))
> +$(eval $(host-autotools-package))

My initial reaction to this patch is: "why".

We generally have host packages for two situations:

 * They are used as a dependency to build some other target package. In
   this case, we expect the patch adding the host package to be
   submitted alongside the patch adding the target package needing it,
   so that there is no "unneeded" host package.

 * They are tools needed to manipulate the target hardware (flashing
   utilities or special communication tools), to generate filesystem or
   special images, etc. In this case, they are present in the "Host
   utilities" submenu of menuconfig.

Your package does not fall in any of those categories. How will you
trigger the build of this package? By manually calling "make
host-imagemagick" ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
