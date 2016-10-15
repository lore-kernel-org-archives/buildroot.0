From: Samuel Martin <s.martin49@gmail.com>
Date: Sat, 15 Oct 2016 12:04:20 +0200
Subject: [Buildroot] [PATCH v2] package/urg: update homepage and source url
Message-ID: <20161015100420.11832-1-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fetch the source archive from fedora repository since this version of
the source is not available of the project site since it moved to
sourceforge.

Also add the md5 checksum computed by feodra to the *.hash file.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/urg/Config.in | 2 +-
 package/urg/urg.hash  | 2 ++
 package/urg/urg.mk    | 2 +-
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/urg/Config.in b/package/urg/Config.in
index 9d57645..c602624 100644
--- a/package/urg/Config.in
+++ b/package/urg/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_URG
 	help
 	  Library to control Hokuyo's URG series sensors.
 
-	  http://www.hokuyo-aut.jp/02sensor/07scanner/download/urg_programs_en/
+	  https://sourceforge.net/p/urgnetwork/wiki/Home/
 
 comment "urg needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/urg/urg.hash b/package/urg/urg.hash
index 5764a14..41749d7 100644
--- a/package/urg/urg.hash
+++ b/package/urg/urg.hash
@@ -1,2 +1,4 @@
+# from http://pkgs.fedoraproject.org/repo/pkgs/urg/urg-0.8.18.zip/
+md5		93f90d2ccc36e784407c5282ef6bd2cb	urg-0.8.18.zip
 # Locally calculated
 sha256	b2cab7e539c90c60fc99a2350a42b5d5390ff952b694b196c3cbb54623cfee7f	urg-0.8.18.zip
diff --git a/package/urg/urg.mk b/package/urg/urg.mk
index 41ac4f4..5d49aeb 100644
--- a/package/urg/urg.mk
+++ b/package/urg/urg.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 URG_VERSION = 0.8.18
-URG_SITE = http://www.hokuyo-aut.jp/02sensor/07scanner/download/urg_programs_en
+URG_SITE = http://pkgs.fedoraproject.org/repo/pkgs/urg/urg-0.8.18.zip/md5/93f90d2ccc36e784407c5282ef6bd2cb
 URG_SOURCE = urg-$(URG_VERSION).zip
 URG_LICENSE = LGPLv3
 URG_LICENSE_FILES = COPYING
-- 
2.10.0
