From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 29 Dec 2020 22:06:26 +0100
Subject: [Buildroot] [PATCH 4/5] support/{config-fragments,
 testing}: select INET_RPC option for custom glibc external
 toolchains
In-Reply-To: <20201207204821.3588178-4-romain.naour@gmail.com>
References: <20201207204821.3588178-1-romain.naour@gmail.com>
 <20201207204821.3588178-4-romain.naour@gmail.com>
Message-ID: <20201229220626.4d99ccdc@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon,  7 Dec 2020 21:48:20 +0100
Romain Naour <romain.naour@gmail.com> wrote:

> The sun rpc support has been removed from glibc 2.32 [1], so BR2_TOOLCHAIN_EXTERNAL_INET_RPC
> will no longer be enabled by default for custom external toolchains.
> 
> Add this option in config fragments used by autobuild and testing scripts.
> 
> [1] https://sourceware.org/pipermail/libc-announce/2020/000029.html
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  support/config-fragments/autobuild/bootlin-x86-64-glibc.config  | 1 +
>  support/config-fragments/autobuild/br-aarch64-glibc.config      | 1 +
>  .../config-fragments/autobuild/br-arm-cortex-a9-glibc.config    | 1 +
>  .../config-fragments/autobuild/br-mips32r6-el-hf-glibc.config   | 1 +
>  .../config-fragments/autobuild/br-mips64r6-el-hf-glibc.config   | 1 +
>  support/config-fragments/autobuild/br-nios2-glibc.config        | 1 +
>  .../config-fragments/autobuild/br-powerpc64-power7-glibc.config | 1 +
>  .../autobuild/br-powerpc64le-power8-glibc.config                | 1 +
>  support/config-fragments/autobuild/br-riscv32.config            | 1 +
>  support/config-fragments/autobuild/br-riscv64.config            | 1 +
>  support/config-fragments/autobuild/br-sparc64-glibc.config      | 1 +
>  support/testing/tests/boot/test_syslinux.py                     | 2 ++
>  support/testing/tests/core/test_hardening.py                    | 1 +
>  support/testing/tests/package/test_glxinfo.py                   | 1 +
>  14 files changed, 15 insertions(+)

We are going to keep BR2_TOOLCHAIN_EXTERNAL_INET_RPC default to yes
with glibc for the moment, so I've marked this patch as Rejected.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
