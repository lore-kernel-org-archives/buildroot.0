From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 14 Jun 2015 23:34:01 +0200
Subject: [Buildroot] [git commit] automake: use whenever possible the
	ACLOCAL_HOST_DIR variable
Message-ID: <20150614213414.5B2D2817B8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=29b146cafd44d5adc6ea342add2dd03a853b5249
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use the ACLOCAL_HOST_DIR in the GTK_DOC_M4_INSTALL hook.

Move the ACLOCAL_HOST_DIR definition at the beginning so the definition
is ahead the utilization.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Cc: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/automake/automake.mk |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/automake/automake.mk b/package/automake/automake.mk
index a3fd18c..84f05dc 100644
--- a/package/automake/automake.mk
+++ b/package/automake/automake.mk
@@ -12,8 +12,11 @@ AUTOMAKE_LICENSE_FILES = COPYING
 
 HOST_AUTOMAKE_DEPENDENCIES = host-autoconf
 
+ACLOCAL_HOST_DIR = $(HOST_DIR)/usr/share/aclocal
+
 define GTK_DOC_M4_INSTALL
-	$(INSTALL) -D -m 0644 package/automake/gtk-doc.m4 $(HOST_DIR)/usr/share/aclocal/gtk-doc.m4
+	$(INSTALL) -D -m 0644 package/automake/gtk-doc.m4 \
+		$(ACLOCAL_HOST_DIR)/gtk-doc.m4
 endef
 
 # ensure staging aclocal dir exists
@@ -29,5 +32,4 @@ $(eval $(host-autotools-package))
 # variables used by other packages
 AUTOMAKE = $(HOST_DIR)/usr/bin/automake
 ACLOCAL_DIR = $(STAGING_DIR)/usr/share/aclocal
-ACLOCAL_HOST_DIR = $(HOST_DIR)/usr/share/aclocal
 ACLOCAL = $(HOST_DIR)/usr/bin/aclocal -I $(ACLOCAL_DIR)
