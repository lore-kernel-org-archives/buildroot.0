From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Jul 2016 23:21:47 +0200
Subject: [Buildroot] [PATCH] package/qjson: not available for static
	builds
In-Reply-To: <1467666414-25116-1-git-send-email-yann.morin.1998@free.fr>
References: <1467666414-25116-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20160704232147.1102aafa@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  4 Jul 2016 23:06:54 +0200, Yann E. MORIN wrote:
> Fixes:
>     http://autobuild.buildroot.org/results/ffa/ffa343702727e118bb98b9c273bd0605de7e75e2/
>     http://autobuild.buildroot.org/results/3ca/3ca05b777789c58b0621a100490373416846aa87/
>     http://autobuild.buildroot.org/results/a4f/a4f3f9c79731c69082f70c3841c012c576517921/
>     ...
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> ---
>  package/qjson/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/qjson/Config.in b/package/qjson/Config.in
> index 0f0cc09..9ad164f 100644
> --- a/package/qjson/Config.in
> +++ b/package/qjson/Config.in
> @@ -1,5 +1,6 @@
>  config BR2_PACKAGE_QJSON
>  	bool "qjson"
> +	depends on !BR2_STATIC_LIBS
>  	depends on BR2_PACKAGE_QT || BR2_PACKAGE_QT5
>  	help
>  	  QJson is a Qt-based library that maps JSON data to

Config.in comment perhaps ? :-)

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
