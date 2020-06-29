From: Julien Olivain <juju@cotds.org>
Date: Mon, 29 Jun 2020 23:07:32 +0200
Subject: [Buildroot] [PATCH 1/4] package/poco: fix the comment dependencies
 about riscv
Message-ID: <20200629210735.179913-1-juju@cotds.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 0737f48c5f "package/poco: disable build for riscv"
changed the Kconfig package dependency, without updating the dependency
of the comment. This patch set the comment dependency to the same
condition as the package.

Signed-off-by: Julien Olivain <juju@cotds.org>
---
 package/poco/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/poco/Config.in b/package/poco/Config.in
index f8f921de04..df37e53b53 100644
--- a/package/poco/Config.in
+++ b/package/poco/Config.in
@@ -86,4 +86,4 @@ comment "poco needs a toolchain w/ wchar, NPTL, C++, dynamic library"
 	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP \
 		|| !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
 	depends on !(BR2_arc || BR2_microblaze || BR2_mipsel \
-		|| BR2_or1k || BR2_xtensa)
+		|| BR2_or1k || BR2_riscv || BR2_xtensa)
-- 
2.26.2
