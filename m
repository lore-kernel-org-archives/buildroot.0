From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 16 Apr 2017 10:39:37 +0200
Subject: [Buildroot] [git commit] trinity: add optional dependency on
	btrfs-progs
Message-ID: <20170416084136.C84D3804F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a81782a3f5dc08bb8d740acb1e6d361022f62f96
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Cc: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/trinity/trinity.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/trinity/trinity.mk b/package/trinity/trinity.mk
index 4d4078d..ee695fb 100644
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
