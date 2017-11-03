From: Norbert Lange <nolange79@gmail.com>
Date: Fri, 3 Nov 2017 11:53:06 +0100
Subject: [Buildroot] [Bug 10336] lttng compilation fails : linking error
Message-ID: <CADYdroMyGoySCjcto6mRbfVevjUeFY+d8SHXNwNMnYb_cOKKew@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I already added a defconfig for reproducing this at [1], I believe
Binutils 2.29 being responsible.


BR2_x86_64=y
BR2_x86_atom=y
BR2_SHARED_STATIC_LIBS=y
BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
BR2_KERNEL_HEADERS_4_9=y
BR2_BINUTILS_VERSION_2_29_X=y
BR2_GCC_VERSION_7_X=y
BR2_TOOLCHAIN_BUILDROOT_CXX=y
BR2_GCC_ENABLE_LTO=y
BR2_GCC_ENABLE_GRAPHITE=y
BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=y
BR2_PACKAGE_LTTNG_TOOLS=y
BR2_PACKAGE_BINUTILS=y
BR2_PACKAGE_LTTNG_LIBUST=y

[1] http://lists.busybox.net/pipermail/buildroot/2017-October/205789.html
