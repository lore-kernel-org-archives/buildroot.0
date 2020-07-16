From: Tomas V. Arredondo <surf_fanatico@yahoo.com>
Date: Thu, 16 Jul 2020 10:45:07 +0000 (UTC)
Subject: [Buildroot] audit2allow BR support
In-Reply-To: <883924338.2521657.1594891236003@mail.yahoo.com>
References: <5696376.2474933.1594878993118.ref@mail.yahoo.com>
 <5696376.2474933.1594878993118@mail.yahoo.com>
 <20200716094540.27274cf4@windsurf.home>
 <159488904315.3198.6229972988341724924@kwain>
 <20200716110524.5214d23a@windsurf.home>
 <883924338.2521657.1594891236003@mail.yahoo.com>
Message-ID: <84025791.2539787.1594896307793@mail.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi,?

.config settings included Thx
    On Thursday, July 16, 2020, 05:05:27 AM EDT, Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:  
 
 On Thu, 16 Jul 2020 10:44:03 +0200
Antoine Tenart <antoine.tenart@bootlin.com> wrote:

> > Which Python version have you chosen ? Python 3.x or Python 2.x, i.e
> > BR2_PACKAGE_PYTHON=y or BR2_PACKAGE_PYTHON3=y ?? 
> 
> I did not encounter such an issue, but I only used versions 3.0+. If I
> think about something, I'll let you know.

Hm, I see that package/selinux-python/Config.in has:

? ? ? ? depends on !BR2_PACKAGE_PYTHON
? ? ? ? select BR2_PACKAGE_PYTHON3

so anyway, this is all only Python 3.x.
So yeah, I'm not sure how Tomas got into this build issue. Tomas: could
share the Buildroot .config being used ?

