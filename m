From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 15 Oct 2020 22:29:25 +0200
Subject: [Buildroot] [git commit] package/duktape: bump to version 2.6.0
Message-ID: <20201015204335.46A33817DF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dfda62d326d9fe77dc46429a398824b3405d042e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Use official tarball instead of github helper
- Update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/duktape/duktape.hash | 4 ++--
 package/duktape/duktape.mk   | 6 ++++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/duktape/duktape.hash b/package/duktape/duktape.hash
index b50ae7329c..4c55e39888 100644
--- a/package/duktape/duktape.hash
+++ b/package/duktape/duktape.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256	810e1dab50dfd3040cac4bb18b96d749a5fdebfd898a7bfe74512044c1a89880	duktape-2.5.0.tar.gz
-sha256	5b42d02dbd084fd6d7e61d93f52e02b596f25400e54e0f86d5780045e5b754c8	LICENSE.txt
+sha256  96f4a05a6c84590e53b18c59bb776aaba80a205afbbd92b82be609ba7fe75fa7  duktape-2.6.0.tar.xz
+sha256  5b42d02dbd084fd6d7e61d93f52e02b596f25400e54e0f86d5780045e5b754c8  LICENSE.txt
diff --git a/package/duktape/duktape.mk b/package/duktape/duktape.mk
index 0047571883..aadd609248 100644
--- a/package/duktape/duktape.mk
+++ b/package/duktape/duktape.mk
@@ -4,8 +4,10 @@
 #
 ################################################################################
 
-DUKTAPE_VERSION = 2.5.0
-DUKTAPE_SITE = $(call github,svaarala,duktape-releases,v$(DUKTAPE_VERSION))
+DUKTAPE_VERSION = 2.6.0
+DUKTAPE_SOURCE = duktape-$(DUKTAPE_VERSION).tar.xz
+DUKTAPE_SITE = \
+	https://github.com/svaarala/duktape/releases/download/v$(DUKTAPE_VERSION)
 DUKTAPE_LICENSE = MIT
 DUKTAPE_LICENSE_FILES = LICENSE.txt
 DUKTAPE_INSTALL_STAGING = YES
