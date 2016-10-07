From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 7 Oct 2016 16:00:38 +0200
Subject: [Buildroot] [git commit] libmicrohttpd: update to 0.9.51
Message-ID: <20161007140042.BA344804C4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=48073884101fe3db7d4bfc8d0b585232bd0e9080
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bfin workaround is not required if the gcc bfin patch is applied.
(gcc: enable _REENTRANT for bfin when -lpthread is used)

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/libmicrohttpd/libmicrohttpd.hash | 2 +-
 package/libmicrohttpd/libmicrohttpd.mk   | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libmicrohttpd/libmicrohttpd.hash b/package/libmicrohttpd/libmicrohttpd.hash
index b228716..848eb65 100644
--- a/package/libmicrohttpd/libmicrohttpd.hash
+++ b/package/libmicrohttpd/libmicrohttpd.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	d1b6385068abded29b6470e383287aa7705de05ae3c08ad0bf5747ac4dc6ebd7	libmicrohttpd-0.9.50.tar.gz
+sha256	3000bb0ba219061f2ea60251b8ea3d5f694e8c6ce1706bbff57e7e24867a23c7	libmicrohttpd-0.9.51.tar.gz
diff --git a/package/libmicrohttpd/libmicrohttpd.mk b/package/libmicrohttpd/libmicrohttpd.mk
index 2266d3c..9caa24a 100644
--- a/package/libmicrohttpd/libmicrohttpd.mk
+++ b/package/libmicrohttpd/libmicrohttpd.mk
@@ -4,18 +4,18 @@
 #
 ################################################################################
 
-LIBMICROHTTPD_VERSION = 0.9.50
+LIBMICROHTTPD_VERSION = 0.9.51
 LIBMICROHTTPD_SITE = $(BR2_GNU_MIRROR)/libmicrohttpd
 LIBMICROHTTPD_LICENSE_FILES = COPYING
 LIBMICROHTTPD_INSTALL_STAGING = YES
 LIBMICROHTTPD_CONF_OPTS = --disable-curl --disable-examples
 LIBMICROHTTPD_CFLAGS = $(TARGET_CFLAGS) -std=c99
 
-# gcc on arc and bfin doesn't define _REENTRANT when -pthread is
+# gcc on arc doesn't define _REENTRANT when -pthread is
 # passed while it should. Compensate this defiency here otherwise
 # libmicrohttpd configure script doesn't find that thread support is
 # enabled.
-ifeq ($(BR2_arc)$(BR2_bfin),y)
+ifeq ($(BR2_arc),y)
 LIBMICROHTTPD_CFLAGS += -D_REENTRANT
 endif
 
