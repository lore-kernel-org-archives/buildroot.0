From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 May 2017 23:17:53 +0200
Subject: [Buildroot] [git commit] package/hwloc: install package to staging
	directory
Message-ID: <20170601202859.1E65B82A3B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=10b386d2dc03b53b03d6923d84c4a128f47322e4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The hwloc package consists of a library and utilities so it should be
installed to both the staging and target directories.

Signed-off-by: Graham Holland <gmh7@sfu.ca>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
 
