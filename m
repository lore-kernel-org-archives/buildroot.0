From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 10 Jul 2016 22:30:50 +0200
Subject: [Buildroot] [PATCH] package/efl: disable libevas jp2k loader
In-Reply-To: <1467928869-2412-1-git-send-email-romain.naour@gmail.com>
References: <1467928869-2412-1-git-send-email-romain.naour@gmail.com>
Message-ID: <a369a0e0-7106-3f91-ebc7-be6703c90765@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

Le 08/07/2016 ? 00:01, Romain Naour a ?crit :
> When the support for JP2K is requested, the configure script is looking
> for libopenjpeg1.pc which is not provided by the openjpeg package since
> it's too recent (currently v2.1).
> 
> Mark BR2_PACKAGE_EFL_JP2K as broken until a new version of the efl
> stack support the new openjpeg library.
> 
> Fixes:
> http://autobuild.buildroot.net/results/ff1/ff1dbbc6cffdb5b2550b3613295151ff9fa964d6

This patch has been marked accepted in patch work but not commited, I changed it
to "new" in patchwork.

It seems that efl jp2k support require MJ2 codecs support in the library but
openjpeg doesn't build at all if this support is enabled...

So lets mark this support as broken until a new version of openjpeg is released.

Best regards,
Romain


> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  package/efl/Config.in | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/efl/Config.in b/package/efl/Config.in
> index 4ab1ec4..ee1a39d 100644
> --- a/package/efl/Config.in
> +++ b/package/efl/Config.in
> @@ -151,9 +151,12 @@ config BR2_PACKAGE_EFL_PNG
>  	  This enables the loader code that loads png files using
>  	  libpng.
>  
> +# JP2K support require openjpeg 1.x (libopenjpeg1.pc) which is not
> +# available in Buildroot anymore.
>  config BR2_PACKAGE_EFL_JP2K
>  	bool "libevas jp2k loader"
>  	select BR2_PACKAGE_OPENJPEG
> +	depends on BROKEN # require openjpeg 1.x
>  	help
>  	  This enables the loader code that loads jp2k files using
>  	  openjpeg.
> 
