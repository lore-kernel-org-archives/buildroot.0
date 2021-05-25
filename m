From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 25 May 2021 14:27:39 +0200
Subject: [Buildroot] [PATCHv3 04/15] package/flare-engine: update explicit
 setting of CMAKE_BUILD_TYPE
In-Reply-To: <20210525122750.5022-1-patrickdepinguin@gmail.com>
References: <20210525122750.5022-1-patrickdepinguin@gmail.com>
Message-ID: <20210525122750.5022-5-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>

The flare-engine package forces CMAKE_BUILD_TYPE=RelWithDebInfo in case
Buildroot would normally set CMAKE_BUILD_TYPE=Debug. Previously, this would
happen if BR2_ENABLE_DEBUG is set, but now we should check
BR2_ENABLE_RUNTIME_DEBUG instead.

Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 package/flare-engine/flare-engine.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/flare-engine/flare-engine.mk b/package/flare-engine/flare-engine.mk
index e2f3eefa28..503eb0825f 100644
--- a/package/flare-engine/flare-engine.mk
+++ b/package/flare-engine/flare-engine.mk
@@ -15,7 +15,7 @@ FLARE_ENGINE_DEPENDENCIES += sdl2 sdl2_image sdl2_mixer sdl2_ttf
 FLARE_ENGINE_CONF_OPTS += -DBINDIR=bin -DDATADIR=share/flare
 
 # Don't use the default Debug type as it adds -pg (gprof)
-ifeq ($(BR2_ENABLE_DEBUG),y)
+ifeq ($(BR2_ENABLE_RUNTIME_DEBUG),y)
 FLARE_ENGINE_CONF_OPTS += -DCMAKE_BUILD_TYPE=RelWithDebInfo
 endif
 
-- 
2.26.3
