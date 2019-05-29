From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Wed, 29 May 2019 15:53:38 +0200
Subject: [Buildroot] [PATCH 0/3] treat gcc bug 63261 in a common way
Message-ID: <20190529135341.23842-1-giulio.benetti@micronovasrl.com>
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

Giulio Benetti (3):
  toolchain: introduce BR2_TOOLCHAIN_HAS_GCC_BUG_63261
  package/fxload: re-enable package on Microblaze
  package/dmalloc: re-enable package on Microblaze

 package/dmalloc/Config.in  | 4 ----
 package/dmalloc/dmalloc.mk | 4 ++++
 package/fxload/Config.in   | 4 ----
 package/fxload/fxload.mk   | 7 ++++++-
 toolchain/Config.in        | 7 +++++++
 5 files changed, 17 insertions(+), 9 deletions(-)

-- 
2.17.1
