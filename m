From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 26 Oct 2014 19:45:41 +0100
Subject: [Buildroot] [PATCH 35/51] tslib: Use the release tarball
In-Reply-To: <1414349157-22749-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1414349157-22749-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1414349157-22749-35-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a hash file since the release tarball has been uploaded from the
maintainer.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/tslib/tslib.hash | 2 ++
 package/tslib/tslib.mk   | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)
 create mode 100644 package/tslib/tslib.hash

diff --git a/package/tslib/tslib.hash b/package/tslib/tslib.hash
new file mode 100644
index 0000000..e3ddce5
--- /dev/null
+++ b/package/tslib/tslib.hash
@@ -0,0 +1,2 @@
+# Locally generated
+sha256  121750e9ae0f05ce840ab8dbefdae1297258f0a69dd1967f55c40ac6e87d5ee9  tslib-1.1.tar.gz
diff --git a/package/tslib/tslib.mk b/package/tslib/tslib.mk
index 51aaf23..3f93149 100644
--- a/package/tslib/tslib.mk
+++ b/package/tslib/tslib.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 TSLIB_VERSION = 1.1
-TSLIB_SITE = $(call github,kergoth,tslib,$(TSLIB_VERSION))
+TSLIB_SITE = https://github.com/kergoth/tslib/releases/download/$(TSLIB_VERSION)/
 TSLIB_LICENSE = GPL, LGPL
 TSLIB_LICENSE_FILES = COPYING
 
-- 
2.1.1
