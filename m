From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 12 Jul 2019 11:08:07 +0200
Subject: [Buildroot] [PATCH 1/1] package/gstreamer1: fix build with NLS
In-Reply-To: <20190711165655.8850-1-fontaine.fabrice@gmail.com>
References: <20190711165655.8850-1-fontaine.fabrice@gmail.com>
Message-ID: <fea8d27c-a463-3daf-b668-08885290493a@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On 11/07/2019 18:56, Fabrice Fontaine wrote:
> Fixes:
>  - http://autobuild.buildroot.org/results/6d3be9feb301495b079eff6283f1cbed9603dc42
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/gstreamer1/gstreamer1/gstreamer1.mk | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/package/gstreamer1/gstreamer1/gstreamer1.mk b/package/gstreamer1/gstreamer1/gstreamer1.mk
> index cea933be84..023cf4e85e 100644
> --- a/package/gstreamer1/gstreamer1/gstreamer1.mk
> +++ b/package/gstreamer1/gstreamer1/gstreamer1.mk
> @@ -33,6 +33,9 @@ GSTREAMER1_DEPENDENCIES = \
>  	host-pkgconf \
>  	libglib2 \
>  	$(if $(BR2_PACKAGE_LIBUNWIND),libunwind) \
> -	$(if $(BR2_PACKAGE_VALGRIND),valgrind)
> +	$(if $(BR2_PACKAGE_VALGRIND),valgrind) \
> +	$(TARGET_NLS_DEPENDENCIES)
> +
> +GSTREAMER1_LDFLAGS = $(TARGET_LDFLAGS) $(TARGET_NLS_LIBS)

 Adam, can you respin the rest of the gst -> meson series taking this into account?

 Regards,
 Arnout

>  
>  $(eval $(meson-package))
> 
