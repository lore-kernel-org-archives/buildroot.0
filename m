From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 11 Nov 2017 23:38:25 +0100
Subject: [Buildroot] [PATCH] support/config-fragments/autobuild: update
 toolchains for 2017.11-rc1
In-Reply-To: <20171107142143.11527-1-thomas.petazzoni@free-electrons.com>
References: <20171107142143.11527-1-thomas.petazzoni@free-electrons.com>
Message-ID: <20171111233825.3242132a@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  7 Nov 2017 15:21:43 +0100, Thomas Petazzoni wrote:
> All Buildroot pre-built toolchains have been rebuilt with Buildroot
> 2017.11-rc1, so that they have the latest version of
> glibc/musl/uClibc, and also the latest gcc/binutils updates.
> 
> Specifically, this will fix the build failures on Blackfin that were
> due to the missing accept4() support:
> 
>   http://autobuild.buildroot.net/results/8b5a72dd7cde685f6f68f46aeee8b1b60c96d559/
>   (openobex)
> 
>   http://autobuild.buildroot.net/results/b19dd9ed29944d7f79c6f824669e3baaa0bb045a/
>   (libiio)
> 
> In terms of changes to the toolchains:
> 
>  - AArch64 glibc toolchain changed to use 4.4 kernel headers instead
>    of 4.1, in order to increase the variety of kernel header versions
>    being tested.
> 
>  - Most configurations now use 4.13 kernel headers instead of 4.12
>    (except the configurations that were explicitly using an older
>    kernel headers version)
> 
>  - The mips64 n64 configuration is changed from using gcc 4.9 to gcc
>    5, since another ARM configuration already tests gcc 4.9.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> ---
> This should be committed to the master branch.
> ---
>  support/config-fragments/autobuild/br-aarch64-glibc.config          | 4 ++--
>  support/config-fragments/autobuild/br-arcle-hs38.config             | 4 ++--
>  support/config-fragments/autobuild/br-arm-basic.config              | 4 ++--
>  support/config-fragments/autobuild/br-arm-cortex-a9-glibc.config    | 4 ++--
>  support/config-fragments/autobuild/br-arm-cortex-a9-musl.config     | 4 ++--
>  support/config-fragments/autobuild/br-arm-cortex-m4-full.config     | 4 ++--
>  support/config-fragments/autobuild/br-arm-full-nothread.config      | 4 ++--
>  support/config-fragments/autobuild/br-arm-full-static.config        | 2 +-
>  support/config-fragments/autobuild/br-arm-full.config               | 2 +-
>  support/config-fragments/autobuild/br-bfin-full.config              | 4 ++--
>  support/config-fragments/autobuild/br-i386-pentium-mmx-musl.config  | 2 +-
>  support/config-fragments/autobuild/br-i386-pentium4-full.config     | 2 +-
>  support/config-fragments/autobuild/br-m68k-5208-full.config         | 4 ++--
>  support/config-fragments/autobuild/br-m68k-68040-full.config        | 4 ++--
>  support/config-fragments/autobuild/br-microblazeel-full.config      | 2 +-
>  support/config-fragments/autobuild/br-mips32r6-el-hf-glibc.config   | 4 ++--
>  support/config-fragments/autobuild/br-mips64-n64-full.config        | 6 +++---
>  support/config-fragments/autobuild/br-mips64r6-el-hf-glibc.config   | 4 ++--
>  support/config-fragments/autobuild/br-mipsel-o32-full.config        | 4 ++--
>  support/config-fragments/autobuild/br-nios2-glibc.config            | 4 ++--
>  support/config-fragments/autobuild/br-openrisc-uclibc.config        | 4 ++--
>  support/config-fragments/autobuild/br-powerpc-603e-basic-cpp.config | 4 ++--
>  support/config-fragments/autobuild/br-powerpc-e500mc-full.config    | 4 ++--
>  support/config-fragments/autobuild/br-powerpc64-power7-glibc.config | 4 ++--
>  .../config-fragments/autobuild/br-powerpc64le-power8-glibc.config   | 4 ++--
>  support/config-fragments/autobuild/br-sh4-full.config               | 4 ++--
>  support/config-fragments/autobuild/br-sparc-uclibc.config           | 2 +-
>  support/config-fragments/autobuild/br-sparc64-glibc.config          | 2 +-
>  support/config-fragments/autobuild/br-x86-64-core2-full.config      | 2 +-
>  support/config-fragments/autobuild/br-x86-64-musl.config            | 4 ++--
>  support/config-fragments/autobuild/br-xtensa-full.config            | 4 ++--
>  31 files changed, 55 insertions(+), 55 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
