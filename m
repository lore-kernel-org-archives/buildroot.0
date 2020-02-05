From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 5 Feb 2020 17:11:35 +0100
Subject: [Buildroot] [PATCH v2] package/gr-osmosdr: fix dependencies
In-Reply-To: <1580916803-11595-1-git-send-email-gwenj@trabucayre.com>
References: <1580916803-11595-1-git-send-email-gwenj@trabucayre.com>
Message-ID: <20200205161135.GF3131@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Gwenhael, All,

On 2020-02-05 16:33 +0100, Gwenhael Goavec-Merou spake thusly:
> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> gr-osmosdr fails with:
> CMake Error at /somewhere/buildroot/output/host/mipsel-buildroot-linux-gnu/sysroot/usr/lib/cmake/gnuradio/GnuradioConfig.cmake:116 (include):
>   include could not find load file:
> 
>     /somewhere/buildroot/output/host/mipsel-buildroot-linux-gnu/sysroot/usr/lib/cmake/gnuradio/gnuradio-filterConfig.cmake
> Call Stack (most recent call first):
>   CMakeLists.txt:45 (find_package)
> 
> gr-osmosdr depends on BR2_PACKAGE_GNURADIO_BLOCKS, BR2_PACKAGE_GNURADIO_FFT and
> BR2_PACKAGE_GNURADIO_FILTER.
> 
> fix:
> - http://autobuild.buildroot.net/results/1781db2b8c28641167f7a39a4d799930db13f9bf/
> 
> Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> Changes v1 -> v2:
>  * add explicitly all dependencies (Thomas)
> ---
>  package/gr-osmosdr/Config.in | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/package/gr-osmosdr/Config.in b/package/gr-osmosdr/Config.in
> index f26380371f..1e80137f35 100644
> --- a/package/gr-osmosdr/Config.in
> +++ b/package/gr-osmosdr/Config.in
> @@ -2,6 +2,8 @@ config BR2_PACKAGE_GR_OSMOSDR
>  	bool "gr-osmosdr"
>  	depends on BR2_PACKAGE_GNURADIO
>  	select BR2_PACKAGE_GNURADIO_BLOCKS
> +	select BR2_PACKAGE_GNURADIO_FFT
> +	select BR2_PACKAGE_GNURADIO_FILTER
>  	help
>  	  GNU Radio block for interfacing with various radio hardware
>  
> -- 
> 2.24.1
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
