From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 23 Aug 2018 21:17:29 +0200
Subject: [Buildroot] [git commit branch/2018.05.x] gawk: install
 /usr/bin/awk as a relative symlink
Message-ID: <20180823190952.DD5788E2E8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1044bf595b788f2bdcde940622b71ee82aeb05bf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.05.x

Fixes:
  http://autobuild.buildroot.net/results/bf3937882023df7ed319dc76f1af10f79785112f/

Signed-off-by: Carlos Santos <casantos@datacom.com.br>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit d4b5a92c53f08b3afad4255b663ac292605d5aa8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gawk/gawk.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gawk/gawk.mk b/package/gawk/gawk.mk
index 0779736882..62350329f0 100644
--- a/package/gawk/gawk.mk
+++ b/package/gawk/gawk.mk
@@ -39,7 +39,7 @@ endif
 HOST_GAWK_CONF_OPTS = --without-readline --without-mpfr
 
 define GAWK_CREATE_SYMLINK
-	ln -sf /usr/bin/gawk $(TARGET_DIR)/usr/bin/awk
+	ln -sf gawk $(TARGET_DIR)/usr/bin/awk
 endef
 
 GAWK_POST_INSTALL_TARGET_HOOKS += GAWK_CREATE_SYMLINK
