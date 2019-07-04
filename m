From: Adrian Perez de Castro <aperez@igalia.com>
Date: Thu,  4 Jul 2019 12:01:48 +0300
Subject: [Buildroot] [PATCH 1/1] package/cog: bump to version 0.3.1
Message-ID: <20190704090148.2524-1-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update the packge to version 0.3.1, which includes build improvements.
In particular, it now uses wayland-scanner to generate Wayland protocol
code instead of shipping pre-generated files.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/cog/cog.hash | 6 ++++--
 package/cog/cog.mk   | 5 +++--
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/cog/cog.hash b/package/cog/cog.hash
index 3aec4ca378..18b53e4ee4 100644
--- a/package/cog/cog.hash
+++ b/package/cog/cog.hash
@@ -1,5 +1,7 @@
-# Locally generated
-sha256 755c68029bbd05a17784262e56021362740783d15868dab9402a125ef35eedaf  cog-0.3.0.tar.gz
+# From https://github.com/Igalia/cog/releases/tag/v0.3.1
+md5 65bb078aad576b8402f973234e86cc82 cog-0.3.1.tar.xz
+sha1 d73b060618f342accb12db71a7578940c2243d4c cog-0.3.1.tar.xz
+sha256 ca7eae333cc02b947ec3d657a2090f01a9b08f9fabb855a585472edafbd9e7eb cog-0.3.1.tar.xz
 
 # Hashes for license files:
 sha256 e6c42d93c68b292bcccf6d2ec3e13da85df90b718ba27c2c2a01053a9d009252  COPYING
diff --git a/package/cog/cog.mk b/package/cog/cog.mk
index 98b0aa6f7a..615d6664df 100644
--- a/package/cog/cog.mk
+++ b/package/cog/cog.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-COG_VERSION = 0.3.0
-COG_SITE = $(call github,Igalia,cog,v$(COG_VERSION))
+COG_VERSION = 0.3.1
+COG_SITE = https://github.com/Igalia/cog/releases/download/v$(COG_VERSION)
+COG_SOURCE = cog-$(COG_VERSION).tar.xz
 COG_INSTALL_STAGING = YES
 COG_DEPENDENCIES = dbus wpewebkit wpebackend-fdo
 COG_LICENSE = MIT
-- 
2.22.0
