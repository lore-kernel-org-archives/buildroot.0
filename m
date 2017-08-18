From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 18 Aug 2017 07:50:07 +0200
Subject: [Buildroot] [PATCH 1/1] package/zmqpp: link with libatomic when
	needed
Message-ID: <20170818055007.13273-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/c32/c32b9b8dd00d6f6d3db27fae9d8de758a4f25138/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/zmqpp/zmqpp.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/zmqpp/zmqpp.mk b/package/zmqpp/zmqpp.mk
index d651c3280..f57652746 100644
--- a/package/zmqpp/zmqpp.mk
+++ b/package/zmqpp/zmqpp.mk
@@ -13,6 +13,10 @@ ZMQPP_LICENSE_FILES = LICENSE
 ZMQPP_MAKE_OPTS = LD="$(TARGET_CXX)" BUILD_PATH=./build PREFIX=/usr
 ZMQPP_LDFLAGS = $(TARGET_LDFLAGS) -lpthread
 
+ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
+ZMQPP_LDFLAGS += -latomic
+endif
+
 ifeq ($(BR2_PACKAGE_ZMQPP_CLIENT),y)
 ZMQPP_DEPENDENCIES += boost
 endif
-- 
2.11.0
