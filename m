From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 15 Jul 2021 08:47:18 +0200
Subject: [Buildroot] [git commit branch/2021.05.x] package/thrift: security
 bump to version 0.14.1
Message-ID: <20210715062051.17F7D90ED2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

commit: https://git.buildroot.net/buildroot/commit/?id=ac2b5a4febeec7b659578eb042a2ab90f0acfad1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.05.x

Fix CVE-2020-13949: In Apache Thrift 0.9.3 to 0.13.0, malicious RPC
clients could send short messages which would result in a large memory
allocation, potentially leading to denial of service.

- Disable javascript and nodejs which have been added with
  https://github.com/apache/thrift/commit/61d502075bf5da10331c201f604acdfefc4d5edc
- Update hash of LICENSE, license for windows-specific files added:
  https://github.com/apache/thrift/commit/98854c48744f20b3f551817273ed502835477f09

https://github.com/apache/thrift/blob/v0.14.1/CHANGES.md

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 7ecbb956e2c6a6dd42126657e05e86072f3fc140)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/thrift/thrift.hash | 6 +++---
 package/thrift/thrift.mk   | 4 +++-
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/thrift/thrift.hash b/package/thrift/thrift.hash
index f342dc348d..20d6baeace 100644
--- a/package/thrift/thrift.hash
+++ b/package/thrift/thrift.hash
@@ -1,4 +1,4 @@
-# From https://www.apache.org/dist/thrift/0.13.0/thrift-0.13.0.tar.gz.sha256
-sha256  7ad348b88033af46ce49148097afe354d513c1fca7c607b59c33ebb6064b5179  thrift-0.13.0.tar.gz
+# From https://www.apache.org/dist/thrift/0.14.1/thrift-0.14.1.tar.gz.sha256
+sha256  13da5e1cd9c8a3bb89778c0337cc57eb0c29b08f3090b41cf6ab78594b410ca5  thrift-0.14.1.tar.gz
 # License files, locally calculated
-sha256  23df881cec3192d1f4474633c14eb2ec30a45b84f8daeb82b9de5d2bd3ac8218  LICENSE
+sha256  d315e6cdedc07c478de6992027bfb66f220886c6216fd7e9885ced30c3703646  LICENSE
diff --git a/package/thrift/thrift.mk b/package/thrift/thrift.mk
index 544eb97323..c36efce2ed 100644
--- a/package/thrift/thrift.mk
+++ b/package/thrift/thrift.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-THRIFT_VERSION = 0.13.0
+THRIFT_VERSION = 0.14.1
 THRIFT_SITE = http://www.us.apache.org/dist/thrift/$(THRIFT_VERSION)
 THRIFT_LICENSE = Apache-2.0
 THRIFT_LICENSE_FILES = LICENSE
@@ -18,8 +18,10 @@ HOST_THRIFT_DEPENDENCIES = host-bison host-boost \
 
 THRIFT_COMMON_CONF_OPTS = -DBUILD_TUTORIALS=OFF \
 	-DBUILD_TESTING=OFF \
+	-DWITH_NODEJS=OFF \
 	-DWITH_PYTHON=OFF \
 	-DWITH_JAVA=OFF \
+	-DWITH_JAVASCRIPT=OFF \
 	-DWITH_QT5=OFF
 
 THRIFT_CONF_OPTS = $(THRIFT_COMMON_CONF_OPTS) -DBUILD_COMPILER=OFF
