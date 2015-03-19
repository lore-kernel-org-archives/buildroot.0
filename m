From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 19 Mar 2015 13:25:50 +0100
Subject: [Buildroot] [git commit] package/numactl: upgrade to 2.0.10
Message-ID: <20150319123153.6544781892@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4237a1f786def8b03ffd054aa0f151bf73a6b4cb
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The package now uses autotools, although it's missing a pregenerated configure
script.

Signed-off-by: Steven Noonan <steven@uplinklabs.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/numactl/numactl.mk |   13 ++++---------
 1 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/package/numactl/numactl.mk b/package/numactl/numactl.mk
index f36a1b3..18da047 100644
--- a/package/numactl/numactl.mk
+++ b/package/numactl/numactl.mk
@@ -4,17 +4,12 @@
 #
 ################################################################################
 
-NUMACTL_VERSION = 2.0.9
+NUMACTL_VERSION = 2.0.10
 NUMACTL_SITE = ftp://oss.sgi.com/www/projects/libnuma/download
 NUMACTL_LICENSE = LGPLv2.1 (libnuma), GPLv2 (programs)
 NUMACTL_LICENSE_FILES = README
 
-define NUMACTL_BUILD_CMDS
-	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
-endef
+# numactl tarball doesn't contain a pregenerated configure script.
+NUMACTL_AUTORECONF = YES
 
-define NUMACTL_INSTALL_TARGET_CMDS
-	$(MAKE) prefix=$(TARGET_DIR) libdir=$(TARGET_DIR)/lib -C $(@D) install
-endef
-
-$(eval $(generic-package))
+$(eval $(autotools-package))
