From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 3 Feb 2015 00:02:13 +0100
Subject: [Buildroot] [git commit] automake: use whenever possible the
	ACLOCAL_DIR variable
Message-ID: <20150202231209.C59DD80458@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=65b3cda915f04d1c0a108c4163ea72e459f20652
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use the ACLOCAL_DIR in the GTK_DOC_M4_INSTALL hook.

Move the ACLOCAL_DIR definition at the beginning so the definition is
ahead the utilization.

Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
Reviewed-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/automake/automake.mk |    6 ++++--
 1 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/automake/automake.mk b/package/automake/automake.mk
index 5021b49..264cbad 100644
--- a/package/automake/automake.mk
+++ b/package/automake/automake.mk
@@ -12,8 +12,11 @@ AUTOMAKE_LICENSE_FILES = COPYING
 
 HOST_AUTOMAKE_DEPENDENCIES = host-autoconf
 
+ACLOCAL_DIR = $(HOST_DIR)/usr/share/aclocal
+
 define GTK_DOC_M4_INSTALL
-	$(INSTALL) -D -m 0644 package/automake/gtk-doc.m4 $(HOST_DIR)/usr/share/aclocal/gtk-doc.m4
+	$(INSTALL) -D -m 0644 package/automake/gtk-doc.m4 \
+		$(ACLOCAL_DIR)/gtk-doc.m4
 endef
 
 # ensure staging aclocal dir exists
@@ -28,5 +31,4 @@ $(eval $(host-autotools-package))
 
 # variables used by other packages
 AUTOMAKE = $(HOST_DIR)/usr/bin/automake
-ACLOCAL_DIR = $(HOST_DIR)/usr/share/aclocal
 ACLOCAL = $(HOST_DIR)/usr/bin/aclocal -I $(ACLOCAL_DIR)
