From: Avishay Orpaz <avishorp@gmail.com>
Date: Mon, 13 Aug 2012 17:19:37 +0300
Subject: [Buildroot] [PATCH 1/2] Added support for hashlib in the target
	Python
Message-ID: <1344867578-12784-1-git-send-email-avishorp@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/python/Config.in |    6 ++++++
 package/python/python.mk |    4 ++++
 2 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/package/python/Config.in b/package/python/Config.in
index 11aa267..65aac23 100644
--- a/package/python/Config.in
+++ b/package/python/Config.in
@@ -93,6 +93,12 @@ config BR2_PACKAGE_PYTHON_ZLIB
 	help
 	  zlib support in Python
 
+config BR2_PACKAGE_PYTHON_HASHLIB
+	bool "hashlib module"
+	select BR2_PACKAGE_OPENSSL
+	help
+	  hashlib support in Python
+
 endmenu
 
 endif
diff --git a/package/python/python.mk b/package/python/python.mk
index fae4e5c..0584a5a 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -110,6 +110,10 @@ else
 PYTHON_CONF_OPT += --disable-zlib
 endif
 
+ifeq ($(BR2_PACKAGE_PYTHON_HASHLIB),y)
+PYTHON_DEPENDENCIES += openssl
+endif
+
 PYTHON_CONF_ENV += \
 	PYTHON_FOR_BUILD=$(HOST_PYTHON_DIR)/python \
 	PGEN_FOR_BUILD=$(HOST_PYTHON_DIR)/Parser/pgen \
-- 
1.7.1
