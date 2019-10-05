From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 5 Oct 2019 16:21:03 +0200
Subject: [Buildroot] [git commit] package/spdlog: need threads
Message-ID: <20191005141633.9DF6688611@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6a46812cad150d4ad630ab2781e3f78e717db4be
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.net/results/f839e70e96a0c7d67034f604565b32ca354da7d0/

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
[Arnout: order depends alphabetically, mention threads in comment]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/spdlog/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/spdlog/Config.in b/package/spdlog/Config.in
index 4b721774eb..4aee1f7dd1 100644
--- a/package/spdlog/Config.in
+++ b/package/spdlog/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_SPDLOG
 	bool "spdlog"
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_WCHAR # fmt
 	select BR2_PACKAGE_FMT
 	help
@@ -8,5 +9,6 @@ config BR2_PACKAGE_SPDLOG
 
 	  https://github.com/gabime/spdlog
 
-comment "spdlog needs a toolchain w/ C++, wchar"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
+comment "spdlog needs a toolchain w/ C++, threads, wchar"
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS \
+		|| !BR2_USE_WCHAR
