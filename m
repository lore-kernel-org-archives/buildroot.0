From: Lionel Landwerlin <llandwerlin@gmail.com>
Date: Fri, 15 Jan 2010 21:35:37 +0100
Subject: [Buildroot] [git commit master] qt: ensure libglib2 is built
 before qt if enabled for Qt's glib support
In-Reply-To: <20100115134832.702BA776C0@busybox.osuosl.org>
References: <20100115134832.702BA776C0@busybox.osuosl.org>
Message-ID: <1263587737.5454.12.camel@coalu.atr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le vendredi 15 janvier 2010 ? 14:48 +0100, Peter Korsgaard a ?crit :
> commit: http://git.buildroot.net/buildroot/commit/?id=8086dfa32fafb91102be5b7516088cde9f2b8699
> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
> 
> Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
> ---
>  package/qt/qt.mk |    5 +++++
>  1 files changed, 5 insertions(+), 0 deletions(-)
> 
> diff --git a/package/qt/qt.mk b/package/qt/qt.mk
> index 4b6876f..a3a466a 100644
> --- a/package/qt/qt.mk
> +++ b/package/qt/qt.mk
> @@ -48,6 +48,11 @@ else
>  QT_CONFIGURE+= -no-qt3support
>  endif
>  
> +# ensure glib is built first if enabled for Qt's glib support
> +ifeq ($(BR2_PACKAGE_LIBGLIB2),y)
> +QT_DEP_LIBS+=libglib2
> +endif
> +
>  
>  ### Pixel depths
>  QT_PIXEL_DEPTHS := # empty

Hi Peter,

There is also an option in the Qt configuration for glib integration. It
would be nice to have access to it through KConfig.

--
Lionel
