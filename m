From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 31 Aug 2014 21:55:14 +0200
Subject: [Buildroot] [PATCH v2 1/9] package/cmake: add host-pkgconf as
	dependency
In-Reply-To: <1409514922-9509-1-git-send-email-s.martin49@gmail.com>
References: <1409514922-9509-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1409514922-9509-2-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since some CMake modules (even upstream ones) use pgk_check_modules
primtives to find {C,LD}FLAGS, then add it to the dependency list.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v1->v2:
- new patch
---
 package/cmake/cmake.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
index 6987f09..bfeb147 100644
--- a/package/cmake/cmake.mk
+++ b/package/cmake/cmake.mk
@@ -10,6 +10,8 @@ CMAKE_SITE = http://www.cmake.org/files/v$(CMAKE_VERSION_MAJOR)
 CMAKE_LICENSE = BSD-3c
 CMAKE_LICENSE_FILES = Copyright.txt
 
+HOST_CMAKE_DEPENDENCIES = host-pkgconf
+
 define HOST_CMAKE_CONFIGURE_CMDS
 	(cd $(@D); \
 		LDFLAGS="$(HOST_LDFLAGS)" \
-- 
2.1.0
