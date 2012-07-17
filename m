From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 17 Jul 2012 13:46:55 +0200
Subject: [Buildroot] [PATCH] opencv: get rid of unused SSE41 and SSE42
 options
In-Reply-To: <1342518879-30779-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1342518879-30779-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20120717134655.1c2fecc7@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Tue, 17 Jul 2012 11:54:39 +0200,
Thomas Petazzoni <thomas.petazzoni@free-electrons.com> a ?crit :

> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
>  package/opencv/opencv.mk |    2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
> index 10ed5bd..8ae2fd5 100644
> --- a/package/opencv/opencv.mk
> +++ b/package/opencv/opencv.mk
> @@ -62,8 +62,6 @@ OPENCV_CONF_OPT += \
>  	-DENABLE_SSE=$(if $(BR2_X86_CPU_HAS_SSE),ON,OFF)     \
>  	-DENABLE_SSE2=$(if $(BR2_X86_CPU_HAS_SSE2),ON,OFF)   \
>  	-DENABLE_SSE3=$(if $(BR2_X86_CPU_HAS_SSE3),ON,OFF)   \
> -	-DENABLE_SSE41=$(if $(BR2_X86_CPU_HAS_SSE41),ON,OFF) \
> -	-DENABLE_SSE42=$(if $(BR2_X86_CPU_HAS_SSE42),ON,OFF) \
>  	-DENABLE_SSSE3=$(if $(BR2_X86_CPU_HAS_SSSE3),ON,OFF)
>  
>  # Software/3rd-party support options.

Any objections to this patch before I merge it?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
