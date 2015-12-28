From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 28 Dec 2015 21:42:45 +0100
Subject: [Buildroot] [PATCH 2/2] package/jack2: add missing optional
 dependencies
In-Reply-To: <5f7632a3d6ed3e3ab0f324e31be21a0ea18245d4.1451329553.git.yann.morin.1998@free.fr>
References: <cover.1451329553.git.yann.morin.1998@free.fr>
 <5f7632a3d6ed3e3ab0f324e31be21a0ea18245d4.1451329553.git.yann.morin.1998@free.fr>
Message-ID: <20151228214245.7b727b44@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

On Mon, 28 Dec 2015 20:08:55 +0100, Yann E. MORIN wrote:

> +ifeq ($(BR2_PACKAGE_OPUS),y)
> +JACK2_DEPENDENCIES += opus
> +endif
> +
> +ifeq ($(BR2_PACKAGE_READLINE),y)
> +JACK2_DEPENDENCIES += readline
> +endif
> +
> +ifeq ($(BR2_PACKAGE_EIGEN),y)
> +JACK2_DEPENDENCIES += eigen
> +endif

I'm fine with the opus and readline dependencies. But for the eigen
dependency, I'm not so sure. linux/wscript defines HAVE_EIGEN3 is eigen
is available. And this symbol is not used anywhere in the jack2 source
code... So it seems like eigen is a useless dependency.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
