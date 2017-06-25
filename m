From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 25 Jun 2017 09:59:58 +0200
Subject: [Buildroot] [PATCH 1/1] package/gnuradio: link with libatomic
 when needed
In-Reply-To: <20170625065741.23065-1-bernd.kuhls@t-online.de>
References: <20170625065741.23065-1-bernd.kuhls@t-online.de>
Message-ID: <20170625095958.463d5a51@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 25 Jun 2017 08:57:41 +0200, Bernd Kuhls wrote:
> Fixes
> http://autobuild.buildroot.net/results/528/52825918bf65b23241cd68d99513350703469294/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Thanks for the patch. One question below.

> diff --git a/package/gnuradio/gnuradio.mk b/package/gnuradio/gnuradio.mk
> index 6407dd4f8..5d6ed8f92 100644
> --- a/package/gnuradio/gnuradio.mk
> +++ b/package/gnuradio/gnuradio.mk
> @@ -22,6 +22,7 @@ GNURADIO_DEPENDENCIES += orc
>  endif
>  
>  GNURADIO_CONF_OPTS = \
> +	-DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) $(GNURADIO_CXXFLAGS)" \

So we are now passing -march=armv7-a in CMAKE_CXX_CFLAGS..

> -GNURADIO_CONF_OPTS += -DCMAKE_C_FLAGS="$(TARGET_CFLAGS) -march=armv7-a"

..while it was passed in CMAKE_C_FLAGS before your patch. Is this
working OK? It would deserve a note in the commit log.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
