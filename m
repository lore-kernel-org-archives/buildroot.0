From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 21 Apr 2020 23:19:32 +0200
Subject: [Buildroot] [PATCH] configs/qemu_riscv{32,
 64}_virt_defconfig: Remove BR2_TARGET_GENERIC_GETTY_PORT
In-Reply-To: <1583583630-25647-1-git-send-email-bmeng.cn@gmail.com>
References: <1583583630-25647-1-git-send-email-bmeng.cn@gmail.com>
Message-ID: <20200421231932.74abbc93@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat,  7 Mar 2020 04:20:30 -0800
Bin Meng <bmeng.cn@gmail.com> wrote:

> Currently BR2_TARGET_GENERIC_GETTY_PORT is set to ttyS0 in both
> qemu_riscv32_virt and qemu_riscv64_virt defconfig files. This
> limits usecases when the same one rootfs could be used on QEMU
> 'sifive_u' machine and SiFive HiFive Unleashed board.
> 
> Remove it so that the default boot console can be used.
> 
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
> ---

Applied to master with a reworked commit log. Indeed, these options are
not really needed, but the idea that these defconfigs should be used on
other HW platforms than the Qemu emulation is not a good idea, as
pointed out by other reviewers.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
