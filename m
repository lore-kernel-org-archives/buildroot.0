From: Asaf Kahlon <asafka7@gmail.com>
Date: Fri,  4 Oct 2019 11:39:13 +0300
Subject: [Buildroot] [PATCH 1/1] package/spdlog: need threads
Message-ID: <20191004083913.15584-1-asafka7@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.net/results/f839e70e96a0c7d67034f604565b32ca354da7d0/

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/spdlog/Config.in | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/spdlog/Config.in b/package/spdlog/Config.in
index 4b721774eb..f78b4f8959 100644
--- a/package/spdlog/Config.in
+++ b/package/spdlog/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_SPDLOG
 	bool "spdlog"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR # fmt
 	select BR2_PACKAGE_FMT
@@ -9,4 +10,5 @@ config BR2_PACKAGE_SPDLOG
 	  https://github.com/gabime/spdlog
 
 comment "spdlog needs a toolchain w/ C++, wchar"
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR \
+		|| !BR2_TOOLCHAIN_HAS_THREADS
-- 
2.20.1
