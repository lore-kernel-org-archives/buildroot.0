From: Thijs Vermeir <thijsvermeir@gmail.com>
Date: Mon, 26 Oct 2015 21:16:38 +0100
Subject: [Buildroot] [PATCH] x265: use default CMake ON/OFF values
Message-ID: <1445890598-53696-1-git-send-email-thijsvermeir@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

replace true/false with ON/OFF for consistency

Signed-off-by: Thijs Vermeir <thijsvermeir@gmail.com>
---
 package/x265/x265.mk | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/x265/x265.mk b/package/x265/x265.mk
index a51d34b..45c86f1 100644
--- a/package/x265/x265.mk
+++ b/package/x265/x265.mk
@@ -17,15 +17,15 @@ X265_DEPENDENCIES += host-yasm
 endif
 
 ifeq ($(BR2_SHARED_LIBS)$(BR2_SHARED_STATIC_LIBS),y)
-X265_CONF_OPTS += -DENABLE_SHARED=true -DENABLE_PIC=true
+X265_CONF_OPTS += -DENABLE_SHARED=ON -DENABLE_PIC=ON
 else
-X265_CONF_OPTS += -DENABLE_SHARED=false
+X265_CONF_OPTS += -DENABLE_SHARED=OFF
 endif
 
 ifeq ($(BR2_PACKAGE_X265_CLI),y)
-X265_CONF_OPTS += -DENABLE_CLI=true
+X265_CONF_OPTS += -DENABLE_CLI=ON
 else
-X265_CONF_OPTS += -DENABLE_CLI=false
+X265_CONF_OPTS += -DENABLE_CLI=OFF
 endif
 
 $(eval $(cmake-package))
-- 
2.1.0
