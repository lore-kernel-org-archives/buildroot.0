From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 11 Dec 2018 23:01:19 +0100
Subject: [Buildroot] [PATCH] package/wine: host-wine also needs bison
 and flex
In-Reply-To: <20181211162830.1845-1-thomas.petazzoni@bootlin.com>
References: <20181211162830.1845-1-thomas.petazzoni@bootlin.com>
Message-ID: <de138243-fae6-e98f-38f7-db30c915c993@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 11/12/2018 17:28, Thomas Petazzoni wrote:
> Just like the build of the target wine, the build of host wine also
> needs bison and flex, otherwise the build fails with:
> 
> checking for flex... no
> configure: error: no suitable flex found. Please install the 'flex' package.
> 
> (and similarly for bison once host-flex is provided)
> 
> This was detected using per-package directories.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

 Applied to master, thanks.

 Regards,
 Arnout

> ---
>  package/wine/wine.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/wine/wine.mk b/package/wine/wine.mk
> index dc559efd95..78c8e6ab63 100644
> --- a/package/wine/wine.mk
> +++ b/package/wine/wine.mk
> @@ -10,6 +10,7 @@ WINE_SITE = https://dl.winehq.org/wine/source/3.0
>  WINE_LICENSE = LGPL-2.1+
>  WINE_LICENSE_FILES = COPYING.LIB LICENSE
>  WINE_DEPENDENCIES = host-bison host-flex host-wine
> +HOST_WINE_DEPENDENCIES = host-bison host-flex
>  
>  # Wine needs its own directory structure and tools for cross compiling
>  WINE_CONF_OPTS = \
> 
