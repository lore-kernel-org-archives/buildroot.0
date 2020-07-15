From: aduskett at gmail.com <aduskett@gmail.com>
Date: Wed, 15 Jul 2020 16:19:16 -0700
Subject: [Buildroot] [PATCH 1/1] package/mender/mender.mk: add missing
 backslash
Message-ID: <20200715231916.1617588-1-aduskett@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Adam Duskett <Aduskett@gmail.com>

Without this backslash, any attempt to run make will result in the error:
package/mender/mender.mk:44: *** recipe commences before first target.  Stop

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
---
 package/mender/mender.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mender/mender.mk b/package/mender/mender.mk
index 13f0225037..325141787e 100644
--- a/package/mender/mender.mk
+++ b/package/mender/mender.mk
@@ -40,7 +40,7 @@ MENDER_LDFLAGS = -X main.Version=$(MENDER_VERSION)
 MENDER_UPDATE_MODULES_FILES = \
 	directory \
 	script \
-	single-file
+	single-file \
 	$(if $(BR2_PACKAGE_DOCKER_CLI),docker) \
 	$(if $(BR2_PACKAGE_RPM),rpm)
 
-- 
2.26.2
