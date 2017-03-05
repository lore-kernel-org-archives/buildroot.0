From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 5 Mar 2017 22:31:58 +0100
Subject: [Buildroot] [PATCH v2 2/2] u-boot: add support for full image
 socfpga mkpimage
In-Reply-To: <20170213153329.1770-1-lionel@svkt.org>
References: <20170213135934.32014-2-lionel@svkt.org>
 <20170213153329.1770-1-lionel@svkt.org>
Message-ID: <20170305223158.5580290a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 13 Feb 2017 16:33:29 +0100, Lionel Flandrin wrote:
> Previously only SPL packaging was supported, now we can also wrap the
> u-boot-dtb.bin if enabled.
> 
> Signed-off-by: Lionel Flandrin <lionel@svkt.org>

I've extended the commit log quite a bit to explain what is going on.

> +	  If BR2_TARGET_UBOOT_SPL is enabled then BR2_TARGET_UBOOT_SPL_NAME is
> +	  converted by mkpimage using header version 0.
> +
> +	  Otherwise the full u-boot-dtb.bin is converted using mkpimage header
> +	  version 1.
> +
> +	  In either case the resulting file will be given a .crc extension.

These paragraphs were a bit too wide, so I rewrapped them.

Also, could you provide a configuration to test the build of the header
version 0 situation, and another to test the build of the header
version 1 situation ?

I'm not familiar enough with the various SoCFPGA SoCs/boards to know
which one is in which situation.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
