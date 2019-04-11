From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 11 Apr 2019 20:10:48 +0200
Subject: [Buildroot] [PATCH 1/1] package/sslh: bump to version 1.20
Message-ID: <20190411181048.12392-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Add hash for license file
- Enable parallel build: it has been fixed since version 1.19b and
  https://github.com/yrutschle/sslh/commit/70a2ea926efc8ca455b08d230b90789a57bc29c6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/sslh/sslh.hash | 3 ++-
 package/sslh/sslh.mk   | 4 ++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/sslh/sslh.hash b/package/sslh/sslh.hash
index 757005dd38..c25b37b8ab 100644
--- a/package/sslh/sslh.hash
+++ b/package/sslh/sslh.hash
@@ -1,2 +1,3 @@
 # Locally calculated
-sha256  1601a5b377dcafc6b47d2fbb8d4d25cceb83053a4adcc5874d501a2d5a7745ad    sslh-v1.18.tar.gz
+sha256  a7f49b0a1cfcb7bb9d97f5ffa932bff11c5f65d9a9bd8fe1812481dee5855116    sslh-v1.20.tar.gz
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643    COPYING
diff --git a/package/sslh/sslh.mk b/package/sslh/sslh.mk
index fac612c73e..6e29a99189 100644
--- a/package/sslh/sslh.mk
+++ b/package/sslh/sslh.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-SSLH_VERSION = v1.18
+SSLH_VERSION = v1.20
 SSLH_SITE = http://www.rutschle.net/tech/sslh
 SSLH_LICENSE = GPL-2.0+
 SSLH_LICENSE_FILES = COPYING
@@ -35,7 +35,7 @@ SSLH_MAKE_OPTS += USESYSTEMD=
 endif
 
 define SSLH_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE1) $(SSLH_MAKE_OPTS) -C $(@D)
+	$(TARGET_MAKE_ENV) $(MAKE) $(SSLH_MAKE_OPTS) -C $(@D)
 endef
 
 define SSLH_INSTALL_TARGET_CMDS
-- 
2.20.1
