From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 23 Feb 2016 19:19:29 -0300
Subject: [Buildroot] [PATCH] qt: depends on BR2_TOOLCHAIN_HAS_SYNC_4
In-Reply-To: <20160223222219.24b95205@free-electrons.com>
References: <1456246089-19346-1-git-send-email-gustavo@zacarias.com.ar>
 <20160223222219.24b95205@free-electrons.com>
Message-ID: <56CCDAF1.9070209@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 23/02/16 18:22, Thomas Petazzoni wrote:

> Isn't this broader than it needs to be? Only the Javascript code seems
> to use this atomic operation, so maybe we could just make
> BR2_PACKAGE_QT_ARCH_SUPPORTS_SCRIPT depends on
> BR2_TOOLCHAIN_HAS_SYNC_4. Or maybe it's
> BR2_PACKAGE_QT_ARCH_SUPPORTS_WEBKIT.
>
> By doing this, it also simplifies the patch quite a bit, since you
> don't need to propagate the dependency to too many packages (if any).
>
> I've indeed tested, and the following defconfig builds fine:
>
> BR2_sparc=y
> BR2_TOOLCHAIN_EXTERNAL=y
> BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
> BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-sparc-glibc-2015.11-rc1-71-g90d1299.tar.bz2"
> BR2_TOOLCHAIN_EXTERNAL_GCC_4_9=y
> BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_3=y
> BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
> BR2_TOOLCHAIN_EXTERNAL_CXX=y
> BR2_INIT_NONE=y
> BR2_SYSTEM_BIN_SH_NONE=y
> # BR2_PACKAGE_BUSYBOX is not set
> BR2_PACKAGE_QT=y
> BR2_PACKAGE_QT_LICENSE_APPROVED=y
> # BR2_PACKAGE_QT_GUI_MODULE is not set
> # BR2_PACKAGE_QT_XML is not set
> # BR2_PACKAGE_QT_NETWORK is not set
> # BR2_PACKAGE_QT_SCRIPT is not set
> # BR2_TARGET_ROOTFS_TAR is not set
>
> Which proves that Qt by itself doesn't use those atomic operations.
> Could you research which specific sub-option(s) are causing problems?
> I'm pretty sure it's either script or webkit, or possibly both.

It's possible, however how likely is it an arch that doesn't support 
atomics (normally meaning very old) running a QT gui?
SPARC v8 is normally used these days for rad-hard/aerospace/avionics 
solutions (gaisler), it's doubtful anyone with an old sparcstation (pre 
1995) with known broken kernel support will care.
Regards.
