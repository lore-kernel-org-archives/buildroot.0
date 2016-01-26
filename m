From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 26 Jan 2016 23:32:59 +0100
Subject: [Buildroot] [PATCH 19/21] openal: add missing
 BR2_TOOLCHAIN_HAS_SYNC_4 dependency
In-Reply-To: <1453676887-31236-20-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1453676887-31236-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1453676887-31236-20-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20160126223259.GF3462@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, all,

On 2016-01-25 00:08 +0100, Thomas Petazzoni spake thusly:
> Fixes:
> 
>   http://autobuild.buildroot.org/results/314fb8da3ca87984e9240d67ff233e2f999ae89e/
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
>  package/gstreamer1/gst1-plugins-bad/Config.in | 2 ++
>  package/openal/Config.in                      | 2 ++
>  2 files changed, 4 insertions(+)
> 
> diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
> index f02be34..0dc217e 100644
> --- a/package/gstreamer1/gst1-plugins-bad/Config.in
> +++ b/package/gstreamer1/gst1-plugins-bad/Config.in
> @@ -566,9 +566,11 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_OPENAL
>  	bool "openal"
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>  	select BR2_PACKAGE_OPENAL
>  
>  comment "openal plugin needs a toolchain w/ NPTL, C++"
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>  	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL \
>  		|| !BR2_INSTALL_LIBSTDCPP
>  
> diff --git a/package/openal/Config.in b/package/openal/Config.in
> index 4a73f45..b497e26 100644
> --- a/package/openal/Config.in
> +++ b/package/openal/Config.in
> @@ -2,6 +2,7 @@ config BR2_PACKAGE_OPENAL
>  	bool "openal"
>  	depends on BR2_INSTALL_LIBSTDCPP
>  	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>  	help
>  	  OpenAL provides capabilities for playing audio in a virtual
>  	  3D environment. Distance attenuation, doppler shift, and
> @@ -11,5 +12,6 @@ config BR2_PACKAGE_OPENAL
>  	  http://kcat.strangesoft.net/openal.html
>  
>  comment "openal needs a toolchain w/ NPTL, C++"
> +	depends on BR2_TOOLCHAIN_HAS_SYNC_4
>  	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL \
>  		|| !BR2_INSTALL_LIBSTDCPP
> -- 
> 2.6.4
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
