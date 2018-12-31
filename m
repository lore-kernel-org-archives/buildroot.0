From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 31 Dec 2018 17:06:58 +0100
Subject: [Buildroot] [PATCH 0/3] Linux 4.20 addition
Message-ID: <20181231160701.12086-1-thomas.petazzoni@bootlin.com>
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

Thanks,

Thomas

Thomas Petazzoni (3):
  toolchain: add necessary options to support 4.20 kernel headers
  package/linux-headers: add support for Linux 4.20 kernel headers
  linux: add support for Linux 4.20

 linux/Config.in                      |  4 ++--
 linux/linux.hash                     |  1 +
 package/linux-headers/Config.in.host | 11 ++++++++++-
 toolchain/Config.in                  |  5 +++++
 4 files changed, 18 insertions(+), 3 deletions(-)

-- 
2.20.1
