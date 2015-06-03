From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 03 Jun 2015 23:05:21 +0200
Subject: [Buildroot] [PATCH 29/32 v2] package/matchbox: xlib_libXfixes
 is an optional dependency
In-Reply-To: <67c7e9a9c9b0c7832067f74e8914279081685044.1433362840.git.yann.morin.1998@free.fr>
References: <cover.1433362840.git.yann.morin.1998@free.fr>
 <67c7e9a9c9b0c7832067f74e8914279081685044.1433362840.git.yann.morin.1998@free.fr>
Message-ID: <556F6C11.3040007@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/03/15 22:41, Yann E. MORIN wrote:
> matchbox can use xlib_libXfixes to completely and really hide the
> cursor, so build-depend on it if enabled.
> 
> Reported-by: Arnout Vandecappelle <arnout@mind.be>
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

 Regards,
 Arnout

> ---
>  package/matchbox/matchbox.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/matchbox/matchbox.mk b/package/matchbox/matchbox.mk
> index 3b6a0eb..9094b1e 100644
> --- a/package/matchbox/matchbox.mk
> +++ b/package/matchbox/matchbox.mk
> @@ -39,4 +39,8 @@ ifeq ($(BR2_PACKAGE_XLIB_LIBXCURSOR),y)
>  MATCHBOX_DEPENDENCIES += xlib_libXcursor
>  endif
>  
> +ifeq ($(BR2_PACKAGE_XLIB_LIBXFIXES),y)
> +MATCHBOX_DEPENDENCIES += xlib_libXfixes
> +endif
> +
>  $(eval $(autotools-package))
> 


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
