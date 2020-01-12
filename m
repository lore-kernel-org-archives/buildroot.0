From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 12 Jan 2020 21:32:09 +0100
Subject: [Buildroot] [PATCH 4/6] package/alure: add libvorbis decoder
 option
In-Reply-To: <20200105113204.30356-4-romain.naour@gmail.com>
References: <20200105113204.30356-1-romain.naour@gmail.com>
 <20200105113204.30356-4-romain.naour@gmail.com>
Message-ID: <20200112213209.792636e6@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun,  5 Jan 2020 12:32:02 +0100
Romain Naour <romain.naour@gmail.com> wrote:

> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  package/alure/Config.in | 7 +++++++
>  package/alure/alure.mk  | 8 +++++++-
>  2 files changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/package/alure/Config.in b/package/alure/Config.in
> index 7947e30a1f..20b9e4e4e9 100644
> --- a/package/alure/Config.in
> +++ b/package/alure/Config.in
> @@ -30,6 +30,13 @@ config BR2_PACKAGE_ALURE_OPUS_DECODER
>  	help
>  	  Enables the built-in libopusfile decoder.
>  
> +config BR2_PACKAGE_ALURE_VORBIS_DECODER
> +	bool "vorbis decoder"
> +	select BR2_PACKAGE_LIBVORBIS
> +	select BR2_PACKAGE_OPUS

This doesn't match what you're doing in the .mk file: the .mk file adds
a dependency on libogg and libvorbis, and this is what is correct. So
I've replaced the select BR2_PACKAGE_OPUS by a select
BR2_PACKAGE_LIBOGG.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
