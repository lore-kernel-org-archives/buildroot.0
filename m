From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 13 Apr 2017 22:48:48 +0200
Subject: [Buildroot] [PATCH v3] atest: new package
In-Reply-To: <1491759842-27293-1-git-send-email-festevam@gmail.com>
References: <1491759842-27293-1-git-send-email-festevam@gmail.com>
Message-ID: <20170413224848.393b11be@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  9 Apr 2017 14:44:02 -0300, Fabio Estevam wrote:

> diff --git a/package/atest/Config.in b/package/atest/Config.in
> new file mode 100644
> index 0000000..ede739e
> --- /dev/null
> +++ b/package/atest/Config.in
> @@ -0,0 +1,12 @@
> +config BR2_PACKAGE_ATEST
> +	bool "atest"
> +	select BR2_PACKAGE_ALSA_LIB
> +	select BR2_PACKAGE_LIBEV
> +	depends on !BR2_TOOLCHAIN_USES_UCLIBC # uclibc lacks wordexp
> +	depends on BR2_TOOLCHAIN_HAS_THREADS # alsa-lib
> +	depends on !BR2_bfin # libev
> +	help
> +	  atest is a test software for checking ALSA Asoc drivers
> +	  concerning the proper frame generation and capture.
> +
> +	  https://github.com/amouiche/atest

A Config.in comment was missing here to show the glibc/musl+thread
dependency, so I've added that.

Applied with this issue fixed. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
