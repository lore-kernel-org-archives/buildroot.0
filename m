From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 9 May 2020 09:02:29 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/wpewebkit: bump
 to version 2.28.0
Message-ID: <20200509124718.8430591137@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bbe227dac688592b6ba2455b39801dc2ce518113
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Adjust fix build with musl patch for 2.28.0.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit cd75229976780b1c25469cd42e0d9bbcf3c0cf55)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/wpewebkit/0001-Fix-build-with-musl.patch | 6 +++---
 package/wpewebkit/wpewebkit.hash                 | 8 ++++----
 package/wpewebkit/wpewebkit.mk                   | 2 +-
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/wpewebkit/0001-Fix-build-with-musl.patch b/package/wpewebkit/0001-Fix-build-with-musl.patch
index a436adf6ce..705c67c7f6 100644
--- a/package/wpewebkit/0001-Fix-build-with-musl.patch
+++ b/package/wpewebkit/0001-Fix-build-with-musl.patch
@@ -9,7 +9,7 @@ https://github.com/WebPlatformForEmbedded/meta-wpe/blob/master/recipes-wpe/wpewe
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
  Source/JavaScriptCore/runtime/MachineContext.h | 10 +++++-----
- Source/WTF/wtf/Platform.h                      |  2 +-
+ Source/WTF/wtf/PlatformHave.h                  |  2 +-
  2 files changed, 6 insertions(+), 6 deletions(-)
 
 diff --git a/Source/JavaScriptCore/runtime/MachineContext.h b/Source/JavaScriptCore/runtime/MachineContext.h
@@ -63,8 +63,8 @@ index bf0bdc7a51a..78d2ec81838 100644
  #if CPU(X86)
 diff --git a/Source/WTF/wtf/Platform.h b/Source/WTF/wtf/Platform.h
 index e2a3388993f..95fe7c593cf 100644
---- a/Source/WTF/wtf/Platform.h
-+++ b/Source/WTF/wtf/Platform.h
+--- a/Source/WTF/wtf/PlatformHave.h
++++ b/Source/WTF/wtf/PlatformHave.h
 @@ -683,7 +683,7 @@
  #define HAVE_CFNETWORK_STORAGE_PARTITIONING 1
  #endif
diff --git a/package/wpewebkit/wpewebkit.hash b/package/wpewebkit/wpewebkit.hash
index fd78264914..2e7016fe38 100644
--- a/package/wpewebkit/wpewebkit.hash
+++ b/package/wpewebkit/wpewebkit.hash
@@ -1,7 +1,7 @@
-# From https://wpewebkit.org/releases/wpewebkit-2.26.4.tar.xz.sums
-md5  4cd2883ec9da38a0ffe413bb75239874  wpewebkit-2.26.4.tar.xz
-sha1  337f78ee237fe98c7e6e728d8fc0508069b007be  wpewebkit-2.26.4.tar.xz
-sha256  0c292182864b63b725491f1a69b55c03e0e75f6db0875389caff31fe9c0d3ae9  wpewebkit-2.26.4.tar.xz
+# From https://wpewebkit.org/releases/wpewebkit-2.28.0.tar.xz.sums
+md5  4298b9d38b4f05f92995422ea9979893  wpewebkit-2.28.0.tar.xz
+sha1  9e791b6112cca8cda51ae7e991b545f4bf0bb46c  wpewebkit-2.28.0.tar.xz
+sha256  a85cd3cb46206a4929a9562d53379a7e7e2ec1a3224b34e2dcf5da30bb906722  wpewebkit-2.28.0.tar.xz
 
 # Hashes for license files:
 sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
index 6591c7a0d8..9c969cae5a 100644
--- a/package/wpewebkit/wpewebkit.mk
+++ b/package/wpewebkit/wpewebkit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WPEWEBKIT_VERSION = 2.26.4
+WPEWEBKIT_VERSION = 2.28.0
 WPEWEBKIT_SITE = http://www.wpewebkit.org/releases
 WPEWEBKIT_SOURCE = wpewebkit-$(WPEWEBKIT_VERSION).tar.xz
 WPEWEBKIT_INSTALL_STAGING = YES
