From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 9 Dec 2012 19:20:11 +0100
Subject: [Buildroot] [PATCH 5/8] bmon: needs MMU for fork()
In-Reply-To: <d3711ead28655ab34fded4452b0410dd13c192b1.1355076808.git.thomas.petazzoni@free-electrons.com>
References: <cover.1355076808.git.thomas.petazzoni@free-electrons.com>
 <d3711ead28655ab34fded4452b0410dd13c192b1.1355076808.git.thomas.petazzoni@free-electrons.com>
Message-ID: <20121209192011.32848ccd@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Sun,  9 Dec 2012 19:14:00 +0100, Thomas Petazzoni wrote:

> diff --git a/package/rt-tests/Config.in b/package/rt-tests/Config.in
> index 54cb8d0..1a0592f 100644
> --- a/package/rt-tests/Config.in
> +++ b/package/rt-tests/Config.in
> @@ -1,8 +1,8 @@
>  config BR2_PACKAGE_RT_TESTS
>  	bool "rt-tests"
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
> -	# Too old uClibc, does not provide priority-inheritance
> -	# mutexes
> +	# Too old uClibc on AVR32, does not provide
> +	# priority-inheritance mutexes
>  	depends on !BR2_avr32
>  	help
>  	  Set of utilities for testing the real-time behaviour of a

FWIW, I've pushed at the same location a new version of this branch
that removes this incorrect part (and squashed it properly in the
previous commit).

Sorry for the mess.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
