From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 8 Apr 2020 22:50:35 +0200
Subject: [Buildroot] [git commit] package/libarchive: make optional zstd
 dependency explicit
Message-ID: <20200408203659.AD6878E127@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=96dc6701af877a4aa4da20a9e0d5b849cc5c8356
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Otherwise, the presence of zstd support in libarchive will depend on build
order.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libarchive/libarchive.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index 60838eea0a..94f974e7d1 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -112,6 +112,13 @@ else
 LIBARCHIVE_CONF_OPTS += --without-lzma
 endif
 
+ifeq ($(BR2_PACKAGE_ZSTD),y)
+LIBARCHIVE_DEPENDENCIES += zstd
+LIBARCHIVE_CONF_OPTS += --with-zstd
+else
+LIBARCHIVE_CONF_OPTS += --without-zstd
+endif
+
 # The only user of host-libarchive needs zlib support
 HOST_LIBARCHIVE_DEPENDENCIES = host-zlib
 HOST_LIBARCHIVE_CONF_OPTS = \
