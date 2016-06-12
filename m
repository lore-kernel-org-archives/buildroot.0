From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Jun 2016 21:40:40 +0200
Subject: [Buildroot] [PATCH] uboot: Use "mdbtrick" target when building
 elf for ARC
In-Reply-To: <1464371501-24130-1-git-send-email-vzakhar@synopsys.com>
References: <1464371501-24130-1-git-send-email-vzakhar@synopsys.com>
Message-ID: <20160612214040.4c1aadf4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 27 May 2016 20:51:41 +0300, Zakharov Vlad wrote:
> By default position independent executables (PIE) are generated
> when building U-Boot elf target. MetaWare debugger doesn't support
> PIE (position-independent executable).
> 
> In order to allow MDB load and run U-Boot elf, we need to do a
> special trick, called "mdbtrick".
> 
> This special build target is used to fake generated U-Boot elf by:
>     1. Reset PIE flag in ELF header
>     2. Strip all debug information from elf
> 
> Signed-off-by: Zakharov Vlad <vzakhar@synopsys.com>
> ---
>  boot/uboot/uboot.mk | 4 ++++
>  1 file changed, 4 insertions(+)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
