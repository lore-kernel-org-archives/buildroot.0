From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 22 Nov 2012 11:12:57 +0100
Subject: [Buildroot] [PATCH 04/33] igh-ethercat: disable drivers build
 with kernel 3.6
In-Reply-To: <1353543503-8952-5-git-send-email-s.martin49@gmail.com>
References: <1353543503-8952-1-git-send-email-s.martin49@gmail.com>
 <1353543503-8952-5-git-send-email-s.martin49@gmail.com>
Message-ID: <20121122111257.7cbf0562@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Samuel Martin,

On Thu, 22 Nov 2012 01:17:54 +0100, Samuel Martin wrote:
> Since hardware specific support is available for some given kernel
> releases (mostly for kernel <=3.2), then disable them if kernel 3.6 is
> enable. However, this still allows the generic driver build.
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> ---
>  package/igh-ethercat/Config.in | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/package/igh-ethercat/Config.in b/package/igh-ethercat/Config.in
> index 890bb12..4a0fd75 100644
> --- a/package/igh-ethercat/Config.in
> +++ b/package/igh-ethercat/Config.in
> @@ -6,7 +6,12 @@ config BR2_PACKAGE_IGH_ETHERCAT
>  
>  	  http://www.etherlab.org/en/ethercat/index.php
>  
> -if BR2_PACKAGE_IGH_ETHERCAT
> +if BR2_PACKAGE_IGH_ETHERCAT && !BR2_LINUX_KERNEL_3_6
> +
> +comment "The following drivers are only available for some"
> +comment "releases of the kernel (mostly 2.6.x)."
> +comment "Further details about the kernel/hardware support at:"
> +comment "http://www.etherlab.org/en/ethercat/hardware.php"

I'm sorry but I don't quite understand neither the commit log nor the
comment here. Could you explain a bit more? Is this fixing any sort of
build problem?

Also !BR2_LINUX_KERNEL_3_6 works only if the user isn't using a custom
Git tree or something like that.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
