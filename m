From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 29 Aug 2020 23:03:49 +0200
Subject: [Buildroot] [PATCH] package/uclibc: use HOSTCC_NOCCACHE as
 kconfig HOSTCC
In-Reply-To: <20200829203720.28230-1-yann.morin.1998@free.fr>
References: <20200829203720.28230-1-yann.morin.1998@free.fr>
Message-ID: <20200829230349.133ba05a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 29 Aug 2020 22:37:20 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> uclibc is part of the toolchain, and as such does not have a dependency
> on it. As a consequence, it does not have a dependency on host-ccache,
> when this is needed.
> 
> Usually, host-ccache is built before uclibc, as part of the dependency
> of gcc-initial, hiot-binutils, and a few other host packages that are

hiot-binutils -> host-binutils

> built before uclibc.
> 
> However, during top-level parallel builds, this ordering is only ever
> guaranteed at the beginning of the configure step, and not before.
> 
> But for kconfig-packages, the moment we apply the configuration to
> prepare the .config file is a pseudo step that happens somewhere in
> limbo between the patch step and the configure step. As such, the

I like the "happens somewhere in limbo", that's a good description of
how the kconfig stuff works :-)

> Reported-by: Raphael Jacob <r.jacob2002@gmail.com>
> Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Acked-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Thanks for the great investigation!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
