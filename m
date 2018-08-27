From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 27 Aug 2018 11:19:12 +0200
Subject: [Buildroot] [git commit branch/next] package/botan: fix altivec
 support
Message-ID: <20180827091118.BFB588E7CD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c845b295bd074c8ec6b9649ed2414dc820323060
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

configure.py only supports --disable-altivec.

Fixes
http://autobuild.buildroot.net/results/318/3187afa3eea77e5de0e0fe14717bfc080da08117/

Added license hash URL.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/botan/botan.hash | 2 +-
 package/botan/botan.mk   | 4 +---
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/botan/botan.hash b/package/botan/botan.hash
index df804bc1ef..eeb94145b9 100644
--- a/package/botan/botan.hash
+++ b/package/botan/botan.hash
@@ -1,4 +1,4 @@
-# Locally calculated after checking pgp signature
+# From https://botan.randombit.net/releases/sha256sums.txt
 sha256 e42df91556317588c6ca0e41bf796f9bd5ec5c70e0668e6c97c608c697c24a90  Botan-2.7.0.tgz
 # Locally computed
 sha256 40cfd35a9e34d18463806f57553c968fdbaf254a2e2a636d1d8e32ff6b698495  license.txt
diff --git a/package/botan/botan.mk b/package/botan/botan.mk
index eb817f62d9..39a2c4c72b 100644
--- a/package/botan/botan.mk
+++ b/package/botan/botan.mk
@@ -70,9 +70,7 @@ BOTAN_DEPENDENCIES += zlib
 BOTAN_CONF_OPTS += --with-zlib
 endif
 
-ifeq ($(BR2_POWERPC_CPU_HAS_ALTIVEC),y)
-BOTAN_CONF_OPTS += --enable-altivec
-else
+ifeq ($(BR2_POWERPC_CPU_HAS_ALTIVEC),)
 BOTAN_CONF_OPTS += --disable-altivec
 endif
 
