From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 6 Sep 2015 22:27:06 +0200
Subject: [Buildroot] [PATCH 1/1] package/libsoundtouch: needs c++
In-Reply-To: <1441542956-6600-1-git-send-email-bernd.kuhls@t-online.de>
References: <1441542956-6600-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150906202706.GE3580@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bernd, All,

On 2015-09-06 14:35 +0200, Bernd Kuhls spake thusly:
> Fixes
> http://autobuild.buildroot.net/results/a92/a92fcb94492edfdf15c1e18c13b03d75c0210382/
> http://autobuild.buildroot.net/results/d1d/d1d9a17a93f5ab61b4fbab67e0b61e79709d411f/
> http://autobuild.buildroot.net/results/d55/d5548c5dbbb94bef8eccf614962d0a4fe5c91133/
> http://autobuild.buildroot.net/results/798/798f103e066f94314e5664b8bcad7337e40a3fd7/
> http://autobuild.buildroot.net/results/484/48407da02451382a1cf7e0c16efa7db8a338ded0/
> http://autobuild.buildroot.net/results/4a0/4a0ac131884c0bc231c9f1dfd356cb533fbe5f0b/
> http://autobuild.buildroot.net/results/162/1629703bc3160143875a1771f1ac25a079ec94ff/
> http://autobuild.buildroot.net/results/be1/be1b69d0394de37615d3a3d2d4c4e25125b71ec2/
> http://autobuild.buildroot.net/results/32b/32b9512de01af6417d2db668dc2d75953119f8ab/
> http://autobuild.buildroot.net/results/1c0/1c0d433d435639f4355098fc6915c3588f922cad/
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/libsoundtouch/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/libsoundtouch/Config.in b/package/libsoundtouch/Config.in
> index 396036f..fdbc075 100644
> --- a/package/libsoundtouch/Config.in
> +++ b/package/libsoundtouch/Config.in
> @@ -1,8 +1,12 @@
>  config BR2_PACKAGE_LIBSOUNDTOUCH
>  	bool "libsoundtouch"
> +	depends on BR2_INSTALL_LIBSTDCPP
>  	help
>  	  SoundTouch is an open-source audio processing library for
>  	  changing the Tempo, Pitch and Playback Rates of audio streams
>  	  or audio files.
>  
>  	  http://www.surina.net/soundtouch
> +
> +comment "libsoundtouch needs a toolchain w/ C++"
> +	depends on !BR2_INSTALL_LIBSTDCPP
> -- 
> 2.1.4
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
