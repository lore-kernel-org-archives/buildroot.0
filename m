From: Wojciech M. Zabolotny <wzab01@gmail.com>
Date: Sun,  5 Aug 2012 15:10:11 +0200
Subject: [Buildroot] [PATCH 2/2] Corrected .mk files to consider differences
	between buldroot-2011.11 and the current version
In-Reply-To: <1344172212-2929-1-git-send-email-wzab01@gmail.com>
References: <1344172212-2929-1-git-send-email-wzab01@gmail.com>
Message-ID: <1344172212-2929-3-git-send-email-wzab01@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Wojciech M. Zabolotny" <wzab01@gmail.com>

Signed-off-by: Wojciech M. Zabolotny <wzab01@gmail.com>
---
 package/libmsgpack/libmsgpack.mk         |    3 ++-
 package/msgpack-python/msgpack-python.mk |    2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libmsgpack/libmsgpack.mk b/package/libmsgpack/libmsgpack.mk
index eeaea52..a22dd53 100644
--- a/package/libmsgpack/libmsgpack.mk
+++ b/package/libmsgpack/libmsgpack.mk
@@ -10,4 +10,5 @@ LIBMSGPACK_INSTALL_STAGING=YES
 LIBMSGPACK_INSTALL_TARGET=YES
 LIBMSGPACK_AUTORECONF=YES
 LIBMSGPACK_CONF_OPT = --disable-cxx --disable-dependency-tracking
-$(eval $(call AUTOTARGETS))
+$(eval $(autotools-package))
+$(eval $(host-autotools-package))
\ No newline at end of file
diff --git a/package/msgpack-python/msgpack-python.mk b/package/msgpack-python/msgpack-python.mk
index d70e9de..44549ba 100644
--- a/package/msgpack-python/msgpack-python.mk
+++ b/package/msgpack-python/msgpack-python.mk
@@ -24,4 +24,4 @@ define MSGPACK_PYTHON_INSTALL_TARGET_CMDS
 	(cd $(@D); $(HOST_DIR)/usr/bin/python setup.py install --prefix=$(TARGET_DIR)/usr)
 endef
 
-$(eval $(call GENTARGETS))
+$(eval $(generic-package))
\ No newline at end of file
-- 
1.7.10.4
