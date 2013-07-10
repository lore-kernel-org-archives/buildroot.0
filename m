From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 10 Jul 2013 21:56:44 +0200
Subject: [Buildroot] [git commit] python: remove idle sample
Message-ID: <20130710202004.6460C9A196@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=371c395b60d854a9b2f9e99f5d3243a6a8deeb41
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also move smtpd.py removal to the global remove useless files define.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/python/python.mk |   11 ++++-------
 1 files changed, 4 insertions(+), 7 deletions(-)

diff --git a/package/python/python.mk b/package/python/python.mk
index 975d6f4..ecea638 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -143,21 +143,18 @@ endef
 
 PYTHON_POST_INSTALL_STAGING_HOOKS += PYTHON_FIXUP_LIBDIR
 
-# Bad shebang, normally not used
-define PYTHON_REMOVE_SMTPD
-	rm -f $(TARGET_DIR)/usr/bin/smtpd.py
-endef
-
-PYTHON_POST_INSTALL_TARGET_HOOKS += PYTHON_REMOVE_SMTPD
-
 #
 # Remove useless files. In the config/ directory, only the Makefile
 # and the pyconfig.h files are needed at runtime.
 #
+# idle & smtpd.py have bad shebangs and are mostly samples
+#
 define PYTHON_REMOVE_USELESS_FILES
+	rm -f $(TARGET_DIR)/usr/bin/idle
 	rm -f $(TARGET_DIR)/usr/bin/python$(PYTHON_VERSION_MAJOR)-config
 	rm -f $(TARGET_DIR)/usr/bin/python2-config
 	rm -f $(TARGET_DIR)/usr/bin/python-config
+	rm -f $(TARGET_DIR)/usr/bin/smtpd.py
 	for i in `find $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/config/ \
 		-type f -not -name pyconfig.h -a -not -name Makefile` ; do \
 		rm -f $$i ; \
