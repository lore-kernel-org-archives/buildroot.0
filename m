From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Oct 2015 21:25:47 +0100
Subject: [Buildroot] [git commit] x265: use default CMake ON/OFF values
Message-ID: <20151026202653.2060081E84@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=23314b423ed6fc96ec25ef6bf81f041fd39ea8c9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

replace true/false with ON/OFF for consistency

Signed-off-by: Thijs Vermeir <thijsvermeir@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/x265/x265.mk |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

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
