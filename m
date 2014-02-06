From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 6 Feb 2014 13:31:21 +0000
Subject: [Buildroot] [Bug 6854] Update to Qt 5.2.1
In-Reply-To: <20140206132343.8A7F39C817@busybox.osuosl.org>
References: <bug-6854-163@https.bugs.busybox.net/>
 <20140206132343.8A7F39C817@busybox.osuosl.org>
Message-ID: <52F38EA9.2080600@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/06/2014 01:23 PM, bugzilla at busybox.net wrote:
> https://bugs.busybox.net/show_bug.cgi?id=6854
>
> --- Comment #2 from Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 2014-02-06 13:23:43 UTC ---
> Thanks a lot!
>
> However, could you submit patches to the mailing list? See the contribution
> process detailed at
> http://buildroot.org/downloads/manual/manual.html#_contributing_to_buildroot.
>

I was testing Qt-5.2.1. I agree with the removal of these patches:

qt5base-0001-Fix-build-MIPS64-bigendian.patch
qt5base-0007-detect-posix_fallocate-at-configure-time.patch

However, I'm having some problem when trying to build this new version:

cd scanner/ && ( test -e Makefile || 
/home/ldap/vriera/work/mips-buildroots/mips64_be_sf_n64/output/host/usr/bin/qmake 
/home/ldap/vriera/work/mips-buildroots/mips64_be_sf_n64/output/build/qt5connectivity-5.2.1/examples/bluetooth/scanner/scanner.pro 
-o Makefile ) && /usr/bin/make -f Makefile
Project ERROR: Unknown module(s) in QT: quick
make[3]: *** [sub-scanner-make_first] Error 3
make[3]: *** Waiting for unfinished jobs....

The package that fails in that log snipet is "qt5connectivity".

Here is the defconfig:

BR2_mips64=y
BR2_MIPS_NABI64=y
BR2_TOOLCHAIN_BUILDROOT_UCLIBC=y
BR2_TOOLCHAIN_BUILDROOT_LARGEFILE=y
BR2_TOOLCHAIN_BUILDROOT_INET_IPV6=y
BR2_TOOLCHAIN_BUILDROOT_INET_RPC=y
BR2_TOOLCHAIN_BUILDROOT_LOCALE=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_PACKAGE_QT5=y
BR2_PACKAGE_QT5BASE_LICENSE_APPROVED=y
BR2_PACKAGE_QT5BASE_EXAMPLES=y
BR2_PACKAGE_QT5BASE_SQL=y
BR2_PACKAGE_QT5BASE_MYSQL=y
BR2_PACKAGE_QT5BASE_SQLITE_QT=y
BR2_PACKAGE_QT5BASE_TEST=y
BR2_PACKAGE_QT5BASE_LINUXFB=y
BR2_PACKAGE_QT5BASE_DIRECTFB=y
BR2_PACKAGE_QT5BASE_XCB=y
BR2_PACKAGE_QT5BASE_PRINTSUPPORT=y
BR2_PACKAGE_QT5BASE_FONTCONFIG=y
BR2_PACKAGE_QT5BASE_GIF=y
BR2_PACKAGE_QT5BASE_JPEG=y
BR2_PACKAGE_QT5BASE_PNG=y
BR2_PACKAGE_QT5BASE_ICU=y
BR2_PACKAGE_QT5BASE_TSLIB=y
BR2_PACKAGE_QT5CONNECTIVITY=y
BR2_PACKAGE_QT5IMAGEFORMATS=y
BR2_PACKAGE_QT5SENSORS=y
BR2_PACKAGE_QT5SERIALPORT=y
BR2_PACKAGE_QT5SVG=y
BR2_PACKAGE_QT5X11EXTRAS=y
BR2_PACKAGE_QT5XMLPATTERNS=y
BR2_PACKAGE_XORG7=y
# BR2_TARGET_ROOTFS_TAR is not set

-- 
Vincent
