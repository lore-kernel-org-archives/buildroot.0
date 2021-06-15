From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 15 Jun 2021 15:47:39 +0800
Subject: [Buildroot] [PATCH 4/4] configs/beaglev: switch to upstream
 opensbi generic platform
In-Reply-To: <20210615001750.421889-5-drew@beagleboard.org>
References: <20210615001750.421889-1-drew@beagleboard.org>
 <20210615001750.421889-5-drew@beagleboard.org>
Message-ID: <CAEUhbmVwUOzYZny2ETqBo6O8L58g_o1nxfkkiZ4C0zja1DPPWw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jun 15, 2021 at 8:18 AM Drew Fustini <drew@beagleboard.org> wrote:
>
> Switch from the starfive-tech opensbi to upstream repo and use generic
> platform now that it supports the console uart [1]. This landed after
> the 0.9 release [2], so the current head of master branch is used [3].
>
> FW_FDT_PATH is set to u-boot.dtb so that the device tree from u-boot

nits: from U-Boot

> will be included in the OpenSBI build [4]. Note that u-boot must have

nits: U-Boot

> CONFIG_OF_SEPARATE enabled for u-boot to build u-boot.dtb [5].

nits: for U-Boot

>
> [1] https://github.com/riscv/opensbi/commit/e822b7504df0583a6a227d51cb7da8ea9fc79c0a
> [2] https://github.com/riscv/opensbi/commit/234ed8e427f4d92903123199f6590d144e0d9351
> [3] https://github.com/riscv/opensbi/commit/79f9b4220ffa7f74356054be25d450d7958bf16c
> [4] https://github.com/riscv/opensbi/blob/master/docs/firmware/fw.md
> [5] https://github.com/lentinj/u-boot/blob/master/doc/README.fdt-control

nits: use the official U-Boot github repo

>
> Signed-off-by: Drew Fustini <drew@beagleboard.org>
> ---
>  configs/beaglev_defconfig | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>

Otherwise,
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
