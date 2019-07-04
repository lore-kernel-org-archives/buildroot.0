From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 4 Jul 2019 07:56:53 +0200
Subject: [Buildroot] [git commit] package/tvheadend: bump version
Message-ID: <20190704060000.A7ED47FC8F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d5ca53da8685ede405dfa63f3f05212dd70300e1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patch which was applied upstream.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...-fix-pie-linking-according-to-disable-pie.patch | 34 ----------------------
 package/tvheadend/tvheadend.hash                   |  2 +-
 package/tvheadend/tvheadend.mk                     |  2 +-
 3 files changed, 2 insertions(+), 36 deletions(-)

diff --git a/package/tvheadend/0002-Makefile-fix-pie-linking-according-to-disable-pie.patch b/package/tvheadend/0002-Makefile-fix-pie-linking-according-to-disable-pie.patch
deleted file mode 100644
index 385c94b36b..0000000000
--- a/package/tvheadend/0002-Makefile-fix-pie-linking-according-to-disable-pie.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-From 5cbf08213222cb507d365e6cbda87277f0b8f31e Mon Sep 17 00:00:00 2001
-From: Giulio Benetti <giulio.benetti@micronovasrl.com>
-Date: Fri, 14 Jun 2019 14:25:08 +0200
-Subject: [PATCH] Makefile: fix -pie linking according to --disable-pie
-
-Only compilation follows './configure --disable-pie', linking instead
-doesn't, because '-pie' flag is passed to LDFLAGS uncoditionally.
-
-So add '-pie' flag only if CONFIG_PIE=yes.
-
-Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
----
- Makefile | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/Makefile b/Makefile
-index 41783b546..4e5a947a3 100644
---- a/Makefile
-+++ b/Makefile
-@@ -62,7 +62,10 @@ LDFLAGS += -ldl -lm
- else
- LDFLAGS += -ldl -lpthread -lm
- endif
--LDFLAGS += -pie -Wl,-z,now
-+ifeq ($(CONFIG_PIE),yes)
-+LDFLAGS += -pie
-+endif
-+LDFLAGS += -Wl,-z,now
- ifeq ($(CONFIG_LIBICONV),yes)
- LDFLAGS += -liconv
- endif
--- 
-2.17.1
-
diff --git a/package/tvheadend/tvheadend.hash b/package/tvheadend/tvheadend.hash
index 43178b874a..ea24aec1cb 100644
--- a/package/tvheadend/tvheadend.hash
+++ b/package/tvheadend/tvheadend.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 92c5f2cdda085b81fc50025afeb3ece74f60fae2b26f40a7dd07e227b0db2d9f  tvheadend-17dff3e5ffbd67174b6c0d7b49f5488e19ec1ead.tar.gz
+sha256 6a7703fbbe553a2d9f87acafc01162d81f78c6e427b8ab9c83242e1677248582  tvheadend-8f1de1621d78c91431238176bf4f6290870a031a.tar.gz
 sha256 54dc3cbc00bf126bcba43e2af7f3ad1dc00f335985da1409fa943c7b7256d942  LICENSE.md
diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index b192a33d4a..61732a203c 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TVHEADEND_VERSION = 17dff3e5ffbd67174b6c0d7b49f5488e19ec1ead
+TVHEADEND_VERSION = 8f1de1621d78c91431238176bf4f6290870a031a
 TVHEADEND_SITE = $(call github,tvheadend,tvheadend,$(TVHEADEND_VERSION))
 TVHEADEND_LICENSE = GPL-3.0+
 TVHEADEND_LICENSE_FILES = LICENSE.md
