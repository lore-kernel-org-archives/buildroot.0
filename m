From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 5 Jul 2017 09:36:42 +0200
Subject: [Buildroot] [PATCH v2 1/1] package/gnuradio: link with
 libatomic when needed
In-Reply-To: <20170625084806.27166-1-bernd.kuhls@t-online.de>
References: <20170625084806.27166-1-bernd.kuhls@t-online.de>
Message-ID: <20170705093642.6e22c849@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 25 Jun 2017 10:48:06 +0200, Bernd Kuhls wrote:

>  GNURADIO_CONF_OPTS = \
> +	-DCMAKE_C_FLAGS="$(TARGET_CFLAGS) $(GNURADIO_CFLAGS)" \
>  	-DENABLE_DEFAULT=OFF \
>  	-DENABLE_VOLK=ON \
>  	-DENABLE_GNURADIO_RUNTIME=ON
> @@ -30,13 +31,17 @@ GNURADIO_CONF_OPTS = \
>  # compile time.
>  GNURADIO_INSTALL_STAGING = YES
>  
> +ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
> +GNURADIO_CFLAGS += -latomic

Is there some CMAKE_LD_FLAGS, or linker flags, or something? This would
be more appropriate for a linker flag.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
