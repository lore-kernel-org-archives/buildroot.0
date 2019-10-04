From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Sat, 5 Oct 2019 00:18:57 +0200
Subject: [Buildroot] [PATCH 1/1] package/ytree: fix static build with
 readline
In-Reply-To: <20190925165248.6067-1-fontaine.fabrice@gmail.com>
References: <20190925165248.6067-1-fontaine.fabrice@gmail.com>
Message-ID: <f63245af-4e69-3bb5-b15e-5fad68330148@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Fabrice,

On 9/25/19 6:52 PM, Fabrice Fontaine wrote:
> Fixes:
>   - http://autobuild.buildroot.org/results/b1a1392636467f8c07504fa6cfb17962764820ae
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

> ---
>   package/ytree/ytree.mk | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/ytree/ytree.mk b/package/ytree/ytree.mk
> index 2d2a6946f7..824ace7155 100644
> --- a/package/ytree/ytree.mk
> +++ b/package/ytree/ytree.mk
> @@ -14,9 +14,9 @@ YTREE_CFLAGS = -DCOLOR_SUPPORT $(TARGET_CFLAGS)
>   YTREE_LDFLAGS = -lncurses $(TARGET_LDFLAGS)
>   
>   ifeq ($(BR2_PACKAGE_READLINE),y)
> -YTREE_DEPENDENCIES += readline
> +YTREE_DEPENDENCIES += host-pkgconf readline
>   YTREE_CFLAGS += -DREADLINE_SUPPORT
> -YTREE_LDFLAGS += -lreadline
> +YTREE_LDFLAGS += `$(PKG_CONFIG_HOST_BINARY) --libs readline`
>   endif
>   
>   define YTREE_BUILD_CMDS
> 

-- 
Giulio Benetti
Benetti Engineering sas
