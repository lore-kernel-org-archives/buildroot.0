From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Mon, 27 May 2019 23:38:22 +0200
Subject: [Buildroot] [PATCH v2 0/4] Fix and clean GCC BUG 68485 per-package
In-Reply-To: <2e2b06bc-ee6a-7d38-5c14-a79dd51685dd@micronovasrl.com>
References: <2e2b06bc-ee6a-7d38-5c14-a79dd51685dd@micronovasrl.com>
Message-ID: <20190527213826.114001-1-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Introduce Gcc Bug 68485
Fix Bug 68485 for brotli
Clean up packages for:
 - gpsd
 - flann
 - libspatialindex

Giulio Benetti (4):
  package/brotli: work aroung gcc bug 68485
  package/gpsd: use common BR2_TOOLCHAIN_HAS_GCC_BUG_68485
  package/flann: re-enable package on Microblaze
  package/libspatialindex: use common BR2_TOOLCHAIN_HAS_BUG_68485

 package/brotli/brotli.mk                   | 4 ++++
 package/flann/Config.in                    | 4 ----
 package/flann/flann.mk                     | 4 ++++
 package/gpsd/gpsd.mk                       | 5 +----
 package/libspatialindex/libspatialindex.mk | 4 +---
 5 files changed, 10 insertions(+), 11 deletions(-)

-- 
2.17.1
