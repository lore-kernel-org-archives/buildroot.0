From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Wed, 22 May 2019 14:25:34 +0200
Subject: [Buildroot] [PATCH 0/8] fix GCC BUG 71124 and 85862
Message-ID: <20190522122542.84146-1-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Following 'Fix GCC BUG 85180 per-package' patchset:
https://patchwork.ozlabs.org/project/buildroot/list/?series=109024
this patchset makes possible to build packages affected by GCC bugs 71124
and 85862.

Giulio Benetti (8):
  toolchain: GCC bug 71124
  package/sqlite: fix BUG_71124 build timeout
  package/ffmpeg: re-enable package if BUG_71124 is present
  package/assimp: re-enable package if BR2_microblaze is enabled
  package/libnss: re-enable package if BUG_85862 is present
  package/ecryptfs-utils: allow building with GCC_BUG_85862 and on
    Microblaze
  package/qt5webengine: re-enable building if BUG_85682=y on latest Qt5
  package/flashbench: remove old check if BR2_microblaze & BR2_sh2a

 package/assimp/Config.in           | 5 -----
 package/assimp/assimp.mk           | 4 ++++
 package/ecryptfs-utils/Config.in   | 6 ------
 package/ffmpeg/Config.in           | 2 --
 package/ffmpeg/ffmpeg.mk           | 5 +++++
 package/flashbench/flashbench.mk   | 5 -----
 package/libnss/Config.in           | 4 ----
 package/libnss/libnss.mk           | 8 ++++++--
 package/qt5/qt5webengine/Config.in | 6 ------
 package/sqlite/sqlite.mk           | 4 ++++
 toolchain/Config.in                | 7 +++++++
 11 files changed, 26 insertions(+), 30 deletions(-)

-- 
2.17.1
