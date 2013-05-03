From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 3 May 2013 14:38:07 +0200
Subject: [Buildroot] [git commit] Added support for hashlib in the target
	Python
Message-ID: <20130504112537.7E15399AA8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=12097e6e4e4f732d37203d7b025e599bfd930349
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/python/Config.in |    6 ++++++
 package/python/python.mk |    4 ++++
 2 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/package/python/Config.in b/package/python/Config.in
index 4089cce..cfe73db 100644
--- a/package/python/Config.in
+++ b/package/python/Config.in
@@ -95,6 +95,12 @@ config BR2_PACKAGE_PYTHON_ZLIB
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
index 71591b7..4876dd8 100644
--- a/package/python/python.mk
+++ b/package/python/python.mk
@@ -108,6 +108,10 @@ else
 PYTHON_CONF_OPT += --disable-zlib
 endif
 
+ifeq ($(BR2_PACKAGE_PYTHON_HASHLIB),y)
+PYTHON_DEPENDENCIES += openssl
+endif
+
 PYTHON_CONF_ENV += \
 	PYTHON_FOR_BUILD=$(HOST_PYTHON_DIR)/python \
 	PGEN_FOR_BUILD=$(HOST_PYTHON_DIR)/Parser/pgen \
