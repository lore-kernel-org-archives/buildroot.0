From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 8 Mar 2020 15:20:08 +0100
Subject: [Buildroot] [git commit branch/next] package/opencv3: bump to
 version 4.2.0
Message-ID: <20200308141654.7D2C18FE7C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5e51bb2756ee5063eff9a45a46033a449e2a6195
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

We need to set -DPROTOBUF_UPDATE_FILES=ON otherwise our protobuf
headers will be incompatible.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/opencv3/opencv3.hash | 4 ++--
 package/opencv3/opencv3.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/opencv3/opencv3.hash b/package/opencv3/opencv3.hash
index 4953d01a1c..ef95f24ad3 100644
--- a/package/opencv3/opencv3.hash
+++ b/package/opencv3/opencv3.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 b7ea364de7273cfb3b771a0d9c111b8b8dfb42ff2bcd2d84681902fb8f49892a  opencv3-3.4.9.tar.gz
-sha256 c3596f2f886631ac49af2c9a201ca559f850bb5726bdc25eacbe2369a70caad9  LICENSE
+sha256  9ccb2192d7e8c03c58fee07051364d94ed7599363f3b0dce1c5e6cc11c1bb0ec  opencv3-4.2.0.tar.gz
+sha256  c3596f2f886631ac49af2c9a201ca559f850bb5726bdc25eacbe2369a70caad9  LICENSE
diff --git a/package/opencv3/opencv3.mk b/package/opencv3/opencv3.mk
index 2c5d6b041d..8a8257b387 100644
--- a/package/opencv3/opencv3.mk
+++ b/package/opencv3/opencv3.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENCV3_VERSION = 3.4.9
+OPENCV3_VERSION = 4.2.0
 OPENCV3_SITE = $(call github,opencv,opencv,$(OPENCV3_VERSION))
 OPENCV3_INSTALL_STAGING = YES
 OPENCV3_LICENSE = BSD-3-Clause
@@ -282,10 +282,10 @@ OPENCV3_CONF_OPTS += -DWITH_PNG=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_OPENCV3_WITH_PROTOBUF),y)
-OPENCV3_CONF_OPTS += -DWITH_PROTOBUF=ON
+OPENCV3_CONF_OPTS += -DWITH_PROTOBUF=ON -DPROTOBUF_UPDATE_FILES=ON
 OPENCV3_DEPENDENCIES += protobuf
 else
-OPENCV3_CONF_OPTS += -DWITH_PROTOBUF=OFF
+OPENCV3_CONF_OPTS += -DWITH_PROTOBUF=OFF -DPROTOBUF_UPDATE_FILES=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_OPENCV3_WITH_QT5),y)
