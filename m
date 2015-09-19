From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Sep 2015 15:44:57 +0200
Subject: [Buildroot] [PATCH v2 02/14] imx-kobs: add new package
In-Reply-To: <1441964394-3817-3-git-send-email-gary.bisson@boundarydevices.com>
References: <1441964394-3817-1-git-send-email-gary.bisson@boundarydevices.com>
 <1441964394-3817-3-git-send-email-gary.bisson@boundarydevices.com>
Message-ID: <20150919154457.54e66ef9@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gary Bisson,

On Fri, 11 Sep 2015 11:39:41 +0200, Gary Bisson wrote:
> Based on the Yocto 3.14.28-1.0.0_ga update:
> https://github.com/Freescale/meta-fsl-arm/commit/6c44744
> 
> Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>

This package does not build on musl, due to loff_t being undefined.
Since it fails on some MTD related code, maybe you should look into
mtd-utils commits to see how they fixed the musl compatibility
problems. I believe using the loff_t type is wrong, and another type
should be used, like off_t.

So I've marked this patch, and the kobs-ng deprecation patch as
"Changes Requested".

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
