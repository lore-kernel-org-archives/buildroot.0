From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 Jan 2019 14:11:32 +0100
Subject: [Buildroot] [PATCH] package/mesa3d: override dri path
In-Reply-To: <20190112190743.7780-1-romain.naour@gmail.com>
References: <20190112190743.7780-1-romain.naour@gmail.com>
Message-ID: <20190113141132.5af03184@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 12 Jan 2019 20:07:43 +0100, Romain Naour wrote:
> Since the bump to 1.5.3, pkgconf prepends the sysroot to all absolute
> paths found in the .pc file.

No, this is not what pkgconf is doing. pkg-config is prepending the
sysroot only to:

 includedir
 libdir
 mapdir
 pkgdatadir
 sdkdir

However, since dridriverdir is defined in the .pc file as being equal
to ${libdir}/dri, it inherits from the sysroot-prefixed libdir path.

I'll fix this up in the commit log when applying.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
