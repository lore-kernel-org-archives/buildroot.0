From: Joseph Burt <caseorum@gmail.com>
Date: Thu, 24 Jun 2021 14:00:43 +0000
Subject: [Buildroot] [PATCH 1/1] package/qemu: replace old configure param
 with new equivalent
Message-ID: <20210624140043.60902-1-caseorum@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

QEMU 6.0.0 replaces in [1] --(enable|disable)-git-update with
--with-git-submodules=(update|validate|ignore). "Disable" is now "ignore".

[1] https://lore.kernel.org/qemu-devel/20201016203857.62572-1-ddstreet at canonical.com/

Signed-off-by: Joseph Burt <caseorum@gmail.com>
---
 package/qemu/qemu.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/qemu/qemu.mk b/package/qemu/qemu.mk
index e0f722cf42..470c285f16 100644
--- a/package/qemu/qemu.mk
+++ b/package/qemu/qemu.mk
@@ -198,7 +198,7 @@ define QEMU_CONFIGURE_CMDS
 			--disable-vhost-crypto \
 			--disable-libxml2 \
 			--disable-capstone \
-			--disable-git-update \
+			--with-git-submodules=ignore \
 			--disable-opengl \
 			--disable-vhost-user-blk-server \
 			--disable-virtiofsd \
-- 
2.32.0
