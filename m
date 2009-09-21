From: Will Newton <will.newton@gmail.com>
Date: Mon, 21 Sep 2009 17:42:22 +0200
Subject: [Buildroot] [git commit master] python: Don't delete .py files
	unless asked.
Message-ID: <20090921154312.7F62477764@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=0c2b9a4a2df1d42ab8ebfaf340bbfeeed1268c48
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If we have set BR2_PACKAGE_PYTHON_PY_ONLY or BR2_PACKAGE_PYTHON_PY_PYC
we want .py files to be left on the target, whatever the value of
BR2_PACKAGE_PYTHON_DEV.

Signed-off-by: Will Newton <will.newton@gmail.com>
---
 package/python/python.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/package/python/python.mk b/package/python/python.mk
index cd1ccec..95586ad 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -155,7 +155,6 @@ endif
 ifneq ($(BR2_PACKAGE_PYTHON_DEV),y)
 	rm -rf $(TARGET_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)
 	rm -rf $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/config
-	find $(TARGET_DIR)/usr/lib/ -name '*.py' -exec rm {} \;
 endif
 ifneq ($(BR2_PACKAGE_PYTHON_BSDDB),y)
 	rm -rf $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/bsddb
-- 
1.6.3.3
