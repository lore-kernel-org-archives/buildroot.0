From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 13 Sep 2020 15:47:11 +0200
Subject: [Buildroot] [PATCH v2] package/xml-security-c: new package
In-Reply-To: <20200609021411.3778-1-matthew.weber@rockwellcollins.com>
References: <20200609021411.3778-1-matthew.weber@rockwellcollins.com>
Message-ID: <20200913154711.19a2341c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Matt,

On Mon,  8 Jun 2020 21:14:11 -0500
Matt Weber <matthew.weber@rockwellcollins.com> wrote:

> From: Chris Simons <chris.simons@rockwellcollins.com>
> 
> Adds support for the Apache Santuario XML Security for C++ that
> implementations the XML Digital Signature and Encryption
> specifications.
> 
> Signed-off-by: Chris Simons <chris.simons@rockwellcollins.com>
> Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>

I finally had a look, and while the package looks good, it doesn't
build here.

The following defconfig:

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2020.02.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_GCC_5=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_14=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
# BR2_PACKAGE_XERCES_ENABLE_NETWORK is not set
BR2_PACKAGE_XML_SECURITY_C=y
# BR2_TARGET_ROOTFS_TAR is not set

fails to build with:

/home/thomas/projets/buildroot/output/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/include/xercesc/util/Xerces_autoconf_config.hpp:123:9: error: ?char16_t? does not name a type
 typedef XERCES_XMLCH_T    XMLCh;
         ^

and then tons and tons of errors related to the XMLCh type being not
available.

Could you look into this? Perhaps doing a test-pkg run on this package
would be useful.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
