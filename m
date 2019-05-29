From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 30 May 2019 00:24:31 +0200
Subject: [Buildroot] [git commit] package/flare-engine: fix check-package
 failure
Message-ID: <20190529221819.694AD8E7A0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=bf6c06152fbb89ae2a6988a0da8d79259da46674
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Check-package gives error on flare-engine due to trailing whitespace in
flare-engine.mk comment inserted with commit:
https://git.buildroot.net/buildroot/commit/?id=1203cca1b51eefb4ee236d998ab6ec32bdd087d8

Remove trailing whitespace in flare-engine.mk comment.

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/flare-engine/flare-engine.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/flare-engine/flare-engine.mk b/package/flare-engine/flare-engine.mk
index 3ed0256901..8a656d695f 100644
--- a/package/flare-engine/flare-engine.mk
+++ b/package/flare-engine/flare-engine.mk
@@ -21,7 +21,7 @@ endif
 
 ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
 # CMakeLists.txt sets CMAKE_CXX_FLAGS_<BUILD_TYPE> depending on
-# BUILD_TYPE, and this comes after the generic CMAKE_CXX_FLAGS. 
+# BUILD_TYPE, and this comes after the generic CMAKE_CXX_FLAGS.
 # Override CMAKE_BUILD_TYPE so no overrides are applied.
 FLARE_ENGINE_CONF_OPTS += -DCMAKE_BUILD_TYPE=Buildroot
 FLARE_ENGINE_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -O0"
