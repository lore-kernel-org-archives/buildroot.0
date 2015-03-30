From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 30 Mar 2015 22:56:58 +0200
Subject: [Buildroot] [PATCH 02/18] package/mplayer: add optional giflib
 support
In-Reply-To: <1427649094-1240-3-git-send-email-bernd.kuhls@t-online.de>
References: <1427649094-1240-1-git-send-email-bernd.kuhls@t-online.de>
 <1427649094-1240-3-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150330225658.091b8e72@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 29 Mar 2015 19:11:18 +0200, Bernd Kuhls wrote:
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/mplayer/mplayer.mk |    6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/package/mplayer/mplayer.mk b/package/mplayer/mplayer.mk
> index 192a42e..f004ca9 100644
> --- a/package/mplayer/mplayer.mk
> +++ b/package/mplayer/mplayer.mk
> @@ -100,6 +100,11 @@ else
>  MPLAYER_CONF_OPTS += --disable-live
>  endif
>  
> +ifeq ($(BR2_PACKAGE_GIFLIB),y)
> +MPLAYER_DEPENDENCIES += giflib
> +MPLAYER_EXTRA_LIBS += -lgif
> +endif

Any reason not to use --enable-gif / --disable-gif here? Then you don't
need to pass a --extra-libs value. I've applied the patch with this
change, as it seems to build fine. Let me know if that causes a problem.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
