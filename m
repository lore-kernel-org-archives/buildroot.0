From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 29 Aug 2017 21:10:03 +0200
Subject: [Buildroot] [PATCH 4/6] package/libconfig: switch to github
In-Reply-To: <20170829191005.19697-1-bernd.kuhls@t-online.de>
References: <20170829191005.19697-1-bernd.kuhls@t-online.de>
Message-ID: <20170829191005.19697-4-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The previous site does not provide the package anymore.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libconfig/libconfig.hash | 2 +-
 package/libconfig/libconfig.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libconfig/libconfig.hash b/package/libconfig/libconfig.hash
index 30110cbbd..00d3bd6bd 100644
--- a/package/libconfig/libconfig.hash
+++ b/package/libconfig/libconfig.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  e31daa390d8e4461c8830512fe2e13ba1a3d6a02a2305a02429eec61e68703f6  libconfig-1.5.tar.gz
+sha256 cae5c02361d8a9b2bb26946c64f089d2e5e599972f386203fbc48975c0d885c8  libconfig-v1.5.tar.gz
diff --git a/package/libconfig/libconfig.mk b/package/libconfig/libconfig.mk
index ed7e40f16..26827f41d 100644
--- a/package/libconfig/libconfig.mk
+++ b/package/libconfig/libconfig.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBCONFIG_VERSION = 1.5
-LIBCONFIG_SITE = http://www.hyperrealm.com/libconfig
+LIBCONFIG_VERSION = v1.5
+LIBCONFIG_SITE = $(call github,hyperrealm,libconfig,$(LIBCONFIG_VERSION))
 LIBCONFIG_LICENSE = LGPL-2.1+
 LIBCONFIG_LICENSE_FILES = COPYING.LIB
 LIBCONFIG_INSTALL_STAGING = YES
-- 
2.11.0
