From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 4 Nov 2016 21:10:33 +0100
Subject: [Buildroot] Armadeus defconfigs failing to build
Message-ID: <20161104211033.4caca063@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Julien,

I would like to let you know that several Armadeus defconfigs in
Buildroot are failing to build:

 - armadeus_apf51_defconfig fails to build because the Linux version is
   too old to be built with gcc 5.x, which is now the default in
   Buildroot. Could you update the defconfig to use a newer Linux
   version, and check that U-Boot also builds fine?

   See the complete build log at
   http://free-electrons.com/~thomas/pub/buildroot-defconfigs/armadeus_apf51_defconfig.log.FAIL

 - armadeus_apf9328_defconfig fails to build in Linux, with some weird
   "error: redefinition of 'return_address'" issue. Could you have a
   look at this problem ? It might be due to the use of gcc 5.x, or
   could be something else.

   See the complete build log at
   http://free-electrons.com/~thomas/pub/buildroot-defconfigs/armadeus_apf9328_defconfig.log.FAIL

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
