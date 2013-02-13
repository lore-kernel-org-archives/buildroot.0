From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 14 Feb 2013 00:14:04 +0100
Subject: [Buildroot] uboot-tools and uboot being separate
In-Reply-To: <511C1A3F.2080804@mind.be>
References: <511BCBEE.5040704@siganos.org> <20130213212002.25c976ca@skate>
 <511C1A3F.2080804@mind.be>
Message-ID: <20130214001404.199dbd64@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Wed, 13 Feb 2013 23:57:03 +0100, Arnout Vandecappelle wrote:

>   I've had the same issue once: a patch to add some functionality to 
> mkimage that I needed both on the host and on the target.

Then easy enough; put your patch in package/uboot-tools/. It handles
the build and installation of both the host *and* target variant of the
U-Boot tools.

> > No. You don't have to have identical uboot-tools and uboot.
> > Basically uboot-tools provide one tool to create U-Boot images
> > (mkimage) and tools to manipulate the U-Boot environment from Linux
> > (fw_printenv, fw_setenv). Those tools are backward compatible, and
> > so you can perfectly use the tools from U-Boot 2010.x with a
> > running U-Boot 2012.x or 2013.x.
> 
>   Unless some feature has been added or removed.

In which case you bump the version of the uboot-tools package, just
like any other package.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
