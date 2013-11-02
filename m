From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 2 Nov 2013 19:00:19 +0100
Subject: [Buildroot] [PATCH] libvpx: needs thread support
In-Reply-To: <1383408297-17438-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1383408297-17438-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20131102180019.GI3542@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2013-11-02 17:04 +0100, Thomas Petazzoni spake thusly:
> Fixes:
> 
>   http://autobuild.buildroot.org/results/8de/8def7e54e4fecb7df350443824c00b53d1c61c01/build-end.log
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

> ---
>  package/gstreamer1/gst1-plugins-good/Config.in | 4 ++++
>  package/libvpx/Config.in                       | 4 ++++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/package/gstreamer1/gst1-plugins-good/Config.in b/package/gstreamer1/gst1-plugins-good/Config.in
> index 3342208..a9308c7 100644
> --- a/package/gstreamer1/gst1-plugins-good/Config.in
> +++ b/package/gstreamer1/gst1-plugins-good/Config.in
> @@ -335,9 +335,13 @@ comment "taglib needs a toolchain w/ C++"
>  config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_VPX
>  	bool "vpx (webm)"
>  	select BR2_PACKAGE_LIBVPX
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # libvpx
>  	help
>  	  VP8 plugin
>  
> +comment "libvpx needs a toolchain w/ threads"
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS
> +
>  config BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_WAVPACK
>  	bool "wavpack (*.wv audio)"
>  	select BR2_PACKAGE_WAVPACK
> diff --git a/package/libvpx/Config.in b/package/libvpx/Config.in
> index 1332c56..0ed3e1a 100644
> --- a/package/libvpx/Config.in
> +++ b/package/libvpx/Config.in
> @@ -1,7 +1,11 @@
>  config BR2_PACKAGE_LIBVPX
>  	bool "libvpx"
> +	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	help
>  	  A high-quality, open video format that's freely available to
>  	  everyone.
>  
>  	  http://webmproject.org
> +
> +comment "libvpx needs a toolchain w/ threads"
> +	depends on !BR2_TOOLCHAIN_HAS_THREADS
> -- 
> 1.8.1.2
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
