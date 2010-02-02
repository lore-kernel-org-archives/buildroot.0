From: Cameron Hutchison <lists@xdna.net>
Date: Tue, 02 Feb 2010 23:07:28 -0000
Subject: [Buildroot] Copying extra libs into image using external toolchain
Message-ID: <39a5.4b68b030.ecb50@getafix.xdna.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I have two buildroot (2009.11) configs set up:
1. A config that only builds a toolchain and installs it in
/opt/brtc/<srch-tag> (with uClibc and C++ support)
2. A config that uses that toolchain as an external toolchain and builds
the entire image (at91bootstrap, u-boot, linux, rootfs)

In the toolchain's output/target/usr/lib is libstdc++.so - as I
specified to build a C++ compiler. 

When I build the image, this library is not copied into it. The uClibc
libraries are copied. 

What do I need to do to get this library copied into the image? 

The docco talks about "Core C library from external toolchain" and
"Libraries to copy from the external toolchain" options but I cannot
find these under menuconfig.

The option for "Build/install c++ compiler and libstdc++" are enabled in
both configs.

Thanks
