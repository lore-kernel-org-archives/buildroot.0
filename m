From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 11 Sep 2019 15:52:18 +0200
Subject: [Buildroot] [PATCH v2] package/minimodem: new package
In-Reply-To: <20190909182345.1615-1-user@vserver64>
References: <20190909182345.1615-1-user@vserver64>
Message-ID: <20190911155218.35ff3c63@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Alexander,

On Mon,  9 Sep 2019 18:23:45 +0000
Alexander Kurz <akurz@blala.de> wrote:

> diff --git a/package/minimodem/Config.in b/package/minimodem/Config.in
> new file mode 100644
> index 0000000000..9d2afd6798
> --- /dev/null
> +++ b/package/minimodem/Config.in
> @@ -0,0 +1,14 @@
> +config BR2_PACKAGE_MINIMODEM
> +	select BR2_PACKAGE_FFTW_SINGLE
> +	depends on BR2_PACKAGE_LIBSNDFILE || BR2_PACKAGE_ALSA_LIB_PCM || \
> +		BR2_PACKAGE_PULSEAUDIO

I changed this to a select, as was initially suggested by Arnout.

> +	bool "minimodem"

The bool statement should be before the select/depends on. This is just
a Buildroot rule, so that we do things consistently between packages. I
think it is reported by "make check-package".

> +MINIMODEM_DEPENDENCIES += fftw-single

A dependency on host-pkgconf was missing here.

I fixed those different issues, and applied. Thanks a lot for your
contribution!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
