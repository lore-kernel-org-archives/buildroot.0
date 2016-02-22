From: gwenhael.goavec <gwenj@trabucayre.com>
Date: Mon, 22 Feb 2016 15:23:25 +0100
Subject: [Buildroot] [PATCH 01/10] package/gnuradio: add optional
 support for orc
In-Reply-To: <1456076099-19607-1-git-send-email-bernd.kuhls@t-online.de>
References: <1456076099-19607-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20160222152325.1717b196@x230.trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernd,

Reviewed-by: "Gwenhael Goavec-Merou" <gwenhael.goavec-merou@trabucayre.com>
Tested-by: "Gwenhael Goavec-Merou" <gwenhael.goavec-merou@trabucayre.com>

Best regards,

Gwenhael

On Sun, 21 Feb 2016 18:34:50 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> When orc was compiled before, gnuradio will use it as optional
> dependency:
> 
> $ output/host/usr/bin/x86_64-linux-readelf -a
> output/target/usr/bin/gnuradio-config-info | grep NEEDED [...]
>  0x0000000000000001 (NEEDED)             Shared library:
> [liborc-0.4.so.0] [...]
> 
> Apparently there is no option provided by the build system to
> en-/disable support for orc:
> https://github.com/gnuradio/volk/blob/41b4df055b2c8d4f2c23ad2bdc60c0b47b4f0dd8/lib/CMakeLists.txt#L449
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/gnuradio/gnuradio.mk | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/gnuradio/gnuradio.mk
> b/package/gnuradio/gnuradio.mk index fc5cd1f..b7dbcb9 100644
> --- a/package/gnuradio/gnuradio.mk
> +++ b/package/gnuradio/gnuradio.mk
> @@ -17,6 +17,10 @@ GNURADIO_DEPENDENCIES = \
>  	host-swig \
>  	boost
>  
> +ifeq ($(BR2_PACKAGE_ORC),y)
> +GNURADIO_DEPENDENCIES += orc
> +endif
> +
>  GNURADIO_CONF_OPTS = \
>  	-DENABLE_DEFAULT=OFF \
>  	-DENABLE_VOLK=ON \
> -- 
> 2.7.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
