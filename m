From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 8 Mar 2016 21:11:00 +0100
Subject: [Buildroot] [git commit] package/owfs: Install owfs in staging
	directory
Message-ID: <20160308201425.50FD0818F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1e03e7431a9b7a5753cd56891bcd64f3d75265a2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Install package in staging directory, so that this package can be
linked together with other packages (for example collectd and its
onewire plugin).

Signed-off-by: Roland Franke <fli4l@franke-prem.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/owfs/owfs.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/owfs/owfs.mk b/package/owfs/owfs.mk
index 23167f4..083939a 100644
--- a/package/owfs/owfs.mk
+++ b/package/owfs/owfs.mk
@@ -15,6 +15,7 @@ OWFS_AUTORECONF = YES
 # owtcl license is declared in module/ownet/c/src/include/ow_functions.h
 OWFS_LICENSE = GPLv2+, LGPLv2 (owtcl)
 OWFS_LICENSE_FILES = COPYING COPYING.LIB
+OWFS_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_LIBFUSE),y)
 OWFS_DEPENDENCIES += libfuse
