From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 17 Sep 2011 14:03:33 +0200
Subject: [Buildroot] [git commit] tslib: drop redundant configure options
Message-ID: <20110917121852.875578D517@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=cbdb0a09224400c97632fa58e1a33d5901ff8f69
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And cleanup while we're at it.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/tslib/tslib.mk |    9 ++-------
 1 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/package/tslib/tslib.mk b/package/tslib/tslib.mk
index 23c1f5b..a65e72e 100644
--- a/package/tslib/tslib.mk
+++ b/package/tslib/tslib.mk
@@ -3,15 +3,10 @@
 # tslib
 #
 #############################################################
-TSLIB_VERSION:=412d99d8b92c
-TSLIB_SITE:=git://github.com/kergoth/tslib.git
+TSLIB_VERSION = 412d99d8b92c
+TSLIB_SITE = git://github.com/kergoth/tslib.git
 TSLIB_AUTORECONF = YES
 TSLIB_INSTALL_STAGING = YES
-TSLIB_INSTALL_TARGET = YES
 TSLIB_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) LDFLAGS=-L$(STAGING_DIR)/usr/lib install
 
-TSLIB_CONF_OPT = \
-	--prefix=/usr	\
-	--sysconfdir=/etc
-
 $(eval $(call AUTOTARGETS,package,tslib))
