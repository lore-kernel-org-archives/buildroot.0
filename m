From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 5 Dec 2016 21:32:07 +0100
Subject: [Buildroot] [PATCH] bluez5_utils: add autoreconf back
In-Reply-To: <20161205131504.28872-1-gary.bisson@boundarydevices.com>
References: <20161205131504.28872-1-gary.bisson@boundarydevices.com>
Message-ID: <20161205213207.42e356af@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon,  5 Dec 2016 14:15:04 +0100, Gary Bisson wrote:
> Not necessary for an unmodified package. However if your external
> layer includes BlueZ5 patches which brings new files (such as a
> new hciattach protocol), it will not be built since the Makefile.in
> is already there.
> 
> Forcing an autoreconf fixes such issue.
> 
> Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
> ---
> Hi all,
> 
> I know this is a corner case which isn't a problem for 99% of users
> so I won't be surprised if it is rejected.

Indeed :)

> The use case here is that we provide a WiFi/BT combo from Qualcomm
> (QCA9377) which isn't supported in upstream BlueZ5.
> https://boundarydevices.com/product/bd_sdmac_wifi/
> 
> Qualcomm said there was no plan to upstream the support, but provides
> their own (outdated) tree in codeaurora:
> https://source.codeaurora.org/quic/la/platform/external/bluetooth/bluez/
> 
> We generated a patch out of that repo that allows to add support for
> this chip in Yocto (with a simple bbappend):
> https://github.com/boundarydevices/meta-boundary/tree/krogoth/recipes-connectivity/bluez5/bluez5
> 
> Now the idea is to provide a Boundary external layer that adds support
> for this chip in Buildroot.
> 
> When adding this patch, the builds fails since hciattach_rome.c isn't
> specified in the Makefile.in already present in the archive.
> 
> Let me know if there's another opion in your opinion.

Have you tried adding BLUEZ5_AUTORECONF = YES to your external.mk file?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
