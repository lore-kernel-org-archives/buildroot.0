From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Tue, 6 Jan 2015 17:42:33 +0000
Subject: [Buildroot] [PATCH 1/2] fluxbox: do not autoreconf
Message-ID: <1420566154-43239-1-git-send-email-Vincent.Riera@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There is no need to have "AUTORECONF = YES" since the patch which
modified the "configure.in" file was removed in the last version bump.

Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
---
 package/fluxbox/fluxbox.mk |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

diff --git a/package/fluxbox/fluxbox.mk b/package/fluxbox/fluxbox.mk
index a0f9367..31699d5 100644
--- a/package/fluxbox/fluxbox.mk
+++ b/package/fluxbox/fluxbox.mk
@@ -10,8 +10,6 @@ FLUXBOX_SITE = http://downloads.sourceforge.net/project/fluxbox/fluxbox/$(FLUXBO
 FLUXBOX_LICENSE = MIT
 FLUXBOX_LICENSE_FILES = COPYING
 
-FLUXBOX_AUTORECONF = YES
-
 FLUXBOX_CONF_OPTS = --x-includes=$(STAGING_DIR)/usr/include/X11 \
 		   --x-libraries=$(STAGING_DIR)/usr/lib
 FLUXBOX_DEPENDENCIES = xlib_libX11 $(if $(BR2_PACKAGE_LIBICONV),libiconv)
-- 
1.7.1
