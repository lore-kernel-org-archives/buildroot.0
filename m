From: Steven Noonan <steven@uplinklabs.net>
Date: Wed, 18 Mar 2015 20:48:06 -0700
Subject: [Buildroot] [PATCH] package/numactl: upgrade to 2.0.10
In-Reply-To: <1426736888-29437-1-git-send-email-steven@uplinklabs.net>
References: <1426736888-29437-1-git-send-email-steven@uplinklabs.net>
Message-ID: <1426736888-29437-4-git-send-email-steven@uplinklabs.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Steven Noonan <steven@uplinklabs.net>
---
 package/numactl/numactl.mk | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/package/numactl/numactl.mk b/package/numactl/numactl.mk
index f36a1b3..042f2d8 100644
--- a/package/numactl/numactl.mk
+++ b/package/numactl/numactl.mk
@@ -4,17 +4,11 @@
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
+NUMACTL_AUTORECONF = YES
 
-define NUMACTL_INSTALL_TARGET_CMDS
-	$(MAKE) prefix=$(TARGET_DIR) libdir=$(TARGET_DIR)/lib -C $(@D) install
-endef
-
-$(eval $(generic-package))
+$(eval $(autotools-package))
-- 
2.3.3
