From: David Bender <codehero@gmail.com>
Date: Thu, 22 Jan 2015 14:11:44 -0500
Subject: [Buildroot] [PATCH 3/3] use TARGET_CONFIGURE_OPTS instead of
	homegrown ENV
In-Reply-To: <1421953904-9156-1-git-send-email-codehero@gmail.com>
References: <20150117192144.GA2827@tarshish>
 <1421953904-9156-1-git-send-email-codehero@gmail.com>
Message-ID: <1421953904-9156-3-git-send-email-codehero@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: David Bender <codehero@gmail.com>
---
 package/cgic/cgic.mk |    7 ++-----
 1 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/package/cgic/cgic.mk b/package/cgic/cgic.mk
index 378e1cd..a575a16 100644
--- a/package/cgic/cgic.mk
+++ b/package/cgic/cgic.mk
@@ -9,14 +9,11 @@ CGIC_SOURCE = cgic206.tar.gz
 CGIC_SITE = http://boutell.com/cgic
 CGIC_LICENSE = Custom
 CGIC_LICENSE_FILES = license.txt
-
-CGIC_ENV = AR=$(TARGET_CROSS)ar \
-	CC=$(TARGET_CROSS)gcc \
-	RANLIB=$(TARGET_CROSS)ranlib
+CGIC_INSTALL_STAGING = YES
 
 define CGIC_BUILD_CMDS
 	(cd $(@D); \
-		$(CGIC_ENV) \
+		$(TARGET_CONFIGURE_OPTS) \
 		make libcgic.a \
 		)
 endef
-- 
1.7.8.6
