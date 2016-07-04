From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Jul 2016 23:38:41 +0200
Subject: [Buildroot] [PATCH 09/83 v2] package/mono: use 'menuconfig'
 instead of 'config'+'menu'
In-Reply-To: <1c9519ae3a9607d6d11266c43ae99e77077ccc60.1467624132.git.yann.morin.1998@free.fr>
References: <cover.1467624132.git.yann.morin.1998@free.fr>
 <1c9519ae3a9607d6d11266c43ae99e77077ccc60.1467624132.git.yann.morin.1998@free.fr>
Message-ID: <20160704233841.613b290f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  4 Jul 2016 11:24:20 +0200, Yann E. MORIN wrote:

> -config BR2_PACKAGE_MONO
> +menuconfig BR2_PACKAGE_MONO
>  	bool "mono"
>  	depends on BR2_PACKAGE_MONO_ARCH_SUPPORTS
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
> @@ -14,6 +14,12 @@ config BR2_PACKAGE_MONO
>  
>  	  http://download.mono-project.com/sources/mono/
>  
> +if BR2_PACKAGE_MONO
> +
> +source "package/mono-gtksharp3/Config.in"
> +
> +endif

I want to keep the package inclusions as much as possible in
package/Config.in, so I've not applied this patch, and for the same
reason, I have not applied:

[PATCH 14/83 v2] package/perl: use 'menuconfig' instead of 'config'+'menu'
[PATCH 16/83 v2] package/php: use 'menuconfig' instead of 'config'+'menu'
[PATCH 19/83 v2] package/python{, 3}: move inclusion of external python modules
[PATCH 21/83 v2] package/tcl: use 'menuconfig' instead of 'config'+'menu'

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
