From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed,  7 Jul 2010 08:20:58 +0200
Subject: [Buildroot] [PATCH 05/20] cmake: pass LDFLAGS/CFLAGS when building
	for the host
In-Reply-To: <cover.1278483657.git.thomas.petazzoni@free-electrons.com>
References: <cover.1278483657.git.thomas.petazzoni@free-electrons.com>
Message-ID: <77b5b803c7ae4298b885d6b2e0b7506804943669.1278483657.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Passing LDFLAGS/CFLAGS when building for the host allows cmake to be
compiled with the proper -rpath value (the -rpath option is added to
HOST_LDFLAGS in a later commit).

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/cmake/cmake.mk |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index 42d4ff5..b388874 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -4,7 +4,9 @@ CMAKE_SITE=http://www.cmake.org/files/v2.8/
 
 define HOST_CMAKE_CONFIGURE_CMDS
  (cd $(@D); \
-   ./bootstrap --prefix=$(HOST_DIR)/usr --parallel=$(BR2_JLEVEL) \
+	LDFLAGS="$(HOST_LDFLAGS)" \
+	CFLAGS="$(HOST_CFLAGS)" \
+	./bootstrap --prefix=$(HOST_DIR)/usr --parallel=$(BR2_JLEVEL) \
  )
 endef
 
-- 
1.7.0.4
