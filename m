From: Nicolas Serafini <nicolas.serafini@sensefly.com>
Date: Wed, 1 May 2019 09:08:33 +0000
Subject: [Buildroot] [PATCH] package/gerbera: fix build with latest exiv2
Message-ID: <20190501090704.44050-1-nicolas.serafini@sensefly.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

After the bump to exiv2 0.27.1 a build error due to missing header
inclusion apparead.

This patch fixes
http://autobuild.buildroot.net/results/3831acf7f4c5a9f1a404e0ced3d6bec7a2249601/
http://autobuild.buildroot.net/results/de0545462c6017fe54acc284b914b9fa8b0172d8/

The patch is waiting merge into the mainline
https://github.com/gerbera/gerbera/pull/457

Signed-off-by: Nicolas Serafini <nicolas.serafini@sensefly.com>
---
 package/gerbera/gerbera.hash | 1 +
 package/gerbera/gerbera.mk   | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/package/gerbera/gerbera.hash b/package/gerbera/gerbera.hash
index aa6a29f81e..9f19e6ffc8 100644
--- a/package/gerbera/gerbera.hash
+++ b/package/gerbera/gerbera.hash
@@ -1,3 +1,4 @@
 # Locally computed:
 sha256	9c4509189eab6bff0fe183e1dd54ea8cb17d7fb0bc6e21bb5b1a8ccaaf6c60d9	gerbera-v1.3.1.tar.gz
 sha256	cae4138373be41fd2be75faf41ce7efbcf49fb17d0e05ad1c51cc01ac335b9b6	LICENSE.md
+sha256	7fe27cab2145b1bde2a2a8fadf3a3f684e7a1a6ad6a31cf4bcdc7bc3e649faaa	457.patch
diff --git a/package/gerbera/gerbera.mk b/package/gerbera/gerbera.mk
index 5b69faaf82..62edbbc900 100644
--- a/package/gerbera/gerbera.mk
+++ b/package/gerbera/gerbera.mk
@@ -19,6 +19,9 @@ GERBERA_CONF_OPTS = \
 	-DWITH_DEBUG=OFF \
 	-DWITH_JS=OFF
 
+GERBERA_PATCH = \
+	https://patch-diff.githubusercontent.com/raw/gerbera/gerbera/pull/457.patch
+
 # Uses __atomic_fetch_add_4
 ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 GERBERA_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -latomic"
-- 
2.21.0
