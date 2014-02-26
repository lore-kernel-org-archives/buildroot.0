From: Simon Dawson <spdawson@gmail.com>
Date: Wed, 26 Feb 2014 17:56:53 +0000
Subject: [Buildroot] [PATCH] libtpl: remove unnecessary autoreconf options
Message-ID: <1393437413-21518-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The default $(PKG)_AUTORECONF_OPT already includes the -i and -f flags,
so there is no point in specifying these in the package makefile.

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/libtpl/libtpl.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/libtpl/libtpl.mk b/package/libtpl/libtpl.mk
index ff05991..1d4becf 100644
--- a/package/libtpl/libtpl.mk
+++ b/package/libtpl/libtpl.mk
@@ -11,7 +11,6 @@ LIBTPL_LICENSE = BSD-like
 LIBTPL_LICENSE_FILES = LICENSE
 
 LIBTPL_AUTORECONF = YES
-LIBTPL_AUTORECONF_OPT = --install --force
 
 define LIBTPL_CREATE_MISSING_FILES
 	touch $(@D)/NEWS $(@D)/AUTHORS $(@D)/ChangeLog $(@D)/COPYING
-- 
1.8.3.2
