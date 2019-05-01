From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 1 May 2019 14:44:08 +0200
Subject: [Buildroot] [git commit] package/libzip: add host variant
Message-ID: <20190501123954.884738129A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a52b620976a272bcd0ab58dfd96acb80d2490dba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The updated host mfgtool package needs the host variant of libzip.

Signed-off-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libzip/libzip.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libzip/libzip.mk b/package/libzip/libzip.mk
index b90ea76f5e..280ca6d8c7 100644
--- a/package/libzip/libzip.mk
+++ b/package/libzip/libzip.mk
@@ -11,6 +11,7 @@ LIBZIP_LICENSE = BSD-3-Clause
 LIBZIP_LICENSE_FILES = LICENSE
 LIBZIP_INSTALL_STAGING = YES
 LIBZIP_DEPENDENCIES = zlib
+HOST_LIBZIP_DEPENDENCIES = host-zlib
 
 ifeq ($(BR2_PACKAGE_BZIP2),y)
 LIBZIP_DEPENDENCIES += bzip2
@@ -33,3 +34,4 @@ LIBZIP_CONF_OPTS += -DENABLE_OPENSSL=OFF
 endif
 
 $(eval $(cmake-package))
+$(eval $(host-cmake-package))
