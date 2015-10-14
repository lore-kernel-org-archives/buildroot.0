From: Charles Duffy <charles@dyfis.net>
Date: Tue, 13 Oct 2015 23:29:37 -0500
Subject: [Buildroot] [PATCH 1/1] musl: Honor BR2_STATIC_LIBS /
	BR2_SHARED_LIBS
Message-ID: <1444796977-23004-1-git-send-email-chaduffy@cisco.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Charles Duffy <charles@dyfis.net>

Signed-off-by: Charles Duffy <chaduffy@cisco.com>
---
 package/musl/musl.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/musl/musl.mk b/package/musl/musl.mk
index 22589f5..aca78ab 100644
--- a/package/musl/musl.mk
+++ b/package/musl/musl.mk
@@ -28,7 +28,9 @@ define MUSL_CONFIGURE_CMDS
 			--host=$(GNU_TARGET_NAME) \
 			--prefix=/usr \
 			--libdir=/lib \
-			--disable-gcc-wrapper)
+			--disable-gcc-wrapper \
+			$(if $(BR2_STATIC_LIBS),--disable-shared) \
+			$(if $(BR2_SHARED_LIBS),--disable-static))
 endef
 
 define MUSL_BUILD_CMDS
-- 
2.0.0
