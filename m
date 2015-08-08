From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  8 Aug 2015 13:59:03 +0200
Subject: [Buildroot] [PATCH 0/3] package/x11r7/xserver_xorg-server: Fixes
	for dri2 and drm support
Message-ID: <1439035146-26080-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

this patch series is an alternative approach to Yann's patch series[1]
which should fix the various build errors currently seen on the
autobuilders.

Regards, Bernd

[1] http://patchwork.ozlabs.org/patch/502355/
    http://patchwork.ozlabs.org/patch/502356/

Bernd Kuhls (3):
  package/x11r7/xserver_xorg-server: Fix compilation of modesetting
    driver
  package/x11r7/xserver_xorg-server: Fix libdrm dependency handling
  package/x11r7/xserver_xorg-server: Add libdrm dependency when dri or
    dri2 is enabled

 .../0001-modesettings-needs-dri2.patch             | 19 +++++++++++++++++++
 package/x11r7/xserver_xorg-server/Config.in        |  2 ++
 .../xserver_xorg-server/xserver_xorg-server.mk     | 22 +++++++++++++++-------
 3 files changed, 36 insertions(+), 7 deletions(-)
 create mode 100644 package/x11r7/xserver_xorg-server/0001-modesettings-needs-dri2.patch

-- 
2.1.4
