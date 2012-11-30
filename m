From: Charles Manning <cdhmanning@gmail.com>
Date: Fri, 30 Nov 2012 14:42:32 +1300
Subject: [Buildroot] [PATCH 2/2] libsigc: Don't copy devel documentation
	onto target
Message-ID: <1354239752-18102-1-git-send-email-cdhmanning@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The libsigc++ developer documentation was being copied onto the target.
Add a clean-up to fix that.

There is probably a better way to do this but I still have training wheels.

Signed-off-by: Charles Manning <cdhmanning@gmail.com>
---
 package/libsigc/libsigc.mk |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/package/libsigc/libsigc.mk b/package/libsigc/libsigc.mk
index 92d1d8b..10f5803 100644
--- a/package/libsigc/libsigc.mk
+++ b/package/libsigc/libsigc.mk
@@ -8,4 +8,10 @@ LIBSIGC_SOURCE = libsigc++-$(LIBSIGC_VERSION).tar.bz2
 LIBSIGC_SITE = http://ftp.gnome.org/pub/GNOME/sources/libsigc++/2.2
 LIBSIGC_INSTALL_STAGING = YES
 
+define LIBSIGC_INSTALL_TARGET_FIXUP
+	rm -rf $(TARGET_DIR)/usr/share/devhelp/books/libsigc++*
+endef
+
+LIBSIGC_POST_INSTALL_TARGET_HOOKS += LIBSIGC_INSTALL_TARGET_FIXUP
+
 $(eval $(autotools-package))
-- 
1.7.1
