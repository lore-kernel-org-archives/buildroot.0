From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 24 Oct 2013 08:46:12 -0300
Subject: [Buildroot] [PATCH] libcgroup: needs host-bison and host-flex
Message-ID: <1382615172-12993-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/a77/a7738d6f99ba8189e6ffbd9fe245b1af7d28e3d9/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/libcgroup/libcgroup.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libcgroup/libcgroup.mk b/package/libcgroup/libcgroup.mk
index c2392e0..6d7ae54 100644
--- a/package/libcgroup/libcgroup.mk
+++ b/package/libcgroup/libcgroup.mk
@@ -9,7 +9,7 @@ LIBCGROUP_SOURCE = libcgroup-$(LIBCGROUP_VERSION).tar.bz2
 LIBCGROUP_SITE = http://downloads.sourceforge.net/project/libcg/libcgroup/v.038
 LIBCGROUP_LICENSE = LGPLv2.1
 LIBCGROUP_LICENSE_FILES = COPYING
-
+LIBCGROUP_DEPENDENCIES = host-bison host-flex
 LIBCGROUP_INSTALL_STAGING = YES
 
 # Undefining _FILE_OFFSET_BITS here because of a "bug" with glibc fts.h
-- 
1.8.1.5
