From: Einar Jon Gunnarsson <tolvupostur@gmail.com>
Date: Fri, 30 Nov 2018 13:01:18 +0100
Subject: [Buildroot] [PATCH 0/5] libgbm hackery to build with QT5
Message-ID: <1543579283-20496-1-git-send-email-tolvupostur@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

NOTE: NOT FOR BUILDROOT MASTER!!!

This is a bunch of hacks and fixes to build the "EGLFS GBM"
module for QT5. 

The only thing this is proven to do is to make sure that 
build/qt5base-*/config summary contains yes for these:
  EGLFS .................................. yes
  EGLFS details:
    EGLFS GBM ............................ yes
And that the build succeeds. 
Otherwise it is totally untested due to lack of hardware/time, 
and may blow up in your face.

This is based on the origin/gbm branch of 
http://git.bootlin.com/users/thomas-petazzoni/buildroot
Previous commit: 27848ebac02855af2cfa79475891d5aa29f93343

Einar Jon Gunnarsson (5):
  package/ti-sgx-um: Add dependency on wayland
  package/qt5: Use any libgbm provider
  package/qt5: fix EGLFS for embedded boards
  package/sunxi-mali-mainline: Fix QT5 build for EGLFS
  configs: libgbm defconfigs build qt5

 configs/libgbm_mesa3d_defconfig                    | 5 +++++
 configs/libgbm_sunxi_mali_defconfig                | 9 +++++++--
 configs/libgbm_ti_sgx_defconfig                    | 9 +++++----
 package/qt5/qt5base/qt5base.mk                     | 9 ++++++---
 package/sunxi-mali-mainline/Config.in              | 3 ++-
 package/sunxi-mali-mainline/sunxi-mali-mainline.mk | 5 +++++
 package/ti-sgx-um/Config.in                        | 2 ++
 package/ti-sgx-um/ti-sgx-um.mk                     | 1 +
 8 files changed, 33 insertions(+), 10 deletions(-)

-- 
2.7.4
