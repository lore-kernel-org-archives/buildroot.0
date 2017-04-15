From: Baruch Siach <baruch@tkos.co.il>
Date: Sun, 16 Apr 2017 01:53:27 +0300
Subject: [Buildroot] [PATCH] trinity: add optional dependency on btrfs-progs
Message-ID: <baba62bac89ef2a49b0206dcfeec2b9b249a4d3a.1492296807.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
The context of this patch depends on
http://patchwork.ozlabs.org/patch/751102/.
---
 package/trinity/trinity.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/trinity/trinity.mk b/package/trinity/trinity.mk
index 4d4078d1e2e0..ee695fb54d9f 100644
--- a/package/trinity/trinity.mk
+++ b/package/trinity/trinity.mk
@@ -14,6 +14,10 @@ TRINITY_PATCH = https://github.com/kernelslacker/trinity/commit/b0e66a2d084ffc21
 		https://github.com/kernelslacker/trinity/commit/f447db18b389050ecc5e66dbf549d5953633e23e.patch \
 		https://github.com/kernelslacker/trinity/commit/87427256640f806710dd97fc807a9a896147c617.patch
 
+ifeq ($(BR2_PACKAGE_BTRFS_PROGS),y)
+TRINITY_DEPENDENCIES += btrfs-progs
+endif
+
 define TRINITY_CONFIGURE_CMDS
 	(cd $(@D); $(TARGET_CONFIGURE_OPTS) ./configure)
 endef
-- 
2.11.0
