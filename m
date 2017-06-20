From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 20 Jun 2017 18:58:45 +0200
Subject: [Buildroot] [PATCH] barebox: support multiple image files
In-Reply-To: <20170620153000.18263-1-m.niestroj@grinn-global.com>
References: <20170620153000.18263-1-m.niestroj@grinn-global.com>
Message-ID: <20170620185845.41140a53@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 20 Jun 2017 17:30:00 +0200, Marcin Niestroj wrote:

> diff --git a/boot/barebox/barebox-aux/Config.in b/boot/barebox/barebox-aux/Config.in
> index ec3b97cb8..8f21a0c45 100644
> --- a/boot/barebox/barebox-aux/Config.in
> +++ b/boot/barebox/barebox-aux/Config.in
> @@ -32,7 +32,7 @@ config BR2_TARGET_BAREBOX_AUX_CONFIG_FRAGMENT_FILES
>  config BR2_TARGET_BAREBOX_AUX_IMAGE_FILE
>  	string "Image filename"

Maybe change to:

	string "Image file names"

>  	help
> -	  Name of the generated barebox image, which will be copied to
> +	  Name of the generated barebox images, which will be copied to

And this to:

	  Space-separated list of barebox images which will be copied to
	  the images directory.

> diff --git a/boot/barebox/barebox/Config.in b/boot/barebox/barebox/Config.in
> index 3d8d01456..d29e742d6 100644
> --- a/boot/barebox/barebox/Config.in
> +++ b/boot/barebox/barebox/Config.in
> @@ -33,7 +33,7 @@ config BR2_TARGET_BAREBOX_CONFIG_FRAGMENT_FILES
>  config BR2_TARGET_BAREBOX_IMAGE_FILE
>  	string "Image filename"
>  	help
> -	  Name of the generated barebox image, which will be copied to
> +	  Name of the generated barebox images, which will be copied to
>  	  the images directory.

And of course same here.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
