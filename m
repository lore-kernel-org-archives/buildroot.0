From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 17 Jul 2019 07:15:19 +0200
Subject: [Buildroot] [git commit] package/ding-libs: bump to version 0.6.1
Message-ID: <20190717051318.332928139D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=711ec23193ec4e385414d05158be57c6f8f3b124
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Switch site to pagure.io as fedorahosted.org is retired:
  https://fedoraproject.org/wiki/Infrastructure/Fedorahosted-retirement
- Add hash for license files

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ding-libs/Config.in      | 2 +-
 package/ding-libs/ding-libs.hash | 4 +++-
 package/ding-libs/ding-libs.mk   | 7 ++++---
 3 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/package/ding-libs/Config.in b/package/ding-libs/Config.in
index 6dc2a80f82..152dca0426 100644
--- a/package/ding-libs/Config.in
+++ b/package/ding-libs/Config.in
@@ -13,4 +13,4 @@ config BR2_PACKAGE_DING_LIBS
 	  initialization format (INI) into a library collection data
 	  structure (libini_config).
 
-	  https://git.fedorahosted.org/git/ding-libs.git
+	  https://pagure.io/SSSD/ding-libs
diff --git a/package/ding-libs/ding-libs.hash b/package/ding-libs/ding-libs.hash
index 6e35697692..2ac5bd8eee 100644
--- a/package/ding-libs/ding-libs.hash
+++ b/package/ding-libs/ding-libs.hash
@@ -1,2 +1,4 @@
 # Locally computed
-sha256 639984a57d6f936a6551c842712619692febaebf4515033fc929620a241ffa6a ding_libs-0_4_0.tar.xz
+sha256 ad3c573641701f67d4b6bd8a5a71f0b65d45fd39fe961495ef5f5d3c57fc0963 ding-libs-ding_libs-0_6_1.tar.gz
+sha256 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903 COPYING
+sha256 6c57f43c939054fd4b831f271a14c97a488c38f98cdda5e887c5d396e3b3bc58 COPYING.LESSER
diff --git a/package/ding-libs/ding-libs.mk b/package/ding-libs/ding-libs.mk
index 976f5728ea..1e8fa59d69 100644
--- a/package/ding-libs/ding-libs.mk
+++ b/package/ding-libs/ding-libs.mk
@@ -4,9 +4,10 @@
 #
 ################################################################################
 
-DING_LIBS_VERSION = 0.4.0
-DING_LIBS_SOURCE = ding_libs-$(subst .,_,$(DING_LIBS_VERSION)).tar.xz
-DING_LIBS_SITE = https://git.fedorahosted.org/cgit/ding-libs.git/snapshot
+DING_LIBS_VERSION = 0.6.1
+DING_LIBS_SOURCE = ding-libs-ding_libs-$(subst .,_,$(DING_LIBS_VERSION)).tar.gz
+DING_LIBS_SITE = \
+	https://pagure.io/SSSD/ding-libs/archive/ding_libs-$(subst .,_,$(DING_LIBS_VERSION))
 DING_LIBS_DEPENDENCIES = host-pkgconf \
 	$(TARGET_NLS_DEPENDENCIES) \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv)
