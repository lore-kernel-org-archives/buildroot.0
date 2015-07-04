From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat,  4 Jul 2015 09:33:27 -0300
Subject: [Buildroot] [PATCH 2/2] isl: bump to version 0.14.1
In-Reply-To: <1436013207-29587-1-git-send-email-gustavo@zacarias.com.ar>
References: <1436013207-29587-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1436013207-29587-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also add hash file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/isl/isl.hash | 2 ++
 package/isl/isl.mk   | 8 ++++----
 2 files changed, 6 insertions(+), 4 deletions(-)
 create mode 100644 package/isl/isl.hash

diff --git a/package/isl/isl.hash b/package/isl/isl.hash
new file mode 100644
index 0000000..e2c14ad
--- /dev/null
+++ b/package/isl/isl.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256	8882c9e36549fc757efa267706a9af733bb8d7fe3905cbfde43e17a89eea4675	isl-0.14.1.tar.xz
diff --git a/package/isl/isl.mk b/package/isl/isl.mk
index 55cff9d..d7df226 100644
--- a/package/isl/isl.mk
+++ b/package/isl/isl.mk
@@ -4,18 +4,18 @@
 #
 ################################################################################
 
-# The latest 0.13 version is not yet compatible with cloog 0.18.2, so
+# The latest 0.15 version is not yet compatible with cloog 0.18.3, so
 # bumping isl is not possible until a new version of cloog is
 # published.
-ISL_VERSION = 0.12.2
-ISL_SOURCE = isl-$(ISL_VERSION).tar.bz2
+ISL_VERSION = 0.14.1
+ISL_SOURCE = isl-$(ISL_VERSION).tar.xz
 ISL_SITE = http://isl.gforge.inria.fr
 ISL_LICENSE = MIT
 ISL_LICENSE_FILES = LICENSE
 ISL_DEPENDENCIES = gmp
 
 # Our libtool patch doesn't apply, and since this package is only
-# built for the host, we don't really care about it.
+# # built for the host, we don't really care about it.
 ISL_LIBTOOL_PATCH = NO
 
 $(eval $(host-autotools-package))
-- 
2.3.6
