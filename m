From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Jun 2015 14:46:21 +0200
Subject: [Buildroot] [PATCH v3 1/2] boot/uboot: add support for the
 kconfig infrastructure
In-Reply-To: <1434283558-9663-1-git-send-email-joerg.krause@embedded.rocks>
References: <1434283558-9663-1-git-send-email-joerg.krause@embedded.rocks>
Message-ID: <20150614144621.45e7c13b@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?rg Krause,

On Sun, 14 Jun 2015 14:05:57 +0200, J?rg Krause wrote:
> With the patchset "kconfig: turnaround into single .config"
> [http://lists.denx.de/pipermail/u-boot/2015-February/205490.html]
> U-Boot switched to a single .config file for board configuration. This allows
> us to use the kconfig-package infrastructure.
> 
> For providing backward compatibility with older U-Boot version a user choice
> between the new Kconfig and the legacy build system is introduced. Kconfig
> is chosen as default build system.

This will break plenty of existing configuration that use older
Buildroot versions. Since the legacy configure/build commands also work
with newer U-Boot, I think we should rather have the legacy build logic
used by default.

> This patch supersedes "boot/uboot: Add support for Kbuild & Kconfig build
> system" [http://patchwork.ozlabs.org/patch/436498/]

Please mark your patches as Superseded yourself in patchwork :-) No
need to indicate that in the commit log.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
