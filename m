From: Nathan Lynch <ntl@pobox.com>
Date: Mon, 11 Jun 2012 21:09:39 -0500
Subject: [Buildroot] [PATCH 3/7] cmake: change use of BR2_JLEVEL to
	PARALLEL_JOBS
In-Reply-To: <1339466983-19786-1-git-send-email-ntl@pobox.com>
References: <1339466983-19786-1-git-send-email-ntl@pobox.com>
Message-ID: <1339466983-19786-4-git-send-email-ntl@pobox.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Nathan Lynch <ntl@pobox.com>
---
 package/cmake/cmake.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index af88eea..af6c53c 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -5,7 +5,7 @@ define HOST_CMAKE_CONFIGURE_CMDS
  (cd $(@D); \
 	LDFLAGS="$(HOST_LDFLAGS)" \
 	CFLAGS="$(HOST_CFLAGS)" \
-	./bootstrap --prefix=$(HOST_DIR)/usr --parallel=$(BR2_JLEVEL) \
+	./bootstrap --prefix=$(HOST_DIR)/usr --parallel=$(PARALLEL_JOBS) \
  )
 endef
 
-- 
1.7.6.5
