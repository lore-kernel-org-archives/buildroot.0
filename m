From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 3 Feb 2015 11:07:21 +0100
Subject: [Buildroot] [git commit] tslib: Use the release tarball
Message-ID: <20150203100726.15A5780E09@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6ae6417af349771b11c72a5bb68aa23409f352c4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a hash file since the release tarball has been uploaded from the
maintainer.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tslib/tslib.hash |    2 ++
 package/tslib/tslib.mk   |    2 +-
 2 files changed, 3 insertions(+), 1 deletions(-)

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
 
