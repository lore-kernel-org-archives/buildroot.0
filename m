From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 16 Jul 2020 09:08:56 +0200
Subject: [Buildroot] [git commit] package/mender/mender.mk: add missing
 backslash
Message-ID: <20200716070620.8423E87083@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c66585ac5a8f0fffa06e96644f1be54e6aa6fd7a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Without this backslash, any attempt to run make will result in the error:
package/mender/mender.mk:44: *** recipe commences before first target.  Stop

Signed-off-by: Adam Duskett <Aduskett@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
 
