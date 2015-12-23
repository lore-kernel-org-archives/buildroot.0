From: Lada Trimasova <Lada.Trimasova@synopsys.com>
Date: Wed, 23 Dec 2015 15:49:50 +0300
Subject: [Buildroot] [PATCH v2 0/2] Fixing xdriver_xf86-video-ati building
Message-ID: <1450874992-15627-1-git-send-email-ltrimas@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

xdriver_xf86-video-ati depends on the radeon driver from libdrm 
and DRI support in xserver_xorg-server, to achieve this we select
the Radeon mesa3d DRI driver which needs to be enabled for all architectures.

Fixes:
http://autobuild.buildroot.net/results/9da/9da4ffdf1c4ec78ae37322e253cb769340116035

Lada Trimasova (2):
  Enabling mesa3d radeon driver for all architectures
  Fixing xdriver_xf86-video-ati dependencies

 package/mesa3d/Config.in                       | 1 -
 package/x11r7/xdriver_xf86-video-ati/Config.in | 5 +++--
 2 files changed, 3 insertions(+), 3 deletions(-)

-- 
2.5.0
