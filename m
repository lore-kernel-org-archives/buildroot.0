From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 11 Apr 2019 19:20:26 +0200
Subject: [Buildroot] [PATCH] package/mesa3d: add KMSRO support for vc4
In-Reply-To: <20190408095838.22227-1-romain.naour@smile.fr>
References: <20190408095838.22227-1-romain.naour@smile.fr>
Message-ID: <20190411192026.1a5e0503@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  8 Apr 2019 11:58:38 +0200
Romain Naour <romain.naour@smile.fr> wrote:

> kmsro allow to support KMS displays with the renderonly layer used to attach a GPU [1].
> 
> Quote from mesa3d meson.build:
> "kmsro driver requires one or more renderonly drivers (vc4, etnaviv, freedreno)"
> But only vc4 support is available by using the (deprecated) autotools build system [2].
> 
> This will also be used by mesa to support KMSRO with the upcomming Panfrost and Lima Gallium drivers.
> 
> [1] https://cgit.freedesktop.org/mesa/mesa/commit/?id=ed65aeec7810a7d98a19461ba933bd77268cb0f6
> [2] https://cgit.freedesktop.org/mesa/mesa/tree/configure.ac?h=mesa-19.0.1#n2864
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
> Bernd, are you working on a patch to switch mesa3d to a meson package ?
> Thanks!
> ---
>  package/mesa3d/Config.in | 17 +++++++++++++++++
>  package/mesa3d/mesa3d.mk |  1 +
>  2 files changed, 18 insertions(+)

Applied to master, thanks. However, I had to rewrap the commit log
message and the comments in the Config.in file. Please make sure to
wrap at a reasonable length ! :-)

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