[TA] Here is the python stuff:
# BR2_PACKAGE_PYTHON is not setBR2_PACKAGE_PYTHON3=y# BR2_PACKAGE_PYTHON3_PY_ONLY is not setBR2_PACKAGE_PYTHON3_PYC_ONLY=y# BR2_PACKAGE_PYTHON3_PY_PYC is not set
## core python3 modules#
## The following modules are unusual or require extra libraries## BR2_PACKAGE_PYTHON3_BZIP2 is not set# BR2_PACKAGE_PYTHON3_CODECSCJK is not set# BR2_PACKAGE_PYTHON3_CURSES is not set# BR2_PACKAGE_PYTHON3_DECIMAL is not set# BR2_PACKAGE_PYTHON3_OSSAUDIODEV is not set# BR2_PACKAGE_PYTHON3_READLINE is not set# BR2_PACKAGE_PYTHON3_SSL is not set# BR2_PACKAGE_PYTHON3_SQLITE is not set# BR2_PACKAGE_PYTHON3_PYEXPAT is not set# BR2_PACKAGE_PYTHON3_XZ is not set
BR2_PACKAGE_PYTHON3_UNICODEDATA=yBR2_PACKAGE_PYTHON3_ZLIB=y
[TA] Here are other settings from our .config:BR2_powerpc=yBR2_powerpc_e500mc=yBR2_GLOBAL_PATCH_DIR="$(BR2_EXTERNAL)/patches"BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_1=yBR2_TOOLCHAIN_HEADERS_AT_LEAST="5.1"BR2_TOOLCHAIN_BUILDROOT_GLIBC=yBR2_TOOLCHAIN_BUILDROOT_CXX=yBR2_GCC_VERSION_5_X=yBR2_GCC_TARGET_CPU="e500mc"BR2_PACKAGE_MTD=y# BR2_PACKAGE_MTD_FLASH_UNLOCK is not set# BR2_PACKAGE_MTD_MTD_DEBUG is not setBR2_PACKAGE_LIBFFI=yBR2_PACKAGE_LIBCAP=yBR2_PACKAGE_LIBSECCOMP=yBR2_PACKAGE_LIBSELINUX=yBR2_PACKAGE_REFPOLICY=yBR2_PACKAGE_SETOOLS=yBR2_PACKAGE_POLICYCOREUTILS=yBR2_PACKAGE_PCRE_32=yBR2_PACKAGE_LRZSZ=yBR2_PACKAGE_DAEMON=yBR2_PACKAGE_LXC=yBR2_PACKAGE_DROPBEAR=yBR2_PACKAGE_DROPBEAR_CLIENT=yBR2_PACKAGE_DROPBEAR_LOCALOPTIONS_FILE="$(BR2_EXTERNAL)/package/dropbear/localoptions.h"BR2_PACKAGE_IPERF3=y# BR2_PACKAGE_DROPBEAR_WTMP is not set# BR2_PACKAGE_DROPBEAR_LASTLOG is not set# BR2_PACKAGE_DROPBEAR_LEGACY_CRYPTO is not setBR2_PACKAGE_OPENSSH=yBR2_PACKAGE_LIBOPENSSL_BIN=yBR2_PACKAGE_LIBOPENSSL_ENGINES=yBR2_PACKAGE_HAVE_CRYPTODEV=yBR2_PACKAGE_CRYPTODEV_LINUX=yBR2_PACKAGE_DBUS=yBR2_PACKAGE_EXPAT=yBR2_PACKAGE_NSS_MDNS=yBR2_PACKAGE_LIBDAEMON=yBR2_PACKAGE_AVAHI=yBR2_PACKAGE_AVAHI_AUTOIPD=yBR2_PACKAGE_AVAHI_DAEMON=yBR2_PACKAGE_AVAHI_LIBDNSSD_COMPATIBILITY=yBR2_PACKAGE_STRACE=yBR2_PACKAGE_I2C_TOOLS=yBR2_PACKAGE_CRYPTODEV=yBR2_PACKAGE_PKC_HOST=yBR2_PACKAGE_PKC_FIRMWARE=yBR2_PACKAGE_FM_UCODE_FIRMWARE=yBR2_PACKAGE_FM_UCODE_FIRMWARE_FILE="fsl_fman_ucode_CPU.bin"BR2_PACKAGE_SUDO=yBR2_PACKAGE_KMOD=yBR2_PACKAGE_KMOD_TOOLS=yBR2_PACKAGE_MEMTESTER=yBR2_PACKAGE_LIBGPIOD=yBR2_PACKAGE_LIBGPIOD_TOOLS=y
# BR2_PACKAGE_PYTHON is not setBR2_PACKAGE_PYTHON3=y# BR2_PACKAGE_PYTHON3_PY_ONLY is not setBR2_PACKAGE_PYTHON3_PYC_ONLY=y# BR2_PACKAGE_PYTHON3_PY_PYC is not set
## core python3 modules#
## The following modules are unusual or require extra libraries## BR2_PACKAGE_PYTHON3_BZIP2 is not set# BR2_PACKAGE_PYTHON3_CODECSCJK is not set# BR2_PACKAGE_PYTHON3_CURSES is not set# BR2_PACKAGE_PYTHON3_DECIMAL is not set# BR2_PACKAGE_PYTHON3_OSSAUDIODEV is not set# BR2_PACKAGE_PYTHON3_READLINE is not set# BR2_PACKAGE_PYTHON3_SSL is not set# BR2_PACKAGE_PYTHON3_SQLITE is not set# BR2_PACKAGE_PYTHON3_PYEXPAT is not set# BR2_PACKAGE_PYTHON3_XZ is not set
BR2_PACKAGE_PYTHON3_UNICODEDATA=yBR2_PACKAGE_PYTHON3_ZLIB=y
BR2_TARGET_ROOTFS_CPIO=yBR2_TARGET_ROOTFS_CPIO_XZ=yBR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y# BR2_TARGET_ROOTFS_TAR is not setBR2_ROOTFS_POST_IMAGE_SCRIPT="$(BR2_EXTERNAL)/board/COMPANY/BOARD/post-image.sh"BR2_ROOTFS_USERS_TABLES="$(BR2_EXTERNAL)/board/COMPANY/BOARD/users.config"BR2_ROOTFS_OVERLAY="$(BR2_EXTERNAL)/board/COMPANY/BOARD/rootfs-overlay"BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y


> > > 2- /var/lib/selinux directory missing
> > > $ semodule -llibsemanage.semanage_create_store: Could not create module store at /var/lib/selinux/targeted. (No such file or directory).libsemanage.semanage_direct_connect: could not establish direct connection (No such file or directory).semodule: Could not connect to policy handler
> > > ls /var/lib/selinuxls: /var/lib/selinux: No such file or directory? 
> > > ==> looks like the directory can just be added? ? 
> > 
> > On this one, I'm not sure, would need testing. I don't immediately see
> > anything creating /var/lib/selinux in Buildroot, so if it's not done by
> > the build system of one the SELinux packages, indeed /var/lib/selinux
> > will be missing.
> > 
> > Antoine: you are working on building systems with SELinux supports, did
> > you face the /var/lib/selinux missing problem ? Or perhaps because
> > you're testing with systemd, the situation is different ?? 
> 
> Using a modular policy at runtime isn't supported by the current
> refpolicy support in BR. When playing with it, I had similar issues with
> directories missing. Also, I don't think adding those directories alone
> will make it working, there's probably more work to do.

How could have Tomas encountered this with the current Buildroot, where
we don't even have the logic to build a modular policy ?
[TA] Could he mean that calling semodule is not supported I guess?

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
    
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200716/97848eb6/attachment.html>
