From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 30 Jun 2020 22:11:11 +0200
Subject: [Buildroot] [git commit] package/poco: enable build for riscv64
Message-ID: <20200630200855.1EDBD86161@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=59104a3238a250a806c9aac5e4dc8e8f63b18692
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

riscv64 support was added upstream in commit:
https://github.com/pocoproject/poco/commit/26fa1b9e6bbe3a5d2d559d0e8bd5772a4e8fdfef
which is included in version >= 1.10.0.

Now, of the riscv architecture, only the 32-bit variant is not
supported, so change the arch restriction to that.

Signed-off-by: Julien Olivain <juju@cotds.org>
[yann.morin.1998 at free.fr: reword commit log]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/poco/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/poco/Config.in b/package/poco/Config.in
index 546fd2f2f3..6f743f5768 100644
--- a/package/poco/Config.in
+++ b/package/poco/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_POCO_ARCH_SUPPORTS
 	depends on !BR2_microblaze
 	depends on !BR2_mipsel
 	depends on !BR2_or1k
-	depends on !BR2_riscv
+	depends on !BR2_RISCV_32
 	depends on !BR2_xtensa
 
 config BR2_PACKAGE_POCO
