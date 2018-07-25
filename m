From: Carlos Santos <casantos@datacom.com.br>
Date: Wed, 25 Jul 2018 08:18:10 -0300
Subject: [Buildroot] [PATCH] gawk: install /usr/bin/awk as a relative symlink
Message-ID: <20180725111810.19587-1-casantos@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
  http://autobuild.buildroot.net/results/bf3937882023df7ed319dc76f1af10f79785112f/

Signed-off-by: Carlos Santos <casantos@datacom.com.br>
---
 package/gawk/gawk.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gawk/gawk.mk b/package/gawk/gawk.mk
index 1315abb9ee..7c93aefed6 100644
--- a/package/gawk/gawk.mk
+++ b/package/gawk/gawk.mk
@@ -34,7 +34,7 @@ endif
 HOST_GAWK_CONF_OPTS = --without-readline --without-mpfr
 
 define GAWK_CREATE_SYMLINK
-	ln -sf /usr/bin/gawk $(TARGET_DIR)/usr/bin/awk
+	ln -sf gawk $(TARGET_DIR)/usr/bin/awk
 endef
 
 GAWK_POST_INSTALL_TARGET_HOOKS += GAWK_CREATE_SYMLINK
-- 
2.14.4
