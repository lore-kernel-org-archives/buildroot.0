From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 22 Jan 2016 00:15:50 +0100
Subject: [Buildroot] [PATCH v4 3/5] package/gutenprint: Un-deprecate and
 bump version to 5.2.10
In-Reply-To: <1453328267-31962-4-git-send-email-olivier.schonken@gmail.com>
References: <1453328267-31962-1-git-send-email-olivier.schonken@gmail.com>
 <1453328267-31962-4-git-send-email-olivier.schonken@gmail.com>
Message-ID: <20160122001550.406e6207@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Olivier Schonken,

On Thu, 21 Jan 2016 00:17:45 +0200, Olivier Schonken wrote:
> Signed-off-by: Olivier Schonken <olivier.schonken@gmail.com>
> ---
>  package/gutenprint/Config.in       | 2 --
>  package/gutenprint/gutenprint.hash | 2 +-
>  package/gutenprint/gutenprint.mk   | 2 +-
>  3 files changed, 2 insertions(+), 4 deletions(-)

This one doesn't build here:

print-olympus.c: In function ?dyesub_do_print?:
print-olympus.c:4909:2: error: #error "Unable to determine endianness, aborting compilation!"
 #error "Unable to determine endianness, aborting compilation!"

Here is the defconfig to reproduce:

BR2_arm=y
BR2_cortex_a9=y
BR2_ARM_ENABLE_VFP=y
BR2_COMPILER_PARANOID_UNSAFE_PATH=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-cortex-a9-musl-2015.11-rc1-71-g90d1299.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_4_9=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_3=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM_MUSL=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_CUPS=y
BR2_PACKAGE_GUTENPRINT=y
BR2_PACKAGE_HPLIP=y
# BR2_TARGET_ROOTFS_TAR is not set

It's late, I'm heading off to bed, so I haven't investigated at all. It
might be trivial.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
