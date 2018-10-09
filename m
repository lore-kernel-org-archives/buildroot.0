From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Tue,  9 Oct 2018 13:45:52 +0200
Subject: [Buildroot] [PATCH] glibc: bump version for more post-2.28 fixes
Message-ID: <20181009114552.27794-1-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

This version bump fixes following issue:

sysdeps/ieee754/soft-fp: ignore maybe-uninitialized with -O [BZ #19444]

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/glibc/glibc.hash | 2 +-
 package/glibc/glibc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
index 9fff30e1ef..c0447fc4d2 100644
--- a/package/glibc/glibc.hash
+++ b/package/glibc/glibc.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from Github)
-sha256  6e88cea4002efa7f78d86ea5e98eb92ed423d5a35068751517c4f00f56b8666c     glibc-glibc-2.28-18-g2339d6a55eb7a7e040ae888e906adc49eeb59eab.tar.gz
+sha256  7fc691e1aa6526ca8e92db831c040af373934712fb78979275d9d65cf9cc6530     glibc-5a580643111ef6081be7b4c7bd1997a5447c903f.tar.gz
 # Locally calculated (fetched from Github)
 sha256  e08ab67b2db2d0f0e8f3311d23c54fb8f6d4c1ef6fa0b4047fd5da400e3ce9de     glibc-arc-2018.03-release.tar.gz
 
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 708c22f723..526bca8146 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -10,7 +10,7 @@ GLIBC_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,glibc,$(GLIBC_VE
 else
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master
-GLIBC_VERSION = glibc-2.28-18-g2339d6a55eb7a7e040ae888e906adc49eeb59eab
+GLIBC_VERSION = 5a580643111ef6081be7b4c7bd1997a5447c903f
 # Upstream doesn't officially provide an https download link.
 # There is one (https://sourceware.org/git/glibc.git) but it's not reliable,
 # sometimes the connection times out. So use an unofficial github mirror.
-- 
2.17.0
