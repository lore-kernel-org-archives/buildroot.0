From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Wed, 10 Mar 2021 10:14:47 +0100
Subject: [Buildroot] [PATCH v2 0/6] Some Nios II and OpenRisc Fixes
Message-ID: <20210310091453.23611-1-giulio.benetti@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patchset applies after this:
https://patchwork.ozlabs.org/project/buildroot/list/?series=232409

and fixes build failures on Nios II and OpenRisc.

---
V1->V2: fixed libcamera patch that breaks Config.in rules
---

Giulio Benetti (6):
  package/libtheora: disable package if binutils is affected from bug
    21464
  package/gnutls: disable package if binutils is affected from bug 21464
  toolchain: introduce BR2_TOOLCHAIN_HAS_BINUTILS_BUG_27100
  package/openal: disable package if binutils is affected from bug 27100
  package/libcamera: disable package while building for Nios II
  package/kf5-kcoreaddons: disable package while building for Nios II

 package/gnutls/Config.in              | 4 +++-
 package/kf5/kf5-kcoreaddons/Config.in | 1 +
 package/libcamera/Config.in           | 4 +++-
 package/libtheora/Config.in           | 1 +
 package/openal/Config.in              | 4 +++-
 toolchain/Config.in                   | 6 ++++++
 6 files changed, 17 insertions(+), 3 deletions(-)

-- 
2.25.1
