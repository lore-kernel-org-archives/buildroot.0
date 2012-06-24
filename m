From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 24 Jun 2012 11:10:04 +0200
Subject: [Buildroot] [git commit] cmake: change use of BR2_JLEVEL to
	PARALLEL_JOBS
Message-ID: <20120624095658.2717788E1F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=615645936cccfed19ee5d28121df6f2ecc294f9d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Nathan Lynch <ntl@pobox.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
 
