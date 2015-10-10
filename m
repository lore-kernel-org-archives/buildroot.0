From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 10 Oct 2015 19:35:09 +0200
Subject: [Buildroot] [PATCHv2 1/2] toolchain: add sparc64 architecture
 support
In-Reply-To: <20150829075733.GA19454@waldemar-brodkorb.de>
References: <20150829075733.GA19454@waldemar-brodkorb.de>
Message-ID: <20151010193509.058edf01@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Waldemar,

On Sat, 29 Aug 2015 09:57:33 +0200, Waldemar Brodkorb wrote:
> Introduce sparc64 architecture to buildroot.
> 
> Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> ---
>  - Changes v1 -> v2:
>    only allow useful architecture variants suggested by Thomas Petazzoni 
> ---
>  arch/Config.in                          |   12 +++++++++++-
>  arch/Config.in.sparc                    |   12 ++++++++++--
>  toolchain/toolchain-buildroot/Config.in |    3 ++-
>  3 files changed, 23 insertions(+), 4 deletions(-)

I tried to build a toolchain with this, and it fails for me, during the
host-gcc-final build step, with the following error message:

In file included from ../../../../libsanitizer/sanitizer_common/sanitizer_platform_limits_posix.cc:17:0:
../../../../libsanitizer/sanitizer_common/sanitizer_internal_defs.h:257:72: error: size of array 'assertion_failed__869' is negative
     typedef char IMPL_PASTE(assertion_failed_##_, line)[2*(int)(pred)-1]

I have built the following configuration:

BR2_sparc64=y
BR2_KERNEL_HEADERS_4_1=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_INIT_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
# BR2_TARGET_ROOTFS_TAR is not set

Could you have a look?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
