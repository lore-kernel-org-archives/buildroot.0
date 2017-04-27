From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 27 Apr 2017 11:30:21 +0200
Subject: [Buildroot] [git commit] tslib: speed up the build by skipping
	autoreconf
Message-ID: <20170427093132.DDDA2826C3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4d9774812997dd51f39fc23855c8bc270bd254be
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We are not carrying any patches modifying auto* files, so autoreconf isn't
needed.

[Peter: extend commit message]
Signed-off-by: Martin Kepplinger <martin.kepplinger@ginzinger.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tslib/tslib.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/tslib/tslib.mk b/package/tslib/tslib.mk
index e0f307a..27d960d 100644
--- a/package/tslib/tslib.mk
+++ b/package/tslib/tslib.mk
@@ -10,7 +10,6 @@ TSLIB_SOURCE = tslib-$(TSLIB_VERSION).tar.xz
 TSLIB_LICENSE = GPL, LGPL
 TSLIB_LICENSE_FILES = COPYING
 
-TSLIB_AUTORECONF = YES
 TSLIB_INSTALL_STAGING = YES
 TSLIB_INSTALL_STAGING_OPTS = DESTDIR=$(STAGING_DIR) LDFLAGS=-L$(STAGING_DIR)/usr/lib install
 
