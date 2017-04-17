From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 17 Apr 2017 15:07:36 +0200
Subject: [Buildroot] [PATCH v2] package/aubio: bump to version 0.4.5
In-Reply-To: <20170416205106.28392-1-romain.naour@gmail.com>
References: <20170416205106.28392-1-romain.naour@gmail.com>
Message-ID: <20170417150736.663cc9c5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 16 Apr 2017 22:51:06 +0200, Romain Naour wrote:

> -ifeq ($(BR2_PACKAGE_LIBSAMPLERATE),y)
> +ifeq ($(BR2_PACKAGE_AUBIO_LIBSAMPLERATE),y)

Since none of the other optional dependencies have a sub-option in this
package, what about just:

ifeq ($(BR2_PACKAGE_LIBSAMPLERATE)$(BR2_PACKAGE_FFTW_PRECISION_SINGLE),yy)

Also, I don't quite understand your commit, because libsamplerate is
itself built with --disable-fftw.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
