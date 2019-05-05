From: Petr Vorel <petr.vorel@gmail.com>
Date: Mon,  6 May 2019 01:29:23 +0200
Subject: [Buildroot] [RFC PATCH 1/1] iputils: Bump to version s20190324
Message-ID: <20190505232923.22744-1-petr.vorel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Upstream changed build system to Meson.
Removed patch included in this release.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Hi,

I'm trying to update iputils for Buildroot to newest version s20190324,
which changed build system to Meson. I cannot figure out which compiler
option is missing / wrong, or which dependency is missing or which
buildroot config is missing wrong. Any tip / idea?

Kind regards,
Petr

>>> iputils s20190324 Configuring
rm -rf /opt/buildroot/output/build/iputils-s20190324//build
mkdir -p /opt/buildroot/output/build/iputils-s20190324//build
sed -e "s%@TARGET_CROSS@%/opt/buildroot/output/host/bin/arm-linux-%g" -e "s%@TARGET_ARCH@%arm%g" -e "s%@TARGET_CPU@%arm926ej-s%g" -e "s%@TARGET_ENDIAN@%"little"%g" -e "s%@TARGET_CFLAGS@%`printf '"%s", ' -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os  `%g" -e "s%@TARGET_LDFLAGS@%%g" -e "s%@TARGET_CXXFLAGS@%`printf '"%s", ' -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64  -Os  `%g" -e "s%@HOST_DIR@%/opt/buildroot/output/host%g" package/meson/cross-compilation.conf.in > /opt/buildroot/output/build/iputils-s20190324//build/cross-compilation.conf
The Meson build system
Version: 0.50.1
Source dir: /opt/buildroot/output/build/iputils-s20190324
Build dir: /opt/buildroot/output/build/iputils-s20190324/build
Build type: cross build
Project name: iputils
Project version: s20190324
Native C compiler: ccache cc (gcc 8.3.1 "cc (SUSE Linux) 8.3.1 20190226 [gcc-8-branch revision 269204]")
