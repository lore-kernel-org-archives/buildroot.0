From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Dec 2010 10:14:30 +0100
Subject: [Buildroot] [PATCH] Add UBI image generation support. UBI
 images are generated from UBIFS one (with ubinize tool) and are used by
 bootloaders (eg U-Boot) to write UBIFS images directly on bare NAND FLASH
 (see http://www.linux-mtd.infradead.org/faq/ubi.html)
In-Reply-To: <1292920543-27598-1-git-send-email-julien.boibessot@free.fr>
References: <1292920543-27598-1-git-send-email-julien.boibessot@free.fr>
Message-ID: <20101221101430.542e4243@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Thanks for this feature, it is definitely much appreciated.

First issue: the log of your patch. There should be one small line,
like:

"Add UBI image generation support"

and then after one empty line, the rest of the description. Some
comments below.

> Signed-off-by: Julien Boibessot <julien.boibessot@armadeus.com>
> Signed-off-by: Nicolas Colombain <nicolas.colombain@armadeus.com>
> ---
>  fs/ubi/Config.in   |   22 ++++++++++++++++++++++
>  fs/ubi/ubi.mk      |   24 ++++++++++++++++++++++++
>  fs/ubi/ubinize.cfg |    7 +++++++
>  fs/ubifs/Config.in |    2 ++

I am not sure it should be a separate filesystem included into the
ubifs-related options. I think I'd prefer to see something inside the
UBIFS filesystem options, like:

 [ ] Embed into a UBI image

and then have the code directly in fs/ubifs/ubifs.mk do the job of
calling ubinize if needed.

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
