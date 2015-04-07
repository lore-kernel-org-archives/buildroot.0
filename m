From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Apr 2015 22:52:46 +0200
Subject: [Buildroot] [PATCH 03/18] package/mplayer: add optional ncurses
 support
In-Reply-To: <1427649094-1240-4-git-send-email-bernd.kuhls@t-online.de>
References: <1427649094-1240-1-git-send-email-bernd.kuhls@t-online.de>
 <1427649094-1240-4-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150407225246.42065043@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sun, 29 Mar 2015 19:11:19 +0200, Bernd Kuhls wrote:
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/mplayer/mplayer.mk |    8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/package/mplayer/mplayer.mk b/package/mplayer/mplayer.mk
> index f004ca9..5ecd25a 100644
> --- a/package/mplayer/mplayer.mk
> +++ b/package/mplayer/mplayer.mk
> @@ -45,6 +45,14 @@ else
>  MPLAYER_CONF_OPTS += --disable-freetype
>  endif
>  
> +ifeq ($(BR2_PACKAGE_NCURSES),y)
> +MPLAYER_CONF_OPTS += --enable-termcap

I've removed this line.

> +MPLAYER_DEPENDENCIES += ncurses
> +MPLAYER_EXTRA_LIBS += -lncurses

This line.

And added a comment above to explain why we don't pass --enable-termcap.

And then I applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
