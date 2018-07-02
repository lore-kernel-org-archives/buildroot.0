From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 2 Jul 2018 22:26:27 +0200
Subject: [Buildroot] [git commit] luasec: bump to version 0.7
Message-ID: <20180702202302.EBCA783DF1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5e62da7f88e9eb75d4afb1092d15af3d6c539ff7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/luasec/Config.in   | 2 +-
 package/luasec/luasec.hash | 2 +-
 package/luasec/luasec.mk   | 5 +++--
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/luasec/Config.in b/package/luasec/Config.in
index 9391cd9d37..d7900a081f 100644
--- a/package/luasec/Config.in
+++ b/package/luasec/Config.in
@@ -7,4 +7,4 @@ config BR2_PACKAGE_LUASEC
 	  LuaSec is a binding for OpenSSL library to provide TLS/SSL
 	  communication.
 
-	  http://www.inf.puc-rio.br/~brunoos/luasec/
+	  https://github.com/brunoos/luasec/wiki
diff --git a/package/luasec/luasec.hash b/package/luasec/luasec.hash
index 9d721ed485..1fdbe7d7e5 100644
--- a/package/luasec/luasec.hash
+++ b/package/luasec/luasec.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	1d04e2f70bc055348dda3cc3566d27d8408094bc944aa5c6a4ae18bffe5c0007  luasec-0.6-1.src.rock
+sha256	383e183ba712f00b2fcbf60187177432ccde724a23ac6186075ceae620cf0b0a  luasec-0.7-1.src.rock
diff --git a/package/luasec/luasec.mk b/package/luasec/luasec.mk
index 28c4b2c64b..7ae7290937 100644
--- a/package/luasec/luasec.mk
+++ b/package/luasec/luasec.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-LUASEC_VERSION = 0.6-1
-LUASEC_SUBDIR = luasec
+LUASEC_VERSION_UPSTREAM = 0.7
+LUASEC_VERSION = $(LUASEC_VERSION_UPSTREAM)-1
+LUASEC_SUBDIR = luasec-luasec-$(LUASEC_VERSION_UPSTREAM)
 LUASEC_LICENSE = MIT
 LUASEC_LICENSE_FILES = $(LUASEC_SUBDIR)/LICENSE
 LUASEC_DEPENDENCIES = openssl
