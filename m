From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 15 Jul 2020 21:33:05 +0200
Subject: [Buildroot] [git commit branch/2020.05.x] pkg-python.mk: use
 PYTHON3_PATH instead of duplicating its value
Message-ID: <20200715195249.54D5683896@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3027ac168e3bf3876807fc7086b28a523385c366
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.05.x

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 38960fbe6e02ea893371fda19a0dfdf167418f6b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/pkg-python.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index 4bf762e662..e5cd52003e 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -21,7 +21,7 @@
 ################################################################################
 
 define PKG_PYTHON_SYSCONFIGDATA_NAME
-$(basename $(notdir $(wildcard $(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/_sysconfigdata__linux_*.py)))
+$(basename $(notdir $(wildcard $(PYTHON3_PATH)/_sysconfigdata__linux_*.py)))
 endef
 
 # Target distutils-based packages
