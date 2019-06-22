From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 22 Jun 2019 20:19:24 +0200
Subject: [Buildroot] [git commit] package/harfbuzz: bump version to 2.5.2
Message-ID: <20190622181943.ABE308438B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c04e5cb16e3de688dfee585f47f22db4232acb3e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream switched tarball to .xz

Updated license hash for COPYING after upstream commit:
https://github.com/harfbuzz/harfbuzz/commit/8ed7655be89c658219ab702e34a79734ba0efb73

Removed license file src/hb-ucdn/COPYING after upstream commit
https://github.com/harfbuzz/harfbuzz/commit/65392b734e38668b870b1ffcbfb4b42ec289ef58
removed src/hb-ucdn/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/harfbuzz/harfbuzz.hash | 7 +++----
 package/harfbuzz/harfbuzz.mk   | 6 +++---
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/package/harfbuzz/harfbuzz.hash b/package/harfbuzz/harfbuzz.hash
index a10b4cfd5d..a2b51bbc0a 100644
--- a/package/harfbuzz/harfbuzz.hash
+++ b/package/harfbuzz/harfbuzz.hash
@@ -1,6 +1,5 @@
-# From https://www.freedesktop.org/software/harfbuzz/release/harfbuzz-1.8.8.tar.bz2.sha256
-sha256	a8e5c86e4d99e1cc9865ec1b8e9b05b98e413c2a885cd11f8e9bb9502dd3e3a9	harfbuzz-1.8.8.tar.bz2
+# From https://www.freedesktop.org/software/harfbuzz/release/harfbuzz-2.5.2.tar.xz.sha256
+sha256 7c8fcf9a2bbe3df5ed9650060d89f9b7cfd40ec5729671447ace8b0505527e8b  harfbuzz-2.5.2.tar.xz
 
 # Locally computed
-sha256	2a886915de4f296cdae5ed67064f86dba01d0c55286d86e8487f2a5caaf40216	COPYING
-sha256	ec20cbe051200fc846caf4dc253cf660e874a2d9e4f3a682e08354b567fae409	src/hb-ucdn/COPYING
+sha256 1b32b6e2fea50440c128c5ba482f7691367c46fd0cd573b80fc863bf07964cea  COPYING
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index 52374c9c9e..ded5e554e6 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-HARFBUZZ_VERSION = 1.8.8
+HARFBUZZ_VERSION = 2.5.2
 HARFBUZZ_SITE = https://www.freedesktop.org/software/harfbuzz/release
-HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.bz2
+HARFBUZZ_SOURCE = harfbuzz-$(HARFBUZZ_VERSION).tar.xz
 HARFBUZZ_LICENSE = MIT, ISC (ucdn library)
-HARFBUZZ_LICENSE_FILES = COPYING src/hb-ucdn/COPYING
+HARFBUZZ_LICENSE_FILES = COPYING
 HARFBUZZ_INSTALL_STAGING = YES
 HARFBUZZ_CONF_OPTS = --with-coretext=no --with-uniscribe=no
 
