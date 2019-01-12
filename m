From: james.hilliard1 at gmail.com <james.hilliard1@gmail.com>
Date: Sat, 12 Jan 2019 21:22:17 +0800
Subject: [Buildroot] [PATCH 3/3] package/libva-utils: bump to version 2.3.0
In-Reply-To: <1547299337-2266-1-git-send-email-james.hilliard1@gmail.com>
References: <1547299337-2266-1-git-send-email-james.hilliard1@gmail.com>
Message-ID: <1547299337-2266-3-git-send-email-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: James Hilliard <james.hilliard1@gmail.com>

Have to add a workaround since upstream didn't package this release properly.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/libva-utils/libva-utils.hash |  4 ++--
 package/libva-utils/libva-utils.mk   | 12 +++++++++---
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/package/libva-utils/libva-utils.hash b/package/libva-utils/libva-utils.hash
index e86cb6e..1c2dc5d 100644
--- a/package/libva-utils/libva-utils.hash
+++ b/package/libva-utils/libva-utils.hash
@@ -1,5 +1,5 @@
 # From https://github.com/intel/libva-utils/releases
-sha1 ef15d40d6bec847c74f21ee3431b7e7b06fec3b4  libva-utils-2.2.0.tar.bz2
+sha1 91e470d0755ec7a102a4e4ce694190e5e95b9c7f  libva-utils-2.3.0.tar.gz
 # Locally computed
-sha256 ed7a6ed1fab657df4e83ea11f90310efcf31c27828f32d65351a28ca3c404dc0  libva-utils-2.2.0.tar.bz2
+sha256 f338497b867bbc9bf008e4892eaebda08955785dc7eb2005855bba5f1a20b037  libva-utils-2.3.0.tar.gz
 sha256 c6220c9f87832c27abcb8a32eafdd2823e13ce146b3ea63d5deae2a76798ef50  COPYING
diff --git a/package/libva-utils/libva-utils.mk b/package/libva-utils/libva-utils.mk
index 348d419..f08ffeb 100644
--- a/package/libva-utils/libva-utils.mk
+++ b/package/libva-utils/libva-utils.mk
@@ -4,13 +4,19 @@
 #
 ################################################################################
 
-LIBVA_UTILS_VERSION = 2.2.0
-LIBVA_UTILS_SOURCE = libva-utils-$(LIBVA_UTILS_VERSION).tar.bz2
-LIBVA_UTILS_SITE = https://github.com/intel/libva-utils/releases/download/$(LIBVA_UTILS_VERSION)
+LIBVA_UTILS_VERSION = 2.3.0
+LIBVA_UTILS_SOURCE = libva-utils-$(LIBVA_UTILS_VERSION).tar.gz
+LIBVA_UTILS_SITE = https://github.com/intel/libva-utils/archive/$(LIBVA_UTILS_VERSION)
 LIBVA_UTILS_LICENSE = MIT
 LIBVA_UTILS_LICENSE_FILES = COPYING
 # 0001-check-ssp.patch
 LIBVA_UTILS_AUTORECONF = YES
 LIBVA_UTILS_DEPENDENCIES = host-pkgconf libva
 
+define LIBVA_UTILS_CREATE_M4_DIR
+	@mkdir -p $(@D)/m4
+endef
+
+LIBVA_UTILS_POST_EXTRACT_HOOKS += LIBVA_UTILS_CREATE_M4_DIR
+
 $(eval $(autotools-package))
-- 
2.7.4
