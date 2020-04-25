From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 25 Apr 2020 22:58:23 +0200
Subject: [Buildroot] [PATCH v2 2/3] package/mesa3d-headers: fix install
 of dri.pc
In-Reply-To: <20191023062220.5646-2-bernd.kuhls@t-online.de>
References: <20191023062220.5646-1-bernd.kuhls@t-online.de>
 <20191023062220.5646-2-bernd.kuhls@t-online.de>
Message-ID: <20200425225823.2f68e8ef@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Bernd,

On Wed, 23 Oct 2019 08:22:19 +0200
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> Due to the switch of mesa3d to the meson build system the upstream
> tarball does not include dri.pc.in anymore, it is created during the
> build now:
> https://cgit.freedesktop.org/mesa/mesa/tree/src/mesa/drivers/dri/meson.build?h=19.2#n93
> 
> In order to provide dri.pc we need to add a version taken from a dri-
> based mesa3d build to our source repository, by doing so we can reduce
> the number of sed commands.

I am sorry, but I don't understand the reasoning behind this patch. If
the new meson build system produces a dri.pc file, why don't we use it?
What is wrong with it?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
