From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Jan 2020 10:01:11 +0100
Subject: [Buildroot] [git commit] package/icu: bump to version 65-1
Message-ID: <20200119085327.26F28814E6@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e2a2fab11baf7cdc7e74d4f65ec73c4c79668007
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switch site to github to get the latest release

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/icu/icu.hash | 4 ++--
 package/icu/icu.mk   | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/icu/icu.hash b/package/icu/icu.hash
index 86de0e14ea..5eb508d2cb 100644
--- a/package/icu/icu.hash
+++ b/package/icu/icu.hash
@@ -1,4 +1,4 @@
-# From http://download.icu-project.org/files/icu4c/64.2/SHASUM512.txt
-sha512 5ecb4c230ba45918747a1cf9aef86f555aa07d5b29b1d07ab674e8013f46dfb907a0e9d6945db41155f9dc3012fd94e1152ffc19f61a68b6dfcbabdcb8ae9d78  icu4c-64_2-src.tgz
+# From https://github.com/unicode-org/icu/releases/download/release-65-1/SHASUM512.txt
+sha512 8f1ef33e1f4abc9a8ee870331c59f01b473d6da1251a19ce403f822f3e3871096f0791855d39c8f20c612fc49cda2c62c06864aa32ddab2dbd186d2b21ce9139  icu4c-65_1-src.tgz
 # Locally computed
 sha256 6a18c5fac70d7860b57f5b72b4e2c9a1ba6b3d2741eef7ff9767c5379364f10d  LICENSE
diff --git a/package/icu/icu.mk b/package/icu/icu.mk
index 81d1dbc179..0b8aeeaee1 100644
--- a/package/icu/icu.mk
+++ b/package/icu/icu.mk
@@ -7,9 +7,10 @@
 # Git tags (and therefore versions on release-monitoring.org) use the
 # XX-Y format, but the tarballs are named XX_Y and the containing
 # directories XX.Y.
-ICU_VERSION = 64-2
+ICU_VERSION = 65-1
 ICU_SOURCE = icu4c-$(subst -,_,$(ICU_VERSION))-src.tgz
-ICU_SITE = http://download.icu-project.org/files/icu4c/$(subst -,.,$(ICU_VERSION))
+ICU_SITE = \
+	https://github.com/unicode-org/icu/releases/download/release-$(ICU_VERSION)
 ICU_LICENSE = ICU License
 ICU_LICENSE_FILES = LICENSE
 
