From: Martin Kepplinger <martin.kepplinger@ginzinger.com>
Date: Thu, 27 Apr 2017 11:15:13 +0200
Subject: [Buildroot] [PATCH] tslib: speed up the build by skipping autoreconf
Message-ID: <1493284513-7365-1-git-send-email-martin.kepplinger@ginzinger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Martin Kepplinger <martin.kepplinger@ginzinger.com>
---
hi,

this is more of a question what buildroot's stand is on this. Can there be
benefit from doing autoreconf in a real tarball release? In case there is
no patch against the relevant build sources, I guess not, but you'll know
better.

thanks
                       martin


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
 
-- 
2.1.4
