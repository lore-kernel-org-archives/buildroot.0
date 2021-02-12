From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 12 Feb 2021 09:24:58 +0100
Subject: [Buildroot] Buildroot defconfig issues
In-Reply-To: <582a548d-b9e3-39dc-f234-10a31e0a355d@mind.be>
References: <6025e87c3e3ce_c6a70d4128370@gitlab-sidekiq-catchall-v1-bb68c6455-8rbvh.mail>
 <20210212091348.75f9cd17@windsurf.home>
 <582a548d-b9e3-39dc-f234-10a31e0a355d@mind.be>
Message-ID: <20210212092458.165a3ec7@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 12 Feb 2021 09:17:53 +0100
Arnout Vandecappelle <arnout@mind.be> wrote:

>  I propose to just remove this defconfig. We're not really happy with those
> non-minimal defconfigs, right. I think it only makes sense to keep something
> like that if there really is something board-specific in there, which is not the
> case here I think.

Well, we've got several of these "development" defconfigs for
Atmel/Microchip platforms:

at91sam9x5ek_dev_defconfig
at91sam9x5ek_mmc_dev_defconfig
atmel_sama5d27_som1_ek_mmc_dev_defconfig
atmel_sama5d2_xplained_mmc_dev_defconfig
atmel_sama5d3_xplained_dev_defconfig
atmel_sama5d3_xplained_mmc_dev_defconfig
atmel_sama5d4_xplained_dev_defconfig
atmel_sama5d4_xplained_mmc_dev_defconfig
microchip_sam9x60ek_mmc_dev_defconfig
microchip_sama5d27_wlsom1_ek_mmc_dev_defconfig

There was quite some debate back then on whether we wanted them or not
in upstream Buildroot. Microchip has its own BR2_EXTERNAL layer at
https://github.com/linux4sam/buildroot-external-microchip with a bunch
of other defconfigs.

But Arnout, I thought you were inclined to having "demo" defconfigs in
Buildroot upstream. Have you changed your mind ?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
