From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat,  5 Oct 2013 16:16:09 +0200
Subject: [Buildroot] [PATCH 0/5] Support for musl based external toolchains
Message-ID: <1380982574-16628-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

The musl C library is an alternative C library available from
http://www.musl-libc.org, it is gaining popularity amongst the people
interested in small root filesystem for embedded platforms.

The following set of commits add support for musl based external
toolchains. As noted in PATCH 3, the pre-build musl toolchains
available at musl.codu.org cannot be used for the moment, since they
lack sysroot support, but I have already contacted the author, who has
added sysroot support, that I've succesfully tested. The next release
of the pre-built toolchains will therefore have sysroot support, and
I'll be able to add them in the external toolchain profiles.

The last patch adds some minor fixes to Busybox to make it build
properly, they have been submitted to upstream Busybox already. Some
other packages will need a few minor fixes, of course.

In the future, I'm planning to add musl support to the internal
toolchain backend as well, but that requires patches on binutils and
gcc, which is a little bit annoying, even if the patches are quite
small.

Best regards,

Thomas

Thomas Petazzoni (5):
  toolchain-external: conditionalize the installation of libraries
  toolchain-external: modify the wildcard logic for shared libraries
    copying
  toolchain-external: add support for musl C library
  toolchain-external: improve help text of some options
  busybox: add patches to fix build with the musl C library

 ...01-libbb-use-poll.h-instead-of-sys-poll.h.patch | 32 +++++++++++++++++++
 ...onfig-include-linux-if_slip.h-instead-of-.patch | 33 ++++++++++++++++++++
 ...libiproute-use-linux-if_packet.h-instead-.patch | 36 ++++++++++++++++++++++
 toolchain/Config.in                                |  9 ++++++
 toolchain/helpers.mk                               | 13 +++++++-
 toolchain/toolchain-external/Config.in             | 27 +++++++++++++---
 toolchain/toolchain-external/ext-tool.mk           | 34 +++++++++++++-------
 7 files changed, 168 insertions(+), 16 deletions(-)
 create mode 100644 package/busybox/1.21.1/0001-libbb-use-poll.h-instead-of-sys-poll.h.patch
 create mode 100644 package/busybox/1.21.1/0002-network-ifconfig-include-linux-if_slip.h-instead-of-.patch
 create mode 100644 package/busybox/1.21.1/0003-networking-libiproute-use-linux-if_packet.h-instead-.patch

-- 
1.8.1.2
