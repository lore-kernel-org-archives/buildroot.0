From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 4 May 2014 13:29:50 +0200
Subject: [Buildroot] [PATCH 8/8] xbmc: Fix TexturePacker compile
In-Reply-To: <1398968277-9044-9-git-send-email-bernd.kuhls@t-online.de>
References: <1398968277-9044-1-git-send-email-bernd.kuhls@t-online.de>
 <1398968277-9044-9-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <CAGduivyfTiuETZKFUuk5CXzVePeDi7jSx_PUMgjtg1YFWsGFRA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernd, all,

On Thu, May 1, 2014 at 8:17 PM, Bernd Kuhls <bernd.kuhls@t-online.de> wrote:
>
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/xbmc/xbmc.mk |    2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/package/xbmc/xbmc.mk b/package/xbmc/xbmc.mk
> index 8955197..1ab89b4 100644
> --- a/package/xbmc/xbmc.mk
> +++ b/package/xbmc/xbmc.mk
> @@ -26,6 +26,8 @@ XBMC_CONF_ENV = \
>         PYTHON_CPPFLAGS="-I$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)" \
>         PYTHON_SITE_PKG="$(STAGING_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages" \
>         PYTHON_NOVERSIONCHECK="no-check" \
> +       use_texturepacker_native=yes \
> +       USE_TEXTUREPACKER_NATIVE_ROOT="$(HOST_DIR)/usr" \
>         TEXTUREPACKER_NATIVE_ROOT="$(HOST_DIR)/usr"
>
>  XBMC_CONF_OPT +=  \
> --
> 1.7.10.4
What was your issue exactly ?
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
