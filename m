From: Ryan Barnett <ryan.barnett@rockwellcollins.com>
Date: Fri, 12 Mar 2021 14:05:27 -0600
Subject: [Buildroot] [PATCH 1/8] package/opkg-utils: remove build step
In-Reply-To: <20210312200534.923-1-ryan.barnett@rockwellcollins.com>
References: <20210312200534.923-1-ryan.barnett@rockwellcollins.com>
Message-ID: <20210312200534.923-2-ryan.barnett@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

opkg-utils is a package that only provides bash and python scripts.
Upon further inspection of the Makefile for the package, invoking
`make` is equivalent to `make install`. The makes the build step
unnecessary so remove it.

Signed-off-by: Ryan Barnett <ryan.barnett@rockwellcollins.com>
---
 package/opkg-utils/opkg-utils.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/opkg-utils/opkg-utils.mk b/package/opkg-utils/opkg-utils.mk
index a94a4cd5cd..47fc4c63b4 100644
--- a/package/opkg-utils/opkg-utils.mk
+++ b/package/opkg-utils/opkg-utils.mk
@@ -12,10 +12,6 @@ OPKG_UTILS_LICENSE_FILES = COPYING
 
 HOST_OPKG_UTILS_DEPENDENCIES += $(BR2_PYTHON3_HOST_DEPENDENCY)
 
-define HOST_OPKG_UTILS_BUILD_CMDS
-	$(MAKE) -C $(@D) $(HOST_CONFIGURE_OPTS)
-endef
-
 define HOST_OPKG_UTILS_INSTALL_CMDS
 	$(MAKE) -C $(@D) PREFIX=$(HOST_DIR) install
 endef
-- 
2.17.1
