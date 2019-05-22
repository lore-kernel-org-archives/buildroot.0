From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Wed, 22 May 2019 15:58:59 +0200
Subject: [Buildroot] [PATCH v2 0/7] fix GCC BUG 85180 and 85862
In-Reply-To: <10430096-81de-792a-8b49-c59ed5e9de2e@micronovasrl.com>
References: <10430096-81de-792a-8b49-c59ed5e9de2e@micronovasrl.com>
Message-ID: <20190522135906.30796-1-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Following 'Fix GCC BUG 85180 per-package' patchset:
https://patchwork.ozlabs.org/project/buildroot/list/?series=109024
this patchset makes possible to build packages affected by GCC bugs 85180
and 85862.

V1->V2:
* merge gcc bug 71124 into 85180 since they are the same
  71124 has been marked as duplicate of 85180.
* removed patch 0001 where BUG_71124 was added since it's useless now

Giulio Benetti (7):
  package/sqlite: fix BUG_85180 build timeout
  package/ffmpeg: re-enable package if BUG_85180 is present
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
 10 files changed, 19 insertions(+), 30 deletions(-)

-- 
2.17.1
