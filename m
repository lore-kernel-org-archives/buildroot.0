From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon, 29 Jul 2019 14:16:38 +0200
Subject: [Buildroot] [PATCH 2/2] package/dtc: disable valgrind
In-Reply-To: <20190729121638.6270-1-fontaine.fabrice@gmail.com>
References: <20190729121638.6270-1-fontaine.fabrice@gmail.com>
Message-ID: <20190729121638.6270-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since version 1.5.0, dtc optionally depends on valgrind so disable it by
setting NO_VALGRIND to 1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/dtc/dtc.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/dtc/dtc.mk b/package/dtc/dtc.mk
index b99a96df83..1188e954b2 100644
--- a/package/dtc/dtc.mk
+++ b/package/dtc/dtc.mk
@@ -15,11 +15,13 @@ HOST_DTC_DEPENDENCIES = host-bison host-flex
 
 DTC_MAKE_OPTS = \
 	PREFIX=/usr \
-	NO_PYTHON=1
+	NO_PYTHON=1 \
+	NO_VALGRIND=1
 
 HOST_DTC_MAKE_OPTS = \
 	PREFIX=$(HOST_DIR) \
 	NO_PYTHON=1 \
+	NO_VALGRIND=1 \
 	NO_YAML=1
 
 define DTC_POST_INSTALL_TARGET_RM_DTDIFF
-- 
2.20.1
