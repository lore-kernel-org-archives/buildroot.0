From: Ryan Coe <bluemrp9@gmail.com>
Date: Wed, 21 Feb 2018 06:17:36 -0800
Subject: [Buildroot] [PATCH next] libite: update path for license files
Message-ID: <20180221141736.15759-1-bluemrp9@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Two of the license files have moved in the source package. Update the package
to reflect these changes.

Fixes:
http://autobuild.buildroot.net/results/8fd71513f021652a9a4ff2354dd5fe4fedf3d557
http://autobuild.buildroot.net/results/6a1ab663f1093351662ca7b86c9224a630798f35
http://autobuild.buildroot.net/results/066373da2da2cc8c0c22cc4a3048d1b187c9c389
http://autobuild.buildroot.net/results/edad6ac5d3f61257e99b90c6f54d4d6786aa7ad7
http://autobuild.buildroot.net/results/c2b72c2a32de949a5b1ab46d6d7c540353cfaf5e
http://autobuild.buildroot.net/results/8635ca4bbec464d196846a4018d1228d6651b211

Signed-off-by: Ryan Coe <bluemrp9@gmail.com>
---
 package/libite/libite.hash | 4 ++--
 package/libite/libite.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libite/libite.hash b/package/libite/libite.hash
index 437127d15c..7ef9dca57a 100644
--- a/package/libite/libite.hash
+++ b/package/libite/libite.hash
@@ -1,5 +1,5 @@
 # Locally calculated
 sha256 39a4c12af30a38a813fac7c8d7512efb3692f910eba9c697a50ce0203e039dad  libite-v2.0.1.tar.gz
 sha256 0e97ab27b60e20a7ddb8e9638189ad159124e51d2c12e12735b05423df224da5  LICENSE
-sha256 9e0fb98d251dddf5ba81a355f6b4d89835ec53bc5d7f5fcd2c866b54ec5ccec8  chomp.c
-sha256 a7d29c148e057fae11a87febc3a51970a26433c35a08fc710be689394442d32d  pidfile.c
+sha256 9e0fb98d251dddf5ba81a355f6b4d89835ec53bc5d7f5fcd2c866b54ec5ccec8  src/chomp.c
+sha256 a7d29c148e057fae11a87febc3a51970a26433c35a08fc710be689394442d32d  src/pidfile.c
diff --git a/package/libite/libite.mk b/package/libite/libite.mk
index 02ea948ef2..a128953c7a 100644
--- a/package/libite/libite.mk
+++ b/package/libite/libite.mk
@@ -7,7 +7,7 @@
 LIBITE_VERSION = v2.0.1
 LIBITE_SITE = $(call github,troglobit,libite,$(LIBITE_VERSION))
 LIBITE_LICENSE = MIT, X11, ISC, BSD-2-Clause
-LIBITE_LICENSE_FILES = LICENSE chomp.c pidfile.c
+LIBITE_LICENSE_FILES = LICENSE src/chomp.c src/pidfile.c
 LIBITE_INSTALL_STAGING = YES
 LIBITE_AUTORECONF = YES
 
-- 
2.16.1
