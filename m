From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri,  2 Apr 2021 20:14:58 +0200
Subject: [Buildroot] [PATCH 1/1] package/kismet: fix static build with uclibc
Message-ID: <20210402181458.1554685-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix static build with uclibc which is raised since bump to version
2020-12-R3 in commit 14522a8f9d272204763c49a21ebce5653430c612

Fixes:
 - http://autobuild.buildroot.org/results/69dcb7ac99e63fca342e4d52d9311d1ee1931911

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/kismet/kismet.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/kismet/kismet.mk b/package/kismet/kismet.mk
index 5445db0b1f..3a171af7b2 100644
--- a/package/kismet/kismet.mk
+++ b/package/kismet/kismet.mk
@@ -18,6 +18,9 @@ KISMET_DEPENDENCIES = \
 KISMET_LICENSE = GPL-2.0+
 KISMET_LICENSE_FILES = LICENSE
 KISMET_SELINUX_MODULES = kismet
+# Needed because tarball configure has not been rebuilt after
+# https://github.com/kismetwireless/kismet/commit/e70968bcbca86dd448d619c40cdeaae8b7dcee98
+KISMET_AUTORECONF = YES
 
 KISMET_CONF_OPTS = --disable-debuglibs
 
-- 
2.30.2
