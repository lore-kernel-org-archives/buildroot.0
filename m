From: Erico Nunes <nunes.erico@gmail.com>
Date: Sun, 30 Oct 2016 13:51:45 +0100
Subject: [Buildroot] [PATCH 1/1] trinity: fix Config.in depends on logic
Message-ID: <1477831905-14615-1-git-send-email-nunes.erico@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The comment from trinity Config.in currently does not show up in
menuconfig for glibc or uClibc toolchains with older headers.
This commit fixes the logic so that it shows up when either one of the
dependencies from trinity are not met.

Signed-off-by: Erico Nunes <nunes.erico@gmail.com>
---
 package/trinity/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/trinity/Config.in b/package/trinity/Config.in
index 35b54d8..0ce1f9a 100644
--- a/package/trinity/Config.in
+++ b/package/trinity/Config.in
@@ -18,5 +18,5 @@ config BR2_PACKAGE_TRINITY
 
 comment "trinity needs a uClibc or glibc toolchain w/ headers >= 3.4"
 	depends on BR2_PACKAGE_TRINITY_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_USES_MUSL
-	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
+	depends on BR2_TOOLCHAIN_USES_MUSL || \
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
-- 
2.7.4
