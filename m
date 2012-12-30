From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 30 Dec 2012 22:33:31 +0100
Subject: [Buildroot] [PATCH 7/8] scons: ensure $(HOST_DIR)/usr/bin is in the
	PATH when invoking $(SCONS)
In-Reply-To: <cover.1356903063.git.s.martin49@gmail.com>
References: <cover.1356903063.git.s.martin49@gmail.com>
Message-ID: <3e298808e4ef829d5e301dcfb73c7cf9e4d07384.1356903063.git.s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/scons/scons.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/scons/scons.mk b/package/scons/scons.mk
index e3ada92..e828588 100644
--- a/package/scons/scons.mk
+++ b/package/scons/scons.mk
@@ -20,4 +20,4 @@ endef
 $(eval $(host-generic-package))
 
 # variables used by other packages
-SCONS = $(HOST_DIR)/usr/bin/scons
+SCONS = PATH=$(HOST_PATH) $(HOST_DIR)/usr/bin/scons
-- 
1.8.0.3
