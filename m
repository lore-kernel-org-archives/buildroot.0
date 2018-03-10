From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 10 Mar 2018 22:23:14 +0100
Subject: [Buildroot] [git commit] ympd: bump to version 1.3.0
Message-ID: <20180310212633.3134782ABC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=be2d79150503f6b2dd3ba5c26d1b854920ae0fea
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove mkdata hook as this is not needed since version 1.2.3.
Indeed, when CMAKE_CROSSCOMPILING is defined, ympd will use a perl
script (mkdata.pl) instead of mkdata binary

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ympd/ympd.hash |  2 +-
 package/ympd/ympd.mk   | 10 +---------
 2 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/package/ympd/ympd.hash b/package/ympd/ympd.hash
index 1c4ad8dc8f..6d45d63862 100644
--- a/package/ympd/ympd.hash
+++ b/package/ympd/ympd.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  092c26c51166d1d1f025cd06742981783dea7e42bfe4f73f10c4418fc003de94  ympd-v1.2.3.tar.gz
+sha256  d9f68920cd93d1cfa971e1d7b9162a2b1724909bc9753c1338cecb3688d234d5  ympd-v1.3.0.tar.gz
 sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  LICENSE
diff --git a/package/ympd/ympd.mk b/package/ympd/ympd.mk
index a50aee074e..e3f21e9eb0 100644
--- a/package/ympd/ympd.mk
+++ b/package/ympd/ympd.mk
@@ -4,18 +4,10 @@
 #
 ################################################################################
 
-YMPD_VERSION = v1.2.3
+YMPD_VERSION = v1.3.0
 YMPD_SITE = $(call github,notandy,ympd,$(YMPD_VERSION))
 YMPD_LICENSE = GPL-2.0
 YMPD_LICENSE_FILES = LICENSE
 YMPD_DEPENDENCIES = libmpdclient
 
-define YMPD_MAKE_HOST_TOOL
-	$(HOSTCC) $(HOST_CFLAGS) $(@D)/htdocs/mkdata.c -o $(@D)/mkdata
-endef
-
-YMPD_PRE_BUILD_HOOKS += YMPD_MAKE_HOST_TOOL
-
-YMPD_CONF_OPTS += -DMKDATA_EXE=$(@D)/mkdata
-
 $(eval $(cmake-package))
