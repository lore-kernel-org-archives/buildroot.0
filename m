From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 13 Oct 2018 10:01:02 +0200
Subject: [Buildroot] [PATCH 1/2] Revert "package/luvi: bump version to 2.8.0"
Message-ID: <20181013080103.29974-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This reverts commit ac6fedda6b43996545ff498cd19a781698a96050.

Fixes
http://autobuild.buildroot.net/results/111/11146b138d3d092c3a230d197528d5dbe293e3fc/
and many others.

Quoting J?rg Krause:
http://lists.busybox.net/pipermail/buildroot/2018-August/228534.html

"The version bump as version 2.8.0 does only updates the projects
 submodules, which we are not using at all. Instead, we always build
 luvi with dependencies provided as packages in Buildroot."

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/luvi/luvi.hash | 3 +--
 package/luvi/luvi.mk   | 9 +++++----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/luvi/luvi.hash b/package/luvi/luvi.hash
index d5716e0036..e2239b6171 100644
--- a/package/luvi/luvi.hash
+++ b/package/luvi/luvi.hash
@@ -1,3 +1,2 @@
 # Locally calculated
-sha256 a18e138c7032ef8406fef6e2135a61fad713861742512f2073adc0b4ab6d8f8b  luvi-v2.8.0.tar.gz
-sha256 cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
+sha256  ce9a1fb762e61267618ddea9ea129170fd543bb918c382b71cb35985d0024c42  luvi-src-v2.7.6.tar.gz
diff --git a/package/luvi/luvi.mk b/package/luvi/luvi.mk
index 8b3b7659b0..111dc09acd 100644
--- a/package/luvi/luvi.mk
+++ b/package/luvi/luvi.mk
@@ -4,10 +4,11 @@
 #
 ################################################################################
 
-LUVI_VERSION = v2.8.0
-LUVI_SITE = https://github.com/luvit/luvi.git
-LUVI_SITE_METHOD = git
-LUVI_GIT_SUBMODULES = YES
+# we keep version 2.7.6 because 2.8.0 causes build errors and only
+# contains updates to submodules we do not need
+LUVI_VERSION = v2.7.6
+LUVI_SOURCE = luvi-src-$(LUVI_VERSION).tar.gz
+LUVI_SITE = https://github.com/luvit/luvi/releases/download/$(LUVI_VERSION)
 LUVI_LICENSE = Apache-2.0
 LUVI_LICENSE_FILES = LICENSE.txt
 LUVI_DEPENDENCIES = libuv luajit luv host-luajit
-- 
2.19.1
