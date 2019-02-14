From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 14 Feb 2019 22:53:15 +0100
Subject: [Buildroot] [PATCH/next 1/1] package/libmad: remove
 LIBMAD_LIBTOOL_PATCH=NO
Message-ID: <20190214215315.8491-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since commit eae18d01abc737182fe171c908462499d5f1aaf0 "libmad: needs
autoreconf", autoreconf builds an up to date ltmain.sh so remove
LIBMAD_LIBTOOL_PATCH = NO which is not needed anymore

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libmad/libmad.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/libmad/libmad.mk b/package/libmad/libmad.mk
index 108c4f641b..b1c9cee5ac 100644
--- a/package/libmad/libmad.mk
+++ b/package/libmad/libmad.mk
@@ -7,7 +7,6 @@
 LIBMAD_VERSION = 0.15.1b
 LIBMAD_SITE = http://downloads.sourceforge.net/project/mad/libmad/$(LIBMAD_VERSION)
 LIBMAD_INSTALL_STAGING = YES
-LIBMAD_LIBTOOL_PATCH = NO
 LIBMAD_LICENSE = GPL-2.0+
 LIBMAD_LICENSE_FILES = COPYING
 LIBMAD_PATCH = \
-- 
2.14.1
