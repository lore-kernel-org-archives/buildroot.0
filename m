From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 4 Apr 2014 23:29:46 +0200
Subject: [Buildroot] [git commit] luasec: bump to version 0.5
Message-ID: <20140404213202.DC18D8DB6F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=591835a831d45c8610f435754b66b94b00166e7d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

which is now compatible with Lua 5.2

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/luasec/Config.in |    4 ----
 package/luasec/luasec.mk |    4 ++--
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/package/luasec/Config.in b/package/luasec/Config.in
index 48aa766..ed55df7 100644
--- a/package/luasec/Config.in
+++ b/package/luasec/Config.in
@@ -3,12 +3,8 @@ config BR2_PACKAGE_LUASEC
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_LUASOCKET
 	depends on BR2_PACKAGE_HAS_LUA_INTERPRETER
-	depends on !BR2_PACKAGE_LUA_5_2
 	help
 	  LuaSec is a binding for OpenSSL library to provide TLS/SSL
 	  communication.
 
 	  http://www.inf.puc-rio.br/~brunoos/luasec/
-
-comment "luasec needs a Lua 5.1 interpreter"
-	depends on BR2_PACKAGE_LUA_5_2
diff --git a/package/luasec/luasec.mk b/package/luasec/luasec.mk
index 354e805..69f53b2 100644
--- a/package/luasec/luasec.mk
+++ b/package/luasec/luasec.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-LUASEC_VERSION_UPSTREAM = 0.4.1
+LUASEC_VERSION_UPSTREAM = 0.5
 LUASEC_VERSION = $(LUASEC_VERSION_UPSTREAM)-2
-LUASEC_SUBDIR  = luasec-luasec-$(LUASEC_VERSION_UPSTREAM)
+LUASEC_SUBDIR  = luasec
 LUASEC_LICENSE = MIT
 LUASEC_LICENSE_FILES = $(LUASEC_SUBDIR)/LICENSE
 LUASEC_DEPENDENCIES = openssl
