From: Romain Naour <romain.naour@openwide.fr>
Date: Fri, 15 May 2015 22:36:17 +0200
Subject: [Buildroot] [PATCH] package/boost: stop on the first error during
	install to staging
Message-ID: <1431722177-4629-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

-q option is missing in BOOST_INSTALL_STAGING_CMDS,
so the build doesn't stop on the first error.
This help to see what happened.

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/boost/boost.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/boost/boost.mk b/package/boost/boost.mk
index 7060591..3fe44e3 100644
--- a/package/boost/boost.mk
+++ b/package/boost/boost.mk
@@ -148,7 +148,7 @@ define HOST_BOOST_INSTALL_CMDS
 endef
 
 define BOOST_INSTALL_STAGING_CMDS
-	(cd $(@D) && ./bjam -j$(PARALLEL_JOBS) -d+1 \
+	(cd $(@D) && ./bjam -j$(PARALLEL_JOBS) -q -d+1 \
 	--user-config=$(@D)/user-config.jam \
 	$(BOOST_OPTS) \
 	--prefix=$(STAGING_DIR)/usr \
-- 
1.9.3
