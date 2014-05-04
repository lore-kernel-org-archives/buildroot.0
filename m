From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun,  4 May 2014 17:03:14 +0200
Subject: [Buildroot] [PATCH] libfribidi: bump version
Message-ID: <1399215794-28324-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch also call autoreconf in order to use buildroot's libtool

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/libfribidi/libfribidi.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/libfribidi/libfribidi.mk b/package/libfribidi/libfribidi.mk
index 99005c2..52e2a84 100644
--- a/package/libfribidi/libfribidi.mk
+++ b/package/libfribidi/libfribidi.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-LIBFRIBIDI_VERSION = 0.19.5
+LIBFRIBIDI_VERSION = 0.19.6
 LIBFRIBIDI_SOURCE = fribidi-$(LIBFRIBIDI_VERSION).tar.bz2
 LIBFRIBIDI_SITE = http://www.fribidi.org/download/
 LIBFRIBIDI_LICENSE = LGPLv2.1+
 LIBFRIBIDI_LICENSE_FILES = COPYING
 LIBFRIBIDI_INSTALL_STAGING = YES
+LIBFRIBIDI_AUTORECONF = YES
 
 $(eval $(autotools-package))
-- 
1.9.2
