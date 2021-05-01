From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 1 May 2021 14:47:10 +0200
Subject: [Buildroot] [PATCH v1] package/sane-backends: poppler-glib
 needs cairo
In-Reply-To: <20210412193228.13226-1-ps.report@gmx.net>
References: <20210412193228.13226-1-ps.report@gmx.net>
Message-ID: <153b0687-cd0f-ad87-0263-1e1c687f527d@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 12/04/2021 21:32, Peter Seiderer wrote:
> - poppler-glib depends on cairo (see poppler-0.84.0/CMakeLists.txt):
> 
>   185 else()
>   186   set(CAIRO_FEATURE "#undef POPPLER_HAS_CAIRO")
>   187   set(ENABLE_GLIB OFF)
>   188 endif()
> 
> Fixes:
> 
>   - http://autobuild.buildroot.net/results/9a345f82c7a010f6b2a3361f25b14caefa9dcbef
> 
>   checking for POPPLER_GLIB... no
>   configure: error: poppler-glib requested but not found
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  package/sane-backends/sane-backends.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/sane-backends/sane-backends.mk b/package/sane-backends/sane-backends.mk
> index 697aa3252b..a8f7466f70 100644
> --- a/package/sane-backends/sane-backends.mk
> +++ b/package/sane-backends/sane-backends.mk
> @@ -61,7 +61,7 @@ else
>  SANE_BACKENDS_CONF_OPTS += --without-libcurl
>  endif
>  
> -ifeq ($(BR2_PACKAGE_POPPLER)$(BR2_PACKAGE_LIBGLIB2),yy)
> +ifeq ($(BR2_PACKAGE_POPPLER)$(BR2_PACKAGE_CAIRO)$(BR2_PACKAGE_LIBGLIB2),yyy)
>  SANE_BACKENDS_DEPENDENCIES += poppler libglib2
>  SANE_BACKENDS_CONF_OPTS += --with-poppler-glib
>  else
> 
