From: Graham Holland <gmh7@sfu.ca>
Date: Tue, 30 May 2017 11:04:23 -0700
Subject: [Buildroot] [PATCH 1/1] package/hwloc: install package to staging
	directory
Message-ID: <1496167463-10721-1-git-send-email-gmh7@sfu.ca>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The hwloc package consists of a library and utilities so it should be installed
to both the staging and target directories.

Signed-off-by: Graham Holland <gmh7@sfu.ca>
---
 package/hwloc/hwloc.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/hwloc/hwloc.mk b/package/hwloc/hwloc.mk
index ad2e090..5de84f7 100644
--- a/package/hwloc/hwloc.mk
+++ b/package/hwloc/hwloc.mk
@@ -11,6 +11,7 @@ HWLOC_SITE = http://www.open-mpi.org/software/hwloc/v$(HWLOC_VERSION_MAJOR)/down
 HWLOC_LICENSE = BSD-3-Clause
 HWLOC_LICENSE_FILES = COPYING
 HWLOC_DEPENDENCIES = host-pkgconf
+HWLOC_INSTALL_STAGING = YES
 # 0001-utils-hwloc-Makefile.am-fix-install-man-race-conditi.patch touches Makefile.am
 HWLOC_AUTORECONF = YES
 
-- 
2.7.4
