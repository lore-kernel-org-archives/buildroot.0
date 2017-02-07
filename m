From: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
Date: Tue, 7 Feb 2017 11:32:34 +0530
Subject: [Buildroot] [PATCH] libcec: remove LIBCEC_AUTORECONF variable
Message-ID: <1486447354-21683-1-git-send-email-rahul.bedarkar@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libcec is a cmake based package. LIBCEC_AUTORECONF is meaningless in
this context.

Signed-off-by: Rahul Bedarkar <rahul.bedarkar@imgtec.com>
---
 package/libcec/libcec.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/libcec/libcec.mk b/package/libcec/libcec.mk
index 1fe69ee..f00e10f 100644
--- a/package/libcec/libcec.mk
+++ b/package/libcec/libcec.mk
@@ -9,8 +9,6 @@ LIBCEC_SITE = $(call github,Pulse-Eight,libcec,libcec-$(LIBCEC_VERSION))
 LIBCEC_LICENSE = GPLv2+
 LIBCEC_LICENSE_FILES = COPYING
 
-# Autoreconf required due to being a dev tarball and not a release tarball.
-LIBCEC_AUTORECONF = YES
 LIBCEC_INSTALL_STAGING = YES
 LIBCEC_DEPENDENCIES = host-pkgconf libplatform
 
-- 
2.6.2
