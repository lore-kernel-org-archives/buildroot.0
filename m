From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 22 Dec 2019 14:24:21 +0100
Subject: [Buildroot] [PATCH 1/1] package/imx-sc-firmware: bump to
 version 1.2.1
In-Reply-To: <bb1e9dbdd73a1e0b8fead464ddf9fa83@cotds.org>
References: <20191218130429.847805-1-juju@cotds.org>
 <CAOMZO5D_Dh2sgweJ+0U_os-jP3igeVbO2XJmeesZTdoQDe86gA@mail.gmail.com>
 <94f6389ba7bd24a86cdec3e8295fddad@cotds.org>
 <CAOMZO5CTpqORMwjZi5681X7h1pngWZJzF-VZHvaVHkEe4CYq1g@mail.gmail.com>
 <bb1e9dbdd73a1e0b8fead464ddf9fa83@cotds.org>
Message-ID: <20191222142421.13cd522c@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 18 Dec 2019 22:22:08 +0100
Julien Olivain <juju@cotds.org> wrote:

>    I agree with you that we can't really force a single version for all
> boards. Exposing a choice of version (like for Kernel, U-Boot, ATF)
> seems a good trade-of (this is what I had in mind in [1]).

> 
>    For i.MX packages, several packages are in that case: I think mainly
> about imx-sc-firmware, firmware-imx and imx-gpu-viv.
> 
>    The only problem I see right now is that from one version to
> another, the build recipe might slightly change. We saw that recently
> in [2]. This means we can't have a single recipe and a free
> _CUSTOM_VERSION config option.
> 
> What about having a KConfig "choice" list of few supported versions,
> also showing NXP BSP name, to help i.MX defconfig maintainers to
> select the right version ? That would allow the package recipe to
> adjust commands for a given version.
> 
> For example, for the imx-sc-firmware, the list of choices would be:
> - 1.1.4 (4.14.78_1.0.0)
> - 1.2.1 (4.14.98_2.0.0)
> - 1.2.2 (4.19.35_1.0.0)
> - 1.2.7.1 (4.19.35_1.1.0)
> 
> What do you think about this approach?

In general, we don't really like to have too much version selection for
components, because it makes the maintenance difficult, and it is also
more difficult for users as they have to know which version to use.

However, for the specific case of this firmware package, I don't really
see any other option than what you're proposing.

One question is: how does it work if one wants to use the upstream
Linux kernel?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
