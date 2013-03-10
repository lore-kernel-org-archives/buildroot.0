From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 10 Mar 2013 11:25:27 +0100
Subject: [Buildroot] [PATCH 4/4] directfb: fixing typo in variables
In-Reply-To: <1362908858-6340-5-git-send-email-c.schoenert@gmail.com>
References: <1362908858-6340-1-git-send-email-c.schoenert@gmail.com>
 <1362908858-6340-5-git-send-email-c.schoenert@gmail.com>
Message-ID: <20130310112527.4a82e689@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Carsten Schoenert,

On Sun, 10 Mar 2013 10:47:38 +0100, Carsten Schoenert wrote:
> From: Carsten Schoenert <c.schoenert@gmail.com>
> 
> Signed-off-by: Carsten Schoenert <c.schoenert@gmail.com>
> ---
>  package/directfb/Config.in   |    4 ++--
>  package/directfb/directfb.mk |    4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/directfb/Config.in b/package/directfb/Config.in
> index 3d22e15..f5759db 100644
> --- a/package/directfb/Config.in
> +++ b/package/directfb/Config.in
> @@ -115,13 +115,13 @@ config BR2_PACKAGE_DIRECTFB_PNG
>  	default y
>  	select BR2_PACKAGE_LIBPNG
>  
> -config BR2_PACKAGE_DIRECTB_DITHER_RGB16
> +config BR2_PACKAGE_DIRECTFB_DITHER_RGB16
>  	bool "enable advanced dithering of RGB16 surfaces"
>  	help
>  	  Enable dithering when loading images to RGB16 surfaces.
>  	  This increases the data section by 64 KBytes.


This is good, but since you're renaming configuration options, you
should add something to the main Config.in.legacy:

config BR2_PACKAGE_DIRECTB_DITHER_RGB16
	bool "DirectFB RGB16 dithering option has been renamed"
	select BR2_PACKAGE_DIRECTFB_DITHER_RGB16
	select BR2_LEGACY

This way, users who will upgrade will be automatically notified of the
option rename.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
