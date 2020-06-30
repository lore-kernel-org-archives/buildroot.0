From: Julien Olivain <juju@cotds.org>
Date: Tue, 30 Jun 2020 19:34:34 +0200
Subject: [Buildroot] [PATCH v2 3/4] package/poco: enable build for riscv64
In-Reply-To: <20200630173435.7828-1-juju@cotds.org>
References: <20200629210735.179913-1-juju@cotds.org>
 <20200630173435.7828-1-juju@cotds.org>
Message-ID: <20200630173435.7828-3-juju@cotds.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Poco riscv64 support was added upstream in commit:
https://github.com/pocoproject/poco/commit/26fa1b9e6bbe3a5d2d559d0e8bd5772a4e8fdfef
which is included in version >= 1.10.0.

This patch enable build for riscv64.

Signed-off-by: Julien Olivain <juju@cotds.org>
---
Changes v1 -> v2:
Suggested by Thomas:
  - use BR2_RISCV_32 instead of (BR2_riscv && !BR2_RISCV_64) in
    arch exclusion, to re-enable riscv64.
---
 package/poco/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/poco/Config.in b/package/poco/Config.in
index cec48591ac..cfc4f6c0aa 100644
--- a/package/poco/Config.in
+++ b/package/poco/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_POCO_ARCH_SUPPORTS
 	bool
 	default y if !(BR2_arc || BR2_microblaze || BR2_mipsel \
-		|| BR2_or1k || BR2_riscv || BR2_xtensa)
+		|| BR2_or1k || BR2_RISCV_32 || BR2_xtensa)
 
 config BR2_PACKAGE_POCO
 	bool "poco"
-- 
2.26.2
