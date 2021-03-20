From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 20 Mar 2021 17:42:35 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/opkg-utils:
 remove build step
Message-ID: <20210320162700.B309888211@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=af952c01a42f0539b3ce9ea3329424c204abe303
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

opkg-utils is a package that only provides bash and python scripts.
Upon further inspection of the Makefile for the package, invoking
`make` only ever builds the manpage. The previous commit dropped the
installation of the manpage. This makes the build step unnecessary so
remove it.

Add a comment to explain the situation

Signed-off-by: Ryan Barnett <ryan.barnett@rockwellcollins.com>
[yann.morin.1998 at free.fr: reword commit log]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 05bf014f56c0c99f08c93db7829e8fd53af3c9a8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/opkg-utils/opkg-utils.mk | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/package/opkg-utils/opkg-utils.mk b/package/opkg-utils/opkg-utils.mk
index 16b3b74d12..93d909b951 100644
--- a/package/opkg-utils/opkg-utils.mk
+++ b/package/opkg-utils/opkg-utils.mk
@@ -12,10 +12,7 @@ OPKG_UTILS_LICENSE_FILES = COPYING
 
 HOST_OPKG_UTILS_DEPENDENCIES += $(BR2_PYTHON3_HOST_DEPENDENCY)
 
-define HOST_OPKG_UTILS_BUILD_CMDS
-	$(MAKE) -C $(@D) $(HOST_CONFIGURE_OPTS)
-endef
-
+# Nothing to build; only scripts to install.
 define HOST_OPKG_UTILS_INSTALL_CMDS
 	$(MAKE) -C $(@D) PREFIX=$(HOST_DIR) install-utils
 endef
