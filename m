From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 9 Apr 2018 11:42:01 +0200
Subject: [Buildroot] [PATCH v3 2/2] cramfs: add xip option
In-Reply-To: <20180407133543.90767-3-chris.brandt@renesas.com>
References: <20180407133543.90767-1-chris.brandt@renesas.com>
 <20180407133543.90767-3-chris.brandt@renesas.com>
Message-ID: <20180409114201.77e40354@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  7 Apr 2018 08:35:43 -0500, Chris Brandt wrote:

> +config BR2_TARGET_ROOTFS_CRAMFS_XIP
> +	bool "Support XIP of all ELF files"
> +	help
> +	  For ELF files, uncompressed and properly aligned data blocks will be
> +	  automatically be mapped directly into user space whenever possible providing
> +	  eXecute-In-Place (XIP) from ROM of read-only segments. Data segments mapped
> +	  read-write (hence they have to be copied to RAM) may still be compressed in
> +	  the cramfs image in the same file along with non compressed read-only
> +	  segments. Both MMU and no-MMU systems are supported. This is particularly
> +	  handy for tiny embedded systems with very tight memory constraints.
> +
> +	  The CRAMFS_MTD Kconfig option must also be enabled in a 4.15+ kernel.

These lines were way too long, so I rewrapped them. You can
use ./utils/check-package to verify your changes: it would have
complained on this change due to the length of the lines.

Applied with this fixed.

Thanks for this cramfs update!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
