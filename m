From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 21 Jul 2015 23:41:44 +0200
Subject: [Buildroot] [PATCH v5 0/4] qt5 bump to 5.5.0
In-Reply-To: <1437478217-19091-1-git-send-email-corjon.j@ecagroup.com>
References: <1437468691-364-1-git-send-email-corjon.j@ecagroup.com>
 <1437478217-19091-1-git-send-email-corjon.j@ecagroup.com>
Message-ID: <20150721234144.17d3b68c@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Julien,

On Tue, 21 Jul 2015 13:30:13 +0200, Julien Corjon wrote:

> Julien Corjon (4):
>   qt5: bump version to 5.5.0
>   qt/qt5base: reorder patches
>   qt/qt5quick1, qt/qt5script, qt/qt5webkit: tag as legacy compatibility

I've applied these three patches, thanks!

>   qt/qt5webchannel: new package

However, while this one looked good, it doesn't build for me. With the
following defconfig:

BR2_arm=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
BR2_TOOLCHAIN_EXTERNAL_URL="http://autobuild.buildroot.org/toolchains/tarballs/br-arm-full-2015.05-496-g85945aa.tar.bz2"
BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_1=y
BR2_TOOLCHAIN_EXTERNAL_LOCALE=y
# BR2_TOOLCHAIN_EXTERNAL_HAS_THREADS_DEBUG is not set
BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
BR2_TOOLCHAIN_EXTERNAL_CXX=y
BR2_INIT_NONE=y
BR2_SYSTEM_BIN_SH_NONE=y
# BR2_PACKAGE_BUSYBOX is not set
BR2_PACKAGE_QT5=y
BR2_PACKAGE_QT5BASE_LICENSE_APPROVED=y
BR2_PACKAGE_QT5WEBCHANNEL=y
# BR2_TARGET_ROOTFS_TAR is not set

I get:

/home/thomas/projets/buildroot/output/host/usr/bin/arm-linux-g++ -c -pipe [...] -I/home/thomas/projets/buildroot/output/host/usr/mkspecs/devices/linux-buildroot-g++ -o .obj/moc_qmetaobjectpublisher_p.o .moc/moc_qmetaobjectpublisher_p.cpp
qmetaobjectpublisher.cpp:44:20: fatal error: QJSValue: No such file or directory
 #include <QJSValue>
                    ^
compilation terminated.
Makefile:408: recipe for target '.obj/qmetaobjectpublisher.o' failed
make[4]: *** [.obj/qmetaobjectpublisher.o] Error 1
make[4]: *** Waiting for unfinished jobs....
Makefile:42: recipe for target 'sub-webchannel-make_first' failed
make[3]: *** [sub-webchannel-make_first] Error 2
Makefile:44: recipe for target 'sub-src-make_first' failed
make[2]: *** [sub-src-make_first] Error 2
package/pkg-generic.mk:156: recipe for target '/home/thomas/projets/buildroot/output/build/qt5webchannel-5.5.0/.stamp_built' failed

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
