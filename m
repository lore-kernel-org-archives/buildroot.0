From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Nov 2016 16:25:57 +0100
Subject: [Buildroot] [PATCH 1/1] package/transmission: fix SITE url
In-Reply-To: <20161029191422.22099-1-bernd.kuhls@t-online.de>
References: <20161029191422.22099-1-bernd.kuhls@t-online.de>
Message-ID: <20161101162557.3d1f3930@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 29 Oct 2016 21:14:22 +0200, Bernd Kuhls wrote:
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/transmission/transmission.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/transmission/transmission.mk b/package/transmission/transmission.mk
> index e0cfc2d..923ba40 100644
> --- a/package/transmission/transmission.mk
> +++ b/package/transmission/transmission.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  TRANSMISSION_VERSION = 2.92
> -TRANSMISSION_SITE = http://download.transmissionbt.com/files
> +TRANSMISSION_SITE = https://github.com/transmission/transmission-releases/raw/master
>  TRANSMISSION_SOURCE = transmission-$(TRANSMISSION_VERSION).tar.xz

I really wonder why they have created a separate Github project and
repository to host tarballs, instead of using the Github releases
functionality.

That being said, that's upstream choice, so: patch applied.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
