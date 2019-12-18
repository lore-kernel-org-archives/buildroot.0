From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 18 Dec 2019 10:27:10 -0300
Subject: [Buildroot] [PATCH 1/1] package/imx-sc-firmware: bump to
 version 1.2.1
In-Reply-To: <94f6389ba7bd24a86cdec3e8295fddad@cotds.org>
References: <20191218130429.847805-1-juju@cotds.org>
 <CAOMZO5D_Dh2sgweJ+0U_os-jP3igeVbO2XJmeesZTdoQDe86gA@mail.gmail.com>
 <94f6389ba7bd24a86cdec3e8295fddad@cotds.org>
Message-ID: <CAOMZO5CTpqORMwjZi5681X7h1pngWZJzF-VZHvaVHkEe4CYq1g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Dec 18, 2019 at 10:23 AM Julien Olivain <juju@cotds.org> wrote:

> As per:
> https://source.codeaurora.org/external/imx/meta-fsl-bsp-release/tree/imx/meta-bsp/recipes-bsp/imx-sc-firmware?h=sumo-4.14.98-2.0.0_ga
>
> For 4.14.98_2.0.0_ga, imx-sc-firmware is 1.2.1.
> imx-sc-firmware is 1.2.2 is for 4.14.98_2.2.0.
>
> Since the rest of the components are on 4.14.98_2.0.0_ga, I would really
> suggest 1.2.1.

Correct, the NXP Release Notes on the web is for 4.14.98_2.2.0.

So using 1.2.1 is fine then.

Shouldn't IMX_SC_FIRMWARE_VERSION be passed via board defconfig instead?

Currently we are forcing the same IMX_SC_FIRMWARE_VERSION for all imx8
boards, which is not ideal because we may have imx8 boards running
4.14.78, others 4.14.98, others 4.19.35, etc

We cannot force all of them to be using the same kernel versions, so I
think we should allow the possibility to pass IMX_SC_FIRMWARE_VERSION
via board defconfig.

What do you think?

Thanks
