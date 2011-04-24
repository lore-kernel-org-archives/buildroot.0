From: heiko at zuerker.org <heiko@zuerker.org>
Date: Sun, 24 Apr 2011 09:38:30 -0500
Subject: [Buildroot] [PATCH] Install module-init-tools into /sbin
Message-ID: <8181b3e96a35f372c8b36ec2dfb1eb2a00ee18ea.1303655867.git.smiley73@users.sourceforge.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Heiko Zuerker <smiley73@users.sourceforge.net>

Install module-init-tools binaries into /sbin, since they're system critical
and need to be available before e.g. mounting of /usr

Signed-off-by: Heiko Zuerker <smiley73@users.sourceforge.net>
---
 package/module-init-tools/module-init-tools.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/module-init-tools/module-init-tools.mk b/package/module-init-tools/module-init-tools.mk
index 27d0159..eb81ece 100644
--- a/package/module-init-tools/module-init-tools.mk
+++ b/package/module-init-tools/module-init-tools.mk
@@ -10,7 +10,9 @@ MODULE_INIT_TOOLS_CONF_ENV = ac_cv_prog_DOCBOOKTOMAN=''
 MODULE_INIT_TOOLS_CONF_OPT = \
 	--disable-static-utils \
 	--disable-builddir \
-	--program-transform-name=''
+	--program-transform-name='' \
+	--prefix=/usr \
+	--exec-prefix=
 
 # module-init-tools-3.11-add-manpages-config-option.patch is modifying
 # configure.ac and Makefile.am
-- 
1.7.3.2
