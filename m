From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Wed, 29 May 2019 16:51:29 +0200
Subject: [Buildroot] [PATCH v3 0/3] treat gcc bug 63261 in a common way
Message-ID: <20190529145132.57042-1-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As done for other Gcc bugs introduce and use
BR2_TOOLCHAIN_HAS_GCC_BUG_63261 in affected packages:
- fxload
- dmalloc
This is more consistent than checking same conditions for every package
and putting a comment on top of it.

Changes:
V1->V2:
* add 'depends on BR2_ENABLE_DEBUG' to BR2_TOOLCHAIN_HAS_GCC_BUG_63261
V2->V3:
* remove 'depends on BR2_ENABLE_DEBUG' from BR2_TOOLCHAIN_HAS_GCC_BUG_63261

Giulio Benetti (3):
  toolchain: introduce BR2_TOOLCHAIN_HAS_GCC_BUG_63261
  package/fxload: re-enable package on Microblaze
  package/dmalloc: re-enable package on Microblaze

 package/dmalloc/Config.in  | 4 ----
 package/dmalloc/dmalloc.mk | 4 ++++
 package/fxload/Config.in   | 4 ----
 package/fxload/fxload.mk   | 9 ++++++++-
 toolchain/Config.in        | 7 +++++++
 5 files changed, 19 insertions(+), 9 deletions(-)

-- 
2.17.1
