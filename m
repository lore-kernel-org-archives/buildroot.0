From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Wed,  4 Mar 2015 23:31:17 +0100
Subject: [Buildroot] [PATCH 2/2] swig: change the name of variable
	SWIG_MAJOR to SWIG_VERSION_MAJOR
In-Reply-To: <1425508277-11723-1-git-send-email-jerzy.grzegorek@trzebnica.net>
References: <1425508277-11723-1-git-send-email-jerzy.grzegorek@trzebnica.net>
Message-ID: <1425508277-11723-3-git-send-email-jerzy.grzegorek@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
---
 package/swig/swig.mk | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/swig/swig.mk b/package/swig/swig.mk
index 3ef56d6..3f3ab2f 100644
--- a/package/swig/swig.mk
+++ b/package/swig/swig.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-SWIG_MAJOR = 2.0
-SWIG_VERSION = $(SWIG_MAJOR).12
+SWIG_VERSION_MAJOR = 2.0
+SWIG_VERSION = $(SWIG_VERSION_MAJOR).12
 SWIG_SITE = http://downloads.sourceforge.net/project/swig/swig/swig-$(SWIG_VERSION)
 SWIG_DEPENDENCIES = host-bison
 HOST_SWIG_CONF_OPTS = \
@@ -25,11 +25,11 @@ SWIG_LICENSE_FILES = LICENSE LICENSE-GPL LICENSE-UNIVERSITIES
 # swig, so that our swig always gets used.
 
 define HOST_SWIG_INSTALL_SYMLINK
-	ln -fs $(HOST_DIR)/usr/bin/swig $(HOST_DIR)/usr/bin/swig$(SWIG_MAJOR)
+	ln -fs $(HOST_DIR)/usr/bin/swig $(HOST_DIR)/usr/bin/swig$(SWIG_VERSION_MAJOR)
 endef
 
 HOST_SWIG_POST_INSTALL_HOOKS += HOST_SWIG_INSTALL_SYMLINK
 
 $(eval $(host-autotools-package))
 
-SWIG = $(HOST_DIR)/usr/bin/swig$(SWIG_MAJOR)
+SWIG = $(HOST_DIR)/usr/bin/swig$(SWIG_VERSION_MAJOR)
-- 
1.9.1
