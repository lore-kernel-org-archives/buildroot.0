From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 21 Jan 2013 00:52:22 +0100
Subject: [Buildroot] [RFC v1 13/14] cmake: support out of tree build
In-Reply-To: <1358725943-31485-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1358725943-31485-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1358725943-31485-14-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cmake/cmake.mk |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index e2bc31f..ff586bf 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -1,11 +1,13 @@
 CMAKE_VERSION = 2.8.9
 CMAKE_SITE = http://www.cmake.org/files/v2.8/
 
+CMAKE_SUPPORTS_OUT_OF_TREE = YES
+
 define HOST_CMAKE_CONFIGURE_CMDS
  (cd $(@D); \
 	LDFLAGS="$(HOST_LDFLAGS)" \
 	CFLAGS="$(HOST_CFLAGS)" \
-	./bootstrap --prefix=$(HOST_DIR)/usr --parallel=$(PARALLEL_JOBS) \
+	$(CMAKE_SRCDIR)/bootstrap --prefix=$(HOST_DIR)/usr --parallel=$(PARALLEL_JOBS) \
  )
 endef
 
-- 
1.7.9.5
