From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Aug 2013 09:39:47 +0200
Subject: [Buildroot] [PATCH 2/6] sunxi-mali: bug fixes for pc and init
 script
In-Reply-To: <1377373321-29732-3-git-send-email-spenser@gillilanding.com>
References: <1377373321-29732-1-git-send-email-spenser@gillilanding.com>
 <1377373321-29732-3-git-send-email-spenser@gillilanding.com>
Message-ID: <20130827093947.4b56f28d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Spenser Gilliland,

On Sat, 24 Aug 2013 14:41:57 -0500, Spenser Gilliland wrote:
> fix bad escape sequences in init script and add correct lib for pc file.
> 
> Signed-off-by: Spenser Gilliland <spenser@gillilanding.com>
> ---
>  package/sunxi-mali/S80mali   | 2 +-
>  package/sunxi-mali/glesv2.pc | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/sunxi-mali/S80mali b/package/sunxi-mali/S80mali
> index 6f51cc4..ecfbab9 100644
> --- a/package/sunxi-mali/S80mali
> +++ b/package/sunxi-mali/S80mali
> @@ -5,7 +5,7 @@ install_driver() {
>  	OPTS=$2
>  
>  	modprobe $DRIVER $OPTS
> -	maj=$(awk "$$2==\"${DRIVER}\" { print $$1; }" /proc/devices)
> +	maj=$(awk "\$2==\"${DRIVER}\" { print \$1; }" /proc/devices)
>  
>  	rm -f /dev/${DRIVER}
>  
> diff --git a/package/sunxi-mali/glesv2.pc b/package/sunxi-mali/glesv2.pc
> index 4e112ee..9273678 100644
> --- a/package/sunxi-mali/glesv2.pc
> +++ b/package/sunxi-mali/glesv2.pc
> @@ -7,6 +7,6 @@ Name: glesv2
>  Description: ARM Mali implementation of OpenGL ESv2
>  Version: 2.0
>  Requires:
> -Libs: -L${libdir} -lGLESv2 -lGLES_CM -lUMP
> +Libs: -L${libdir} -lGLESv2 -lGLESv1_CM -lUMP
>  Cflags: -I${includedir}/GLES2
>  

I haven't tested this, but it looks ok.

Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Peter: I believe we can apply this one for 2013.08.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
