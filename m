From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 30 Nov 2012 22:08:03 -0800
Subject: [Buildroot] [git commit] libsigc: Don't copy devel documentation
	onto target
Message-ID: <20121201062134.70DB9995F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=537556b22ca6252d319a33ac797afb45b215dbd1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The libsigc++ developer documentation was being copied onto the target.
Add a clean-up to fix that.

Signed-off-by: Charles Manning <cdhmanning@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
