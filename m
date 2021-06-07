From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 7 Jun 2021 17:18:41 +0200
Subject: [Buildroot] [git commit] package/udisks: drop unused lvm2 support
Message-ID: <20210607144942.89C308B82A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e509ddd44fbe74adcd98afdf6e7e95eef8e51e44
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

BR2_PACKAGE_UDISKS_LVM2 was dropped in commit eb251b30084e38 (package/lvm2:
drop BR2_PACKAGE_LVM2_APP_LIBRARY), but missed when merging next.  Drop it.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/udisks/udisks.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/udisks/udisks.mk b/package/udisks/udisks.mk
index 1090f77846..aa1a73aff5 100644
--- a/package/udisks/udisks.mk
+++ b/package/udisks/udisks.mk
@@ -39,8 +39,4 @@ UDISKS_CONF_OPTS = \
 	--disable-vdo \
 	--disable-zram
 
-ifeq ($(BR2_PACKAGE_UDISKS_LVM2),y)
-UDISKS_CONF_OPTS += --enable-lvm2
-endif
-
 $(eval $(autotools-package))
