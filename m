From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 26 Feb 2020 15:46:03 +0100
Subject: [Buildroot] [PATCH v2 32/37] package/cutelyst: drop
 QT5_VERSION_LATEST logic
In-Reply-To: <20200226144608.12529-1-peter@korsgaard.com>
References: <20200226144608.12529-1-peter@korsgaard.com>
Message-ID: <20200226144608.12529-32-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Now that the version selection has been removed.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cutelyst/cutelyst.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/cutelyst/cutelyst.mk b/package/cutelyst/cutelyst.mk
index 709d9443ca..f2129312d5 100644
--- a/package/cutelyst/cutelyst.mk
+++ b/package/cutelyst/cutelyst.mk
@@ -17,7 +17,7 @@ CUTELYST_CONF_OPTS += \
 	-DPLUGIN_VIEW_GRANTLEE=OFF
 
 # Qt 5.8 needs atomics, which on various architectures are in -latomic
-ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC)$(BR2_PACKAGE_QT5_VERSION_LATEST),yy)
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
 CUTELYST_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -latomic"
 endif
 
-- 
2.20.1
