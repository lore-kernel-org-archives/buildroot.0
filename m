From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 24 Sep 2019 23:14:06 +0200
Subject: [Buildroot] [git commit] package/c-icap-modules: bump to version
 0.5.3
Message-ID: <20190924211011.BD4FB8F388@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=77657f36de106a062b7e91a0589bf2bac9a8641d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Remove zlib option (dropped since version 0.5.1 and
  https://github.com/c-icap/c-icap-modules/commit/51e78cf08a0a92b58037abcbbcacba962874d0b0)
- Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/c-icap-modules/c-icap-modules.hash | 10 +++++++---
 package/c-icap-modules/c-icap-modules.mk   |  9 +--------
 2 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/package/c-icap-modules/c-icap-modules.hash b/package/c-icap-modules/c-icap-modules.hash
index a9fee87e43..fa0eb08983 100644
--- a/package/c-icap-modules/c-icap-modules.hash
+++ b/package/c-icap-modules/c-icap-modules.hash
@@ -1,3 +1,7 @@
-# From http://sourceforge.net/projects/c-icap/files/c-icap-modules/0.4.x/
-md5 1a7eaa7a34ff35c2440cf303f7b45f22  c_icap_modules-0.4.5.tar.gz
-sha1 515145e6d29413aff8543937504dc5c419043fd5  c_icap_modules-0.4.5.tar.gz
+# From http://sourceforge.net/projects/c-icap/files/c-icap-modules/0.5.x/
+md5 d5f1e553cfe60180f9fa22c9a13005be  c_icap_modules-0.5.3.tar.gz
+sha1 df76f30b2cc29aeef700f477693e7017eaa847f4  c_icap_modules-0.5.3.tar.gz
+
+# Locally calculated
+sha256 6e2f87a60379ffde26947c6e82ff0c7f614bc005588bf1efb40c74f69c82f925  c_icap_modules-0.5.3.tar.gz
+sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/c-icap-modules/c-icap-modules.mk b/package/c-icap-modules/c-icap-modules.mk
index d75437898c..b5356b1db1 100644
--- a/package/c-icap-modules/c-icap-modules.mk
+++ b/package/c-icap-modules/c-icap-modules.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-C_ICAP_MODULES_VERSION = 0.4.5
+C_ICAP_MODULES_VERSION = 0.5.3
 C_ICAP_MODULES_SOURCE = c_icap_modules-$(C_ICAP_MODULES_VERSION).tar.gz
 C_ICAP_MODULES_SITE = http://downloads.sourceforge.net/c-icap
 C_ICAP_MODULES_LICENSE = GPL-2.0+
@@ -15,13 +15,6 @@ C_ICAP_MODULES_CONF_OPTS = \
 	--with-c-icap=$(STAGING_DIR)/usr/ \
 	--without-clamav
 
-ifeq ($(BR2_PACKAGE_ZLIB),y)
-C_ICAP_MODULES_CONF_OPTS += --with-zlib
-C_ICAP_MODULES_DEPENDENCIES += zlib
-else
-C_ICAP_MODULES_CONF_OPTS += --without-zlib
-endif
-
 ifeq ($(BR2_PACKAGE_BERKELEYDB),y)
 C_ICAP_MODULES_CONF_OPTS += --with-bdb
 C_ICAP_MODULES_DEPENDENCIES += berkeleydb
