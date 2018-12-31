From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 31 Dec 2018 18:52:30 +0100
Subject: [Buildroot] [PATCH v2 0/4] Support Linux 4.20
Message-ID: <20181231175234.14572-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This adds support for using Linux 4.20 for the kernel headers and/or
kernel build.

Amongst other things, Linux 4.20 has the fix of the net_tstamp.h
header which will fix the build failure of linuxptp.

Changes since v1:

 - Add one more patch that makes it possible to use custom external
   toolchains that use Linux 4.20 kernel headers, as noticed by Romain
   Naour.

Thomas Petazzoni (4):
  toolchain: add necessary options to support 4.20 kernel headers
  package/linux-headers: add support for Linux 4.20 kernel headers
  linux: add support for Linux 4.20
  toolchain/toolchain-external-custom: support Linux 4.20 kernel headers

 linux/Config.in                                       |  4 ++--
 linux/linux.hash                                      |  1 +
 package/linux-headers/Config.in.host                  | 11 ++++++++++-
 toolchain/Config.in                                   |  5 +++++
 .../toolchain-external-custom/Config.in.options       |  4 ++++
 5 files changed, 22 insertions(+), 3 deletions(-)

-- 
2.20.1
